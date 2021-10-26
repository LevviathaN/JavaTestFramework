package cucumber.stepdefs;

import cucumber.reusablesteps.ReusableRunner;
import cucumber.stepdefs.Actions.ActionsWithLocator;
import cucumber.stepdefs.Actions.ActionsWithLocatorAndParameter;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.hamcrest.Matchers;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.testng.Assert;
import ui.utils.SeleniumHelper;
import ui.utils.BPPLogManager;
import ui.utils.Conditions;
import ui.utils.Reporter;
import ui.utils.UiHandlers;
import ui.utils.bpp.ExecutionContextHandler;
import ui.utils.bpp.TestParametersController;

import java.util.List;

import static com.jcabi.matchers.RegexMatchers.matchesPattern;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;

public class SpecialStepDefs extends SeleniumHelper {

    /**
     * Definition to click an element on the page
     *
     * @author Ruslan Levytskyi
     * @param elementLocator name or value of needed element which replaces PARAMETER definiton in SpecialLocators.json
     * @param elementType xpath template of needed element
     */
    @When("^I click on the \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_click_on_element_with_parameter_special(String elementLocator, String elementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocator.CLICK)
                .setMessage("Executing step: I click on the '" + elementLocator + "' " + elementType)
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
        stepDef.setAction(ActionsWithLocator.CLICK_WITH_JS)
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
        Conditions conditions = new Conditions();
        String actualValue = "";
        if (conditions.checkCondition(condition, conditionParameter)) {
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
        } else {
            Reporter.log("Condition " + conditionParameter + condition + " is not true, so '" + element + text + "' element step will not be validated");
        }
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
        Reporter.log("Executing step: Attribute '" + attributeName + "' of '" + elementLocator + "' " + elementType + " should have value '" + attributeValue + "'");
        if(specialLocatorsMap.containsKey(elementType)) {
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = xpathTemplate.replaceAll("PARAMETER",
                    TestParametersController.checkIfSpecialParameter(elementLocator));
            String actualAttributeValue = findElement(initElementLocator(resultingXpath)).getAttribute(attributeName);
            Assert.assertTrue(actualAttributeValue.equalsIgnoreCase(TestParametersController.checkIfSpecialParameter(attributeValue)));
        } else {
            Reporter.fail("No such locator template key");
        }
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
        Reporter.log("Executing step: I " + value + " '" + elementLocator + "' " + elementType);
        boolean state = true;
        if(value.equals("check")){state = true;}
        else if(value.equals("uncheck")){state = false;}
        if(specialLocatorsMap.containsKey(elementType)) {
            String processedLocator = TestParametersController.checkIfSpecialParameter(elementLocator);
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = xpathTemplate.replaceAll("PARAMETER", processedLocator);
            checkCheckbox(initElementLocator(resultingXpath),state,
                    UiHandlers.PF_SPINNER_HANDLER,
                    UiHandlers.ACCEPT_ALERT,
                    UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                    UiHandlers.PF_SCROLL_HANDLER,
                    UiHandlers.PAGE_NOT_LOAD_HANDLER,
                    UiHandlers.SF_CLICK_HANDLER,
                    UiHandlers.WAIT_HANDLER,
                    UiHandlers.DEFAULT_HANDLER);
            if(!elementLocator.equals(processedLocator)){
                Reporter.log("<pre>[input test parameter] " + elementLocator + "' -> '" + processedLocator + "' [output value]</pre>");
            }
        } else {
            Reporter.fail("No such locator template key");
        }
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
                    UiHandlers.PF_SPINNER_HANDLER,
                    UiHandlers.ACCEPT_ALERT,
                    UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                    UiHandlers.PF_SCROLL_HANDLER,
                    UiHandlers.PAGE_NOT_LOAD_HANDLER,
                    UiHandlers.SF_CLICK_HANDLER,
                    UiHandlers.WAIT_HANDLER,
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
        Reporter.log("Executing step: I select: " + value + " from " + elementLocator + "' " + elementType);
        if(specialLocatorsMap.containsKey(elementType)) {
            String processedLocator = TestParametersController.checkIfSpecialParameter(elementLocator);
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = xpathTemplate.replaceAll("PARAMETER", processedLocator);

            if (value.equals("KW_AUTO_SELECT")) {
                Reporter.log("Starting random selection from dropdown.");
                String autoSelectedValue = autoSelectFromDropdown(initElementLocator(resultingXpath));
                Reporter.log("Selected \"" + autoSelectedValue + "\" value from " + elementLocator + "' " + elementType);
            } else if (value.contains("EC_")) {
                Reporter.log("Selecting value using Execution Context");
                String executionContextValue = ExecutionContextHandler.getExecutionContextValueByKey(value);
                selectValueFromDropDown(initElementLocator(resultingXpath), executionContextValue);
                Reporter.log("Selected \"" + executionContextValue + "\" value from " + elementLocator + "' " + elementType);
            } else {
                Reporter.log("Selecting \"" + value + "\" value from " + elementLocator + "' " + elementType);
                selectValueFromDropDown(initElementLocator(resultingXpath), value);
            }
        }else {
            Reporter.fail("No such locator template key");
        }
    }

