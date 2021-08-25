package cucumber.stepdefs;

import cucumber.reusablesteps.ReusableRunner;
import cucumber.stepdefs.Actions.ActionsWithLocator;
import cucumber.stepdefs.Actions.ActionsWithLocatorAndParameter;
import cucumber.stepdefs.Actions.ActionsWithParameter;
import cucumber.stepdefs.Actions.ActionsWithParameterAndTable;
import io.cucumber.java.AfterStep;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.hamcrest.Matchers;
import org.jooq.tools.json.ParseException;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.NoSuchWindowException;
import org.openqa.selenium.WebElement;
import org.testng.Assert;
import ui.utils.SeleniumHelper;
import ui.utils.*;
import ui.utils.bpp.ExecutionContextHandler;
import ui.utils.bpp.TestParametersController;
import ui.utils.pdf.PDFHandler;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import static com.jcabi.matchers.RegexMatchers.matchesPattern;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;

/**
 * Created by Ruslan Levytskyi on 15/3/2019.
 */
public class StepDefinitions extends SeleniumHelper {


    @AfterStep
    public void postActions() {
        try {
            driver().switchTo().defaultContent();
        } catch (NoSuchWindowException e) {
            BPPLogManager.getLogger().info("Catching exception: " + e.getMessage().substring(0, 44));
        }
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
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(element)
                .setAction(ActionsWithLocator.PRESENT)
                .setMessage("Executing step: I should see the '" + element + "' element")
                .execute();
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
        Reporter.log("Executing step: I remember '" + text + "' text as '" + varName + "' variable");
        ExecutionContextHandler.setExecutionContextValueByKey(varName, TestParametersController.checkIfSpecialParameter(text));
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
        Reporter.log("Executing step: Attribute '" + attributeName + "' of '" + elementLocator + "' should have value '" + attributeValue + "'");
        if (attributeValue.toUpperCase().contains("CONTAINS=")) {
            String attributeValueCropped = attributeValue.substring("CONTAINS=".length());
            if (attributeValue.contains("EC_")) {
                String executionContextValue = TestParametersController.checkIfSpecialParameter(ExecutionContextHandler.getExecutionContextValueByKey(attributeValueCropped));
                Assert.assertTrue(findElement(initElementLocator(elementLocator)).getAttribute(attributeName).contains(executionContextValue));
            }
        } else if (attributeValue.contains("EC_")) {
            String executionContextValue = TestParametersController.checkIfSpecialParameter(ExecutionContextHandler.getExecutionContextValueByKey(attributeValue));
            Assert.assertTrue(findElement(initElementLocator(elementLocator)).getAttribute(attributeName).equalsIgnoreCase(executionContextValue));
        } else {
            Assert.assertTrue(findElement(initElementLocator(elementLocator)).getAttribute(attributeName).equalsIgnoreCase(attributeValue));
        }
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
        Reporter.log("Executing step: CSS value '" + attributeName + "' of '" + elementLocator + "' should have value '" + cssValue + "'");
        if (cssValue.toUpperCase().contains("CONTAINS=")) {
            String attributeValueCropped = cssValue.substring("CONTAINS=".length());
            if (cssValue.contains("EC_")) {
                String executionContextValue = TestParametersController.checkIfSpecialParameter(ExecutionContextHandler.getExecutionContextValueByKey(attributeValueCropped));
                Assert.assertTrue(findElement(initElementLocator(elementLocator)).getCssValue(attributeName).contains(executionContextValue));
            }
        } else if (cssValue.contains("EC_")) {
            String executionContextValue = TestParametersController.checkIfSpecialParameter(ExecutionContextHandler.getExecutionContextValueByKey(cssValue));
            Assert.assertTrue(findElement(initElementLocator(elementLocator)).getCssValue(attributeName).equalsIgnoreCase(executionContextValue));
        } else {
            Assert.assertTrue(findElement(initElementLocator(elementLocator)).getCssValue(attributeName).equalsIgnoreCase(cssValue));
        }
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
        Reporter.log("Executing step: I " + value + " '" + element + "' checkbox");
        String processedElement = TestParametersController.checkIfSpecialParameter(element);
        boolean state = true;
        if (value.equals("check")) {
            state = true;
        } else if (value.equals("uncheck")) {
            state = false;
        }
        checkCheckbox(initElementLocator(element), state);
        if (!element.equals(processedElement)) {
            Reporter.log("<pre>[input test parameter] " + element + "' -> '" + processedElement + " [output value]</pre>");
        }
    }

