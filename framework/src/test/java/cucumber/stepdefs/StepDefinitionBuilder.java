package cucumber.stepdefs;

import cucumber.reusablesteps.ReusableRunner;
import cucumber.stepdefs.Actions.*;
import org.openqa.selenium.By;
import org.testng.Assert;
import ui.utils.*;
import ui.utils.bpp.TestParametersController;

import java.util.List;

/**
 * This class was created to provide easy way of creating step definitions for cucumber.
 *
 * @author Ruslan Levytskyi
 */
public class StepDefinitionBuilder extends SeleniumHelper {

    private final SeleniumHelper seleniumHelper = new SeleniumHelper();
    private Conditions conditions = new Conditions();

    private By locator; //locator of element (if it`s needed)
    private boolean condition = true; //condition to decide whether step will be executed or skipped with no error.
    private String loop = ""; // if set to FOR or UNTIL, step will be executed in corresponding loop.
    private String loopConditionParameter, loopConditionStatement; // condition to quit the loop
    private int loopLimit = 5; //restriction for loop execution number
    private Action action; //mandatory. Make sure that if you want to execute action with locator, you need to specify locator prior the action
    private String reporterLog = ""; //log string that will be passed to html extent report
    private String log = ""; //log string that will be passed to console

    public StepDefinitionBuilder() {

    }

    /**
     * Method to add selenium By locator to the step
     *
     * @param element Locator name string. All simple locators are listed in \src\resources\Locators.json
     */
    public StepDefinitionBuilder setLocator(String element) {
        locator = initElementLocator(element);
        return this;
    }

    /**
     * Method to add selenium 'By' parametrized(special) locator to the step
     * All parametrized(special) locators are listed in \src\resources\SpecialLocators.json
     *
     * @param elementType xpath template, where 'PARAMETER' substring is replaced by elementLocator
     * @param elementLocator parameter for elementType
     */
    public StepDefinitionBuilder setLocator(String elementLocator, String elementType) {
        if(specialLocatorsMap.containsKey(elementType)) {
            String processedLocator = TestParametersController.checkIfSpecialParameter(elementLocator);
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = xpathTemplate.replaceAll("PARAMETER", processedLocator);
            locator = initElementLocator(resultingXpath);
            if(!elementLocator.equals(processedLocator)){
                Reporter.log("<pre>[input test parameter] " + elementLocator + "' -> '" + processedLocator + "' [output value]</pre>");
            }
        } else {
            Reporter.fail("No such locator template key");
        }
        return this;
    }

    /**
     * Method to add condition to the step
     * All conditions could be found in \src\main\java\ui\utils\Conditions.java
     *
     * @param conditionParameter subject of the condition. Can be a locator or EC_ variable
     * @param conditionStatement condition statement for given parameter. For example: 'Submit Button (parameter)' 'should be present (statement)'
     */
    public StepDefinitionBuilder setCondition(String conditionParameter, String conditionStatement) {
        conditionParameter = TestParametersController.checkIfSpecialParameter(conditionParameter);
        if(!conditions.checkCondition(conditionStatement,conditionParameter)){
            condition = false;
            Reporter.log("Condition " + conditionParameter + " " + conditionStatement + " is not true");
        }
        return this;
    }


    /**
     * Method to specify if the step should be executed repeatedly in loop.
     * All conditions could be found in \src\main\java\ui\utils\Conditions.java
     *
     * @param type type of loop you want the step to be executed in. For example: for, until
     * @param conditionParameter subject of the condition. Can be a locator or EC_ variable
     * @param conditionStatement condition statement for given parameter. For example: 'Submit Button (parameter)' 'should be present (statement)'
     */
    public StepDefinitionBuilder setLoop(String type, String conditionParameter, String conditionStatement) {
        loopConditionParameter = conditionParameter;
        loopConditionStatement = conditionStatement;
        loop = type;
        return this;
    }

    /**
     * Method to specify the limit for step execution number in loop. 5 by default.
     *
     * @param limit
     */
    public StepDefinitionBuilder setLoopLimit(String limit) {
        loopLimit = Integer.parseInt(limit);
        return this;
    }

