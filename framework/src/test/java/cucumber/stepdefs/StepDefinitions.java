package cucumber.stepdefs;

import cucumber.reusablesteps.ReusableRunner;
import cucumber.stepdefs.Actions.*;
import io.cucumber.java.AfterStep;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.hamcrest.Matchers;
import org.hamcrest.text.MatchesPattern;
import org.jooq.tools.json.ParseException;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.NoSuchWindowException;
import org.openqa.selenium.WebElement;
import org.testng.Assert;
import org.testng.asserts.SoftAssert;
import ui.utils.SeleniumHelper;
import ui.utils.*;
import ui.utils.bpp.ExecutionContextHandler;
import ui.utils.bpp.TestParametersController;
import ui.utils.pdf.PDFHandler;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import static com.jcabi.matchers.RegexMatchers.matchesPattern;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;


/**
 * Created by Ruslan Levytskyi on 15/3/2019.
 */
public class StepDefinitions extends SeleniumHelper {
    public SoftAssert sa = new SoftAssert();


    @AfterStep
    public void postActions() {
        try {
            driver().switchTo().defaultContent();
        } catch (NoSuchWindowException e) {
            BPPLogManager.getLogger().info("Catching exception: " + e.getMessage().substring(0, 44));
        }
    }

    @Given("^I do debug$")
    public void i_do_debug() {
        String debug = "debug";
    }

