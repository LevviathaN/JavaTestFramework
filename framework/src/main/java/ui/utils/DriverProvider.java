package ui.utils;

import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.remote.BrowserType;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import ui.utils.bpp.PropertiesHelper;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;


/**
 * @author yzosin
 * <p> Enables to create webdriver isntance passed from System Property variable as driver=BSTACK_CHROME </p>
 */

public class DriverProvider {

    public static final String OS_EXTENTION = (System.getProperty("os.name").toLowerCase().contains("win")) ? ".exe" :
            (System.getProperty("os.name").toLowerCase().contains("mac")) ? "_mac" :
                    "_linux";
    static String FIREFOX_PATH = "drivers/geckodriver" + OS_EXTENTION;
    static String CHROME_PATH = "drivers/chromedriver" + OS_EXTENTION;

    //private static WebDriver instance;
    public static final ThreadLocal<WebDriver> instance = new ThreadLocal<WebDriver>();

    static String BROWSER_TYPE;

    static public FirefoxDriver getFirefox() {

        System.setProperty("webdriver.gecko.driver", FIREFOX_PATH);

        try {

            FirefoxProfile profile = new FirefoxProfile();
            profile.setPreference("browser.download.folderList", 2);
            profile.setPreference("browser.helperApps.neverAsk.saveToDisk",
                    "image/jpeg, application/pdf, application/octet-stream, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            profile.setPreference("pdfjs.disabled", true);


            FirefoxOptions options = new FirefoxOptions();
            options.setCapability(FirefoxDriver.PROFILE, profile);

            return new FirefoxDriver(options);
        } catch (Exception e) {
            throw new WebDriverException("Unable to launch the browser", e);
        }
    }

    static public ChromeDriver getChrome() {

        try {
            File folder = new File("downloads");
            if (folder != null) {
                folder.mkdir();
            }

            System.setProperty("webdriver.chrome.driver", CHROME_PATH);
            ChromeOptions options = new ChromeOptions();
            Map<String, Object> prefs = new HashMap<String, Object>();
            prefs.put("credentials_enable_service", false);
            prefs.put("profile.password_manager_enabled", false);


            options.setExperimentalOption("prefs", prefs);
            options.addArguments("--test-type");
            options.addArguments("--start-maximized");
            options.addArguments("--disable-save-password-bubble");
            options.addArguments("--no-sandbox");
            options.addArguments("--disable-infobars");
            options.addArguments("--disable-dev-shm-usage");
            options.addArguments("--disable-browser-side-navigation");
            options.addArguments("--disable-gpu");
            options.addArguments("enable-automation");
            options.setPageLoadStrategy(PageLoadStrategy.NONE);
            options.setCapability(ChromeOptions.CAPABILITY, options);
            options.setCapability(CapabilityType.ACCEPT_SSL_CERTS, true);
            options.setCapability("chrome.switches", Arrays.asList("--no-default-browser-check"));

            HashMap<String, Object> chromePreferences = new HashMap<>();
            chromePreferences.put("profile.password_manager_enabled", "false");
            chromePreferences.put("credentials_enable_service", "false");
            chromePreferences.put("profile.default_content_settings.popups", 0);
            chromePreferences.put("download.default_directory", folder.getAbsolutePath());

            options.setCapability("chrome.prefs", chromePreferences);

            return new ChromeDriver(options);
        } catch (Exception e) {
            throw new WebDriverException("Unable to launch the browser", e);
        }
    }

    static public RemoteWebDriver getChromeBrowserStack() {

        try {
            File folder = new File("downloads");
            if (folder != null) {
                folder.mkdir();
            }
            ChromeOptions options = new ChromeOptions();
            Map<String, Object> prefs = new HashMap<String, Object>();
            prefs.put("credentials_enable_service", false);
            prefs.put("profile.password_manager_enabled", false);


            options.setExperimentalOption("prefs", prefs);
            options.setPageLoadStrategy(PageLoadStrategy.EAGER);
            options.addArguments("--test-type");
            options.addArguments("--start-maximized");
            options.addArguments("--disable-save-password-bubble");
            options.addArguments("--no-sandbox");
            options.addArguments("--disable-infobars");
            options.addArguments("--disable-dev-shm-usage");
            options.addArguments("--disable-browser-side-navigation");
            options.addArguments("--disable-gpu");
            options.addArguments("enable-automation");

            options.setCapability("chrome.switches", Arrays.asList("--no-default-browser-check"));
            HashMap<String, Object> chromePreferences = new HashMap<>();
            chromePreferences.put("profile.password_manager_enabled", "false");
            chromePreferences.put("credentials_enable_service", "false");
            chromePreferences.put("profile.default_content_settings.popups", 0);
            chromePreferences.put("download.default_directory", folder.getAbsolutePath());
            options.setCapability("chrome.prefs", chromePreferences);
            options.setCapability("browser_version", FileIO.getConfigProperty("ch_version"));
            options.setCapability("os", FileIO.getConfigProperty("os"));
            options.setCapability("os_version", FileIO.getConfigProperty("os_version"));
            options.setCapability("resolution", "1920x1080");
            options.setCapability("browserstack.debug", "true");
            options.setCapability("browserstack.video", "true");
            options.setCapability("browserstack.networkLogs", "false");
            options.setCapability("build", "automation");
            options.setCapability("browserstack.local", "true");
            options.setCapability("browserstack.console", "errors");
            options.setCapability("browserstack.localIdentifier", "TestAutomation");

            options.setCapability(ChromeOptions.CAPABILITY, options);
            options.setCapability(CapabilityType.ACCEPT_SSL_CERTS, true);
            options.setCapability(ChromeOptions.CAPABILITY, options);

            //configure capability to set the job name with Test Case name
            String testName = Reporter.getCurrentTestName();
            options.setCapability("name", testName);

            //RemoteWebDriver driver = new RemoteWebDriver(new URL(PropertiesHelper.determineEffectivePropertyValue("browserStackURL")), options);
            //driver.setFileDetector(new LocalFileDetector());
            return new RemoteWebDriver(new URL(FileIO.getConfigProperty("browserStackURL")), options);

        } catch (Exception e) {
            throw new WebDriverException("Unable to launch the browser", e);
        }
    }

    static public RemoteWebDriver getFirefoxBrowserStack() {

        try {
            FirefoxProfile profile = new FirefoxProfile();
            profile.setPreference("browser.download.folderList", 2);
            profile.setPreference("browser.helperApps.neverAsk.saveToDisk",
                    "image/jpeg, application/pdf, application/octet-stream, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            profile.setPreference("pdfjs.disabled", true);
            //To skip the insecured password behaviour
            profile.setPreference("security.insecure_password.ui.enabled", false);
            profile.setPreference("security.insecure_field_warning.contextual.enabled", false);

            //Create Desired Capability Instance
            FirefoxOptions options = new FirefoxOptions();
            HashMap<String, Object> firefoxPreferences = new HashMap<>();
            firefoxPreferences.put("profile.password_manager_enabled", "false");
            firefoxPreferences.put("credentials_enable_service", "false");
            firefoxPreferences.put("profile.default_content_settings.popups", 0);
            options.addArguments("--test-type");
            options.addArguments("--start-maximized");
            options.addArguments("--disable-save-password-bubble");
            options.addArguments("--no-sandbox");
            options.addArguments("--disable-infobars");
            options.addArguments("--disable-dev-shm-usage");
            options.addArguments("--disable-browser-side-navigation");
            options.addArguments("--disable-gpu");
            options.addArguments("enable-automation");
            options.setPageLoadStrategy(PageLoadStrategy.NONE);
            options.setCapability("browser_version", FileIO.getConfigProperty("ff_version"));
            options.setCapability("os", FileIO.getConfigProperty("os"));
            options.setCapability("os_version", FileIO.getConfigProperty("os_version"));
            options.setCapability("resolution", "1920x1080");
            options.setCapability("browserstack.debug", "true");
            options.setCapability("browserstack.video", "true");
            options.setCapability("browserstack.networkLogs", "true");
            options.setCapability("build", "automation");
//            options.setCapability("browserstack.local", "true");
//            options.setCapability("browserstack.localIdentifier", "TestAutomation");
            options.setCapability(FirefoxDriver.PROFILE, profile);

            //configure capability for setting up Test Case name for Sauce Jobs
            String testName = Reporter.getCurrentTestName();
            options.setCapability("name", testName);

            return new RemoteWebDriver(new URL(FileIO.getConfigProperty("browserStackURL")), options);
        } catch (Exception e) {
            throw new WebDriverException("Unable to launch the browser", e);
        }
    }

    static public RemoteWebDriver getIOSMobileDevice() {

        try {
            File folder = new File("downloads");
            if (folder != null) {
                folder.mkdir();
            }
            DesiredCapabilities capabilities = new DesiredCapabilities();

            Map<String, Object> prefs = new HashMap<String, Object>();
            prefs.put("credentials_enable_service", false);
            prefs.put("profile.password_manager_enabled", false);

            capabilities.setCapability("device", System.getProperty("device"));
            capabilities.setCapability("os_version", FileIO.getConfigProperty("ios_mobile_version"));
            capabilities.setCapability("browserName", "iPhone");
            capabilities.setCapability("realMobile", "true");
            capabilities.setCapability("resolution", "1920x1080");
            capabilities.setCapability("browserstack.debug", "true");
            capabilities.setCapability("browserstack.video", "true");
            capabilities.setCapability("browserstack.networkLogs", "true");
            capabilities.setCapability("build", "automation");
            capabilities.setCapability("browserstack.local", "true");
            capabilities.setCapability("browserstack.console", "errors");
            capabilities.setCapability("browserstack.localIdentifier", "TestAutomation");
            capabilities.setCapability("browserstack.appium_version", "1.17.0");
            //capabilities.setCapability("autoAcceptAlerts",true);
            //capabilities.setCapability("autoDismissAlerts", true);
            capabilities.setCapability(CapabilityType.ACCEPT_SSL_CERTS, true);

            //configure capability to set the job name with Test Case name
            String testName = Reporter.getCurrentTestName();
            capabilities.setCapability("name", testName);

            return new RemoteWebDriver(new URL(FileIO.getConfigProperty("browserStackURL")), capabilities);

        } catch (Exception e) {
            throw new WebDriverException("Unable to launch the browser", e);
        }
    }

    static public RemoteWebDriver getAndroidMobileDevice() {

        try {
            File folder = new File("downloads");
            if (folder != null) {
                folder.mkdir();
            }
            DesiredCapabilities capabilities = new DesiredCapabilities();

            Map<String, Object> prefs = new HashMap<String, Object>();
            prefs.put("credentials_enable_service", false);
            prefs.put("profile.password_manager_enabled", false);

            capabilities.setCapability("device", System.getProperty("device"));
            capabilities.setCapability("os_version", FileIO.getConfigProperty("android_mobile_version"));
            capabilities.setCapability("browserName", "Chrome");
            capabilities.setCapability("realMobile", "true");
            capabilities.setCapability("resolution", "1920x1080");
            capabilities.setCapability("browserstack.debug", "true");
            capabilities.setCapability("browserstack.video", "true");
            capabilities.setCapability("browserstack.networkLogs", "true");
            capabilities.setCapability("build", "automation");
            capabilities.setCapability("browserstack.local", "true");
            capabilities.setCapability("browserstack.console", "errors");
            capabilities.setCapability("browserstack.localIdentifier", "TestAutomation");

            //configure capability to set the job name with Test Case name
            String testName = Reporter.getCurrentTestName();
            capabilities.setCapability("name", testName);

            return new RemoteWebDriver(new URL(FileIO.getConfigProperty("browserStackURL")), capabilities);

        } catch (Exception e) {
            throw new WebDriverException("Unable to launch the browser", e);
        }
    }


    public static WebDriver getDriver() throws MalformedURLException {

        if (instance.get() == null)
            if (getCurrentBrowserName().equalsIgnoreCase(BrowserType.FIREFOX)) {
                instance.set(getFirefox());
            } else if (getCurrentBrowserName().equalsIgnoreCase(BrowserType.CHROME)) {
                instance.set(getChrome());
            } else if (getCurrentBrowserName().equalsIgnoreCase("BSTACK_CHROME")) {
                instance.set(getChromeBrowserStack());
            } else if (getCurrentBrowserName().equalsIgnoreCase("BSTACK_FIREFOX")) {
                instance.set(getFirefoxBrowserStack());
            } else if (getCurrentBrowserName().equalsIgnoreCase("MOBILE_IOS")) {
                instance.set(getIOSMobileDevice());
            } else if (getCurrentBrowserName().equalsIgnoreCase("MOBILE_ANDROID")) {
                instance.set(getAndroidMobileDevice());
            }
        return instance.get();

    }

    public static void closeDriver() {
        instance.get().quit();
        instance.set(null);
    }

    public static String getCurrentBrowserName() {
        if (BROWSER_TYPE == null)
            if (PropertiesHelper.determineEffectivePropertyValue("driver").equalsIgnoreCase("firefox")) {
                BROWSER_TYPE = BrowserType.FIREFOX;
            } else if (PropertiesHelper.determineEffectivePropertyValue("driver").equalsIgnoreCase("chrome")) {
                BROWSER_TYPE = BrowserType.CHROME;
            } else if (PropertiesHelper.determineEffectivePropertyValue("driver").equalsIgnoreCase("BSTACK_CHROME")) {
                BROWSER_TYPE = "BSTACK_CHROME";
            } else if (PropertiesHelper.determineEffectivePropertyValue("driver").equalsIgnoreCase("BSTACK_FIREFOX")) {
                BROWSER_TYPE = "BSTACK_FIREFOX";
            } else if (PropertiesHelper.determineEffectivePropertyValue("driver").equalsIgnoreCase("MOBILE_ANDROID")) {
                BROWSER_TYPE = "MOBILE_ANDROID";
            } else if (PropertiesHelper.determineEffectivePropertyValue("driver").equalsIgnoreCase("MOBILE_IOS")) {
                BROWSER_TYPE = "MOBILE_IOS";
            }

        return BROWSER_TYPE;
    }

}