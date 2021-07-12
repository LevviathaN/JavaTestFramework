package ui.utils.bpp;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import ui.utils.BPPLogManager;
import ui.utils.Reporter;

import java.util.concurrent.TimeUnit;

/**
 * <p> The class is used to handle the JavaScript behavior </p>
 *
 * Author: Nick
 */
public class JavaScriptHelper {

    /**
     *
     * @param driver
     * @param timeSeconds
     */
    public static void waitForJavaScriptToRun(WebDriver driver, int timeSeconds) {
        try {
            Reporter.log("Waiting for JavaScript to update the DOM");
            BPPLogManager.getLogger().info("Waiting for JavaScript to updated the DOM");
            Reporter.log("Waiting for JavaScript to update the DOM");
            Reporter.log("Waiting for JavaScript to update the DOM");

            JavascriptExecutor javascriptExecutor = (JavascriptExecutor) driver;
            driver.manage().timeouts().setScriptTimeout(timeSeconds, TimeUnit.SECONDS);

            //entire DOM tree is checked
            javascriptExecutor.executeAsyncScript("var callback = arguments[arguments.length - 1];" +
                    "document.addEventListener('DOMSubtreeModified', function(event) {" +
                    "callback();" +
                    "});");

            Reporter.log("JavaScript has updated the DOM");
            BPPLogManager.getLogger().info("JavaScript has updated the DOM");
            Reporter.log("JavaScript has updated the DOM");
            Reporter.log("JavaScript has updated the DOM");
            driver.manage().timeouts().setScriptTimeout(0, TimeUnit.MICROSECONDS);
        } catch (Exception e) {
            Reporter.log("Seems like JS has already updated the DOM");
            BPPLogManager.getLogger().info("Seems like JS has already updated the DOM");
            Reporter.log("Seems like JS has already updated the DOM");
            Reporter.log("Seems like JS has already updated the DOM");
        }

    }

    /**
     *  @param driver
     * @param element
     * @param timeSeconds
     */
    public static void waitForJavaScriptToRun(WebDriver driver, String element, int timeSeconds) {
        try {
            Reporter.log("Waiting for JavaScript to updated the passed element along with its descendants");
            BPPLogManager.getLogger().info("Waiting for JavaScript to update the passed element along with its descendants");
            Reporter.log("Waiting for JavaScript to updated the passed element along with its descendants");
            Reporter.log("Waiting for JavaScript to updated the passed element along with its descendants");

            JavascriptExecutor javascriptExecutor = (JavascriptExecutor) driver;
            driver.manage().timeouts().setScriptTimeout(timeSeconds, TimeUnit.SECONDS);

            //checking the element located by xpath to be updated by JS. MutationObserver is used.
            javascriptExecutor.executeAsyncScript("var callback = arguments[arguments.length - 1];" +
                    "var target = arguments[0];" +
                    "var observer = new MutationObserver(function(mutations) {" +
                    "mutations.forEach(function(mutation) {" +
                    "callback();});});" +
                    "var config = { attributes: true, childList: true, characterData: true };" +
                    "observer.observe(target, config);", element);

            //checking the element located by xpath to be updated by JS. EventListener is used.
/*        javascriptExecutor.executeAsyncScript("var callback = arguments[arguments.length - 1];" +
                "var target = arguments[0].parentNode;" +
                "target.addEventListener('DOMSubtreeModified', function(event) {" +
                "callback();" +
                "});", element);*/

            Reporter.log("JS has updated the expected web element");
            BPPLogManager.getLogger().info("JS has updated the expected web element");
            Reporter.log("JS has updated the expected web element");
            Reporter.log("JS has updated the expected web element");
            driver.manage().timeouts().setScriptTimeout(0, TimeUnit.MICROSECONDS);
        } catch (Exception e) {
            Reporter.log("Seems like the expected web element has already been updated by JS");
            BPPLogManager.getLogger().info("Seems like the expected web element has already been updated by JS");
            Reporter.log("Seems like the expected web element has already been updated by JS");
            Reporter.log("Seems like the expected web element has already been updated by JS");
        }

    }
}