    /**
     * Method to specify action which the step will perform. Mandatory.
     * Depending on type and number of parameters different overloads of this method will be executed
     * All available actions cn be found under \src\test\java\cucumber\stepdefs\Actions directory
     *
     * Make sure to specify locator(if applicable) prior to action
     * All simple locators are listed in \src\resources\Locators.json
     * All parametrized(special) locators are listed in \src\resources\SpecialLocators.json
     *
     * @param actionName name of action to be performed. Taken from ActionsWithParameter.enum
     * @param param string parameter. Depending on action can be: time to wait in seconds, reusable name, url e.t.c
     */
    public StepDefinitionBuilder setAction(ActionsWithParameter actionName, String param) {
        String parameter = TestParametersController.checkIfSpecialParameter(param);
        Reporter.log("<pre>[input test parameter] " + param + "' -> '" + parameter + "' [output value]</pre>");
        switch (actionName) {
            case WAIT:
                action = () -> sleepFor(Integer.parseInt(parameter) * 1000);
                break;
            case EXECUTE_REUSABLE:
                action = () -> ReusableRunner.getInstance().executeReusable(parameter);
                break;
            case GO_TO_URL:
                action = () -> {
                    driver().get(parameter);
                    waitForPageToLoad();
                };
                break;
            case VALIDATE_PAGE_TITLE:
                action = () -> driver().get(parameter);
                break;
        }
        return this;
    }

    /**
     * Method to specify action which the step will perform. Mandatory.
     * Depending on type and number of parameters different overloads of this method will be executed
     * All available actions cn be found under \src\test\java\cucumber\stepdefs\Actions directory
     *
     * @param actionName name of action to be performed. Taken from ActionsWithParameterAndTable.enum
     * @param param string parameter. Depending on action can be: reusable name
     * @param table table underneath the step, which can contain modified steps of reusable, or steps to be executed in loop
     */
    public StepDefinitionBuilder setAction(ActionsWithParameterAndTable actionName, String param, List table) {
        String parameter = TestParametersController.checkIfSpecialParameter(param);
        Reporter.log("<pre>[input test parameter] " + param + "' -> '" + parameter + "' [output value]</pre>");
        switch (actionName) {
            case EXECUTE_MODIFIED_REUSABLE:
                action = () -> ReusableRunner.getInstance().executeReusableModified(parameter,table);
                break;
            case FOR_EACH:
                action = () -> ReusableRunner.getInstance().executeReusable(parameter);
                break;
        }
        return this;
    }

    /**
     * Method to specify action which the step will perform. Mandatory.
     * Depending on type and number of parameters different overloads of this method will be executed
     * All available actions cn be found under \src\test\java\cucumber\stepdefs\Actions directory
     *
     * Make sure to specify locator(if applicable) prior to action
     * All simple locators are listed in \src\resources\Locators.json
     * All parametrized(special) locators are listed in \src\resources\SpecialLocators.json
     *
     * @param actionName name of action to be performed. Taken from ActionsWithLocator.enum
     */
    public StepDefinitionBuilder setAction(ActionsWithLocator actionName) {
        switch (actionName) {
            case CLICK:
                action = () -> clickOnElement(locator,
                        UiHandlers.PF_SPINNER_HANDLER,
                        UiHandlers.ACCEPT_ALERT,
                        UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                        UiHandlers.PF_SCROLL_HANDLER,
                        UiHandlers.PAGE_NOT_LOAD_HANDLER,
                        UiHandlers.SF_CLICK_HANDLER,
                        UiHandlers.WAIT_HANDLER,
                        UiHandlers.PF_PREMATURE_MENU_CLICK_HANDLER,
                        UiHandlers.DEFAULT_HANDLER);
                break;
            case DOUBLE_CLICK:
                action = () -> doubleClick(locator,
                        UiHandlers.PF_SPINNER_HANDLER,
                        UiHandlers.ACCEPT_ALERT,
                        UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                        UiHandlers.PF_SCROLL_HANDLER,
                        UiHandlers.PAGE_NOT_LOAD_HANDLER,
                        UiHandlers.SF_CLICK_HANDLER,
                        UiHandlers.WAIT_HANDLER,
                        UiHandlers.DEFAULT_HANDLER);
                break;
            case RIGHT_CLICK:
                action = () -> rightMouseClick(locator);
                break;
            case CLICK_WITH_JS:
                action = () -> clickWithJS(locator);
                break;
            case HOVER:
                action = () -> hoverItem(locator);
                break;
            case PRESENT:
                action = () -> Assert.assertTrue(seleniumHelper.isElementPresentAndDisplay(locator));
                break;
            case ABSENT:
                action = () -> Assert.assertFalse(seleniumHelper.isElementPresentAndDisplay(locator));
                break;
        }
        return this;
    }

