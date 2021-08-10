package cucumber.stepdefs;

import cucumber.reusablesteps.ReusableRunner;
import org.openqa.selenium.By;
import org.testng.Assert;
import ui.utils.*;
import ui.utils.bpp.TestParametersController;

public class StepDefinition extends SeleniumHelper {

    private SeleniumHelper seleniumHelper = new SeleniumHelper();

    private By locator;
    private boolean condition = true;
    private Action action;
    private String reporterLog;
    private String log;

    public StepDefinition() {

    }

    public void setLocator(String element) {
        locator = initElementLocator(element);
    }

    public void setCondition(String conditionParameter, String conditionStatement) {
        Conditions conditions = new Conditions();
        if(!conditions.checkCondition(conditionStatement,conditionParameter)){
            condition = false;
            Reporter.log("Condition " + conditionParameter + " " + conditionStatement + " is not true");
        }
    }

    public void setLocator(String elementLocator, String elementType) {
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
    }

    public void setAction(String actionName, String parameter) {
        switch (actionName) {
            case "wait":
                action = () -> sleepFor(Integer.parseInt(parameter));
                break;
            case "execute reusable":
                action = () -> ReusableRunner.getInstance().executeReusable(parameter);
                break;
        }
    }

    public void setActionWithLocator(String actionName) {
        switch (actionName) {
            case "click":
                action = () -> clickOnElement(locator);
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
    }

    public void setActionWithLocatorAndString(String actionName, String parameter) {
        switch (actionName) {
            case "set text":
                action = () -> setText(locator, parameter);
                break;
            case "hover":
                action = () -> hoverItem(locator);
                break;
        }
    }

    public void setReporterLog(String message) {
        reporterLog = message;
    }

    public void setLog(String message) {
        log = message;
    }

    public void execute() {
        if(condition){
            Reporter.log(reporterLog);
            BPPLogManager.getLogger().info(log);
            action.execute();
        }
    }
}