    /**
     * Definition to execute JS code for some particular element
     *
     * @param jsCode JS code to execute
     * @author Ruslan Levytskyi
     */
    @And("^I execute \"([^\"]*)\" JS code for \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_execute_js_code_for_element_special(String jsCode, String elementLocator, String elementType) {
        StepDefinitionBuilder stepDef = new StepDefinitionBuilder();
        stepDef.setLocator(elementLocator,elementType)
                .setAction(ActionsWithLocatorAndParameter.EXECUTE_JS,jsCode)
                .setMessage("Executing JS code: '" + jsCode + "' for " + elementLocator + " " + elementType)
                .execute();
    }

    /**
     * Definition to click an element on the page until given condition is true, up to 10 times
     *
     * @author Ruslan Levytskyi
     */
    @When("^I click on the \"([^\"]*)\" \"([^\"]*)\" until \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_click_on_element_until_special(String elementLocator, String elementType, String conditionParameter, String condition) {
        Conditions conditions = new Conditions();
        int attempt = 1;
        Reporter.log("Executing step: I click on the '" + elementLocator + "' element");
        do {
            Reporter.log("attempt " + attempt);
            if(specialLocatorsMap.containsKey(elementType)) {
                String processedLocator = TestParametersController.checkIfSpecialParameter(elementLocator);
                String xpathTemplate = specialLocatorsMap.get(elementType);
                String resultingXpath = xpathTemplate.replaceAll("PARAMETER", processedLocator);
                clickOnElement(initElementLocator(resultingXpath),
                        UiHandlers.PF_SCROLL_HANDLER,
                        UiHandlers.ACCEPT_ALERT,
                        UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                        UiHandlers.PAGE_NOT_LOAD_HANDLER,
                        UiHandlers.PF_SPINNER_HANDLER,
                        UiHandlers.PF_PREMATURE_MENU_CLICK_HANDLER,
                        UiHandlers.DEFAULT_HANDLER);
                if(!elementLocator.equals(processedLocator)){
                    Reporter.log("<pre>[input test parameter] " + elementLocator + "' -> '" + processedLocator + "' [output value]</pre>");
                }
            } else {
                Reporter.fail("No such locator template key");
            }
            attempt++;
            if (attempt > 5) {
                Reporter.log("Condition " + conditionParameter + condition + " is not true, so '" + elementLocator + "' element step will not be clicked");
                break;
            } else {
                sleepFor(5000);
            }
        } while (!conditions.checkCondition(condition, conditionParameter));
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
        Reporter.log("Executing step: I press the " + fieldValue + " from keyboard for special parameter");
        if(specialLocatorsMap.containsKey(elementType)) {
            String processedText = TestParametersController.checkIfSpecialParameter(fieldValue);
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = xpathTemplate.replaceAll("PARAMETER",
                    TestParametersController.checkIfSpecialParameter(elementLocator));
            pressKeyFromKeyboard(initElementLocator(resultingXpath), TestParametersController.checkIfSpecialParameter(processedText));
            waitForPageToLoad();
        } else {
            Reporter.fail("No such locator template key");
        }
    }