    /**
     * Method to specify action which the step will perform. Mandatory.
     * Depending on type and number of parameters different overloads of this method will be executed
     * All available actions cn be found under \src\test\java\cucumber\stepdefs\Actions directory
     *
     * Make sure to specify locator(if applicable) prior to action
     * All simple locators are listed in \src\resources\Locators.json
     * All parametrized(special) locators are listed in \src\resources\SpecialLocators.json
     *
     * @param actionName name of action to be performed. Taken from ActionsWithLocator.enum
     */
    public StepDefinitionBuilder setAction(ActionsWithLocatorAndParameter actionName, String param) {
        String parameter = TestParametersController.checkIfSpecialParameter(param);
        Reporter.log("<pre>[input test parameter] " + param + "' -> '" + parameter + "' [output value]</pre>");
        switch (actionName) {
            case SET_TEXT:
                action = () -> setText(locator, parameter);
                break;
            case SET_TEXT_WITH_JS:
                action = () -> setText(locator, parameter);
                break;
            case NUMBER_OF_ELEMENTS_PRESENT:
                action = () -> {
                    int actualNumberOfElements = numberOfElements(locator);
                    if (parameter.contains("more than")) {
                        BPPLogManager.getLogger().info("Expected quantity of elements is more than " + parameter + ", but found " + actualNumberOfElements);
                        Assert.assertTrue(actualNumberOfElements > Integer.parseInt(parameter.substring(10)));
                    } else if (parameter.contains("less than")) {
                        BPPLogManager.getLogger().info("Expected quantity of elements is less than " + parameter + ", but found " + actualNumberOfElements);
                        Assert.assertTrue(actualNumberOfElements < Integer.parseInt(parameter.substring(10)));
                    } else {
                        BPPLogManager.getLogger().info("Expected quantity of elements is: " + parameter + ", but found " + actualNumberOfElements);
                        Assert.assertTrue(parameter.equals(String.valueOf(actualNumberOfElements)));
                    }
                };
                break;
            case EXECUTE_JS:
                action = () -> executeJSCodeForElement(locator,parameter);
                break;
        }
        return this;
    }

    /**
     * Method to set both console and reporter logs
     */
    public StepDefinitionBuilder setReporterLog(String message) {
        reporterLog = message;
        return this;
    }

    /**
     * Method to set console log
     */
    public StepDefinitionBuilder setLog(String message) {
        log = message;
        return this;
    }

    /**
     * Method to set reporter log
     */
    public StepDefinitionBuilder setMessage(String message) {
        log = message;
        reporterLog = message;
        return this;
    }

    /**
     * This method is a final step of building process. Executes step with previously set parameters.
     * Should be executed at the end of set-methods chain.
     *
     */
    public void execute() {
        if(condition){ //
            if (!reporterLog.equals("")) Reporter.log(reporterLog);   //set reporter log if provided
            if (!log.equals("")) BPPLogManager.getLogger().info(log); //set console log if provided
            switch (loop) { //if any loop name is provided(for,until) executes step in corresponding loop
                case "until":
                    for (int i = 1; i < loopLimit && !conditions.checkCondition(loopConditionStatement,loopConditionParameter); i++) {
                        action.execute();
                    }
                    break;
                case "for":
                    for (int i = 1; i < loopLimit && conditions.checkCondition(loopConditionStatement,loopConditionParameter); i++) {
                        action.execute();
                    }
                    break;
                default: // if no loop name is provided, execute step as it is
                    action.execute();
                    break;
            }
        }
    }
}