    /**
     * Definition to imitate key press from keyboard
     *
     * @param fieldValue : value to be entered in appropriate field using metadata values
     * @param element:   By locator of element to press key
     */
    @Then("^I press \"([^\"]*)\" for \"([^\"]*)\"$")
    public void i_press_from_keyboard(String fieldValue, String element) {
        Reporter.log("Executing step: I press the " + fieldValue + " from keyboard");
        pressKeyFromKeyboard(initElementLocator(element), TestParametersController.checkIfSpecialParameter(fieldValue));
        waitForPageToLoad();
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
        Reporter.log("Executing step: I should see " + expectedQuantity + " '" + element + "' elements");
        int actualNumberOfElements = numberOfElements(initElementLocator(element));
        if (expectedQuantity.contains("more than")) {
            Assert.assertTrue(actualNumberOfElements > Integer.parseInt(expectedQuantity.substring(10)));
        } else if (expectedQuantity.contains("less than")) {
            Assert.assertTrue(actualNumberOfElements < Integer.parseInt(expectedQuantity.substring(10)));
        } else {
            Assert.assertTrue(expectedQuantity.equals(String.valueOf(actualNumberOfElements)));
        }
    }

    /**
     * Action to upload a file
     *
     * @param element:  locator type to be used to locate the element for uploading a file
     * @param fileName: file that should be uploaded to element on the page
     */
    @Then("I upload \"([^\"]*)\" file to \"([^\"]*)\" element")
    public void i_upload_file_to_element(String fileName, String element) {
        Reporter.log("Executing step: I upload the " + fileName + " to: " + element);
        fileUpload(initElementLocator(element), fileName);
        waitForPageToLoad();
    }

