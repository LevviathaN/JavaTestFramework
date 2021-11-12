package api;

import org.testng.ITestResult;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;
import ui.utils.BPPLogManager;
import ui.utils.Reporter;
import ui.utils.RetryAnalyzer;
import ui.utils.bpp.ExecutionContextHandler;
import ui.utils.bpp.KeywordsHandler;
import ui.utils.bpp.MetaDataHandler;
import ui.utils.bpp.PreProcessFiles;
import ui.utils.qTestAPI;

import java.io.IOException;
import java.lang.reflect.Method;

/**
 * <p>Base test class for all api tests.</p>
 *
 * @author yzosin
 */
public class BaseApiTest {

    Reporter reporter = new Reporter();
    @BeforeMethod
    public void preProcess(Method method, Object[] data) {

        System.out.println("START - BPP AUTOMATION API MODULE");

        new PreProcessFiles().initPaths(false);

        //init reporter
        Reporter.instantiate();
        Reporter.startReportingAPI(method,data);
        reporter.setLogName(method.getAnnotation(Test.class).testName());
        Reporter.logForEveryTest(method.getAnnotation(Test.class).testName());
        KeywordsHandler.instantiate();
        MetaDataHandler.instantiate();
    }

    @AfterMethod
    public void flushProcesses(ITestResult testResult) {
        Reporter.stopReportingAPI(testResult);
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
        } catch (IOException | org.jooq.tools.json.ParseException e) {
            e.printStackTrace();
        }

    }

    @AfterClass(alwaysRun = true)
    public void flushReporter() {
        ExcelResultsWriter.createApiExcel();
        Reporter.flush();
        ExecutionContextHandler.resetExecutionContextValues();
        RetryAnalyzer.deletePreviousAttemptsFromHtmlReport();
        System.out.println("API EXECUTIONS HAVE FINISHED");
    }
}
