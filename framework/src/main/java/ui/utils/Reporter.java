package ui.utils;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.MediaEntityBuilder;
import com.aventstack.extentreports.reporter.ExtentHtmlReporter;
import com.aventstack.extentreports.reporter.configuration.Theme;
import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.FileAppender;
import org.apache.log4j.PatternLayout;
import org.testng.ITestResult;
import org.testng.annotations.Test;
import ru.yandex.qatools.ashot.AShot;
import ru.yandex.qatools.ashot.Screenshot;
import ru.yandex.qatools.ashot.shooting.ShootingStrategies;
import ui.utils.bpp.ExecutionContextHandler;

import javax.imageio.ImageIO;
import java.io.*;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author yzosin
 * <p>
 * Provides the reporting interface
 * </p>
 */
public class Reporter {

    private static ExtentReports extent;
    private static String root = System.getProperty("user.dir");
    private static String filePath = "report.html";
    private static Path reportPath;
    private static Path quarkPath;
    private static Path screenshotFolder;
    private static Path ecFolder;
    private static Path logFolder;
    private static StringBuilder htmlStringBuilder = new StringBuilder();
    private static boolean buildStatus = true;
    private static ArrayList failuresBucket = new ArrayList<String>();
    protected String logName;
    protected static String testLogName;
    private static String browserLink;
    private static String env;
    private static String qtestBuild;

    private static ConcurrentHashMap<Long, ExtentTest> testStorage = new ConcurrentHashMap<>();
    private static ConcurrentHashMap<Long, ExtentTest> testNodesStorage = new ConcurrentHashMap<>();

    /**
     * <p>
     * Instantiate the Extend report with report configurations
     * </p>
     */
    public static synchronized void instantiate() {

        if (extent != null) {
            return;
        }

        // create the report at path root/report/report_<nano time>
        try {
            // generate report folder name
            Path rootPath = getNewReportPath();

            // create directory if not exists
            if (Files.notExists(rootPath))
                reportPath = Files.createDirectories(rootPath);
            else
                reportPath = rootPath;

        } catch (IOException e) {
            e.printStackTrace();
        }

        // lazy initialization of the extent report object
        if (null == extent) {
            extent = new ExtentReports();

            ExtentHtmlReporter htmlReporter = new ExtentHtmlReporter(Paths.get(reportPath.toString(), filePath).toAbsolutePath().toFile());

            // report configuration
            htmlReporter.config().setChartVisibilityOnOpen(false);
            htmlReporter.config().setDocumentTitle("BPP Automation");
            htmlReporter.config().setReportName("Regression cycle");
            htmlReporter.config().setTheme(Theme.DARK);

            String js = Tools.readFile("src/main/resources/ReportJQuery.js", StandardCharsets.UTF_8);
            if (!js.equals("")) {
                htmlReporter.config().setJS(js);
            } else {
                BPPLogManager.getLogger().warn("ReportJQuery.js file is empty");
            }

            //adding a custom style sheet to the report
            String css = Tools.readFile("src/main/resources/ReportStyle.css", StandardCharsets.UTF_8);
            if (!css.equals("")) {
                htmlReporter.config().setCSS(css);
            } else {
                BPPLogManager.getLogger().warn("ReportStyle.css file is empty");
            }

            extent.attachReporter(htmlReporter);
        }
    }

    public static void setSystemInfo(Map<String, String> info) {

        for (Map.Entry<String, String> entry : info.entrySet()) {
            extent.setSystemInfo(entry.getKey(), entry.getValue());
        }
        extent.flush();
    }


    public static synchronized String getTestName() {
        String testName = String.valueOf(testStorage.get(Thread.currentThread().getId()));
        return testName;
    }