    /**
     * Definition to fill field imitating key press from keyboard
     *
     * @param fieldValue : value to be entered in appropriate field using metadata values
     * @param elementType:   By locator of element to press key
     */
    @Then("^I set \"([^\"]*)\" text to the \"([^\"]*)\" \"([^\"]*)\" from keyboard$")
    public void i_set_text_from_keyboard_special(String fieldValue,String elementLocator, String elementType) {
        Reporter.log("Executing step: I press the " + fieldValue + " from keyboard for special parameter");
        if(specialLocatorsMap.containsKey(elementType)) {
            String processedText = TestParametersController.checkIfSpecialParameter(fieldValue);
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = xpathTemplate.replaceAll("PARAMETER",
                    TestParametersController.checkIfSpecialParameter(elementLocator));
            char[] string = processedText.toCharArray();
            By element = initElementLocator(resultingXpath);
            clearEntireField(element);
            for (int i=0; i<string.length; i++) {
                WebElement keyItem = findElement(element);
                keyItem.sendKeys(String.valueOf(string[i]));
            }
            waitForPageToLoad();
        } else {
            Reporter.fail("No such locator template key");
        }
    }

    /**
     * Definition to validate text from web element
     *
     * @param text     : value to be checked
     * @param elementType: By locator of element to press key
     */
    @Then("^I validate text \"([^\"]*)\" to be displayed for \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_validate_text_to_be_displayed_for_element_special(String text, String elementLocator, String elementType) {
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
        Reporter.log("Executing step: I count '" + elementLocator + "' " + elementType);
        if(specialLocatorsMap.containsKey(elementType)) {
            String processedLocator = TestParametersController.checkIfSpecialParameter(elementLocator);
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = xpathTemplate.replaceAll("PARAMETER", processedLocator);
            BPPLogManager.getLogger().info("Counting: " + elementLocator + " elements");
            int actualNumberOfElements = numberOfElements(initElementLocator(resultingXpath));
            ExecutionContextHandler.setExecutionContextValueByKey(varName, TestParametersController.checkIfSpecialParameter(String.valueOf(actualNumberOfElements)));
            if(!elementLocator.equals(processedLocator)){
                Reporter.log("<pre>[input test parameter] " + elementLocator + "' -> '" + processedLocator + "' [output value]</pre>");
            }
        } else {
            Reporter.fail("No such locator template key");
        }
    }


    /**
     * Definition to execute JS code if given condition is true
     *
     * @param jsCode JS code to execute
     * @author yzosin
     */
    @When("^I execute \"([^\"]*)\" JS code if \"([^\"]*)\" \"([^\"]*)\"$")
    public void i_execute_js_code_if(String jsCode, String conditionParameter, String condition) {
        Conditions conditions = new Conditions();
        if (conditions.checkCondition(condition, conditionParameter)) {
            Reporter.log("Executing JS code: " + jsCode);
            executeJSCode(TestParametersController.checkIfSpecialParameter(jsCode));
        } else {
            Reporter.log("Condition " + conditionParameter + condition + " is not true, so JS code will not be executed!");
        }
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
        Reporter.log("Executing step: CSS value '" + attributeName + "' of '" + elementLocator + "' should have value '" + cssValue + "'");
        if(specialLocatorsMap.containsKey(elementType)) {
            String processedLocator = TestParametersController.checkIfSpecialParameter(elementLocator);
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = xpathTemplate.replaceAll("PARAMETER", processedLocator);
            Assert.assertTrue(findElement(initElementLocator(resultingXpath)).getCssValue(attributeName).equalsIgnoreCase(cssValue));
            if(!elementLocator.equals(processedLocator)){
                Reporter.log("<pre>[input test parameter] " + elementLocator + "' -> '" + processedLocator + "' [output value]</pre>");
            }
        } else {
            Reporter.fail("No such locator template key");
        }
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
}