    /**
     * Definition to go to specified url.
     * Also checks if the parameter is Meta Data or Execution Context value
     *
     * @param url url where you want navigate to
     * @author Ruslan Levytskyi
     */
    @Given("^I am on \"([^\"]*)\" URL$")
    public void i_am_on_url(String url) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setAction(ActionsWithParameter.GO_TO_URL,url)
                .setMessage("Executing step: I am on '" + url + "' url")
                .execute();
    }

    /**
     * Definition to click an element on the page
     *
     * @param element locator for element you want to click on
     *                initElementLocator builds locator, depending on input parameter:
     *                1. Starts with "xpath" or "css" - locator is passed directly into a method
     *                2. Parameter exists in locators document - locator value is returned from document
     *                3. None of above - parameter is treated as text value of element: //*[contains(text(), 'parameter')]
     * @author Ruslan Levytskyi
     */
    @When("^I click on the \"([^\"]*)\" (?:button|link|option|element)$")
    public void i_click_on_the_button(String element) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocator.CLICK)
                .setMessage("Executing step: I click on the '" + element + "' element")
                .execute();
    }

    /**
     * Definition to click an element on the page by order number
     *
     * @param element locator for element you want to click on
     *                initElementLocator builds locator, depending on input parameter:
     *                1. Starts with "xpath" or "css" - locator is passed directly into a method
     *                2. Parameter exists in locators document - locator value is returned from document
     *                3. None of above - parameter is treated as text value of element: //*[contains(text(), 'parameter')]
     * @author Ruslan Levytskyi
     */
    @When("^I click on the \"([^\"]*)\" element by order \"([^\"]*)\"$")
    public void i_click_on_the_element_by_order(String element, String orderNumber) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setItemIndex(orderNumber)
                .setAction(ActionsWithLocator.CLICK)
                .setMessage("Executing step: I click on the '" + element + "' element by order " + orderNumber)
                .execute();
    }

    /**
     * Definition to click an element if it is present on the page
     *
     * @param element locator for element you want to click on
     *                initElementLocator builds locator, depending on input parameter:
     *                1. Starts with "xpath" or "css" - locator is passed directly into a method
     *                2. Parameter exists in locators document - locator value is returned from document
     *                3. None of above - parameter is treated as text value of element: //*[contains(text(), 'parameter')]
     * @author Ruslan Levytskyi
     */
    @When("^I click on the \"([^\"]*)\" (?:button|link|option|element) if present$")
    public void i_click_on_the_element_if_present(String element) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocator.CLICK_IF_PRESENT)
                .setMessage("Executing step: I click on the '" + element + "' element if present")
                .execute();
    }

    /**
     * Definition to click an element on the page if given condition is true
     *
     * @param element locator for element you want to click on
     *                initElementLocator builds locator, depending on input parameter:
     *                1. Starts with "xpath" or "css" - locator is passed directly into a method
     *                2. Parameter exists in locators document - locator value is returned from document
     *                3. None of above - parameter is treated as text value of element: //*[contains(text(), 'parameter')]
     * @author Ruslan Levytskyi
     */
    @When("^I click on the \"([^\"]*)\" (?:button|link|option|element) if \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_click_on_the_button_if(String element, String conditionParameter, String condition) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocator.CLICK)
                .setCondition(conditionParameter,condition)
                .setMessage("Executing step: I click on the '" + element + "' element if " + conditionParameter + " " + condition)
                .execute();
    }

    /**
     * Definition to send some text into some text input field
     *
     * @param element locator for element you want to send text to
     *                Parameter exists in locators document - locator value is returned from document
     * @param text    text you want to send to element
     *                Here we also check if text is EC_ or MD_ of KW_
     * @author Ruslan Levytskyi
     */
    @When("^I fill the \"([^\"]*)\" field with \"([^\"]*)\"$")
    public void fill_field(String element, String text) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocatorAndParameter.SET_TEXT, text)
                .setMessage("Executing step: I fill the  '" + element + "' field with '" + text + "'")
                .execute();
    }

    /**
     * Definition to wait for desired amount of seconds
     *
     * @param seconds amount of seconds you want to wait
     *                Here we also check if text is EC_ or MD_ of KW_
     * @author Ruslan Levytskyi
     */
    @When("^I wait for \"([^\"]*)\" seconds$")
    public void wait_for(String seconds) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setAction(ActionsWithParameter.WAIT,seconds)
                .setMessage("Executing step: I wait for " + seconds + " seconds")
                .execute();
}

    /**
     * Definition to wait for desired amount of seconds if condition is true
     *
     * @param seconds amount of seconds you want to wait
     *                Here we also check if text is EC_ or MD_ of KW_
     * @author Ruslan Levytskyi
     */
    @When("^I wait for \"([^\"]*)\" seconds if \"([^\"]*)\" \"([^\"]*)\"$")
    public void wait_for_if(String seconds, String conditionParameter, String condition) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setCondition(conditionParameter, condition)
                .setAction(ActionsWithParameter.WAIT,seconds)
                .setMessage("Executing step: I wait for " + seconds + " seconds")
                .execute();
    }

    /**
     * Definition to hover over element
     *
     * @param element locator of element you want to hover over
     *                Here we also check if text is EC_ or MD_ of KW_
     * @author Ruslan Levytskyi
     */
    @When("^I hover over the \"([^\"]*)\" (?:button|link|option|element)$")
    public void hover_over(String element) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocator.HOVER)
                .setMessage("Executing step: I hover over the '" + element + "' element")
                .execute();
    }

    /**
     * Definition to check visibility of the element
     *
     * @param element locator of element you want to check if it's visible
     *                Here we also check if text is EC_ or MD_ of KW_
     * @author Ruslan Levytskyi
     */
    @Then("^I should see the \"([^\"]*)\" (?:button|message|element)$")
    public void i_should_see_the_text(String element) {
        Reporter.log("Executing step: I should see the '" + element + "' element");
        boolean isDisplayed = false;
        for (int i = 0; i < findElements(initElementLocator(element)).size(); i++) {
            if (findElements(initElementLocator(element)).get(i).isDisplayed()) {
                isDisplayed = true;
            }
        }
        Assert.assertTrue(isDisplayed, "Element with " + element + " text is not displayed");
    }

    /**
     * Definition to verify that you are on the page with correct title
     *
     * @param pageTitle locator of element you want to check if it's visible
     *                  Here we also check if text is EC_ or MD_ of KW_
     * @author Ruslan Levytskyi
     */
    @Then("^I should be redirected to the \"([^\"]*)\" page$")
    public void i_should_be_redirected_to_page(String pageTitle) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setAction(ActionsWithParameter.VALIDATE_PAGE_TITLE, pageTitle)
                .setMessage("Executing step: I should be redirected to the '" + pageTitle + "' page")
                .execute();
    }

    /**
     * Definition to execute reusable steps
     *
     * @param reusableName name of reusable step (Scenario in ReusableSteps.feature) you want to execute
     *                     Here we also check if text is EC_ or MD_ of KW_
     * @author Ruslan Levytskyi
     */
    @Then("^I execute \"([^\"]*)\" reusable step$")
    public void i_execute_reusable_step(String reusableName) {
        Reporter.log("Executing step: I execute '" + reusableName + "' reusable step");
        ReusableRunner.getInstance().executeReusable(TestParametersController.checkIfSpecialParameter(reusableName));
    }

    @Then("^I execute \"([^\"]*)\" reusable step with some additional steps$")
    public void i_execute_reusable_step_with(String reusableName, Map<Integer, String> steps) {
        Reporter.log("Executing step: I execute '" + reusableName + "' reusable step with some additional steps");
        ReusableRunner.getInstance().executeReusableAddSteps(TestParametersController.checkIfSpecialParameter(reusableName), steps);
    }

    @Then("^I execute \"([^\"]*)\" reusable step replacing some steps$")
    public void i_execute_reusable_step_replace(String reusableName, Map<Integer, String> steps) {
        Reporter.log("Executing step: I execute '" + reusableName + "' reusable step with replacing some steps");
        ReusableRunner.getInstance().executeReusableReplaceStep(TestParametersController.checkIfSpecialParameter(reusableName), steps);
    }

    @Then("^I execute modified \"([^\"]*)\" reusable step$")
    public void i_execute_reusable_step_modified(String reusableName, List<List<String>> steps) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setAction(ActionsWithParameterAndTable.EXECUTE_MODIFIED_REUSABLE, reusableName, steps)
                .setMessage("Executing step: I execute '" + reusableName + "' reusable step modified")
                .execute();
    }

    /**
     * Definition to execute reusable step if given condition is true
     *
     * @param reusableName name of reusable step (Scenario in ReusableSteps.feature) you want to execute
     *                     Here we also check if text is EC_ or MD_ of KW_
     * @author Ruslan Levytskyi
     */
    @Then("^I execute \"([^\"]*)\" reusable step if \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_execute_reusable_step_if(String reusableName, String conditionParameter, String condition) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setCondition(conditionParameter,condition)
                .setAction(ActionsWithParameter.EXECUTE_REUSABLE, reusableName)
                .setMessage("Executing step: I execute '" + reusableName + "' reusable step")
                .execute();
    }

    /**
     * Definition to save some text value in EC variable
     *
     * @param text    text you want to save into a variable
     * @param varName name of variable in which you want to save text
     * @author Ruslan Levytskyi
     */
    @Then("^I remember \"([^\"]*)\" text as \"([^\"]*)\" variable$")
    public void i_remember_text(String text, String varName) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setAction(ActionsWithTwoParameters.REMEMBER_TEXT, text, varName)
                .setReporterLog("Executing step: I remember '" + text + "' text as '" + varName + "' variable")
                .execute();
    }

    /**
     * Definition to save some text value in EC variable if condition is true
     *
     * @param text    text you want to save into a variable
     * @param varName name of variable in which you want to save text
     * @author Ruslan Levytskyi
     */
    @Then("^I remember \"([^\"]*)\" text as \"([^\"]*)\" variable if \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_remember_text_if(String text, String varName, String conditionParameter, String condition) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setCondition(conditionParameter, condition)
                .setAction(ActionsWithTwoParameters.REMEMBER_TEXT, text, varName)
                .setReporterLog("Executing step: I remember '" + text + "' text as '" + varName + "' variable if " + conditionParameter + " " + condition)
                .execute();
    }

    /**
     * Definition to verify presence of element on the page
     *
     * @param attributeName  name of attribute of element you want to check
     * @param elementLocator name or value of needed element
     * @param attributeValue value that tested attribute should have
     * @author Ruslan Levytskyi
     */
    @When("^Attribute \"([^\"]*)\" of \"([^\"]*)\" should have value \"([^\"]*)\"$")
    public void elements_attribute_should_have_value(String attributeName, String elementLocator, String attributeValue) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator)
                .setAction(ActionsWithLocatorAndTwoParameters.VALIDATE_ELEMENT_ATTRIBUTE, attributeName, attributeValue)
                .setReporterLog("Executing step: Attribute '" + attributeName + "' of '" + elementLocator + "' should have value '" + attributeValue + "'")
                .execute();
    }

    /**
     * Definition to verify presence of element on the page
     *
     * @param attributeName  name of css attribute of element you want to check
     * @param elementLocator name or value of needed element
     * @param cssValue value that tested attribute should have
     * @author Ruslan Levytskyi
     */
    @When("^Сss \"([^\"]*)\" of \"([^\"]*)\" should have value \"([^\"]*)\"$")
    public void element_css_should_have_value(String attributeName, String elementLocator, String cssValue) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator)
                .setAction(ActionsWithLocatorAndTwoParameters.VALIDATE_ELEMENT_CSS, attributeName, cssValue)
                .setReporterLog("Executing step: CSS attribute '" + attributeName + "' of '" + elementLocator + "' should have value '" + cssValue + "'")
                .execute();
    }

    /**
     * Definition to check or uncheck the checkbox
     * If svalue is check, but the checkbox is unchecked, than this method checks the checkbox
     * Vice versa.
     *
     * @param value   = value to set a statement to the checkbox. Can be "check" or "uncheck"
     * @param element By locator of checkbox
     */
    @When("^I \"(check|uncheck)\" \"([^\"]*)\" checkbox$")
    public void i_check_uncheck(String value, String element) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocatorAndParameter.CHECK_CHECKBOX, value)
                .setReporterLog("Executing step: I " + value + " '" + element + "' checkbox")
                .execute();
    }

    /**
     * Definition to imitate key press from keyboard
     *
     * @param fieldValue : value to be entered in appropriate field using metadata values
     * @param element:   By locator of element to press key
     */
    @Then("^I press \"([^\"]*)\" for \"([^\"]*)\"$")
    public void i_press_from_keyboard(String fieldValue, String element) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocatorAndParameter.PRESS_KEYBOARD, fieldValue)
                .setReporterLog("Executing step: I press the " + fieldValue + " from keyboard")
                .execute();
    }

    /**
     * Definition to check visibility of the element located in frame
     *
     * @param element locator of element you want to check if it's visible
     *                Here we also check if text is EC_ or MD_ of KW_
     * @param frame   frame name to switch
     */
    @Then("^I should see the \"([^\"]*)\" message in \"([^\"]*)\" frame$")
    public void i_should_see_the_message_in_frame(String element, String frame) {
        Reporter.log("Executing step: I should see the " + element + " element located in frame");
        waitForPageToLoad();
        switchToFrame(initElementLocator(frame));
        findElements(initElementLocator(element));
    }

    /**
     * Definition to check invisibility of the element
     *
     * @param element: By locator of a element
     * @author Andrii Yakymchuk
     */
    @Then("^I shouldn't see the \"([^\"]*)\" (?:button|message|element|text)$")
    public void i_should_not_see_the_element(String element) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocator.ABSENT)
                .setMessage("Executing step: I shouldn't see the '" + element + "' element")
                .execute();
    }

    /**
     * Definition to verify that a certain number of elements are present on the page
     *
     * @param element          xpath of needed element
     * @param expectedQuantity expected quantity of elements to be present on the page
     * @author Ruslan Levytskyi
     */
    @When("^I should see the \"([^\"]*)\"(?: button| message| element| text)? in quantity of \"([^\"]*)\"$")
    public void i_should_see_number_of_elements(String element, String expectedQuantity) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocatorAndParameter.NUMBER_OF_ELEMENTS_PRESENT, expectedQuantity)
                .setMessage("Executing step: I should see " + expectedQuantity + " '" + element + "' elements")
                .execute();
    }

    /**
     * Action to upload a file
     *
     * @param element:  locator type to be used to locate the element for uploading a file
     * @param fileName: file that should be uploaded to element on the page
     */
    @Then("I upload \"([^\"]*)\" file to \"([^\"]*)\" element")
    public void i_upload_file_to_element(String fileName, String element) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocatorAndParameter.UPLOAD_FILE_TO_ELEMENT, fileName)
                .setMessage("Executing step: I upload the " + fileName + " to: " + element)
                .execute();
    }

    /**
     * Definition to validate text from web element
     *
     * @param text     : value to be checked
     * @param element: By locator of element to press key
     */
    @Then("^I validate text \"([^\"]*)\" to be displayed for \"([^\"]*)\" element$")
    public void i_validate_text_to_be_displayed_for_element(String text, String element) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocatorAndParameter.VALIDATE_ELEMENT_TEXT, text)
                .setReporterLog("Executing step: I validate text " + text + " to be displayed for " + element + " element")
                .execute();
    }

    /**
     * Definition to validate text from web element
     *
     * @param text     : value to be checked
     * @param element: By locator of element to press key
     */
    @Then("^I validate text \"([^\"]*)\" to be displayed for any \"([^\"]*)\" element$")
    public void i_validate_text_to_be_displayed_for_any_element(String text, String element) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocatorAndParameter.VALIDATE_ANY_ELEMENT_TEXT, text)
                .setReporterLog("Executing step: I validate text " + text + " to be displayed for any " + element + " element")
                .execute();
    }

    /**
     * Definition to verify relation between two values (equal to|more than|less than|more or equal to|less or equal to)
     *
     */
    @Then("^I validate \"([^\"]*)\" value is \"(equal to|more than|less than|more or equal to|less or equal to)\" \"([^\"]*)\" value$")
    public void i_validate_value_relation(String value1, String relation, String value2) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setAction(ActionsWithThreeParameters.VALIDATE_VALUE_RELATION, value1, relation, value2)
                .setReporterLog("Executing step: I validate " + value1 + " value is " + relation + " " + value2 + " value")
                .execute();
    }

    /**
     * Definition scroll the page to the bottom after page is loaded
     *
     * @author Andrii Yakymchuk
     */
    //todo: this step doesn't work with StepdefBuilder logic
    @And("^I should scroll to the \"(top|bottom)\" of the page$")
    public void i_should_scroll_to_top_bottom_of_the_page(String value) {
        Reporter.log("Executing step: I should scroll to the " + value + " of the page");
        if (value.equals("top")) {
            scrollToTopOfPage();
        } else if (value.equals("bottom")) {
            scrollToBottomOfPage();
        }
    }

    @And("I select \"([^\"]*)\" from \"([^\"]*)\" element")
    public void i_select_from_element(String value, String element) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocatorAndParameter.SELECT_FROM_ELEMENT, value)
                .setReporterLog("Executing step: I select: " + value + " from " + element + " dropdown")
                .execute();
    }

    /**
     * Switching to the window with appropriate index. Used when few windows are open in browser.
     * If needed it may be used in order to switch to any extra window and then back to the main window.
     * Index = 1 is supposed to be the index of the main window
     * MAXIMUM acceptable window index is 9
     */
    @Then("^I switch to window with index \"([^\"]*)\"$")
    public void i_switch_to_window_with_index(String value) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setAction(ActionsWithParameter.SWITCH_TO_WINDOW_BY_INDEX, value)
                .setReporterLog("Switching to the window with index = " + value)
                .execute();
    }

    /**
     * Perform click using JavaScript
     */
    @When("^I click on the \"([^\"]*)\" (?:button|link|option|element) by JS$")
    public void i_click_with_JS(String element) {
       //todo: StepDefBuilder doesn't handle clicking in another window
        sleepFor(1500);
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocator.CLICK_WITH_JS)
                .setMessage("Executing step: I click on the '" + element + "' element by JS")
                .execute();
    }

    /**
     * Definition to send some text into some text input field using JS
     *
     * @param element locator for element you want to send text to
     *                Parameter exists in locators document - locator value is returned from document
     * @param text    text you want to send to element
     *                Here we also check if text is EC_ or MD_ of KW_
     * @author Ruslan Levytskyi
     */
    @When("^I set \"([^\"]*)\" text to the element with ID \"([^\"]*)\" using JS$")
    public void i_set_text_with_js(String text, String element) {
        //todo: does not worn in Sub Topics And Labels. To be fixed. Reverted to old version for now.
        Reporter.log("Executing step: I set '" + text + "' text to the element with ID '" + element + "' using JS");
        //executeJSCode("document.getElementById('" + element + "').setAttribute('value', '" + text + "')");

        String processedText = TestParametersController.checkIfSpecialParameter(text);
        BPPLogManager.getLogger().info("Setting: " + element + " with value: " + text);
        executeJSCode("document.getElementById('" + element + "').setAttribute('value', '" + processedText + "')");
        if (!text.equals(processedText)) {
            Reporter.log("<pre>[input test parameter] " + text + "' -> '" + processedText + " [output value]</pre>");
        }
    }

    /**
     * Provides the ability to use the browser's navigation capabilities.
     *
     * @param operation: browser operation performed can be FORWARD, BACK, or REFRESH case-insensitive
     */
    @Then("^Browser performs \"([^\"]*)\" command$")
    public void browser_navigates(String operation) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setAction(ActionsWithParameter.EXECUTE_BROWSER_NAVIGATION_COMMAND, operation)
                .setReporterLog("Executing step: Performing browser " + operation + " operation")
                .setLog("Browser " + operation + " operation executing.")
                .execute();
    }

    /**
     * Definition to capture text data as EC variable
     *
     * @param element          locator of element you want to check if it's visible and soon to put into Execution Context
     * @param executionContext Name that starts with 'EC_' that is used to store saved text value from element
     * @author Andrii Yakymchuk
     */
    @And("^I capture text data \"([^\"]*)\" as \"([^\"]*)\" variable$")
    public void i_capture_text_data_as_variable(String element, String executionContext) {
        //todo: StepDefBuilder throws error while trying to get EC  -2021-12-01 17:05:39 [PoolService] ERROR ExecutionContextHandler:35 - Requested EC_BASKET_ID execution context key is absent
        String value = "";
        try {
            value = getTextValueFromField(initElementLocator(element));
        } catch (Exception e) {
            Reporter.log("Text capturing failed for '" + element + "'. Waiting for 5 sec and trying again");
            BPPLogManager.getLogger().info("Text capturing failed for '" + element + "'. Waiting for 5 sec and trying again");
            wait_for("5");
            value = getTextValueFromField(initElementLocator(element));
        }
        Reporter.log("Capturing data from : " + initElementLocator(element) + ": " + executionContext);
        if (!executionContext.equals("")) {
            if (value.equals("")) {
                Reporter.log("Saving EC key " + executionContext + " with an empty string. No application data found.");
            } else {
                Reporter.log("Saving EC key " + executionContext + " = " + value);
            }
            ExecutionContextHandler.setExecutionContextValueByKey(executionContext, value);
        } else
            Reporter.log("Cannot save EC value with an empty key. Check your parameters.");
    }

    /**
     * Definition to capture text data as EC variable
     *
     * @param element          locator of element you want to check if it's visible and soon to put into Execution Context
     * @param executionContext Name that starts with 'EC_' that is used to store saved text value from element
     * @author Andrii Yakymchuk
     */
    @And("^I capture text data \"([^\"]*)\" as \"([^\"]*)\" variable if \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_capture_text_data_as_variable_if(String element, String executionContext, String conditionParameter, String condition) {
        //todo: StepDefBuilder throws error while trying to get EC  -2021-12-01 17:05:39 [PoolService] ERROR ExecutionContextHandler:35 - Requested EC_BASKET_ID execution context key is absent
        Conditions cond = new Conditions();
        if (cond.checkCondition(condition,conditionParameter)) {
            String value = "";
            try {
                value = getTextValueFromField(initElementLocator(element));
            } catch (Exception e) {
                Reporter.log("Text capturing failed for '" + element + "'. Waiting for 5 sec and trying again");
                BPPLogManager.getLogger().info("Text capturing failed for '" + element + "'. Waiting for 5 sec and trying again");
                wait_for("5");
                value = getTextValueFromField(initElementLocator(element));
            }
            Reporter.log("Capturing data from : " + initElementLocator(element) + ": " + executionContext);
            if (!executionContext.equals("")) {
                if (value.equals("")) {
                    Reporter.log("Saving EC key " + executionContext + " with an empty string. No application data found.");
                } else {
                    Reporter.log("Saving EC key " + executionContext + " = " + value);
                }
                ExecutionContextHandler.setExecutionContextValueByKey(executionContext, value);
            } else
                Reporter.log("Cannot save EC value with an empty key. Check your parameters.");
        }
    }

    /**
     * Definition to execute JS code
     *
     * @param jsCode JS code to execute
     * @author Ruslan Levytskyi
     */
    @And("^I execute \"([^\"]*)\" JS code$")
    public void i_execute_js_code(String jsCode) {
        //todo: .checkIfSpecialParameter() does not work with JS commands.
        //It sees that string contains EC_ variable, but do not recognize it as valid one. Probably the thing is in regex
        //to check it. todo to be replaced
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setAction(ActionsWithParameter.EXECUTE_JS_CODE, jsCode)
                .setReporterLog("Executing JS code: " + jsCode)
                .execute();
    }

    /**
     * Definition to execute JS code (Console command for Chrome) to grab Auth key from Chrome's Local Storage.
     *
     * @param jsCode JS code to execute
     * @param ecValue ec Value to store returned js code
     * @apiNote There should be timeout before the method, cause Token need time to be shown.
     * @see  [[[   return localStorage.getItem('product-factory-react-token')   ]]]
     * @author Andrii Yakymchuk
     *
     */

    @And("^I execute \"([^\"]*)\" JS code and saving value as \"([^\"]*)\"$")
    public void i_execute_js_code_and_saving_value_as(String jsCode, String ecValue) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setAction(ActionsWithTwoParameters.RETURN_REQUEST_WITH_JS, jsCode, ecValue)
                .setReporterLog("Executing step: I execute '" + jsCode + "' JS code and saving value as '" + ecValue)
                .execute();
    }

    /**
     * Definition to transform date from one pattern to another and saving as EC.
     *
     * @param dateParse JS code to execute
     * @param datePattern ec Value to store returned js code
     * @param ecValue
     * @author Andrii Yakymchuk
     *
     */

    @And("^I transform \"([^\"]*)\" date with pattern \"([^\"]*)\" to another \"([^\"]*)\" pattern saving value as \"([^\"]*)\"$")
    public void i_transform_date_to_another_pattern_saving_value_as(String dateParse, String oldDatePattern, String datePattern, String ecValue) {

        DateFormat originalFormat = new SimpleDateFormat(oldDatePattern);
        DateFormat targetFormat = new SimpleDateFormat(datePattern);
        Date date = null;
        try {
            date = originalFormat.parse(TestParametersController.checkIfSpecialParameter(dateParse));
        } catch (java.text.ParseException e) {
            e.printStackTrace();
        }
        String formattedDate = targetFormat.format(date);
        ExecutionContextHandler.setExecutionContextValueByKey(ecValue, formattedDate);

    }

    /**
     * Definition to execute JS code for some particular element
     *
     * @param jsCode JS code to execute
     * @author Ruslan Levytskyi
     */
    @And("^I execute \"([^\"]*)\" JS code for \"([^\"]*)\" element$")
    public void i_execute_js_code_for_element(String jsCode, String element) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocatorAndParameter.EXECUTE_JS, jsCode)
                .setReporterLog("Executing JS code: " + jsCode)
                .execute();
    }

    /**
     * Definition to get specific data using REGEX. Required for BE Create New Line Manager workflow
     *
     * @param element          locator of element you want to check is visible
     * @param executionContext Name that starts with 'EC_' that is used to store saved text value from element
     * @author yzosin
     */
    @And("^I capture a part of \"([^\"]*)\" element text by \"([^\"]*)\" regex and save as \"([^\"]*)\" variable$")
    public void i_capture_special_data(String element, String regex, String executionContext) {

        String data = findElement(initElementLocator(element)).getText().trim();
        String value = "";
        for (String singleElement : data.split(" ")) {
            if (singleElement.matches(regex)) {
                value = singleElement;
            }
        }
        Reporter.log("Capturing data from : " + element + ": " + executionContext);
        if (!executionContext.equals("")) {
            if (value.equals("")) {
                Reporter.log("Saving EC key " + executionContext + " with an empty string. No application data found.");
            } else {
                Reporter.log("Saving EC key " + executionContext + " = " + value);
            }
            ExecutionContextHandler.setExecutionContextValueByKey(executionContext, value);
        } else
            Reporter.log("Cannot save EC value with an empty key. Check your parameters.");
    }

    @And("^I capture current URL as \"([^\"]*)\" variable$")
    public void i_capture_url_as_variable(String executionContext) {
        Reporter.log("Capturing current url as " + executionContext);
        if (!executionContext.equals("")) {
            Reporter.log("Current URL = " + getURL());
            ExecutionContextHandler.setExecutionContextValueByKey(executionContext, getURL());
        } else
            Reporter.log("Cannot save EC value with an empty key. Check your parameters.");
    }

    @And("^I capture current URL as \"([^\"]*)\" variable if \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_capture_url_as_variable_if(String executionContext, String conditionParameter, String condition) {
        Conditions cond = new Conditions();
        if (cond.checkCondition(condition, conditionParameter)) {
            Reporter.log("Capturing current url as " + executionContext);
            if (!executionContext.equals("")) {
                Reporter.log("Current URL = " + getURL());
                ExecutionContextHandler.setExecutionContextValueByKey(executionContext, getURL());
            } else
                Reporter.log("Cannot save EC value with an empty key. Check your parameters.");
        }
    }

    /**
     * Definition to click an element on the page until given condition is true, up to 10 times
     *
     * @author Ruslan Levytskyi
     */
    @When("^I click on the \"([^\"]*)\" element until \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_click_on_element_until(String element, String conditionParameter, String condition) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setCondition(conditionParameter,condition)
                .setAction(ActionsWithLocator.CLICK)
                .setReporterLog("Executing step: I click on the '" + element + "' element")
                .execute();
    }

    /**
     * Definition to click an element on the page if given condition is true
     *
     * @param element locator for element you want to click on
     *                initElementLocator builds locator with JS, depending on input parameter:
     *                1. Starts with "xpath" or "css" - locator is passed directly into a method
     *                2. Parameter exists in locators document - locator value is returned from document
     *                3. None of above - parameter is treated as text value of element: //*[contains(text(), 'parameter')]
     * @author Ruslan Levytskyi
     */
    @When("^I click on the \"([^\"]*)\" (?:button|link|option|element) with JS if \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_click_on_the_button_with_js_if(String element, String conditionParameter, String condition) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocator.CLICK_WITH_JS)
                .setCondition(conditionParameter,condition)
                .setMessage("Executing step: I click on the '" + element + "' element with JS if " + conditionParameter + " " + condition)
                .execute();
    }

    /**
     * Provides the ability to delete browser's cookies. Added to avoid BPP-10241
     *
     */
    @Then("^Browser deletes cookies$")
    public void delete_cookies () {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setAction(ActionsWithParameter.EXECUTE_BROWSER_NAVIGATION_COMMAND, "DELETE_COOKIES")
                .setReporterLog("Executing step: Browser deletes cookies")
                .setLog("Browser has deleted cookies")
                .execute();
    }

    /**
     * Provides the ability to get first party cookie settings for bpp domain. Required in BPP-14260
     *
     */
    @Then("^Browser gets first party cookies$")
    public void get_first_party_cookies () {
        Reporter.log("Executing step: Browser gets first party cookies");
        Cookie cookie = driver().manage().getCookieNamed("kppid");
        Assert.assertEquals(cookie.getDomain(),"web-stage-bppdigital.bppuniversity.com");
        BPPLogManager.getLogger().info("Cookie domain is: " + cookie.getDomain());
        Assert.assertEquals(cookie.getName(),"kppid");
        BPPLogManager.getLogger().info("Cookie name is: " + cookie.getName());
        String cookieValue = cookie.getValue();
        assertThat(cookieValue, matchesPattern("^[A-Za-z0-9\\_]{11}$"));
        BPPLogManager.getLogger().info("Cookie value is: " + cookieValue);
        long cookieTime = cookie.getExpiry().getTime();
        BPPLogManager.getLogger().info("Cookie expiry is: " + cookieTime);
        long checkedTime = Tools.checkExpiryTimeForCookies();
        Assert.assertEquals(String.valueOf(cookieTime).substring(0,8), String.valueOf(checkedTime).substring(0,8));
        Reporter.log("Cookie expiry date matches a date 6 months in the future as expected");
        ExecutionContextHandler.setExecutionContextValueByKey("EC_COOKIE_VALUE", cookieValue);
        ExecutionContextHandler.setExecutionContextValueByKey("EC_COOKIE_EXPIRY", String.valueOf(cookieTime));
    }

    /**
     * Provides the ability to check first party cookies after navigating through website
     *
     */
    @Then("^Browser checks first party cookies$")
    public void check_first_party_cookies () {
        Reporter.log("Executing step: Browser gets first party cookies");
        Cookie cookie = driver().manage().getCookieNamed("kppid");
        Assert.assertEquals(cookie.getDomain(),"web-stage-bppdigital.bppuniversity.com");
        BPPLogManager.getLogger().info("Cookie domain after navigating through website is: " + cookie.getDomain());
        Assert.assertEquals(cookie.getName(),"kppid");
        BPPLogManager.getLogger().info("Cookie name after navigating through website is " + cookie.getName());
        String cookieValue = cookie.getValue();
        Assert.assertEquals(cookieValue,ExecutionContextHandler.getExecutionContextValueByKey("EC_COOKIE_VALUE"));
        Reporter.log("Cookie value: " + cookieValue + " matches the EC variable: " + ExecutionContextHandler.getExecutionContextValueByKey("EC_COOKIE_VALUE"));
        BPPLogManager.getLogger().info("Cookie value after navigating through website is: " + cookieValue);
        long cookieTime = cookie.getExpiry().getTime();
        BPPLogManager.getLogger().info("Cookie expiry after navigating through website is: " + cookieTime);
        Assert.assertNotEquals(String.valueOf(cookieTime), ExecutionContextHandler.getExecutionContextValueByKey("EC_COOKIE_EXPIRY"));
        Reporter.log("Cookie expiry date: " + cookieTime + " matches the EC variable by pattern [^[A-Za-z0-9\\_]{11}$]: " + ExecutionContextHandler.getExecutionContextValueByKey("EC_COOKIE_EXPIRY"));
    }

    /**
     * Definition to execute a list of steps for each element found on the page by given locator
     *
     * @param element locator for element you want to click on
     *                initElementLocator builds locator, depending on input parameter:
     *                1. Starts with "xpath" or "css" - locator is passed directly into a method
     *                2. Parameter exists in locators document - locator value is returned from document
     *                3. None of above - parameter is treated as text value of element: //*[contains(text(), 'parameter')]
     * @param steps list of steps to execute for each element found on page by given locator
     *              To perform some action whith iterated element from current iteration, use FOR_ITEM as the locator.
     *              For example, if you say:
     *                  For each "OK Button" element:
     *                  |I click on the "FOR_ITEM" element|
     *              where "OK Button" is specified in your Locators.json file as "xpath=//button[text()='OK']",
     *              and there was 2 such elements found by given locator, then "I click on the "FOR_ITEM" element" step
     *              will be executed 2 times: first on "xpath=(//button[text()='OK'])[1]", and second on
     *              "xpath=(//button[text()='OK'])[2]" element.
     * @author Ruslan Levytskyi
     */
    @When("^For each \"([^\"]*)\" element:$")
    public void for_each(String element, List<String> steps) {
        //todo: To be tested properly. Currently works only with simple locators (not special locators)
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocatorAndTable.FOR_EACH, steps)
                .setReporterLog("Executing step: For each '" + element + "' element")
                .execute();
    }

    /**
     * Definition to execute a list of steps for each element found on the page by given locator
     *
     * @param element locator for element you want to click on
     *                initElementLocator builds locator, depending on input parameter:
     *                1. Starts with "xpath" or "css" - locator is passed directly into a method
     *                2. Parameter exists in locators document - locator value is returned from document
     *                3. None of above - parameter is treated as text value of element: //*[contains(text(), 'parameter')]
     * @param steps list of steps to execute for each element found on page by given locator
     *              To perform some action whith iterated element from current iteration, use FOR_ITEM as the locator.
     *              For example, if you say:
     *                  For each "OK Button" element:
     *                  |I click on the "FOR_ITEM" element|
     *              where "OK Button" is specified in your Locators.json file as "xpath=//button[text()='OK']",
     *              and there was 2 such elements found by given locator, then "I click on the "FOR_ITEM" element" step
     *              will be executed 2 times: first on "xpath=(//button[text()='OK'])[1]", and second on
     *              "xpath=(//button[text()='OK'])[2]" element.
     * @author Ruslan Levytskyi
     */
    @When("^For \"([^\"]*)\" \"([^\"]*)\" elements:$")
    public void for_some(String number, String element, List<String> steps) {
        //todo: To be tested properly. Currently works only with simple locators (not special locators)
        if (number.equals("5")) number = "4"; //crutch, related to functionality of FOR_EACH action
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setLoopLimit(number)
                .setAction(ActionsWithLocatorAndTable.FOR_EACH, steps)
                .setReporterLog("Executing step: For each '" + element + "' element")
                .execute();
    }

    /**
     * Definition to execute a list of steps for each element found on the page by given locator
     *
     * @param baseFile a base PDF file for comparison
     *
     * @param fileName1 a PDF file downloaded from web platform to compare against
     *
     * @author Yurii Zosin
     */
    @And("I compare \"([^\"]*)\" file with \"([^\"]*)\" PDF file")
    public void i_compare_pdfs(String baseFile, String fileName1) {

        Reporter.log("Executing step: I check PDF files: " + baseFile + " and " + fileName1);
        try {
            Reporter.log("Amount of pages in " + baseFile + " is: " + PDFHandler.getPageCountBaseFile(baseFile));
            Reporter.log("Amount of pages in " + fileName1 + " is: " + PDFHandler.getPageCountDownloadedFile(fileName1));
            Assert.assertTrue(PDFHandler.checkPDF(baseFile, fileName1));
        } catch (IOException e) {
            e.printStackTrace();
            Reporter.fail("Please check the PDF files! Some files are missing! ");
        }
    }


    /**
     * Definition to doubleclick an element on the page
     *
     * @param element locator for element you want to click on
     *                initElementLocator builds locator, depending on input parameter:
     *                1. Starts with "xpath" or "css" - locator is passed directly into a method
     *                2. Parameter exists in locators document - locator value is returned from document
     *                3. None of above - parameter is treated as text value of element: //*[contains(text(), 'parameter')]
     * @author Ruslan Levytskyi
     */
    @When("^I doubleclick on the \"([^\"]*)\" (?:button|link|option|element)$")
    public void i_doubleclick_on_the_button(String element) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocator.DOUBLE_CLICK)
                .setMessage("Executing step: I double click on the '" + element + "' element")
                .execute();
    }

    /**
     * Definition to execute reusable step if given condition is true
     *
     * @param reusableName name of reusable step (Scenario in ReusableSteps.feature) you want to execute
     *                     Here we also check if text is EC_ or MD_ of KW_
     * @author Ruslan Levytskyi
     */
    @Then("^I execute modified \"([^\"]*)\" reusable step if \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_execute_reusable_step_modified_if(String reusableName, String conditionParameter, String condition, List<List<String>> steps) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setCondition(conditionParameter, condition)
                .setAction(ActionsWithParameterAndTable.EXECUTE_MODIFIED_REUSABLE, reusableName, steps)
                .setMessage("Executing step: I execute '" + reusableName + "' reusable step modified")
                .execute();
    }

    /**
     * Definition to check if element is enabled
     *
     * @param elementLocator name or value of needed element
     * @param status         parameter (enabled/disabled) to verify enabled or disabled status of an element
     * @author yzosin
     */
    @When("^Element \"([^\"]*)\" should be \"([^\"]*)\"$")
    public void check_element_is_enabled(String elementLocator, String status) {
        Reporter.log("Executing step: Check if " + elementLocator + " element is enabled");
        if (status.contains("enabled")) {
            Assert.assertTrue(findElement(initElementLocator(elementLocator)).isEnabled());
        } else {
            Assert.assertFalse(findElement(initElementLocator(elementLocator)).isEnabled());
        }
    }

    /**
     * Definition to validate condition
     *
     */
    @Then("^I verify that \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_verify_that(String conditionParameter, String condition) {
        Reporter.log("Executing step: I verify that" + conditionParameter + " " + condition);
        Conditions conditions = new Conditions();
        Assert.assertTrue(conditions.checkCondition(condition,conditionParameter));
    }

    /**
     * Definition to validate condition
     *
     */
    @Then("^I verify that \"([^\"]*)\" \"([^\"]*)\" for \"([^\"]*)\" test$")
    public void i_verify_for_test(String conditionParameter, String condition, String scenarioName) {
        Reporter.log("Executing step: I verify that" + conditionParameter + " " + condition);
        Conditions conditions = new Conditions();
        String qtestID = qTestAPI.getTestRunIDfromSuite().get(scenarioName);
        try {
            if (conditions.checkCondition(condition,conditionParameter)) { ;
                RetryAnalyzer.passMap.put(scenarioName, "pass");
                qTestAPI.TestRunStatusUpdate(Reporter.getCurrentTestName(), "Passed", 601, qtestID, "");
            } else {
                RetryAnalyzer.passMap.put(scenarioName, "fail");
                qTestAPI.TestRunStatusUpdate(Reporter.getCurrentTestName(), "Failed", 602, qtestID, "Some Error");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Definition to execute reusable steps
     *
     * @param reusableName name of reusable step (Scenario in ReusableSteps.feature) you want to execute
     *                     Here we also check if text is EC_ or MD_ of KW_
     * @author Ruslan Levytskyi
     */
    @Then("^I execute \"([^\"]*)\" reusable step verifying \"([^\"]*)\"$")
    public void i_execute_reusable_step_verifying(String reusableName, String scenarios) {
        Reporter.log("Executing step: I execute '" + reusableName + "' reusable step to verify '" + scenarios + "' scenario(s)");
        boolean isPassed = true;
        String errorMessage = "";
        try {
            ReusableRunner.getInstance().executeReusable(TestParametersController.checkIfSpecialParameter(reusableName));
            for (String scenarioName : scenarios.split(",")) {
                RetryAnalyzer.passMap.put(scenarioName, "pass");
                String qtestID = System.getProperties().containsKey("qtest") && System.getProperty("qtest")
                        .equalsIgnoreCase("TRUE") ? qTestAPI.getTestRunIDfromSuite().get(scenarioName) : null;
                if (qtestID == null) {
                    qTestAPI.TestRunStatusUpdate(Reporter.getCurrentTestName(), "Passed", 601, qtestID, "");
                }
            }
        } catch (Exception e) {
            for (String scenarioName : scenarios.split(",")) {
                RetryAnalyzer.passMap.put(scenarioName, "fail");
                e.printStackTrace();
                isPassed = false;
            }
        }

        if (!isPassed){
            for (String scenarioName : scenarios.split(",")) {
                String qtestID = System.getProperties().containsKey("qtest") && System.getProperty("qtest")
                        .equalsIgnoreCase("TRUE") ? qTestAPI.getTestRunIDfromSuite().get(scenarioName) : null;
                if (qtestID != null) {
                    try {
                        qTestAPI.TestRunStatusUpdate(Reporter.getCurrentTestName(), "Failed", 601, qtestID, errorMessage);
                    } catch (IOException e) {
                        e.printStackTrace();
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    /**
     * Definition to execute reusable steps
     *
     * @param reusableName name of reusable step (Scenario in ReusableSteps.feature) you want to execute
     *                     Here we also check if text is EC_ or MD_ of KW_
     * @author Ruslan Levytskyi
     */
    @Then("^I execute modified \"([^\"]*)\" reusable step verifying \"([^\"]*)\"$")
    public void i_execute_modified_reusable_step_verifying(String reusableName, String scenarios, List<List<String>> steps) {
        Reporter.log("Executing step: I execute modified '" + reusableName + "' reusable step to verify '" + scenarios + "' scenario(s)");
        boolean isPassed = true;
        String errorMessage = "";
        try {
            ReusableRunner.getInstance().executeReusableModified(TestParametersController.checkIfSpecialParameter(reusableName),steps);
            for (String scenarioName : scenarios.split(",")) {
                RetryAnalyzer.passMap.put(scenarioName, "pass");
                String qtestID = System.getProperties().containsKey("qtest") && System.getProperty("qtest")
                        .equalsIgnoreCase("TRUE") ? qTestAPI.getTestRunIDfromSuite().get(scenarioName) : null;
                if (qtestID == null) {
                    qTestAPI.TestRunStatusUpdate(Reporter.getCurrentTestName(), "Passed", 601, qtestID, "");
                }
            }
        } catch (Exception e) {
            for (String scenarioName : scenarios.split(",")) {
                RetryAnalyzer.passMap.put(scenarioName, "fail");
                e.printStackTrace();
                isPassed = false;
            }
        }

        if (!isPassed){
            for (String scenarioName : scenarios.split(",")) {
                String qtestID = System.getProperties().containsKey("qtest") && System.getProperty("qtest")
                        .equalsIgnoreCase("TRUE") ? qTestAPI.getTestRunIDfromSuite().get(scenarioName) : null;
                if (qtestID != null) {
                    try {
                        qTestAPI.TestRunStatusUpdate(Reporter.getCurrentTestName(), "Failed", 601, qtestID, errorMessage);
                    } catch (IOException e) {
                        e.printStackTrace();
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    /**
     * Definition to store quantity of elements on the page into EC_ variable
     *
     * @author Ruslan Levytskyi
     */
    @When("^I store \"([^\"]*)\" elements number in \"([^\"]*)\" variable$")
    public void i_count_elements(String element, String varName) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocatorAndParameter.COUNT_ELEMENTS, varName)
                .setReporterLog("Executing step: I count '" + element + "' elements")
                .setLog("Counting: " + element + " elements")
                .execute();
    }

    /**
     * Definition to perform right click an element on the page
     *
     * @author Yurii Zosin
     * @param element name or value of needed element
     */
    @When("^I perform right mouse click \"([^\"]*)\" (?:button|link|option|element)$")
    public void i_right_click_on_element_(String element) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocator.RIGHT_CLICK)
                .setMessage("Executing step: I perform right mouse click on the '" + element + "'")
                .execute();
    }

    /**
     * Definition to perform drag and drop from one element to another
     *
     * @author Ruslan Levytskyi
     * @param sourceElement locator of element to drag from
     * @param targetElement locator of element to drag to
     */
    @When("^I drag \"([^\"]*)\" element to \"([^\"]*)\" element$")
    public void i_drag_and_drop(String sourceElement, String targetElement) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(sourceElement)
                .setAnotherLocator(targetElement)
                .setAction(ActionsWithTwoLocators.DRAG_AND_DROP)
                .setMessage("Executing step: I drag: '" + sourceElement + "' element to '" + targetElement + "' element")
                .execute();
    }

    /**
     * Definition to click an element on the page
     *
     * @author Ruslan Levytskyi
     * @param elementLocator name or value of needed element which replaces PARAMETER definiton in SpecialLocators.json
     * @param elementType xpath template of needed element
     */
    @When("^I click on the \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_click_on_element_with_parameter_special(String elementLocator, String elementType) {
        //todo: there is an issue with locators that not allow to use '//' or '/descendant::' in locators. Investigate
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocator.CLICK)
                .setMessage("Executing step: I click on the '" + elementLocator + "' " + elementType)
                .execute();
    }

    /**
     * Definition to click an element on the page by order number
     *
     * @param elementLocator locator for element you want to click on
     *                initElementLocator builds locator, depending on input parameter:
     *                1. Starts with "xpath" or "css" - locator is passed directly into a method
     *                2. Parameter exists in locators document - locator value is returned from document
     *                3. None of above - parameter is treated as text value of element: //*[contains(text(), 'parameter')]
     * @author Ruslan Levytskyi
     */
    @When("^I click on the \"([^\"]*)\" \"([^\"]*)\" by order \"([^\"]*)\"$")
    public void i_click_on_the_element_by_order(String elementLocator, String elementType, String orderNumber) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocatorAndParameter.CLICK_BY_ORDER, orderNumber)
                .setMessage("Executing step: I click on the '" + elementLocator + "' " + elementType + " by order " + orderNumber)
                .execute();
    }

    /**
     * Definition to click an element if it is present on the page on the page
     *
     * @author Ruslan Levytskyi
     * @param elementLocator name or value of needed element which replaces PARAMETER definiton in SpecialLocators.json
     * @param elementType xpath template of needed element
     */
    @When("^I click on the \"([^\"]*)\" \"([^\"]*)\" if present$")
    public void i_click_on_element_with_parameter_special_if_present(String elementLocator, String elementType) {
        //todo: there is an issue with locators that not allow to use '//' or '/descendant::' in locators. Investigate
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocator.CLICK_IF_PRESENT)
                .setMessage("Executing step: I click on the '" + elementLocator + "' " + elementType + " if present")
                .execute();
    }

    /**
     * Definition to click an element on the page using JS
     *
     * @author Ruslan Levytskyi
     * @param elementLocator name or value of needed element which replaces PARAMETER definiton in SpecialLocators.json
     * @param elementType xpath template of needed element
     */
    @When("^I click on the \"([^\"]*)\" \"([^\"]*)\" by JS$")
    public void i_click_on_element_with_parameter_by_js_special(String elementLocator, String elementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocator.CLICK_WITH_JS)
                .setMessage("Executing step: I click on the '" + elementLocator + "' " + elementType + " with JS")
                .execute();
    }

    /**
     * Definition to click an element on the page if given condition is true
     *
     * @author Ruslan Levytskyi
     * @param elementLocator name or value of needed element which replaces PARAMETER definiton in SpecialLocators.json
     * @param elementType xpath template of needed element
     */
    @When("^I click on the \"([^\"]*)\" \"([^\"]*)\" if \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_click_on_element_with_parameter_special_if(String elementLocator, String elementType, String conditionParameter, String condition) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocator.CLICK)
                .setCondition(conditionParameter,condition)
                .setMessage("Executing step: I click on the '" + elementLocator + "' " + elementType)
                .execute();
    }

    /**
     * Definition to click an element on the page by JS if given condition is true
     *
     * @author Ruslan Levytskyi
     * @param elementLocator name or value of needed element which replaces PARAMETER definiton in SpecialLocators.json
     * @param elementType xpath template of needed element
     */
    @When("^I click on the \"([^\"]*)\" \"([^\"]*)\" by JS if \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_click_on_element_with_parameter_by_js_special_if(String elementLocator, String elementType, String conditionParameter, String condition) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator, elementType)
                .setAction(ActionsWithLocator.CLICK_WITH_JS)
                .setCondition(conditionParameter,condition)
                .setMessage("Executing step: I click on the '" + elementLocator + "' " + elementType + " with JS")
                .execute();
    }

    /**
     * Definition to validate an element on the page if given condition is true
     *
     * @param text     : value to be checked
     * @param element: By locator of element to press key
     * @author Ruslan Levytskyi
     */
    @When("^I validate text \"([^\"]*)\" to be displayed for \"([^\"]*)\" element if \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_validate_text_to_be_displayed_for_element_special_if(String text, String element, String conditionParameter, String condition) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setCondition(conditionParameter, condition)
                .setAction(ActionsWithLocatorAndParameter.VALIDATE_ELEMENT_TEXT, text)
                .setReporterLog("Executing step: I validate text " + text + " to be displayed for " + element + " element")
                .execute();
    }

    /**
     * Definition to validate an element on the page if given condition is true
     *
     * @param text     : value to be checked
     * @param elementLocator: By locator of element to press key
     * @author Ruslan Levytskyi
     */
    @When("^I validate text \"([^\"]*)\" to be displayed for any \"([^\"]*)\" \"([^\"]*)\"")
    public void i_validate_text_to_be_displayed_for_any_element_special(String text, String elementLocator, String elementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocatorAndParameter.VALIDATE_ANY_ELEMENT_TEXT, text)
                .setReporterLog("Executing step: I validate text " + text + " to be displayed for any '" + elementLocator + "' " + elementType)
                .execute();
    }

    /**
     * Definition to set text into the input element
     *
     * @author Ruslan Levytskyi
     * @param text text you want to send to the input element
     * @param elementLocator name or value of needed element
     * @param elementType xpath template of needed element
     */
    @When("^I set \"([^\"]*)\" text to the \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_set_text_special(String text, String elementLocator, String elementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocatorAndParameter.SET_TEXT, text)
                .setMessage("Executing step: I set '" + text + "' text to '" + elementLocator + "' " + elementType)
                .execute();
    }

    /**
     * Definition to verify presence of element on the page
     *
     * @author Ruslan Levytskyi
     * @param elementLocator name or value of needed element
     * @param elementType xpath template of needed element
     */
    @When("^I should see the \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_should_see_special(String elementLocator, String elementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocator.PRESENT)
                .setMessage("Executing step: I should see the '" + elementLocator + "' " + elementType)
                .execute();
    }

    /**
     * Definition to verify that a certain number of elements are present on the page
     *
     * @author Ruslan Levytskyi
     * @param elementLocator name or value of needed element
     * @param elementType xpath template of needed element
     * @param expectedQuantity expected quantity of elements to be present on the page
     */
    @When("^I should see \"([^\"]*)\" \"([^\"]*)\" in quantity of \"([^\"]*)\"$")
    public void i_should_see_number_of_elements_special(String elementLocator, String elementType, String expectedQuantity) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocatorAndParameter.NUMBER_OF_ELEMENTS_PRESENT,expectedQuantity)
                .setMessage("Executing step: I should see the '" + elementLocator + "' " + elementType + " in quantity of " + expectedQuantity)
                .execute();
    }

    /**
     * Definition to check invisibility of the element
     *
     * @param elementLocator name or value of needed element
     * @param elementType xpath template of needed element
     * @author Andrii Yakymchuk
     */
    @Then("I shouldn't see the \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_should_not_see_the_element_special(String elementLocator, String elementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocator.ABSENT)
                .setMessage("Executing step: I should not see the '" + elementLocator + "' " + elementType)
                .execute();
    }

    /**
     * Definition to verify presence of element on the page
     *
     * @author Ruslan Levytskyi
     * @param attributeName name of attribute of element you want to check
     * @param elementLocator name or value of needed element
     * @param elementType xpath template of needed element
     * @param attributeValue value that tested attribute should have
     */
    @When("^Attribute \"([^\"]*)\" of \"([^\"]*)\" \"([^\"]*)\" should have value \"([^\"]*)\"$")
    public void elements_attribute_should_have_value_special(String attributeName, String elementLocator, String elementType, String attributeValue) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator, elementType)
                .setAction(ActionsWithLocatorAndTwoParameters.VALIDATE_ELEMENT_ATTRIBUTE, attributeName, attributeValue)
                .setReporterLog("Executing step: Attribute '" + attributeName + "' of '" + elementLocator + "' " + elementType + " should have value '" + attributeValue + "'")
                .execute();
    }

    /**
     * Definition to check or uncheck the checkbox
     * If svalue is check, but the checkbox is unchecked, than this method checks the checkbox
     * Vice versa.
     *
     * @param value = value to set a statement to the checkbox. Can be "check" or "uncheck"
     * @param elementLocator locator of checkbox
     */
    @When("^I \"(check|uncheck)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_check_uncheck_special(String value, String elementLocator, String elementType){
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator, elementType)
                .setAction(ActionsWithLocatorAndParameter.CHECK_CHECKBOX, value)
                .setReporterLog("Executing step: I " + value + " '" + elementLocator + "' " + elementType)
                .execute();
    }

    /**
     * Definition to check or uncheck the checkbox by JS
     * If svalue is check, but the checkbox is unchecked, than this method checks the checkbox
     * Vice versa.
     *
     * @param value = value to set a statement to the checkbox. Can be "check" or "uncheck"
     * @param elementLocator locator of checkbox
     */
    @When("^I \"(check|uncheck)\" \"([^\"]*)\" \"([^\"]*)\" by JS$")
    public void i_check_uncheck_by_js_special(String value, String elementLocator, String elementType){
        Reporter.log("Executing step: I " + value + " '" + elementLocator + "' " + elementType);
        boolean state = true;
        if(value.equals("check")){state = true;}
        else if(value.equals("uncheck")){state = false;}
        if(specialLocatorsMap.containsKey(elementType)) {
            String processedLocator = TestParametersController.checkIfSpecialParameter(elementLocator);
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = xpathTemplate.replaceAll("PARAMETER", processedLocator);
            checkCheckboxByJS(initElementLocator(resultingXpath),state,
                    UiHandlers.SPINNER_HANDLER,
                    UiHandlers.ACCEPT_ALERT,
                    UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                    UiHandlers.PF_SCROLL_HANDLER,
                    UiHandlers.PAGE_NOT_LOAD_HANDLER,
                    UiHandlers.SF_CLICK_HANDLER,
                    UiHandlers.WAIT_HANDLER,
                    UiHandlers.SKIP_HANDLER,
                    UiHandlers.DEFAULT_HANDLER);
            if(!elementLocator.equals(processedLocator)){
                Reporter.log("<pre>[input test parameter] " + elementLocator + "' -> '" + processedLocator + "' [output value]</pre>");
            }
        } else {
            Reporter.fail("No such locator template key");
        }
    }

    @And("^I select \"([^\"]*)\" from \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_select_from_element_special(String value, String elementLocator, String elementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocatorAndParameter.SELECT_FROM_ELEMENT,value)
                .setReporterLog("Executing step: I select: " + value + " from " + elementLocator + "' " + elementType)
                .execute();
    }

    /**
     * Definition to execute JS code for some particular element
     *
     * @param jsCode JS code to execute
     * @author Ruslan Levytskyi
     */
    @And("^I execute \"([^\"]*)\" JS code for \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_execute_js_code_for_element_special(String jsCode, String elementLocator, String elementType) {
        Reporter.log("Executing JS code: " + jsCode);
        if(specialLocatorsMap.containsKey(elementType)) {
            String processedLocator = TestParametersController.checkIfSpecialParameter(elementLocator);
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = xpathTemplate.replaceAll("PARAMETER", processedLocator);
            isElementPresentAndDisplay(initElementLocator(resultingXpath));
            BPPLogManager.getLogger().info("Executing JS code: " + jsCode + " for: " + elementLocator + " element");
            executeJSCodeForElement(initElementLocator(resultingXpath),jsCode);
            if(!elementLocator.equals(processedLocator)){
                Reporter.log("<pre>[input test parameter] " + elementLocator + "' -> '" + processedLocator + "' [output value]</pre>");
            }
        } else {
            Reporter.fail("No such locator template key");
        }
    }

    /**
     * Definition to click an element on the page until given condition is true, up to 10 times
     *
     * @author Ruslan Levytskyi
     */
    @When("^I click on the \"([^\"]*)\" \"([^\"]*)\" until \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_click_on_element_until_special(String elementLocator, String elementType, String conditionParameter, String condition) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator, elementType)
                .setLoop("until", conditionParameter, condition)
                .setAction(ActionsWithLocator.CLICK)
                .setReporterLog("Executing step: I click on the '" + elementLocator + " " + elementType
                        + "' element until '" + conditionParameter + " " + condition + "' condition is true")
                .execute();
    }

    /**
     * Definition to execute specified set of steps until given condition is true, up to 10 times
     *
     * @author Ruslan Levytskyi
     */
    @When("^I execute steps until \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_execute_steps_until(String conditionParameter, String condition, List<String> steps) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLoopLimit("0")
                .setLoop("until", conditionParameter, condition)
                .setAction(ActionsWithTable.EXECUTE_STEPS, steps)
                .setReporterLog("Executing step: Execute steps until '" + conditionParameter + " " + condition + "' condition is true")
                .execute();
    }

    /**
     * Definition to execute specified set of reusables until given condition is true, up to 10 times
     *
     * @author Ruslan Levytskyi
     */
    @When("^I execute reusables until \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_execute_reusables_until(String conditionParameter, String condition, List<String> reusables) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLoop("until", conditionParameter, condition)
                .setAction(ActionsWithTable.EXECUTE_REUSABLES, reusables)
                .setReporterLog("Executing step: Execute reusables until '" + conditionParameter + " " + condition + "' condition is true")
                .execute();
    }

    /**
     * Definition to hover over element
     *
     * @param elementLocator locator of element you want to hover over
     *                Here we also check if text is EC_ or MD_ of KW_
     * @author Ruslan Levytskyi
     */
    @When("^I hover over the \"([^\"]*)\" \"([^\"]*)\"$")
    public void hover_over_element_special(String elementLocator, String elementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocator.HOVER)
                .setMessage("Executing step: I hover over the '" + elementLocator + "' element")
                .execute();
    }

    /**
     * Definition to imitate key press from keyboard
     *
     * @param fieldValue : value to be entered in appropriate field using metadata values
     * @param elementType:   By locator of element to press key
     */
    @Then("^I press \"([^\"]*)\" for \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_press_from_keyboard_special(String fieldValue,String elementLocator, String elementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator, elementType)
                .setAction(ActionsWithLocatorAndParameter.PRESS_KEYBOARD, fieldValue)
                .setReporterLog("Executing step: I press the " + fieldValue + " from keyboard for special parameter")
                .execute();
    }

    /**
     * Definition to fill field imitating key press from keyboard
     *
     * @param fieldValue : value to be entered in appropriate field using metadata values
     * @param elementType:   By locator of element to press key
     */
    @Then("^I set \"([^\"]*)\" text to the \"([^\"]*)\" \"([^\"]*)\" from keyboard$")
    public void i_set_text_from_keyboard_special(String fieldValue,String elementLocator, String elementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator, elementType)
                .setAction(ActionsWithLocatorAndParameter.SET_TEXT_FROM_KEYBOARD, fieldValue)
                .setReporterLog("Executing step: I press the " + fieldValue + " from keyboard for special parameter")
                .execute();
    }

    /**
     * Definition to validate text from web element
     *
     * @param text     : value to be checked
     * @param elementType: By locator of element to press key
     */
    @Then("^I validate text \"([^\"]*)\" to be displayed for \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_validate_text_to_be_displayed_for_element_special(String text, String elementLocator, String elementType) {
        //todo: stepdefBuilder's VALIDATE_ELEMENT_TEXT is not working (PF Alphabetic Ordering). To be fixed
        String actualValue = "";
        Reporter.log("Executing step: I validate " + text + " to be displayed for: " + elementLocator);

        if(specialLocatorsMap.containsKey(elementType)) {
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = xpathTemplate.replaceAll("PARAMETER",
                    TestParametersController.checkIfSpecialParameter(elementLocator));
            if (elementType.equalsIgnoreCase("CHECK_URL")) {
                actualValue = SeleniumHelper.driver().getCurrentUrl();
                Reporter.log("Validating URL to match :" + text);
                assertThat(actualValue, containsString(text));
            } else {
                actualValue = getTextValueFromField(initElementLocator(resultingXpath));
                String newValue = text.replaceAll("''", "\"");
                if (text.toUpperCase().trim().startsWith("RE=")) {
                    newValue = newValue.substring("RE=".length());
                    assertThat(actualValue.trim(), MatchesPattern.matchesPattern(newValue));
                    Reporter.log("<pre>Actual value '" + actualValue + "' matches the pattern " + "'" + newValue + "'</pre>");
                    BPPLogManager.getLogger().info("Actual value '" + actualValue + "' matches the pattern " + "'" + newValue + "'");
                } else if (text.toUpperCase().startsWith("CONTAINS=")) {
                    newValue = newValue.substring("CONTAINS=".length());
                    if (text.contains("EC_")) {
                        String executionContextValue = ExecutionContextHandler.getExecutionContextValueByKey(newValue);
                        assertThat(actualValue.trim().toLowerCase(), containsString(executionContextValue.toLowerCase()));
                        Reporter.log("<pre>Actual value '" + actualValue + "' contains the string " + "'" + executionContextValue + "'</pre>");
                    } else {
                        assertThat(actualValue.trim(), containsString(newValue));
                        Reporter.log("<pre>Actual value '" + actualValue + "' contains the string " + "'" + newValue + "'</pre>");
                        BPPLogManager.getLogger().info("Actual value '" + actualValue + "' contains the string " + "'" + newValue + "'");
                    }
                } else if (text.toUpperCase().startsWith("NOT_CONTAINS=")) {
                    newValue = newValue.substring("NOT_CONTAINS=".length());
                    if (text.contains("EC_")) {
                        String executionContextValue = ExecutionContextHandler.getExecutionContextValueByKey(newValue);
                        assertThat(actualValue.trim(), not(containsString(executionContextValue)));
                    } else {
                        assertThat(actualValue.trim(), not(containsString(newValue)));
                        Reporter.log("<pre>Actual value '" + actualValue + "' not contains the string " + "'" + newValue + "'</pre>");
                        BPPLogManager.getLogger().info("Actual value '" + actualValue + "' not contains the string " + "'" + newValue + "'");
                    }
                } else if (text.toUpperCase().startsWith("CASE=")) {
                    newValue = newValue.substring("CASE=".length());
                    assertThat(actualValue.trim(), Matchers.equalTo(newValue));
                    Reporter.log("<pre>Actual value '" + actualValue + "' equals to the case sensitive string " + "'" + newValue + "'</pre>");
                    BPPLogManager.getLogger().info("Actual value '" + actualValue + "' equals to the case sensitive string " + "'" + newValue + "'");
                } else if (text.toUpperCase().contains("STARTS-WITH=")) {
                    newValue = newValue.substring("STARTS-WITH=".length());
                    assertThat(actualValue.trim(), Matchers.startsWith(newValue));
                    Reporter.log("<pre>Actual value '" + actualValue + "' starts with case sensitive string " + "'" + newValue + "'</pre>");
                    BPPLogManager.getLogger().info("Actual value '" + actualValue + "' starts with case sensitive string " + "'" + newValue + "'");
                } else if (text.contains("EC_")) {
                    String executionContextValue = ExecutionContextHandler.getExecutionContextValueByKey(newValue);
                    assertThat(actualValue.trim(), Matchers.equalTo(executionContextValue));
                    Reporter.log("<pre>Actual value '" + actualValue + "' equals to " + "'" + newValue + ": " + executionContextValue + "'</pre>");
                    BPPLogManager.getLogger().info("Actual value '" + actualValue + "' equals to " + "'" + newValue + ": " + executionContextValue + "'");
                } else {
                    assertThat(actualValue.trim(), Matchers.equalToIgnoringWhiteSpace(text));
                    BPPLogManager.getLogger().info("Actual value '" + actualValue + "' equals to the case insensitive string " + "'" + newValue + "'");
                    Reporter.log("<pre>Actual value '" + actualValue + "' equals to the case insensitive string " + "'" + newValue + "'</pre>");
                }
            }
        } else {
            Reporter.fail("No such locator template key");
        }
    }

    /**
     * Definition to double-click an element on the page
     *
     * @author Yurii Zosin
     * @param elementLocator name or value of needed element which replaces PARAMETER definiton in SpecialLocators.json
     * @param elementType xpath template of needed element
     */
    @When("^I doubleclick on the \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_doubleclick_on_element_with_parameter_special(String elementLocator, String elementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocator.DOUBLE_CLICK)
                .setMessage("Executing step: I double-click on the '" + elementLocator + "' " + elementType)
                .execute();
    }

    /**
     * Definition to perform right click an element on the page
     *
     * @author Yurii Zosin
     * @param elementLocator name or value of needed element which replaces PARAMETER definiton in SpecialLocators.json
     * @param elementType xpath template of needed element
     */
    @When("^I perform right mouse click on the \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_right_click_on_element_with_parameter_special(String elementLocator, String elementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocator.RIGHT_CLICK)
                .setMessage("Executing step: I perform right mouse click on the '" + elementLocator + "' " + elementType)
                .execute();
    }

    /**
     * Definition to execute a list of steps for each element found on the page by given locator
     *
     * @param elementLocator locator for element you want to click on
     *                initElementLocator builds locator, depending on input parameter:
     *                1. Starts with "xpath" or "css" - locator is passed directly into a method
     *                2. Parameter exists in locators document - locator value is returned from document
     *                3. None of above - parameter is treated as text value of element: //*[contains(text(), 'parameter')]
     * @param steps list of steps to execute for each element found on page by given locator
     *              To perform some action whith iterated element from current iteration, use FOR_ITEM as the locator.
     *              For example, if you say:
     *                  For each "OK Button" element:
     *                  |I click on the "FOR_ITEM" element|
     *              where "OK Button" is specified in your Locators.json file as "xpath=//button[text()='OK']",
     *              and there was 2 such elements found by given locator, then "I click on the "FOR_ITEM" element" step
     *              will be executed 2 times: first on "xpath=(//button[text()='OK'])[1]", and second on
     *              "xpath=(//button[text()='OK'])[2]" element.
     * @author Ruslan Levytskyi
     */
    @When("^For each \"([^\"]*)\" \"([^\"]*)\":$")
    public void for_each_special(String elementLocator, String elementType,  List<String> steps) {
        //todo: reverted to previous version till FOR_EACH issue with special locators is fixed
        if(specialLocatorsMap.containsKey(elementType)) {
            String processedLocator = TestParametersController.checkIfSpecialParameter(elementLocator);
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = xpathTemplate.replaceAll("PARAMETER", processedLocator);

            if(isElementPresentAndDisplay(initElementLocator(resultingXpath))) {

                Reporter.log("Executing step: For each '" + elementLocator + " " + elementType + "' element");
                List<WebElement> elements = findElements(initElementLocator(resultingXpath));
                String xpathLocator = "";
                BPPLogManager.getLogger().info("There are " + elements.size() + " '" + elementLocator + " " + elementType + "' elements found on the page");
                //todo: To be discussed, to move all cycling through elements and steps into separate method in ReusableRunner
                for (int i = 1; i <= elements.size(); i++) {
                    BPPLogManager.getLogger().info("For " + i + " element");
                    for (String step : steps) {
                        BPPLogManager.getLogger().info("Executing: " + step + " iteration " + i);
                        xpathLocator = resultingXpath.replace("xpath=", "xpath=(") + ")[" + i + "]";
                        ReusableRunner.getInstance().executeStep(step.replace("FOR_ITEM", xpathLocator));
                    }
                }
            } else {
                Reporter.fail("No such elements present on the page");
            }

            if(!elementLocator.equals(processedLocator)){
                Reporter.log("<pre>[input test parameter] " + elementLocator + "' -> '" + processedLocator + "' [output value]</pre>");
            }
        } else {
            Reporter.fail("No such locator template key");
        }
    }

    /**
     * Definition to double-click an element on the page
     *
     * @author Ruslan Levytskyi
     * @param elementLocator name or value of needed element which replaces PARAMETER definiton in SpecialLocators.json
     * @param elementType xpath template of needed element
     */
    @When("^I store \"([^\"]*)\" \"([^\"]*)\" elements number in \"([^\"]*)\" variable$")
    public void i_count_elements_special(String elementLocator, String elementType, String varName) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator, elementType)
                .setAction(ActionsWithLocatorAndParameter.COUNT_ELEMENTS, varName)
                .setReporterLog("Executing step: I count '" + elementLocator + "' " + elementType)
                .execute();
    }


    /**
     * Definition to execute JS code if given condition is true
     *
     * @param jsCode JS code to execute
     * @author yzosin
     */
    @When("^I execute \"([^\"]*)\" JS code if \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_execute_js_code_if(String jsCode, String conditionParameter, String condition) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setCondition(conditionParameter, condition)
                .setAction(ActionsWithParameter.EXECUTE_JS_CODE, jsCode)
                .setReporterLog("Executing JS code: " + jsCode)
                .execute();
    }

    /**
     * Definition to check value of specified css style
     *
     * @param attributeName  name of css attribute of element you want to check
     * @param elementLocator name or value of needed element
     * @param cssValue value that tested attribute should have
     * @author yzosin
     */
    @When("^Сss \"([^\"]*)\" of \"([^\"]*)\" \"([^\"]*)\" should have value \"([^\"]*)\"$")
    public void element_special_css_should_have_value(String attributeName, String elementLocator, String elementType, String cssValue) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator, elementType)
                .setAction(ActionsWithLocatorAndTwoParameters.VALIDATE_ELEMENT_CSS, attributeName, cssValue)
                .setReporterLog("Executing step: CSS value '" + attributeName + "' of '" + elementLocator + "' should have value '" + cssValue + "'")
                .execute();
    }

    /**
     * Definition to capture text data as EC variable
     *
     * @param elementType xpath template of needed element
     * @param executionContext Name that starts with 'EC_' that is used to store saved text value from element
     * @author yzosin
     */
    @And("^I capture text data \"([^\"]*)\" \"([^\"]*)\" as \"([^\"]*)\" variable$")
    public void i_capture_text_data_special_as_variable(String elementLocator, String elementType, String executionContext) {
        //todo: StepDefBuilder throws error while trying to get EC  -2021-12-01 17:05:39 [PoolService] ERROR ExecutionContextHandler:35 - Requested EC_BASKET_ID execution context key is absent
        if (specialLocatorsMap.containsKey(elementType)) {
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = xpathTemplate.replaceAll("PARAMETER",
                    TestParametersController.checkIfSpecialParameter(elementLocator));
            String value = getTextValueFromField(initElementLocator(resultingXpath));
            Reporter.log("Capturing data from : " + initElementLocator(resultingXpath) + ": " + executionContext);
            ExecutionContextHandler.setExecutionContextValueByKey(executionContext, value);
            Reporter.log("Saving EC key " + executionContext + " = " + value);
        } else {
            Reporter.log("Cannot save EC value with an empty key. Check your parameters.");
        }
    }

    /**
     * Definition to perform drag and drop from one element to another
     *
     * @author Ruslan Levytskyi
     * @param sourceElementLocator locator of element to drag from
     * @param sourceElementType locator of element to drag from
     * @param targetElementLocator locator of element to drag to
     * @param targetElementType locator of element to drag to
     */
    @When("^I drag \"([^\"]*)\" \"([^\"]*)\" to \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_drag_and_drop_special(String sourceElementLocator, String sourceElementType, String targetElementLocator, String targetElementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(sourceElementLocator, sourceElementType)
                .setAnotherLocator(targetElementLocator, targetElementType)
                .setAction(ActionsWithTwoLocators.DRAG_AND_DROP)
                .setMessage("Executing step: I drag: '" + sourceElementLocator + " " + sourceElementType + "' to '" + targetElementLocator + " " + targetElementType +  "' element")
                .execute();
    }

    @When("^For each \"([^\"]*)\" csv entry:$")
    public void i_execute_for_each_csv_entry(String csvName, List<String> steps) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setAction(ActionsWithParameterAndTable.EXECUTE_FOR_EACH_CSV_ENTRY,csvName,steps)
                .setMessage("Executing step: For each '" + csvName + " csv entry:")
                .execute();
    }

    @When("^Counter \"([^\"]*)\" \"([^\"]*)\"$")
    public void counter(String countName, String countAct) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setAction(ActionsWithTwoParameters.COUNTER,countName,countAct)
                .setMessage("Executing step: Counter '" + countName + "' " + countAct)
                .execute();
    }

    @When("^Counter \"([^\"]*)\" \"([^\"]*)\" if \"([^\"]*)\" \"([^\"]*)\"$")
    public void counter_if(String countName, String countAct, String conditionParameter, String condition) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setCondition(conditionParameter, condition)
                .setAction(ActionsWithTwoParameters.COUNTER,countName,countAct)
                .setMessage("Executing step: Counter '" + countName + "' " + countAct + " if '" + conditionParameter + "' " + condition)
                .execute();
    }

    @When("^I open \"([^\"]*)\" link in new tab$")
    public void i_open_in_new_tab(String element) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocator.OPEN_LINK_IN_NEW_TAB)
                .setMessage("Executing step: Open '" + element + "' link in new tab" )
                .execute();
    }

    @When("^I open \"([^\"]*)\" \"([^\"]*)\" in new tab$")
    public void i_open_in_new_tab_special(String elementLocator, String elementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator, elementType)
                .setAction(ActionsWithLocator.OPEN_LINK_IN_NEW_TAB)
                .setMessage("Executing step: Open '" + elementLocator + " " + elementType + "' link in new tab" )
                .execute();
    }

    @When("^I open \"([^\"]*)\" link in new tab by index \"([^\"]*)\"$")
    public void i_open_in_new_tab_by_index(String element, String index) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setItemIndex(index)
                .setAction(ActionsWithLocator.OPEN_LINK_IN_NEW_TAB)
                .setMessage("Executing step: Open '" + element + "' link in new tab by index " + index)
                .execute();
    }

    @When("^I open \"([^\"]*)\" \"([^\"]*)\" in new tab by index \"([^\"]*)\"$")
    public void i_open_in_new_tab_by_index_special(String elementLocator, String elementType, String index) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator, elementType)
                .setItemIndex(index)
                .setAction(ActionsWithLocator.OPEN_LINK_IN_NEW_TAB)
                .setMessage("Executing step: Open '" + elementLocator + " " + elementType + "' link in new tab by index " + index)
                .execute();
    }

    /**
     * Definition to validate items are similar
     *
     */
    @Then("^I verify that \"([^\"]*)\" element \"(equal|contains)\" to \"([^\"]*)\" element$")
    public void i_verify_that_element_is(String elementOne, String value, String elementTwo) {
        String resultElement = TestParametersController.checkIfSpecialParameter(elementOne);
        String startElement = TestParametersController.checkIfSpecialParameter(elementTwo);
        Reporter.log("Executing step: I verify that " + resultElement + " is "+ value + " to: " + startElement);
        String currentUrl = getURL();
        if (value.equals("contains")) {
            if (!startElement.contains(resultElement)) {
                Reporter.warn("Mismatch. Element " + startElement + " does not contain " + resultElement + " at " + currentUrl);
                BPPLogManager.getLogger().error("Mismatch. Element " + startElement + " does not contain " + resultElement + " at " + currentUrl);
            }
            sa.assertTrue(startElement.contains(resultElement), currentUrl);
        } else if (value.equals("equal")) {
            if (!startElement.equals(resultElement)) {
                Reporter.warn("Mismatch. Element " + startElement + " is not equal to " + resultElement + " at " + currentUrl);
                BPPLogManager.getLogger().error("Mismatch. Element " + startElement + " is not equal to " + resultElement + " at " + currentUrl);
            }
            sa.assertEquals(startElement, resultElement, currentUrl);
        }
    }

    /**
     * Definition to validate items are similar if given condition is true
     *
     */
    @Then("^I verify that \"([^\"]*)\" element \"(equal|contains)\" to \"([^\"]*)\" element if \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_verify_that_element_if(String elementOne, String value, String elementTwo, String conditionParameter, String condition) {
        String resultElement = TestParametersController.checkIfSpecialParameter(elementOne);
        String startElement = TestParametersController.checkIfSpecialParameter(elementTwo);
        Conditions cond = new Conditions();
        if (cond.checkCondition(condition,conditionParameter)) {
            Reporter.log("Executing step: I verify that " + resultElement + " is " + value + " to: " + startElement);
            String currentUrl = getURL();
            if (value.equals("contains")) {
                if (!startElement.contains(resultElement)) {
                    Reporter.warn("Mismatch. Element " + startElement + " does not contain " + resultElement + " at " + currentUrl);
                    BPPLogManager.getLogger().error("Mismatch. Element " + startElement + " does not contain " + resultElement + " at " + currentUrl);
                }
                sa.assertTrue(startElement.contains(resultElement), currentUrl);
            } else if (value.equals("equal")) {
                if (!startElement.equals(resultElement)) {
                    Reporter.warn("Mismatch. Element " + startElement + " is not equal to " + resultElement + " at " + currentUrl);
                    BPPLogManager.getLogger().error("Mismatch. Element " + startElement + " is not equal to " + resultElement + " at " + currentUrl);
                }
                sa.assertEquals(startElement, resultElement, currentUrl);
            }
        }
    }

    /**
     * Assert all for sort assertions
     *
     */
    @Then("^I assert all$")
    public void i_assert_all() { //todo: move assertAll to BaseUiTest
        sa.assertAll();
    }
}