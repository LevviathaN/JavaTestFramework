package cucumber.stepdefs;

import cucumber.reusablesteps.ReusableRunner;
import org.openqa.selenium.By;
import org.testng.Assert;
import ui.utils.*;
import ui.utils.bpp.TestParametersController;

public class StepDefinitionBuilder extends SeleniumHelper {

    private final SeleniumHelper seleniumHelper = new SeleniumHelper();

    private By locator;
    private boolean condition = true;
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
        Conditions conditions = new Conditions();
        if(!conditions.checkCondition(conditionStatement,conditionParameter)){
            condition = false;
            Reporter.log("Condition " + conditionParameter + " " + conditionStatement + " is not true");
        }
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
                action = () -> doubleClick(locator);
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
            case "hover":
                action = () -> hoverItem(locator);
                break;
        }
        return this;
    }

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
            action.execute();
        }
    }
}
