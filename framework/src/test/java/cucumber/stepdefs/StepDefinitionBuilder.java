package cucumber.stepdefs;

import cucumber.reusablesteps.ReusableRunner;
import cucumber.stepdefs.Actions.ActionsWithLocator;
import cucumber.stepdefs.Actions.ActionsWithLocatorAndParameter;
import cucumber.stepdefs.Actions.ActionsWithParameter;
import cucumber.stepdefs.Actions.ActionsWithParameterAndTable;
import org.openqa.selenium.By;
import org.testng.Assert;
import ui.utils.*;
import ui.utils.bpp.TestParametersController;

import java.util.List;

public class StepDefinitionBuilder extends SeleniumHelper {
    //todo: replace strings in switch-cases with enums

    private final SeleniumHelper seleniumHelper = new SeleniumHelper();
    private Conditions conditions = new Conditions();

    private By locator;
    private boolean condition = true;
    private String loop = "";
    private String loopConditionParameter, loopConditionStatement;
    private int loopLimit = 5;
    private Action action;
    private String reporterLog = "";
    private String log = "";

    public StepDefinitionBuilder() {

    }

    public StepDefinitionBuilder setLocator(String element) {
        locator = initElementLocator(element);
        return this;
    }

    public StepDefinitionBuilder setCondition(String conditionParameter, String conditionStatement) {
        conditionParameter = TestParametersController.checkIfSpecialParameter(conditionParameter);
        if(!conditions.checkCondition(conditionStatement,conditionParameter)){
            condition = false;
            Reporter.log("Condition " + conditionParameter + " " + conditionStatement + " is not true");
        }
        return this;
    }

    public StepDefinitionBuilder setLoop(String type, String conditionParameter, String conditionStatement) {
        loopConditionParameter = conditionParameter;
        loopConditionStatement = conditionStatement;
        loop = type;
        return this;
    }

    public StepDefinitionBuilder setLoopLimit(String type) {
        loop = type;
        return this;
    }

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

    //todo: create one method for setting reporter and logger messages
    public StepDefinitionBuilder setReporterLog(String message) {
        reporterLog = message;
        return this;
    }

    public StepDefinitionBuilder setLog(String message) {
        log = message;
        return this;
    }

    public StepDefinitionBuilder setMessage(String message) {
        log = message;
        reporterLog = message;
        return this;
    }

    public void execute() {
        if(condition){
            Reporter.log(reporterLog);
            BPPLogManager.getLogger().info(log);
            switch (loop) {
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
                default:
                    action.execute();
                    break;
            }
        }
    }
}