    /**
     * Definition to validate text from web element
     *
     * @param text     : value to be checked
     * @param element: By locator of element to press key
     */
    @Then("^I validate text \"([^\"]*)\" to be displayed for \"([^\"]*)\" element$")
    public void i_validate_text_to_be_displayed_for_element(String text, String element) {
        String actualValue = "";
        Reporter.log("Executing step: I validate " + text + " to be displayed for: " + element);
        if (element.equalsIgnoreCase("CHECK_URL")) {
            actualValue = SeleniumHelper.driver().getCurrentUrl();
            Reporter.log("Validating URL to match :" + text);
            assertThat(actualValue, containsString(text));
        } else {
            actualValue = getTextValueFromField(initElementLocator(element));
            String newValue = text.replaceAll("''", "\"");
            if (text.toUpperCase().trim().startsWith("RE=")) {
                newValue = newValue.substring("RE=".length());
                assertThat(actualValue.trim(), matchesPattern(newValue));
                Reporter.log("<pre>Actual value '" + actualValue + "' matches the pattern " + "'" + newValue + "'</pre>");
                BPPLogManager.getLogger().info("Actual value '" + actualValue + "' matches the pattern " + "'" + newValue + "'");
            } else if (text.toUpperCase().startsWith("CONTAINS=")) {
                newValue = newValue.substring("CONTAINS=".length());
                if (text.contains("EC")) {
                    String executionContextValue = ExecutionContextHandler.getExecutionContextValueByKey(newValue);
                    assertThat(actualValue.trim().toLowerCase(), Matchers.containsString(executionContextValue.toLowerCase()));
                } else {
                    assertThat(actualValue.trim(), Matchers.containsString(newValue));
                    Reporter.log("<pre>Actual value '" + actualValue + "' contains the string " + "'" + newValue + "'</pre>");
                    BPPLogManager.getLogger().info("Actual value '" + actualValue + "' contains the string " + "'" + newValue + "'");
                }
            } else if (text.toUpperCase().startsWith("NOT_CONTAINS=")) {
                newValue = newValue.substring("NOT_CONTAINS=".length());
                if (text.contains("EC")) {
                    String executionContextValue = ExecutionContextHandler.getExecutionContextValueByKey(newValue);
                    assertThat(actualValue.trim(), not(Matchers.containsString(executionContextValue)));
                } else {
                    assertThat(actualValue.trim(), not(Matchers.containsString(newValue)));
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
    }

    /**
     * Definition scroll the page to the bottom after page is loaded
     *
     * @author Andrii Yakymchuk
     */
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
        Reporter.log("Executing step: I select: " + value + " from " + element + " dropdown");
        if (value.equals("KW_AUTO_SELECT")) {
            Reporter.log("Starting random selection from dropdown.");
            String autoSelectedValue = autoSelectFromDropdown(initElementLocator(element));
            Reporter.log("Selected \"" + autoSelectedValue + "\" value from " + element);
        } else {
            Reporter.log("Selecting \"" + value + "\" value from " + element);
            selectValueFromDropDown(initElementLocator(element), TestParametersController.checkIfSpecialParameter(value));
        }
    }

    /**
     * Switching to the window with appropriate index. Used when few windows are open in browser.
     * If needed it may be used in order to switch to any extra window and then back to the main window.
     * Index = 1 is supposed to be the index of the main window
     * MAXIMUM acceptable window index is 9
     */
    @Then("^I switch to window with index \"([^\"]*)\"$")
    public void i_switch_to_window_with_index(String value) {
        if (value.length() > 0) {
            int index = Integer.parseInt(value.substring(0, 1));
            Reporter.log("Switching to the window with index = " + index);
            switchToWindowByIndex(index);
        } else {
            Reporter.log("REQUIRED 'WINDOW INDEX' PARAMETER IS MISSED");
        }
    }

    /**
     * Perform click using JavaScript
     */
    @When("^I click on the \"([^\"]*)\" (?:button|link|option|element) by JS$")
    public void i_click_with_JS(String element) {
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
        String browserOperation = operation.toUpperCase();
        Reporter.log("Executing step: Performing browser " + browserOperation + " operation");
        switch (browserOperation) {
            case "FORWARD":
                BPPLogManager.getLogger().info("Browser FORWARD operation executing.");
                driver().navigate().forward();
                break;
            case "BACK":
                BPPLogManager.getLogger().info("Browser BACK operation executing.");
                driver().navigate().back();
                break;
            case "REFRESH":
                BPPLogManager.getLogger().info("Browser REFRESH operation executing.");
                driver().navigate().refresh();
                break;
            default:
                BPPLogManager.getLogger().info("No navigation operation performed.  Check spelling for page navigation parameter.  Only 'Forward', 'Back', and 'Refresh' are supported.");
                break;
        }
    }

    /**
     * Definition scroll the page to the bottom after page is loaded
     *
     * @param element          locator of element you want to check if it's visible and soon to put into Execution Context
     * @param executionContext Name that starts with 'EC_' that is used to store saved text value from element
     * @author Andrii Yakymchuk
     */

    @And("^I capture text data \"([^\"]*)\" as \"([^\"]*)\" variable$")
    public void i_capture_text_data_as_variable(String element, String executionContext) {
        String value = getTextValueFromField(initElementLocator(element));
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
     * Definition to execute JS code
     *
     * @param jsCode JS code to execute
     * @author Ruslan Levytskyi
     */
    @And("^I execute \"([^\"]*)\" JS code$")
    public void i_execute_js_code(String jsCode) {
        Reporter.log("Executing JS code: " + jsCode);
        //todo: .checkIfSpecialParameter() does not work with JS commands.
        //It sees that string contains EC_ variable, but do not recognize it as valid one. Probably the thing is in regex
        //to check it. todo to be replaced
        executeJSCode(TestParametersController.checkIfSpecialParameter(jsCode));
    }

    /**
     * Definition to execute JS code for some particular element
     *
     * @param jsCode JS code to execute
     * @author Ruslan Levytskyi
     */
    @And("^I execute \"([^\"]*)\" JS code for \"([^\"]*)\" element$")
    public void i_execute_js_code_for_element(String jsCode, String element) {
        Reporter.log("Executing JS code: " + jsCode);
        executeJSCodeForElement(initElementLocator(element), TestParametersController.checkIfSpecialParameter(jsCode));
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

    /**
     * Definition to click an element on the page until given condition is true, up to 10 times
     *
     * @author Ruslan Levytskyi
     */
    @When("^I click on the \"([^\"]*)\" element until \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_click_on_element_until(String element, String conditionParameter, String condition) {
        Conditions conditions = new Conditions();
        int attempt = 1;
        Reporter.log("Executing step: I click on the '" + element + "' element");
        do {
            Reporter.log("attempt " + attempt);
            clickOnElement(initElementLocator(element),
                    UiHandlers.PF_SPINNER_HANDLER,
                    UiHandlers.ACCEPT_ALERT,
                    UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                    UiHandlers.PF_SCROLL_HANDLER,
                    UiHandlers.PAGE_NOT_LOAD_HANDLER,
                    UiHandlers.SF_CLICK_HANDLER,
                    UiHandlers.WAIT_HANDLER,
                    UiHandlers.PF_PREMATURE_MENU_CLICK_HANDLER,
                    UiHandlers.DEFAULT_HANDLER);
            attempt++;
            if (attempt > 5) {
                Reporter.log("Condition " + conditionParameter + condition + " is not true, so '" + element + "' element step will not be clicked");
                break;
            } else {
                sleepFor(5000);
            }
        } while (!conditions.checkCondition(condition, conditionParameter));
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
        Reporter.log("Executing step: Browser deletes cookies");
        driver().manage().deleteAllCookies();
        BPPLogManager.getLogger().info("Browser has deleted cookies");
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
        //todo: To be tested properly
        Reporter.log("Executing step: For each '" + element + "' element");
        if (isElementPresentAndDisplay(initElementLocator(element))) {
            List<WebElement> elements = findElements(initElementLocator(element));
            String xpathLocator = "";
            BPPLogManager.getLogger().info("There are " + elements.size() + " '" + element + "' elements found on the page");
            //todo: To be discussed, to move all cycling through elements and steps into separate method in ReusableRunner
            for(int i = 1; i <= elements.size(); i++) {
                BPPLogManager.getLogger().info("For " + i + " element");
                for(String step : steps) {
                    BPPLogManager.getLogger().info("Executing: " + step + " iteration " + i);
                    if (locatorsMap.containsKey(element)) {
                        xpathLocator = locatorsMap.get(element).replace("xpath=","xpath=(") + ")[" + i + "]";
                    } else {
                        xpathLocator = "xpath=(//*[text()='" + TestParametersController.checkIfSpecialParameter(element) + "'])[" + i + "]";
                    }
                    ReusableRunner.getInstance().executeStep(step.replace("FOR_ITEM",xpathLocator));
                }
            }
        } else {
            Reporter.log("Element '" + element + "' not found");
            BPPLogManager.getLogger().info("Element '" + element + "' not found");
        }

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
//        Reporter.log("Executing step: I click on the '" + element + "' element");
//        doubleClick(initElementLocator(element),
//                UiHandlers.PF_SPINNER_HANDLER,
//                UiHandlers.ACCEPT_ALERT,
//                UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
//                UiHandlers.PF_SCROLL_HANDLER,
//                UiHandlers.PAGE_NOT_LOAD_HANDLER,
//                UiHandlers.SF_CLICK_HANDLER,
//                UiHandlers.WAIT_HANDLER,
//                UiHandlers.DEFAULT_HANDLER);
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
        Conditions conditions = new Conditions();
        if (conditions.checkCondition(condition, conditionParameter)) {
            Reporter.log("Executing step: I execute '" + reusableName + "' reusable step modified");
            ReusableRunner.getInstance().executeReusableModified(TestParametersController.checkIfSpecialParameter(reusableName), steps);
        } else {
            Reporter.log("Condition " + conditionParameter + " " + condition + " is not true, so '" + reusableName + "' reusable step will not be executed");
        }
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
    public void i_execute_reusable_step_verifying(String reusableName, String scenarioName) {
        Reporter.log("Executing step: I execute '" + reusableName + "' reusable step to verify '" + scenarioName + "' scenario");
        ReusableRunner.getInstance().executeReusable(TestParametersController.checkIfSpecialParameter(reusableName));
        String qtestID = System.getProperties().containsKey("qtest") && System.getProperty("qtest")
                .equalsIgnoreCase("TRUE") ? qTestAPI.getTestRunIDfromSuite().get(scenarioName) : null;
        boolean isPassed = true;
        String errorMessage = "";
        try {
            ReusableRunner.getInstance().executeReusable(TestParametersController.checkIfSpecialParameter(reusableName));
            RetryAnalyzer.passMap.put(scenarioName, "pass");
            if (qtestID == null) {
                qTestAPI.TestRunStatusUpdate(Reporter.getCurrentTestName(), "Passed", 601, qtestID, "");
            }
        } catch (Exception e) {
            RetryAnalyzer.passMap.put(scenarioName, "fail");
            e.printStackTrace();
            isPassed = false;
        }
        if (!isPassed && qtestID == null){
            try {
                qTestAPI.TestRunStatusUpdate(Reporter.getCurrentTestName(), "Failed", 601, qtestID, errorMessage);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (ParseException e) {
                e.printStackTrace();
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
    public void i_execute_modified_reusable_step_verifying(String reusableName, String scenarioName, List<List<String>> steps) {
        Reporter.log("Executing step: I execute modified '" + reusableName + "' reusable step to verify '" + scenarioName + "' scenario");
        ReusableRunner.getInstance().executeReusable(TestParametersController.checkIfSpecialParameter(reusableName));
        String qtestID = System.getProperties().containsKey("qtest") && System.getProperty("qtest")
                .equalsIgnoreCase("TRUE") ? qTestAPI.getTestRunIDfromSuite().get(scenarioName) : null;
        boolean isPassed = true;
        String errorMessage = "";
        try {
            ReusableRunner.getInstance().executeReusableModified(reusableName,steps);
            RetryAnalyzer.passMap.put(scenarioName, "pass");
            if (qtestID == null) {
                qTestAPI.TestRunStatusUpdate(Reporter.getCurrentTestName(), "Passed", 601, qtestID, "");
            }
        } catch (Exception e) {
            RetryAnalyzer.passMap.put(scenarioName, "fail");
            e.printStackTrace();
            isPassed = false;
        }
        if (!isPassed && qtestID == null){
            try {
                qTestAPI.TestRunStatusUpdate(Reporter.getCurrentTestName(), "Failed", 601, qtestID, errorMessage);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Definition to double-click an element on the page
     *
     * @author Ruslan Levytskyi
     */
    @When("^I store \"([^\"]*)\" elements number in \"([^\"]*)\" variable$")
    public void i_count_elements(String element, String varName) {
        Reporter.log("Executing step: I count '" + element + "' elements");
            BPPLogManager.getLogger().info("Counting: " + element + " elements");
            int actualNumberOfElements = numberOfElements(initElementLocator(element));
            ExecutionContextHandler.setExecutionContextValueByKey(varName, TestParametersController.checkIfSpecialParameter(String.valueOf(actualNumberOfElements)));
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
}