package ui.utils;

import CodeEditor.GuiHelper;
import api.RestApiController;
import org.jooq.tools.json.ParseException;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.testng.Assert;
import org.testng.ITestResult;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;
import ui.utils.bpp.ExecutionContextHandler;
import ui.utils.bpp.KeywordsHandler;
import ui.utils.bpp.MetaDataHandler;
import ui.utils.bpp.PreProcessFiles;

import java.io.IOException;
import java.lang.reflect.Method;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;


/**
 * <p>Base test class for all ui tests.</p>
 * @author yzosin
 */
public class BaseUITest {

    private PreProcessFiles preProcessFiles;
    private String sessionId;
    Reporter reporter = new Reporter();
    private static final Map<String, String> executionEnvironment = new HashMap<>();
    private static final Object lock = new Object();

    @BeforeMethod
    public void beforeWithData(Object[] data, Method method) {
        RestApiController apiController = new RestApiController();

        //init reporter
        Reporter.instantiate();
        Reporter.startReporting(method, data);
        reporter.setLogName(method.getAnnotation(Test.class).testName());
        Reporter.logForEveryTest(method.getAnnotation(Test.class).testName());

        preProcessFiles = new PreProcessFiles();

        try {
            BPPLogManager.getLogger().info("Driver creation");
            //temporary hardcoded solution to run PF Cleanup on Firefox
            if (method.getName().equals("runPFDatabaseCleanup")) {
                DriverProvider.instance.set(DriverProvider.getFirefoxBrowserStack());
                SeleniumHelper.driver.set(DriverProvider.instance.get());
            } else {
                SeleniumHelper.driver.set(DriverProvider.getDriver());
            }
            SeleniumHelper.driver().manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        } catch (Exception e) {
            Reporter.log(e.getMessage());
            BPPLogManager.getLogger().info(e.toString());
            Reporter.failTryTakingScreenshot("Before test failure during Driver creation. Please check options for test executions ");
            Reporter.flush();
            Assert.fail(e.getMessage());
            BPPLogManager.getLogger().error("Driver set up failed! Please check configurations in VM options!");
        }

        try {
           preProcessFiles.preProcessTestConfiguration();
        } catch (Exception e) {
            e.printStackTrace();
        }

        SeleniumHelper.locatorsMap = GuiHelper.getLocatorsMap(PreProcessFiles.ROOT_FOLDER_PATH + "/src/main/resources/Locators.json");
        SeleniumHelper.specialLocatorsMap = GuiHelper.getLocatorsMap(PreProcessFiles.ROOT_FOLDER_PATH + "/src/main/resources/SpecialLocators.json");
        SeleniumHelper.stepSignaturesMap = GuiHelper.getLocatorsMap(PreProcessFiles.ROOT_FOLDER_PATH + "/src/main/resources/NewStepSignatures.json");

        KeywordsHandler.instantiate();
        MetaDataHandler.instantiate();
        setExecutionEnvironmentInfo();
    }

    @AfterMethod
    public synchronized void endTest(ITestResult testResult) throws IOException, ParseException {

        if (SpreadsheetsHelper.executionStartTime > testResult.getStartMillis() || SpreadsheetsHelper.executionStartTime == 0) SpreadsheetsHelper.executionStartTime = testResult.getStartMillis();
        if (SpreadsheetsHelper.executionEndTime < testResult.getEndMillis() || SpreadsheetsHelper.executionEndTime == 0) SpreadsheetsHelper.executionEndTime = testResult.getEndMillis();

        // close reporter
        Reporter.stopReporting(testResult);
        try {
            Reporter.writeToFile();
            Reporter.saveAllECToFile();
            if (System.getProperties().containsKey("qtest") && System.getProperty("qtest").equalsIgnoreCase("TRUE")) {
                String scenarioName;
                String actualScenarioName = Reporter.getCurrentTestName();
                if (actualScenarioName.contains("attempt")) {
                    scenarioName = actualScenarioName.substring(0, actualScenarioName.length() - 10);
                } else {
                    scenarioName = actualScenarioName;
                }
                if (qTestAPI.getTestRunIDfromSuite().containsKey(scenarioName)) {
                    String qtestID = qTestAPI.getTestRunIDfromSuite().get(scenarioName);
                    if (testResult.toString().contains("SUCCESS")) {
                        BPPLogManager.getLogger().info("Test " + Reporter.getCurrentTestName() + " PASSED");
                        qTestAPI.TestRunStatusUpdate(Reporter.getCurrentTestName(), "Passed", 601, qtestID, "");
                    } else {
                        BPPLogManager.getLogger().info("Test " + Reporter.getCurrentTestName() + " FAILED");
                        qTestAPI.TestRunStatusUpdate(Reporter.getCurrentTestName(), "Failed", 602, qtestID, testResult.getThrowable().toString());
                    }
                    Reporter.addQtestLink(qtestID);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            if (DriverProvider.getCurrentBrowserName().toUpperCase().contains("BSTACK") || DriverProvider.getCurrentBrowserName().toUpperCase().contains("MOBILE")) {
                sessionId = ((RemoteWebDriver) DriverProvider.getDriver()).getSessionId().toString();
                Reporter.addLinkToReport(Reporter.getScreencastLinkFromBrowserStack(sessionId));

                Reporter.updateBrowserStackJob(testResult.toString().contains("FAILURE") ? "fail" : "pass", sessionId);
                SeleniumHelper.driver().quit();
                DriverProvider.closeDriver();
            } else if (DriverProvider.getCurrentBrowserName().toUpperCase().contains("LAMBDA")) {
                ((JavascriptExecutor) SeleniumHelper.driver()).executeScript("lambda-status=" + (testResult.toString().contains("FAILURE") ? "failed" : "passed"));
                SeleniumHelper.driver().quit();
                DriverProvider.closeDriver();
            } else {
                SeleniumHelper.driver().quit();
                DriverProvider.closeDriver();
            }
        } catch (MalformedURLException | TimeoutException e) {
            e.printStackTrace();
            SeleniumHelper.driver().quit();
            DriverProvider.closeDriver();
        }
    }

    @AfterClass(alwaysRun = true)
    public void flushReporter() {
        Reporter.setSystemInfo(executionEnvironment);
        Reporter.flush();
        ExecutionContextHandler.resetExecutionContextValues();
        RetryAnalyzer.deletePreviousAttemptsFromHtmlReport();
        //RetryAnalyzer.createReportForAllDiamondsTest();
    }

    public static void setExecutionEnvironmentInfo() {
        synchronized (lock) {
            if (!executionEnvironment.isEmpty()) {
                return;
            }
            executionEnvironment.put("Operating System", System.getProperty("os.name"));
        }
    }
}