    public static synchronized String getTestName(Method m, Object[] data) {
        String testName = null;
        String address = null;

        String[] testGroups = m.getAnnotation(Test.class).groups();
        for (int i = 0; i < testGroups.length; i++) {
            if (testGroups[i].startsWith("http")) {
                address = testGroups[i];
            }
        }
        if (address != null) {
            testName = "<a href=" + "\"" + address + "\""
                    + "target=_blank alt=This test is linked to test case. Click to open it>"
                    + m.getAnnotation(Test.class).testName() + "</a>";
        } else {
            try {
                testName = m.getAnnotation(Test.class).testName(); // get name from annotation
                testName = testName + data[0].toString(); // add value from first DataProvider parameter ot test name
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (testName == null || testName.equals("")) {
            testName = m.getName();
        }
        return testName.replaceAll("\"", " ");
    }

    /**
     * <p>
     * Generate the unique report name
     * </p>
     *
     * @return
     */
    private static Path getNewReportPath() {
        LocalDateTime dateTime = LocalDateTime.now();
        String reportName = "report" + "_" + dateTime.toLocalDate() + "_" + dateTime.toLocalTime().getHour() + "_"
                + dateTime.toLocalTime().getMinute() + "_" + dateTime.toLocalTime().getSecond();

        return Paths.get(root, "report", reportName);
    }

    /**
     * <p>
     * Add test to the report with the give test name
     * </p>
     *
     * @param testName name of the test executing
     */
    public static void addTest(Method m, String testName) {

        String finalTestName = testName;
        if (RetryAnalyzer.counterMap.containsKey(testName.substring(1, testName.length() - 1))) {
            int retryAttempt = RetryAnalyzer.counterMap.get(testName.substring(1, testName.length() - 1));
            finalTestName = testName.substring(1, testName.length() - 1) + "_attempt_" + retryAttempt;
        }
        ExtentTest test = extent.createTest(finalTestName);
        testStorage.put(Thread.currentThread().getId(), test);

        //Custom functionality to add browser icons, environment info and qTest build to the report
        String browserName = DriverProvider.getCurrentBrowserName().toUpperCase();

        if (browserName.equalsIgnoreCase("chrome") || browserName.equalsIgnoreCase("bstack_chrome")) {
            browserLink = "<img src='https://cdnjs.cloudflare.com/ajax/libs/browser-logos/45.10.0/archive/chrome_12-48/chrome_12-48_64x64.png' class='BrowserLogo'>";
        } else if (browserName.equalsIgnoreCase("firefox") || browserName.equalsIgnoreCase("bstack_firefox")) {
            browserLink = "<img src='https://cdnjs.cloudflare.com/ajax/libs/browser-logos/45.10.0/archive/firefox_1/firefox_1_64x64.png' class='BrowserLogo'>";
        } else if (browserName.equalsIgnoreCase("ie") || browserName.equalsIgnoreCase("bstack_ie")) {
            browserLink = "<img src='https://cdnjs.cloudflare.com/ajax/libs/browser-logos/45.10.0/archive/internet-explorer_9-11/internet-explorer_9-11_64x64.png' class='BrowserLogo'>";
        } else if (browserName.equalsIgnoreCase("safari") || browserName.equalsIgnoreCase("bstack_safari")) {
            browserLink = "<img src='https://cdnjs.cloudflare.com/ajax/libs/browser-logos/45.10.0/archive/safari_1-7/safari_1-7_64x64.png' class='BrowserLogo'>";
        } else if (browserName.contains("IOS")) {
            browserLink = "<img src='https://img.icons8.com/nolan/64/ios-logo.png' class='BrowserLogo'>";
        } else if (browserName.contains("ANDROID")) {
            browserLink = "<img src='https://img.icons8.com/color/48/000000/android-os.png' class='BrowserLogo'>";
        }

        test.assignCategory(browserName.concat("<span>&nbsp;-&nbsp;Browser</span>"));

        if (System.getProperties().containsKey("environment")) {
            env = System.getProperty("environment").toUpperCase();
            test.assignCategory(env.concat("<span>&nbsp;-&nbsp;Environment</span>"));
        } else {
            env = "QA";
            test.assignCategory(env.concat("<span>&nbsp;-&nbsp;Environment</span>"));
        }
        //info message for grabbing logo.
        test.info(browserLink);
    }


    public static synchronized void startReporting(Method m, Object[] data) {
        addTest(m, getTestName(m, data));
        BPPLogManager.getLogger().info("Started test: " + getTestName(m, data));
    }

    public static synchronized void startReportingAPI(Method m, Object[] data) {
        addApiTest(m, getTestName(m, data));
        BPPLogManager.getLogger().info("Started test: " + getTestName(m, data));
    }

    /**
     * Used in DriverType to launch a web driver via Browser Stack
     *
     * @return the test name that is run in current thread
     */
    public static String getCurrentTestName() {
        return testStorage.get(Thread.currentThread().getId()).getModel().getName();
    }

    /**
     * <p>
     * Set simple log to the test
     * </p>
     *
     * @param log identify the log for test execution
     */
    public static synchronized void log(String log) {
        testNodesStorage.get(Thread.currentThread().getId()).info(log);
    }

    /**
     * <p>
     * Set warning log to the test
     * </p>
     *
     * @param log identify the log for test execution
     */
    public static void warn(String log) {
        testNodesStorage.get(Thread.currentThread().getId()).warning(log);
    }

    /**
     * Set simple log to the test
     *
     * @param log message that will be shown in report
     */
    public static void testLog(String log) {
        testStorage.get(Thread.currentThread().getId()).info(log);
    }

    /**
     * <p>
     * Input the log as passing step of Business Process.
     * Requested at AGQA-931
     * </p>
     *
     * @param log identify the log for test execution
     */
    public static void passMessage(String log) {
        testNodesStorage.get(Thread.currentThread().getId()).pass(log);
    }

    /**
     * <p>
     * Input the log as passing step of the test and attach the screenshot
     * </p>
     *
     * @param log identify the log for test execution
     */
    public static void pass(String log) {
        String currentTestName = getCurrentTestName();
        if (currentTestName.contains("attempt")) {
            RetryAnalyzer.passMap.put(currentTestName.substring(0, currentTestName.length() - 10), "pass");
        } else {
            RetryAnalyzer.passMap.put(currentTestName, "pass");
        }
        testStorage.get(Thread.currentThread().getId()).pass(log);
    }

    /**
     * <p>
     * Input the log as failing step of the test and attach the screenshot
     * </p>
     *
     * @param log identify the log for test execution
     */
    public static synchronized void fail(String log) {
        String currentTestName = getCurrentTestName();
        if (currentTestName.contains("attempt")) {
            RetryAnalyzer.passMap.put(currentTestName.substring(0, currentTestName.length() - 10), "fail");
        }
        try {
            String screenshotPath = takeScreenshot();
            screenshotPath = screenshotPath.substring(screenshotPath.indexOf("screenshots"));
            testNodesStorage.get(Thread.currentThread().getId()).fail(log, MediaEntityBuilder.createScreenCaptureFromPath(screenshotPath).build());
            buildStatus = false;
            failuresBucket.add(log);
        } catch (Exception e) {
            testStorage.get(Thread.currentThread().getId()).fail(log);
        }
    }

    public static void failTryTakingScreenshot(String log) {

        String currentTestName = getCurrentTestName();
        if (currentTestName.contains("attempt")) {
            RetryAnalyzer.passMap.put(currentTestName.substring(0, currentTestName.length() - 10), "fail");
        }

        try {
            testNodesStorage.get(Thread.currentThread().getId()).fail(log);
            buildStatus = false;
            failuresBucket.add(log);
        } catch (Exception e) {
            testStorage.get(Thread.currentThread().getId()).fail(log);
        }
    }

    /**
     * <p>
     * Get the final build status, to fail the maven build.
     * </p>
     *
     * @return
     */
    public static boolean getBuildStatus() {
        return buildStatus;
    }

    /**
     * <p>
     * Get the list of failed messages
     * </p>
     *
     * @return
     */
    public static ArrayList<String> getFailureBucket() {
        return failuresBucket;
    }

    /**
     * <p>
     * skip log
     * </p>
     *
     * @param log identify the log for test execution
     */
    public static void skip(String log) {
        ExtentTest childNode = testStorage.get(Thread.currentThread().getId()).createNode(log).skip(log);
        testNodesStorage.put(Thread.currentThread().getId(), childNode);
    }

    /**
     * <p>
     * Attach a child node to the step, all the function are similar to the step
     * </p>
     *
     * @param businessProcess name of the business process for the node
     * @param log             identify the log for test execution
     */
    public static void node(String businessProcess, String log) {
        ExtentTest childNode = testStorage.get(Thread.currentThread().getId()).createNode(businessProcess).info(log);
        testNodesStorage.put(Thread.currentThread().getId(), childNode);
    }

    /**
     * <p>
     * Flush the test data in the test of the report Need to get called after
     * every test finishes
     * </p>
     */
    public synchronized static void flush() {
        extent.flush();
    }

    /**
     * <p>
     * Take the screenshot
     * </p>
     *
     * @return
     */
    private static String takeScreenshot() {

        String testCaseName = testStorage.get(Thread.currentThread().getId()).getModel().getName().replace(" ", "_");

        try {
            // now copy the screenshot to desired location using copyFile method
            screenshotFolder = Paths.get(reportPath.toString(), "screenshots");

            if (Files.notExists(screenshotFolder))
                Files.createDirectory(screenshotFolder);

            //String fileName = testCaseName.replace(" ", "_") + "_" + System.nanoTime();
            String fileName = testCaseName.replaceAll("\"", "_") + System.nanoTime();

            Path screenshotPath = Paths.get(screenshotFolder.toString(), fileName + ".png");

            Screenshot screenshot = null;

            //shooting strategy work for Chrome Only.
            boolean hasDriverId = System.getProperties().contains("driver");
            if (hasDriverId) {
                System.getProperty("driver").contains("CHROME");
            }

            //verify if Chrome is specified from maven or config.properties
            if (System.getProperties().containsKey("driver") && System.getProperties().getProperty("driver").contains("CHROME")) {
                BPPLogManager.getLogger().info("Taking Screen Shot For Chrome ");
                screenshot = new AShot().shootingStrategy(ShootingStrategies.viewportPasting(100))
                        .takeScreenshot(SeleniumHelper.driver.get());
            } else {
                screenshot = new AShot()
                        .takeScreenshot(SeleniumHelper.driver.get());
            }

            ImageIO.write(screenshot.getImage(), "PNG", new File(screenshotPath.toString()));

            return screenshotPath.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public static Path getScreenshotFolder() {
        return screenshotFolder;
    }


    public static synchronized void stopReporting(ITestResult result) {

        if (result.getStatus() == ITestResult.FAILURE)
            fail("Test failed. Please see attached screenshot and log file for more details");
        else if (result.getStatus() == ITestResult.SKIP)
            log("Test: " + testStorage.get(Thread.currentThread().getId()).toString() + " skipped");
        else
            pass("Test passed!");

        flush();
    }

    public static Path getReportPath() {
        return reportPath;
    }

    /**
     * <p>
     * Build html report with Execution Context data
     * </p>
     *
     * @param fileContent reference information for EC html
     * @throws IOException Signals that an I/O exception of some sort has occurred. This
     *                     class is the general class of exceptions produced by failed
     *                     or interrupted I/O operations.
     */
    private static void createHtml(String fileContent) throws IOException {
        htmlStringBuilder.append("<html>");
        htmlStringBuilder.append("<head>");
        htmlStringBuilder.append("<style>" + "body {font-weight: italic; color: blue}" + "</style>");
        htmlStringBuilder.append("</head>");
        htmlStringBuilder.append("<h3></h3>");
        htmlStringBuilder.append(fileContent);
        htmlStringBuilder.append("<body>");
        htmlStringBuilder.append("</body></html>");
    }

    /**
     * <p>
     * Write html report with Execution Context data into separate file for each test
     * </p>
     *
     * @throws IOException Signals that an I/O exception of some sort has occurred. This
     *                     class is the general class of exceptions produced by failed
     *                     or interrupted I/O operations.
     */
    public synchronized static void writeToFile() throws IOException {

        if (ExecutionContextHandler.getAllValues().size() == 0) {
            return;
        }

        String testCaseName = testStorage.get(Thread.currentThread().getId()).getModel().getName().replace(" ", "_");

        BPPLogManager.getLogger().info("Saving the EC values as HTML report for the test: " + testCaseName);

        try {
            for (Map.Entry entry : ExecutionContextHandler.getAllValues().entrySet()) {
                createHtml(entry.getKey() + ": " + entry.getValue());
            }
        } catch (IOException e) {
            fail("Unable to write EC variable into html report!");
            BPPLogManager.getLogger().error("Unable to write EC variable into html report!");
        }

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM.dd.yyyy_HH.mm.ss");
        LocalDateTime dateTime = LocalDateTime.now();
        String formattedDateTime = dateTime.format(formatter);

        ecFolder = Paths.get(reportPath.toString(), "ExecutionContext");
        try {
            ecFolder = Paths.get(reportPath.toString(), "ExecutionContext");
            if (Files.notExists(ecFolder))
                Files.createDirectory(ecFolder);
        } catch (IOException e) {
            BPPLogManager.getLogger().info("Unable to create folder to store EC variables");
        }

        String fileName = testCaseName.replace("\"", "_") + "_" + formattedDateTime + ".html";
        String tempFile = ecFolder + File.separator + fileName;
        File file = new File(tempFile);

        if (!htmlStringBuilder.toString().isEmpty()) {
            OutputStream outputStream = new FileOutputStream(file.getAbsoluteFile(), true);
            Writer writer = new OutputStreamWriter(outputStream);
            writer.write(htmlStringBuilder.toString());
            writer.close();
            htmlStringBuilder.setLength(0);
        } else {
            BPPLogManager.getLogger().info("During the " + testCaseName
                    + " test execution no EC variables were found to be saved into report.");
        }

    }

    /**
     * <p>
     * Write report with all Execution Context variables into one txt file
     * </p>
     *
     * @throws IOException Signals that an I/O exception of some sort has occurred. This
     *                     class 6is the general class of exceptions produced by failed
     *                     or interrupted I/O operations.
     */
    public synchronized static void saveAllECToFile() throws IOException {

        if (ExecutionContextHandler.getAllValues().size() == 0) {
            return;
        }

        String testCaseName = testStorage.get(Thread.currentThread().getId()).getModel().getName();
        BPPLogManager.getLogger().info("Saving all EC values in text file for the test: " + testCaseName);

        for (Map.Entry entry : ExecutionContextHandler.getAllValues().entrySet()) {
            String fileName = "Execution_Context_Variables" + ".txt";
            String tempFile = ecFolder + File.separator + fileName;
            File file = new File(tempFile);
            if (file != null)
                if (!file.exists()) {
                    file.createNewFile();
                    FileWriter writer = new FileWriter(file, true);
                    BufferedWriter bufferedWriter = new BufferedWriter(writer);
                    bufferedWriter.write(entry.getKey() + ": " + entry.getValue());
                    bufferedWriter.close();
                } else {
                    FileWriter writer = new FileWriter(file, true);
                    BufferedWriter bufferedWriter = new BufferedWriter(writer);
                    bufferedWriter.newLine();
                    bufferedWriter.write(entry.getKey() + ": " + entry.getValue());
                    bufferedWriter.close();
                }
        }
    }

    //get the name of the log file for further usage in the report
    public void setLogName(String testLogName) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM.dd.yyyy_HH.mm");
        LocalDateTime dateTime = LocalDateTime.now();
        String formattedDateTime = dateTime.format(formatter);

        //String tempName = getCurrentTestName();
        String tempName = testStorage.get(Thread.currentThread().getId()).getModel().getName().replace(" ", "_");
        logName = tempName.replace("\"", "_");
        synchronized (testLogName) {
            Reporter.testLogName = logName + "_" + formattedDateTime + ".log";
        }
        //this.logName = testName.replace(" ", "_") + "_" + formattedDateTime + ".log";
    }


    /**
     * <p>
     * Create log for every test in test suite
     * </p>
     */

    public synchronized static void logForEveryTest(String fileName) {

        logFolder = Paths.get(reportPath.toString(), "Logs");
        try {
            logFolder = Paths.get(reportPath.toString(), "Logs");
            if (Files.notExists(logFolder))
                Files.createDirectory(logFolder);
        } catch (IOException e) {
            BPPLogManager.getLogger().info("Unable to create logs folder");
        }
        FileAppender fileApp = new FileAppender();
        //String file = fileName.replaceAll("\"", "_");
        //testLogName = fileName.replaceAll("\"", "_");
        fileApp.setFile(logFolder + "/" + testLogName.replace(" ", "_"));
        fileApp.setLayout(new PatternLayout("%d{yyyy-MM-dd HH:mm:ss} [%t] %-5p %C{1}:%L - %m%n"));
        fileApp.setAppend(true);
        fileApp.activateOptions();
        BPPLogManager.addFileAppender(fileApp);
    }

    public static void addQtestLink(String testID) {

        qtestBuild = String.format("https://bpp.qtestnet.com/p/39036/portal/project#tab=testexecution&object=3&id="
                + testID);

        String link = String.format("<a target='_blank' href='%s'>qTest Link</a>", qtestBuild);
        node("qTest Execution Link", link);
    }

    //https://automate.browserstack.com/dashboard/v2/builds/7c8b609afec733f8009687fb45014e5efe9278a2/sessions/bbcd18b49789624603a57d2bfcd9522073f21ea3
    // ============= BROWSER STACK ====================
    public static String getScreencastLinkFromBrowserStack(String sessionId) {
        if (System.getProperties().containsKey("BstackPlan")
                && System.getProperty("BstackPlan").equalsIgnoreCase("Mobile")) {
            return String.format("https://automate.browserstack.com/dashboard/v2/builds/" + FileIO.getConfigProperty("browserStackMobileBuild") + "/sessions/" + sessionId);
        } else if (System.getProperties().containsKey("BstackPlan")
                && System.getProperty("BstackPlan").equalsIgnoreCase("Venus")) {
            return String.format("https://automate.browserstack.com/dashboard/v2/builds/" + FileIO.getConfigProperty("browserStackVenusBuild") + "/sessions/" + sessionId);
        } else if (System.getProperties().containsKey("BstackPlan")
                && System.getProperty("BstackPlan").equalsIgnoreCase("Terra")) {
            return String.format("https://automate.browserstack.com/dashboard/v2/builds/" + FileIO.getConfigProperty("browserStackTerraBuild") + "/sessions/" + sessionId);
        } else if (System.getProperties().containsKey("BstackPlan")
                && System.getProperty("BstackPlan").equalsIgnoreCase("Terra")) {
            return String.format("https://automate.browserstack.com/dashboard/v2/builds/" + FileIO.getConfigProperty("browserStackTitanBuild") + "/sessions/" + sessionId);
        } else
            return String.format("https://automate.browserstack.com/dashboard/v2/builds/" + FileIO.getConfigProperty("browserStackBuild") + "/sessions/" + sessionId);
    }


    public static void addLinkToReport(String ref) {
        String link = String.format("<a target='_blank' href='%s'>Screencast Link</a>", ref);
        node("BrowserStack Information", link);
    }


    public static void updateBrowserStackJob(String jobStatus, String sessionId) {
        try {
            String payload = "";
            if (jobStatus.contains("pass")) {
                payload = String.format("{\"status\":\"passed\"}");
            } else {
                payload = String.format("{\"status\":\"failed\"}");
            }

            String userName = FileIO.getConfigProperty("browserStackUsername");
            String password = FileIO.getConfigProperty("browserStackPassword");

            URL url = new URL(String.format("https://api.browserstack.com/automate/builds/" + FileIO.getConfigProperty("browserStackBuild") + "/sessions/" + sessionId + ".json"));
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setDoOutput(true);
            connection.setRequestMethod("PUT");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Accept", "application/json");
            connection.setRequestProperty("Authorization",
                    "Basic " + getBasicAuthenticationEncoding(userName, password));

            OutputStreamWriter osw = new OutputStreamWriter(connection.getOutputStream());
            osw.write(payload);
            osw.flush();
            osw.close();

            if (connection.getResponseCode() == 200) {
                Reporter.log("BrowserStack job has been updated successfully");
            } else {
                Reporter.log("BrowserStack job has NOT been updated");
            }

            System.err.println(connection.getResponseCode());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private static String getBasicAuthenticationEncoding(String username, String password) {

        String userPassword = username + ":" + password;
        return new String(Base64.encodeBase64(userPassword.getBytes(StandardCharsets.UTF_8)));
    }

    //Methods required only for API tests

    public static synchronized void addApiTest(Method m, String testName) {

        ExtentTest test = extent.createTest(testName);
        testStorage.put(Thread.currentThread().getId(), test);
        browserLink = "<img src='https://i.imgur.com/zXAnKwH.png' class='BrowserLogo'>";

        if (System.getProperties().containsKey("environment")) {
            env = System.getProperty("environment");
            test.assignCategory(env.concat("<span>&nbsp;-&nbsp;Environment</span>"));
        } else {
            env = "QA";
            test.assignCategory(env.concat("<span>&nbsp;-&nbsp;Environment</span>"));
        }
        test.info(browserLink);
    }

    public static synchronized void stopReportingAPI(ITestResult result) {

        if (result.getStatus() == ITestResult.FAILURE)
            failTryTakingScreenshot("Test failed because of: " + result.getThrowable().getMessage());
        else if (result.getStatus() == ITestResult.SKIP)
            log("Test: " + testStorage.get(Thread.currentThread().getId()).toString() + " skipped");
        else
            passApi("Test passed!");
    }

    public static synchronized void passApi(String log) {

        String currentTestName = getCurrentTestName();
        if (currentTestName.contains("attempt")) {
            RetryAnalyzer.passMap.put(currentTestName.substring(0, currentTestName.length() - 10), "pass");
        } else {
            RetryAnalyzer.passMap.put(currentTestName, "pass");
        }
        testStorage.get(Thread.currentThread().getId()).pass(log);
    }

    public static synchronized String getQuarkImagesFolder() {
        try {
            Path rootPath = getQuarkScreenshotsPath();
            if (Files.notExists(rootPath))
                quarkPath = Files.createDirectories(rootPath);
            else
                quarkPath = rootPath;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return quarkPath.toString();
    }

    private static Path getQuarkScreenshotsPath() {
        return Paths.get(getReportPath().toString(), "PDFDifferences");
    }
}