package ui.utils;

import com.google.common.base.Function;
import org.hamcrest.Matcher;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.remote.LocalFileDetector;
import org.openqa.selenium.remote.RemoteWebElement;
import org.openqa.selenium.support.ui.*;
import ui.utils.*;
import ui.utils.bpp.PreProcessFiles;
import ui.utils.bpp.TestParametersController;

import java.time.Duration;
import java.time.temporal.ChronoUnit;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.IntStream;

import static org.hamcrest.Matchers.*;

/**
 * <p> Base class for all page objects.
 * A class to store Selenium-specific operations </p>.
 * @author rlevytskyi
 */

public class SeleniumHelper {

    public static Map<String,String> specialLocatorsMap;
    public static Map<String,String> locatorsMap;
    public static Map<String,String> stepSignaturesMap;
    public static List<String> reusablesList;

    public static final ThreadLocal<WebDriver> driver = new ThreadLocal<WebDriver>();
    private final String fileUploadPath = PreProcessFiles.TEST_FILES_FOLDER_PATH;
    //boolean map, used by UiHandlers to determine, if exception was handled by any handler. If not, then DEFAULT_HANDLER is executed.
    public static Map<String, Boolean> isHandled = new HashMap<>();
    //boolean, used by UiHandlers to determine, if you want to repeat Action, on which you had an exception, after running handlers.
    public static boolean repeatAction = true;

    //____________________________________________Timeouts section__________________________________________________

    public static final int DEFAULT_TIMEOUT = getTimeout();
    public static final int SHORT_TIMEOUT = getShortTimeout();

    private static int getTimeout() {
        String timeout = FileIO.getConfigProperty("DefaultTimeoutInSeconds");
        if (timeout == null) {
            Reporter.failTryTakingScreenshot("DefaultTimeoutInSeconds parameter was not found");
            timeout = "15";
        }
        return Integer.parseInt(timeout);
    }

    private static int getShortTimeout() {
        String timeout = FileIO.getConfigProperty("ShortTimeoutInSeconds");
        if (timeout == null) {
            Reporter.failTryTakingScreenshot("ShortTimeoutInSeconds parameter was not found");
            timeout = "3";
        }
        return Integer.parseInt(timeout);
    }
    //____________________________________________________________________________________________________________

    //constructor
    public SeleniumHelper() {
    }

    //Getter, that ensures only one driver instance exists in project
    public static WebDriver driver() {
        return driver.get();
    }

    //_______________________________________________Basic Assertions_______________________________________________

    /**
     * Assertion to check if proper page is loaded
     *
     * @param title title that page should have
     * @param url url that page should have
     *
     * @return bool
     */
    public boolean isPageLoaded(String title, String url) {
        boolean result = false;
        Reporter.log("Page title is: " + driver().getTitle());
        Reporter.log("Page URL is: " + driver().getCurrentUrl());
        if (driver().getTitle().contains(title)) {
            result = true;
        } else {
            Reporter.failTryTakingScreenshot("Expected title: " + title + " but was: " + driver().getTitle());
            result = false;
        }

        if (driver().getCurrentUrl().contains(url))
            result = true;
        else {
            Reporter.failTryTakingScreenshot("Expected url: " + url + " but was: " + driver().getCurrentUrl());
            result = false;
        }

        return result;
    }

    /**
     * Assertion to check if specified text is present on the page
     *
     * @param text text to find
     *
     * @return bool
     */
    public boolean isTextPresent(String text) {
        return driver().getPageSource().contains(text);
    }

