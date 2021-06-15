package cucumber.stepdefs;

import cucumber.reusablesteps.ReusableRunner;
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
    private String loop, loopConditionParameter, loopConditionStatement;
    private int loopLimit = 5;
    private Action action;
    private String reporterLog;
    private String log;

    public StepDefinitionBuilder() {

    }

    public StepDefinitionBuilder setLocator(String element) {
        locator = initElementLocator(element);
        return this;
    }

    public StepDefinitionBuilder setCondition(String conditionParameter, String conditionStatement) {
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

    public StepDefinitionBuilder setAction(String actionName, String parameter) {
        switch (actionName) {
            case "go to url":
                action = () -> driver().get(parameter);
                break;
            case "execute reusable":
                action = () -> ReusableRunner.getInstance().executeReusable(parameter);
                break;
        }
        return this;
    }

    public StepDefinitionBuilder setActionWithParameter(String actionName, String parameter) {
        switch (actionName) {
            case "wait":
                action = () -> sleepFor(Integer.parseInt(parameter));
                break;
            case "execute reusable":
                action = () -> ReusableRunner.getInstance().executeReusable(parameter);
                break;
            case "go to url":
                action = () -> driver().get(parameter);
                break;
        }
        return this;
    }

    public StepDefinitionBuilder setActionWithTable(String actionName, String parameter, List table) {
        switch (actionName) {
            case "wait":
                action = () -> sleepFor(Integer.parseInt(parameter));
                break;
            case "execute reusable":
                action = () -> ReusableRunner.getInstance().executeReusable(parameter);
                break;
        }
        return this;
    }

    public StepDefinitionBuilder setActionWithLocator(String actionName) {
        switch (actionName) {
            case "click":
                action = () -> clickOnElement(locator,
                        UiHandlers.PF_SCROLL_HANDLER,
                        UiHandlers.ACCEPT_ALERT,
                        UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                        UiHandlers.PAGE_NOT_LOAD_HANDLER,
                        UiHandlers.PF_SPINNER_HANDLER,
                        UiHandlers.PF_PREMATURE_MENU_CLICK_HANDLER,
                        UiHandlers.DEFAULT_HANDLER);
                break;
            case "double click":
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
            case "right click":
                action = () -> rightMouseClick(locator);
                break;
            case "click with js":
                action = () -> clickWithJS(locator);
                break;
            case "hover":
                action = () -> hoverItem(locator);
                break;
            case "present":
                action = () -> Assert.assertTrue(seleniumHelper.isElementPresentAndDisplay(locator));
                break;
            case "absent":
                action = () -> Assert.assertFalse(seleniumHelper.isElementPresentAndDisplay(locator));
                break;
        }
        return this;
    }

    public StepDefinitionBuilder setActionWithLocatorAndString(String actionName, String parameter) {
        switch (actionName) {
            case "set text":
                action = () -> setText(locator, parameter);
                break;
            case "number of elements present":
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
            case "execute js":
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
//            action.execute();
        }
    }
}