    /**
     * Assertion to check if specified element is displayed on the page
     *
     * @param by locator of element
     *
     * @return bool
     */
    public boolean isElementPresentAndDisplay(By by) {
        try {
            return findElementIgnoreException(by).isDisplayed();
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Returns number of elements, present on the page by given locator
     *
     * @param by locator of element
     *
     * @return int
     */
    public int numberOfElements(By by) {
        return driver().findElements(by).size();
    }

    //________________________________________________Basic Actions___________________________________________________

    public void reloadPage() {
        Reporter.log("Refreshing the page: " + "\"" + driver().getTitle() + "\"");
        driver().navigate().refresh();
    }

    public static String getSource() {
        String s = driver().getPageSource();
        return s;
    }

    public void openUrl(String url) {
        Reporter.log("Opening the: " + url);
        driver().get(url);
    }

    public void close() {
        Reporter.log("Closing the browser");
        driver().close();
    }

    public String getTitle() {
        Reporter.log("The page title is: " + "\"" + driver().getTitle() + "\"");
        return driver().getTitle();
    }

    public String getURL() {
        Reporter.log("The requested URL is: " + driver().getCurrentUrl());
        return driver().getCurrentUrl();
    }

    public void setText(By element, String value) {
        if (value != null) {
            BPPLogManager.getLogger().info("Setting: " + element +" with value: " + value);
            try {
                clearEntireField(element);
                findElement(element).sendKeys(value);
            } catch (ElementNotInteractableException | StaleElementReferenceException e) {
                new Actions(driver()).sendKeys(value).perform();
            }

        }
    }

    public void openInNewTab(By element) {
        Actions action = new Actions(driver());
        action.keyDown(Keys.CONTROL).click(findElement(element)).keyUp(Keys.CONTROL).build().perform();
    }

    /**
     * Action clears the entire  text field as Selenium's clear() refuses to work on new chrome versions
     *
     * @param element: locator type to be used to locate the button element
     */
    //Todo: Fix click in the middle issue
    //cursor is set in the middle of the field, so if text in field is bigger than the half of the field, text
    //will not be erased completely. Temporary fixed, but the method needs refactoring
    public void clearEntireField(By element) {
        WebElement textField = findElement(element);
        String textArea = findElement(element).getText();
        String backSpace = Keys.BACK_SPACE.toString();
        if (textField.getAttribute("value") == null) {
            int size = textArea.length();
            if (size != 0) {
                clickOnElement(element,
                        UiHandlers.PF_SPINNER_HANDLER,
                        UiHandlers.POPUP_HANDLER,
                        UiHandlers.ACCEPT_ALERT,
                        UiHandlers.PF_SCROLL_HANDLER,
                        UiHandlers.PAGE_NOT_LOAD_HANDLER,
                        UiHandlers.SF_CLICK_HANDLER,
                        UiHandlers.WAIT_HANDLER,
                        UiHandlers.DEFAULT_HANDLER);
                IntStream.range(0, size).mapToObj(i -> backSpace).forEach(textField::sendKeys);
            }
        } else {
            try {
                int size = textField.getAttribute("value").length();
                while (size != 0) {
                    clickOnElement(element,
                            UiHandlers.PF_SPINNER_HANDLER,
                            UiHandlers.POPUP_HANDLER,
                            UiHandlers.ACCEPT_ALERT,
                            UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                            UiHandlers.PAGE_NOT_LOAD_HANDLER,
                            UiHandlers.PF_SCROLL_HANDLER,
                            UiHandlers.SF_CLICK_HANDLER,
                            UiHandlers.WAIT_HANDLER,
                            UiHandlers.DEFAULT_HANDLER);
                }

                if (size != 0) {
                    clickOnElement(element,
                            UiHandlers.PF_SPINNER_HANDLER,
                            UiHandlers.POPUP_HANDLER,
                            UiHandlers.ACCEPT_ALERT,
                            UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                            UiHandlers.PAGE_NOT_LOAD_HANDLER,
                        UiHandlers.PF_SCROLL_HANDLER,
                        UiHandlers.SF_CLICK_HANDLER,
                        UiHandlers.WAIT_HANDLER,
                        UiHandlers.DEFAULT_HANDLER);
                IntStream.range(0, size).mapToObj(i -> backSpace).forEach(textField::sendKeys);
            }

                size = textField.getAttribute("value").length();
                if (size != 0) {
                    clickOnElement(element,
                            UiHandlers.PF_SPINNER_HANDLER,
                            UiHandlers.POPUP_HANDLER,
                            UiHandlers.ACCEPT_ALERT,
                            UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                            UiHandlers.PAGE_NOT_LOAD_HANDLER,
                        UiHandlers.PF_SCROLL_HANDLER,
                        UiHandlers.SF_CLICK_HANDLER,
                        UiHandlers.WAIT_HANDLER,
                        UiHandlers.DEFAULT_HANDLER);
                IntStream.range(0, size).mapToObj(i -> backSpace).forEach(textField::sendKeys);
            }
                size = textField.getAttribute("value").length();
                if (size != 0) {
                    clickOnElement(element,
                            UiHandlers.PF_SPINNER_HANDLER,
                            UiHandlers.POPUP_HANDLER,
                            UiHandlers.ACCEPT_ALERT,
                            UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                            UiHandlers.PAGE_NOT_LOAD_HANDLER,
                            UiHandlers.PF_SCROLL_HANDLER,
                            UiHandlers.SF_CLICK_HANDLER,
                            UiHandlers.WAIT_HANDLER,
                            UiHandlers.DEFAULT_HANDLER);
                    IntStream.range(0, size).mapToObj(i -> backSpace).forEach(textField::sendKeys);
                }

            } catch (InvalidElementStateException e) {
                textField.sendKeys("");
            }
        }
    }

    /**
     * Action to select a value from a dropdown
     *
     * @param locator: locator type to be used to locate the dropdown element
     * @param value:   value to be selected from dropdown
     */
    public void selectValueFromDropDown(By locator, String value) {
        if (!value.equals("")) {
            elementToBeEnable(locator);
            WebElement webelement = driver().findElement(locator);
            Select dropdown = new Select(webelement);
            waitForOptions(locator);
            try {
                selectDropDownOption(dropdown, value);
            } catch (StaleElementReferenceException e1) {
                webelement = driver().findElement(locator);
                dropdown = new Select(webelement);
                waitForOptions(locator);
                selectDropDownOption(dropdown, value);
            }
        }
    }

    /**
     * This method select the value from the dropdown
     *
     * @param dropdown : to pass the WebElement into dropdown
     * @param value    : pass the value to select from dropdown
     */
    public void selectDropDownOption(Select dropdown, String value) {
        try {
            dropdown.selectByVisibleText(value);
        } catch (NoSuchElementException n) {
            value = value.replaceAll(String.valueOf((char) 160), String.valueOf((char) 32));
            dropdown.selectByVisibleText(value);
        }
        WebDriverWait wait = new WebDriverWait(driver(), Duration.ofSeconds(DEFAULT_TIMEOUT));
        wait.until(ExpectedConditions.attributeContains(dropdown.getFirstSelectedOption(), "text", value));
    }

    /**
     * This method gets auto selected value from a dropdown
     *
     * @param locator: locator type to be used to locate the dropdown  element
     * @return a string indicating a value that has been selected
     */
    public String autoSelectFromDropdown(By locator) {

        elementToBeEnable(locator);
        WebElement selectElement = driver().findElement(locator);
        Select select = new Select(selectElement);
        waitForOptions(locator);

        int value;
        Random random = new Random();
        List<WebElement> allOptions = select.getOptions();

        if (allOptions.get(0).getText().toLowerCase().contains("none")||
                allOptions.get(0).getText().toLowerCase().contains("Select a country...")) {
            value = 1 + random.nextInt(allOptions.size() - 1);
        } else {
            value = random.nextInt(allOptions.size() - 1);
        }

        select.selectByIndex(value);
        return allOptions.get(value).getText();
    }


    /**
     * This method wait for the value to populate in the dropdown
     *
     * @param locator :- selector to find the element
     */
    private void waitForOptions(By locator) {
        try {
            BPPLogManager.getLogger().info("Waiting for options to be available...");
            WebElement webelement = driver().findElement(locator);
            Select dropdown = new Select(webelement);
            new FluentWait<WebDriver>(driver()).withTimeout(Duration.of(30, ChronoUnit.SECONDS)).pollingEvery(Duration.ofMillis(10))
                    .until((Function<WebDriver, Boolean>) d -> (dropdown.getOptions().size() >= 2));
        } catch (StaleElementReferenceException s) {
            BPPLogManager.getLogger().info("Seems like the web page is being updated. Waiting...");
            WebElement webelement = driver().findElement(locator);
            Select dropdown = new Select(webelement);
            new FluentWait<WebDriver>(driver()).withTimeout(Duration.of(30, ChronoUnit.SECONDS)).pollingEvery(Duration.ofMillis(10))
                    .until((Function<WebDriver, Boolean>) d -> (dropdown.getOptions().size() >= 2));
        }
    }

    /**
     * Wait for the element to be enable on web page
     *
     * @param locator: locator to wait to make it enable
     */
    public void elementToBeEnable(By locator) {
        WebDriverWait wait = new WebDriverWait(driver(), Duration.ofSeconds(SHORT_TIMEOUT));
        wait.until(ExpectedConditions.elementToBeClickable(locator));
    }

    public WebElement findByText(String element) {
        BPPLogManager.getLogger().info("Trying to find element: " + element );
        return findElement(byText(element));
    }

    public void clickByText(String text) {
        Reporter.log("Clicking on element with text '" + text + "'");
        findElement(byText(text)).click();
    }

    public By byText(String element) {
        return By.xpath("//*[text()='" + element + "']");
    }

    public By byAttribute(String attributeName, String attributeValue) {
        return By.xpath("//*[@" + attributeName + "='" + attributeValue + "']");
    }

    public By byTagAndAttribute(String tagName, String attributeName, String attributeValue) {
        return By.xpath("//" + tagName + "[@" + attributeName + "='" + attributeValue + "']");
    }

    //_______________________________________________Complex Actions__________________________________________________

    /**
     * Method to click on first visible element by specified locator
     *
     * @param element locator of element to find
     * @param elementNumber optional order number of element, if you want to find not FIRST visible element but N of
     *                      all visible elements, found by specified locator
     */
    //todo: rename to clickOnFirstVisibleElement and create another method called clickOnFirstInteractibleElement
    //actually, if you have second, you don't need first
    public void clickOnFirstVisibleElement(By element, int... elementNumber) {
        waitForPageToLoad();
        List<WebElement> elements = findElements(element);
        if (elementNumber.length > 0) {
            elements.get(elementNumber[0]).click();
        } else {
            for (WebElement elem : elements) {
                try {
                    elem.click();
                }  catch(ElementClickInterceptedException clk){
                    BPPLogManager.getLogger().info("Looks like some other element received a click. Will try again");
                    driver().findElement(element).click();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * Method to find group element and continue execution if element is not found
     *
     * @param element locator of element to find
     * @param timeout optional value of timeout for finding specified element
     *
     * @return WebElement
     */
    public static WebElement findElementIgnoreException(By element, int... timeout) {
        waitForPageToLoad();
        int timeoutForFindElement = timeout.length < 1 ? SHORT_TIMEOUT : timeout[0];
        try {
            (new WebDriverWait(driver(), Duration.ofSeconds(timeoutForFindElement)))
                    .until(ExpectedConditions.visibilityOfElementLocated(element));
            return driver().findElement(element);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Method to click on element
     *
     * @param element locator of element to click on
     * @param handlers code from UiHandlers enum, that will be executed, when exception occurs
     */
    public static void clickOnElement(By element, UiHandlers... handlers) {
        try {
            (new WebDriverWait(driver(), Duration.ofSeconds(DEFAULT_TIMEOUT)))
                    .until(ExpectedConditions.visibilityOfElementLocated(element));
            BPPLogManager.getLogger().info("Clicking on: " + element );
            driver().findElement(element).click();
            waitForPageToLoad();
            repeatAction = true;
        } catch (Exception e) {
            for(UiHandlers handler : handlers){
                handler.getHandler().handle(element, e);
            }
            if (repeatAction) clickOnElement(element, handlers);
            waitForPageToLoad();
        }
    }

    /**
     * Method to click on element with JS
     *
     * @param element locator of element to click on
     */
    public static void clickWithJS(By element){
        BPPLogManager.getLogger().info("Clicking by JS on: " + element);
        JavascriptExecutor executor = (JavascriptExecutor)driver();
        executor.executeScript("arguments[0].click();", driver().findElement(element));
    }

    /**
     * Method to execute JS code for some specific element
     *
     * @param element locator of element
     * @param jsCode JS code to execute
     */
    public static void executeJSCodeForElement(By element, String jsCode){
        BPPLogManager.getLogger().info("Executing JS code on element: " + element);
        JavascriptExecutor executor = (JavascriptExecutor)driver();
        executor.executeScript(jsCode, driver().findElement(element));
    }

    /**
     * Method to execute some JS code on desired element
     *
     * @param jsCode JS code to execute
     */
    public void executeJSCode(String jsCode){
      try {
          JavascriptExecutor executor = (JavascriptExecutor) driver();
          BPPLogManager.getLogger().info("Executing JavaScript code");
          executor.executeScript(jsCode);
      } catch (StaleElementReferenceException e1) {
          BPPLogManager.getLogger().info("StaleElementReferenceExeption caught. Try to execute JavaScript code");
          JavascriptExecutor executor = (JavascriptExecutor) driver();
          executor.executeScript(jsCode);
        }
    }

    /**
     * Method to find element by locator
     *
     * @param element locator of element to find
     * @param timeout optional value of timeout for finding selected element
     *
     * @return list of WebElements found by specified locator
     */
    public WebElement findElement(By element, int... timeout) {
        int timeoutForFindElement = timeout.length < 1 ? DEFAULT_TIMEOUT : timeout[0];
        waitForPageToLoad();
        try {
            (new WebDriverWait(driver(), Duration.ofSeconds(timeoutForFindElement)))
                    .until(ExpectedConditions.visibilityOfElementLocated(element));
            return driver().findElement(element);
        } catch (Exception e) {
            BPPLogManager.getLogger().error(Tools.getStackTrace(e));
            Reporter.failTryTakingScreenshot(Tools.getStackTrace(e));
            throw new RuntimeException("Failure finding element");
        }
    }

    /**
     * Method to XPath of element (basically replacing PARAMETER in elementType with element locator)
     *
     * @return special locator
     */
    public String getSpecialElementXPath(String elementLocator, String elementType) {
        String processedLocator = TestParametersController.checkIfSpecialParameter(elementLocator);
        String xpathTemplate = specialLocatorsMap.get(elementType);
        return xpathTemplate.replaceAll("PARAMETER", processedLocator);
    }

    /**
     * Method to find element by locator checking presence of element (not visibility)
     *
     * @param element locator of element to find
     * @param timeout optional value of timeout for finding selected element
     *
     * @return list of WebElements found by specified locator
     */
    public WebElement findPresentElement(By element, int... timeout) {
        int timeoutForFindElement = timeout.length < 1 ? DEFAULT_TIMEOUT : timeout[0];
        waitForPageToLoad();
        BPPLogManager.getLogger().info("Checking the presence of an element: " + element);
        new FluentWait<WebDriver>(driver()).withTimeout(Duration.of(timeoutForFindElement, ChronoUnit.SECONDS))
                .pollingEvery(Duration.ofMillis(1000))
                .ignoring(TimeoutException.class).ignoring(NoSuchElementException.class)
                .until(ExpectedConditions.presenceOfElementLocated(element));
        return driver().findElement(element);
    }

    /**
     * Method to find elements by locator
     *
     * @param element locator of element to find
     * @param timeout optional value of timeout for finding selected element
     *
     * @return list of WebElements found by specified locator
     */
    public List<WebElement> findElements(By element, int... timeout) {
        int timeoutForFindElement = timeout.length < 1 ? DEFAULT_TIMEOUT : timeout[0];
        waitForPageToLoad();
        BPPLogManager.getLogger().info("Finding elements: " + element);
        try {
            (new WebDriverWait(driver(), Duration.ofSeconds(timeoutForFindElement)))
                    .until(ExpectedConditions.presenceOfElementLocated(element));
            return driver().findElements(element);
        } catch (Exception e) {
            BPPLogManager.getLogger().error(Tools.getStackTrace(e));
            Reporter.failTryTakingScreenshot(Tools.getStackTrace(e));
            throw new RuntimeException("Failure finding elements");
        }
    }

    /**
     * Method to get value of element attribute and continue execution if element or attribute is not found
     *
     * @param element locator of element to find attribute value of
     * @param attributeName name of element attribute you want to get
     * @param timeout optional value of timeout for finding selected element
     *
     * @return value of attribute of element
     */
    public String getElementAttributeIgnoreExecption(By element, String attributeName, int... timeout) {
        waitForPageToLoad();
        try {
            return getElementAttribute(element, attributeName, timeout[0]);
        } catch (RuntimeException e) {
            Reporter.log("Got exception. Exception is expected and ignored.");
        }
        return null;
    }

    /**
     * Method to get value of element attribute
     *
     * @param element locator of element to find attribute value of
     * @param attributeName name of element attribute you want to get
     * @param timeout optional value of timeout for finding selected element
     *
     * @return value of attribute of element
     */
    public String getElementAttribute(By element, String attributeName, int... timeout) {
        int timeoutForFindElement = timeout.length < 1 ? DEFAULT_TIMEOUT : timeout[0];
        waitForPageToLoad();
        BPPLogManager.getLogger().info("Getting an: " + element + " by attribute: " + attributeName);
        try {
            (new WebDriverWait(driver(), Duration.ofSeconds(timeoutForFindElement)))
                    .until(ExpectedConditions.visibilityOfElementLocated(element));
            return findElement(element).getAttribute(attributeName);
        } catch (Exception e) {
            Reporter.failTryTakingScreenshot(Tools.getStackTrace(e));
            throw new RuntimeException("Failure getting attribute id of an element");
        }
    }

    /**
     * Method to form By element locator based on type of inserted locator
     * Used in StepDefinitions
     *
     *  1. Starts with "xpath" or "css" - locator is passed directly into a method
     *  2. Parameter exists in locators document - locator value is returned from document
     *  3. None of above - parameter is treated as text value of element: //*[contains(text(), 'parameter')]
     *
     * @param element string locator fo find element
     * @return element By locator
     */
    public By initElementLocator(String element) {

        if (locatorsMap.containsKey(element)) {
            return TestParametersController.initElementByLocator(locatorsMap.get(element));
        } else if(element.contains("xpath=") || element.contains("id=") || element.contains("css=")) {
            return TestParametersController.initElementByLocator(element);
        } else {
            return byText(TestParametersController.checkIfSpecialParameter(element));
        }
    }

    /**
     * Method to check or uncheck the checkbox
     * If shouldBeChecked is true, but the checkbox is unchecked, than this method checks the checkbox
     * Vice versa.
     *
     * @param shouldBeChecked = boolean to set a statement to the checkbox
     * @param element By locator of checkbox
     */
    //method does not work properly
    public void checkCheckbox(By element, boolean shouldBeChecked){
        WebElement checkbox = findElement(element);
        if((!checkbox.isSelected() & shouldBeChecked) || (checkbox.isSelected() & !shouldBeChecked)){
            BPPLogManager.getLogger().info("Checking the checkbox " + checkbox);
            checkbox.click();
        }
    }

    /**
     * Method to check or uncheck the checkbox
     * If shouldBeChecked is true, but the checkbox is unchecked, than this method checks the checkbox
     * Vice versa.
     *
     * @param shouldBeChecked = boolean to set a statement to the checkbox
     * @param element By locator of checkbox
     * @param handlers code from UiHandlers enum, that will be executed, when exception occurs
     */
    public void checkCheckbox(By element, boolean shouldBeChecked, UiHandlers... handlers){
        WebElement checkbox = findElement(element);
        boolean toClick = (!checkbox.isSelected() & shouldBeChecked) || (checkbox.isSelected() & !shouldBeChecked);
        if(toClick){
            BPPLogManager.getLogger().info("Checking the checkbox " + checkbox);
            try{
                checkbox.click();
                repeatAction = true;
            } catch (Exception e) {
                for(UiHandlers handler : handlers){
                    handler.getHandler().handle(element, e);
                }
                if (repeatAction) checkCheckbox(element, shouldBeChecked, handlers);
            }
        }
    }

    /**
     * Method to check or uncheck the checkbox
     * If shouldBeChecked is true, but the checkbox is unchecked, than this method checks the checkbox
     * Vice versa.
     *
     * @param shouldBeChecked = boolean to set a statement to the checkbox
     * @param element By locator of checkbox
     * @param handlers code from UiHandlers enum, that will be executed, when exception occurs
     */
    public void checkCheckboxByJS(By element, boolean shouldBeChecked, UiHandlers... handlers){
        WebElement checkbox = findElement(element);
        boolean toClick = (!checkbox.isSelected() & shouldBeChecked) || (checkbox.isSelected() & !shouldBeChecked);
        if(toClick){
            BPPLogManager.getLogger().info("Checking the checkbox " + checkbox);
            try{
                clickWithJS(element);
                repeatAction = true;
            } catch (Exception e) {
                for(UiHandlers handler : handlers){
                    handler.getHandler().handle(element, e);
                }
                if (repeatAction) checkCheckbox(element, shouldBeChecked, handlers);
            }
        }
    }

    /**
     * Method to scroll to the element
     * Scrolls down until element is in a view
     *
     * @param element WebElement of element to scroll to
     */
    public static void scrollToElement(WebElement element) {
        waitForPageToLoad();
        BPPLogManager.getLogger().info("Scrolling to element: " + element);
        ((JavascriptExecutor) driver()).executeScript("arguments[0].scrollIntoView();", element);
    }

    /**
     * Method to scroll to the bottom of the page
     */
    public static void scrollToBottomOfPage() {
        BPPLogManager.getLogger().info("Scrolling to the bottom of the page.");
        ((JavascriptExecutor) driver()).executeScript("window.scrollTo(0, document.body.scrollHeight)");
        waitForPageToLoad();
    }

    /**
     * Method to scroll to the top of the page
     */
    public static void scrollToTopOfPage() {
        BPPLogManager.getLogger().info("Scrolling to the top of the page.");
        ((JavascriptExecutor) driver()).executeScript("window.scrollTo(0, 0)");
        waitForPageToLoad();
    }

    /**
     * Method to scroll by a certain amount of pixels
     */
    public static void scrollBy(int x, int y) {
        BPPLogManager.getLogger().info("Scrolling horizontally by " + x + " pixels, vertically by " + y + " pixels");
        ((JavascriptExecutor) driver()).executeScript("window.scrollBy(" + x + ", " + y +")");
        waitForPageToLoad();
    }

    /**
     * Method to wait for page to load for DEFAULT_TIMEOUT
     */
    public static void waitForPageToLoad(){
        Wait<WebDriver> wait = new WebDriverWait(driver(),Duration.ofSeconds(DEFAULT_TIMEOUT),Duration.ofSeconds(1)).ignoring(WebDriverException.class);
        if (driver().getTitle().contains("BPP Totara Staging") || driver().getTitle().contains("BPPTS: Automation Board")) {
            sleepFor(2);
            JavascriptExecutor executor = (JavascriptExecutor) driver();
            BPPLogManager.getLogger().info("Executing JavaScript code");
            executor.executeScript("window.stop()");
        }
        else {wait.until(new Function<WebDriver, Boolean>() {
            public Boolean apply(WebDriver driver) {
                return String.valueOf(((JavascriptExecutor) driver).executeScript("return document.readyState"))
                        .equals("complete");
            }
        }); }
    }


    /**
     * Method to call Thread.sleep
     *
     * @param msTimeout time to wait in milliseconds
     */
    public static void sleepFor(int msTimeout) {
        try {
            Thread.sleep(msTimeout);
        } catch (InterruptedException e) {
        }
    }

    /**
     * Method to wait for alert
     *
     * @param timeout time to wait in milliseconds
     */
    static void waitForAlert(int timeout) {
        int i = 0;
        BPPLogManager.getLogger().info("Waiting for alert");
        while (i++ < timeout) try {
            driver().switchTo().alert();
            break;
        } catch (NoAlertPresentException e)
        {
            sleepFor(1);
            continue;
        }
    }

    /**
     * Method to hover over selected element
     *
     * @param element locator of element to hover over
     */
    // Does not work in Firefox because of geckodriver_mac bug
    // https://stackoverflow.com/questions/40360223/webdriverexception-moveto-did-not-match-a-known-command
    public void hoverItem(By element) {
        BPPLogManager.getLogger().info("Hover over an alement: " + element);
        Actions action = new Actions(driver());
        action.moveToElement(findElement(element)).build().perform();
    }

    /**
     * Method to hover over selected element
     *
     * @param sourceElement locator of element to drag from
     * @param targetElement locator of element to drag to
     */
    // Does not work in Firefox because of geckodriver_mac bug
    // https://stackoverflow.com/questions/40360223/webdriverexception-moveto-did-not-match-a-known-command
    public void dragAndDrop(By sourceElement, By targetElement) {
        BPPLogManager.getLogger().info("drag: " + sourceElement + " element to " + targetElement + " element");
        Actions action = new Actions(driver());
        action.dragAndDrop(findElement(sourceElement),findElement(targetElement)).perform();
    }

    /**
     * Method to switch to iFrame on the page
     *
     * @param frameName locator of iFrame you need to switch to
     */
    public void switchToFrame(By frameName) {
        BPPLogManager.getLogger().info("Switching to frame: " + frameName);
        sleepFor(3);
        try {
            driver().switchTo().frame(findPresentElement(frameName, 3));
        } catch (Exception e) {
            e.getMessage();
        }
    }

    /**
     * Method to switch back from iFrame to default page content
     */
    public void switchToDefaultContent() {
        Reporter.log("Switch to default content");
        driver().switchTo().defaultContent();
    }

    /**
     * Action to switch to specified window index. Index = 1 is supposed to be
     * the index of main window
     *
     * @param index - index of a window that it is needed to switch to.
     */
    public void switchToWindowByIndex(int index) {
        ArrayList<String> windows;
        if (index > 1) {
            sleepFor(3);
            windows = new ArrayList<String>(driver().getWindowHandles());
            driver().switchTo().window(windows.get(index - 1));
        } else {
            try {
               wait(5);
            } catch (Exception e) {
                BPPLogManager.getLogger().warn("Seems like several windows are still opened." +
                        " This may mean that some windows don't close themselves automatically." +
                        " Trying to close them...");
                windows = new ArrayList<String>(driver().getWindowHandles());
                for (int i = windows.size(); i > 1; i--) {
                    driver().switchTo().window(windows.get(i - 1)).close();
                    sleepFor(1);
                }
            }
            windows = new ArrayList<String>(driver().getWindowHandles());
            driver().switchTo().window(windows.get(0));
        }
    }

    /**
     * Action to wait while browser opens all expected windows. Used when
     * expected number of windows is greater than 1
     *
     * @param timeoutSeconds  - number of SECONDS to wait for expected windows to appears
     * @param numberOfWindows - indicates the minimal number of windows to wait for
     */
    private void waitWhileExpectedWindowsAppear(int timeoutSeconds, int numberOfWindows) {
        Matcher<?> matcher = is(greaterThanOrEqualTo(numberOfWindows));
        new FluentWait<WebDriver>(driver()).withTimeout(Duration.of(timeoutSeconds, ChronoUnit.SECONDS)).pollingEvery(Duration.ofMillis(1000))
                .until((Function<WebDriver, Boolean>) d -> (matcher.matches(driver().getWindowHandles().size())));
    }

    /**
     * Action to wait while browser close extra windows and leaves the main one.
     * Used when expected number of windows is 1
     *
     * @param timeoutSeconds  - number of SECONDS to wait for expected windows to disappears
     * @param numberOfWindows - indicates the number of windows be left
     */
    private void waitWhileExpectedWindowsLeft(int timeoutSeconds, int numberOfWindows) {
        Matcher<?> matcher = is(lessThanOrEqualTo(numberOfWindows));
        new FluentWait<WebDriver>(driver()).withTimeout(Duration.of(timeoutSeconds, ChronoUnit.SECONDS)).pollingEvery(Duration.ofMillis(1000))
                .until((Function<WebDriver, Boolean>) d -> (matcher.matches(driver().getWindowHandles().size())));
    }

    /**
     * Action to imitate key press from keyboard
     *
     * @param value: value to be entered in appropriate field using metadata values
     * @param element By locator of element to press the key for
     */
    public void pressKeyFromKeyboard(By element, String value) {
        if (!value.equals("")) {
            try {
                WebElement keyItem = findElement(element);
                keyItem.sendKeys(Keys.valueOf(value));
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            BPPLogManager.getLogger().error("No value defined for 'PressKey'. Check your parameters");
        }
    }

    /**
     * Action to verify that element is not present
     *
     * @param element By locator of element to press the key for
     */
    public boolean checkIfElementNotExist(By element) {
        waitForPageToLoad();
        if (driver().findElements(element).size() != 0) {
            BPPLogManager.getLogger().info("Element: " + element + " is not displayed");
            return true;
        } else {
            BPPLogManager.getLogger().info("Element: " + element + " is displayed");
            return false;
        }
    }

    /**
     * Action to upload a file
     *
     * @param locator: locator type to be used to locate the element for uploading a file
     */
    public void fileUpload(By locator, String filename) {
        WebElement webelement = findPresentElement(locator);
        ((RemoteWebElement) webelement ).setFileDetector(new LocalFileDetector());
        webelement.sendKeys(fileUploadPath + "/" + filename);
    }

    /**
     * Action to validate text data from an element
     *
     * @param locator: locator type to be used to locate the radio button element
     * @return String webelement text
     */
    public String getTextValueFromField(By locator) {

        WebElement webelement = driver().findElement(locator);
        String data = webelement.getText().trim();
        if (data.isEmpty()) {
            try {
                BPPLogManager.getLogger().info("Getting text from value attribute");
                data = webelement.getAttribute("value").trim();
            } catch (Exception e) {
                data = "";
            }
        }
        return data;
    }

    /**
     * Action to accept alert / error message on the web page
     *
     * @return String webelement text with information provided in the Popup Window
     */
    public void acceptAlertMessage() {
        Alert jsalert = new WebDriverWait(driver(),Duration.ofSeconds(5)).until(ExpectedConditions.alertIsPresent());
        String alertMsg = jsalert.getText();

        Reporter.log("Expected:" + alertMsg + " popup appeared");
        jsalert.accept();
    }

    /**
     * Used to get specific data using Regular Expressions
     *
     * @param locator: locator type to be used to locate the element
     */
    public String selectSpecificData(By locator) {

        String udatedLocator = locator.toString();
        String[] decomposedLocator = udatedLocator.split("\\|");
        By element = By.xpath(decomposedLocator[0].substring(10));
        WebElement webelement = driver().findElement(element);
        String data;

        try {
            data = webelement.getText().trim();
        } catch (Exception e) {
            return "";
        }

        String regexSuitableLocator = decomposedLocator[1].replace("\\", "");
        for (String singleElement : data.split(" ")) {
            if (singleElement.matches(regexSuitableLocator)) {
                return singleElement;
            }
        }
        throw new NotFoundException("Requested element was not found by " + regexSuitableLocator);
    }

    public static boolean waitForJavaScriptToRun(int... timeout) {
        int timeoutForJS = timeout.length < 1 ? SHORT_TIMEOUT : timeout[0];
        try {
            Reporter.log("Waiting for JavaScript to updated the DOM");

            JavascriptExecutor javascriptExecutor = (JavascriptExecutor) driver();
            driver().manage().timeouts().setScriptTimeout(timeoutForJS, TimeUnit.SECONDS);

            //entire DOM tree is checked
            javascriptExecutor.executeAsyncScript("var callback = arguments[arguments.length - 1];" +
                    "document.addEventListener('DOMSubtreeModified', function(event) {" +
                    "callback();" +
                    "});");

            Reporter.log("JavaScript has updated the DOM");
            driver().manage().timeouts().setScriptTimeout(0, TimeUnit.MICROSECONDS);
        } catch (Exception e) {
            Reporter.log("Seems like JS has already updated the DOM");
        }
        return true;
    }

    /**
     * Method to perform right mouse click on selected element
     *
     * @param element locator of element to perform click
     */

    public void rightMouseClick(By element) {

        Actions action = new Actions(driver());
        try {
            (new WebDriverWait(driver(), Duration.ofSeconds(DEFAULT_TIMEOUT)))
                    .until(ExpectedConditions.visibilityOfElementLocated(element));
            BPPLogManager.getLogger().info("Right mouse click for an element: " + element);
            action.contextClick(findElement(element)).build().perform();
            waitForPageToLoad();
            repeatAction = true;
        } catch (Exception e) {
            waitForPageToLoad();
            action.contextClick(findElement(element)).build().perform();
        }
    }

    /**
     * Method to perform double mouse click on selected element
     *
     * @param element locator of element to perform click
     */

    public void doubleClick(By element, UiHandlers... handlers) {
        Actions action = new Actions(driver());
        try {
            (new WebDriverWait(driver(), Duration.ofSeconds(DEFAULT_TIMEOUT)))
                    .until(ExpectedConditions.visibilityOfElementLocated(element));
            BPPLogManager.getLogger().info("Double mouse click on: " + element );
            action.doubleClick(findElement(element)).perform();
            waitForPageToLoad();
            repeatAction = true;
        } catch (Exception e) {
            for(UiHandlers handler : handlers){
                handler.getHandler().handle(element, e);
            }
            if (repeatAction) doubleClick(element, handlers);
            waitForPageToLoad();
        }
    }
}
