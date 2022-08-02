package cucumber.stepdefs;

import cucumber.reusablesteps.ReusableRunner;
import cucumber.stepdefs.Actions.*;
import enums.ProjectRelated.ProjectRelatedScales;
import org.hamcrest.Matchers;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.testng.Assert;
import ui.utils.*;
import ui.utils.bpp.ExecutionContextHandler;
import ui.utils.bpp.PreProcessFiles;
import ui.utils.bpp.TestParametersController;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;

import static com.jcabi.matchers.RegexMatchers.matchesPattern;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;

/**
 * This class was created to provide easy way of creating step definitions for cucumber.
 *
 * @author Ruslan Levytskyi
 */
public class StepDefinitionBuilder extends SeleniumHelper {

    private final SeleniumHelper seleniumHelper = new SeleniumHelper();
    private Conditions conditions = new Conditions();

    private String locatorNameString; //locator name string. Needed for FOR_EACH action
    private String locatorNameStringParameter; //parameter(s) of parametrized locators. Needed for FOR_EACH action
    private String locatorXpathString; //locator xpath value string.
    private By locator; //locator of element (if it`s needed) as Selenium.By object
    private By secondLocator; //additional locator. Needed for DragAndDrop
    private boolean condition = true; //condition to decide whether step will be executed or skipped with no error.
    private String loop = ""; // if set to FOR or UNTIL, step will be executed in corresponding loop.
    private String loopConditionParameter, loopConditionStatement; // condition to quit the loop
    private int loopLimit = 5; //restriction for loop execution number
    private Action action; //mandatory. Make sure that if you want to execute action with locator, you need to specify locator prior the action
    private String reporterLog = ""; //log string that will be passed to html extent report
    private String log = ""; //log string that will be passed to console
    private String failLog = "";

    public StepDefinitionBuilder() {

    }

    /**
     * Method to add selenium By locator to the step
     *
     * @param element Locator name string. All simple locators are listed in \src\resources\Locators.json
     */
    public StepDefinitionBuilder setLocator(String element) {
        locatorNameString = element;
        locator = initElementLocator(element);
        locatorXpathString = "xpath=" + locator.toString().substring(10); //todo: will not work if given locator is not xpath
        return this;
    }

    /**
     * Method to add second selenium By locator to the step
     *
     * @param element Locator name string. All simple locators are listed in \src\resources\Locators.json
     */
    public StepDefinitionBuilder setAnotherLocator(String element) {
        secondLocator = initElementLocator(element);
        return this;
    }

    /**
     * Method to add selenium 'By' parametrized(special) locator to the step
     * All parametrized(special) locators are listed in /src/resources/SpecialLocators.json
     *
     * @param elementType xpath template, where 'PARAMETER' substring is replaced by elementLocator
     * @param elementLocator parameter for elementType
     */
    public StepDefinitionBuilder setLocator(String elementLocator, String elementType) {
        if(specialLocatorsMap.containsKey(elementType)) {
            locatorNameString = elementType;
            locatorNameStringParameter = elementLocator;
            String processedLocator = TestParametersController.checkIfSpecialParameter(elementLocator);
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = locatorXpathString = xpathTemplate.replaceAll("PARAMETER", processedLocator);
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
     * Method to add second selenium 'By' parametrized(special) locator to the step
     * All parametrized(special) locators are listed in /src/resources/SpecialLocators.json
     *
     * @param elementType xpath template, where 'PARAMETER' substring is replaced by elementLocator
     * @param elementLocator parameter for elementType
     */
    public StepDefinitionBuilder setAnotherLocator(String elementLocator, String elementType) {
        if(specialLocatorsMap.containsKey(elementType)) {
            String processedLocator = TestParametersController.checkIfSpecialParameter(elementLocator);
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath = locatorXpathString = xpathTemplate.replaceAll("PARAMETER", processedLocator);
            secondLocator = initElementLocator(resultingXpath);
            if(!elementLocator.equals(processedLocator)){
                Reporter.log("<pre>[input test parameter] " + elementLocator + "' -> '" + processedLocator + "' [output value]</pre>");
            }
        } else {
            Reporter.fail("No such locator template key");
        }
        return this;
    }

    /**
     * Method to append a locator to existing one, so that complex relative locators can be created
     *
     * @param element Locator name string. All simple locators are listed in \src\resources\Locators.json
     */
    public StepDefinitionBuilder appendLocator(String element) {
        locatorXpathString = locatorXpathString + initElementLocator(element).toString().substring(10); //todo: will not work if given locator is not xpath
        locator = initElementLocator(locatorXpathString);
        return this;
    }

    /**
     * Method to append a parametrized locator to existing one, so that complex relative locators can be created
     * All parametrized(special) locators are listed in /src/resources/SpecialLocators.json
     *
     * @param elementType xpath template, where 'PARAMETER' substring is replaced by elementLocator
     * @param elementLocator parameter for elementType
     */
    public StepDefinitionBuilder appendLocator(String elementLocator, String elementType) {
        if(specialLocatorsMap.containsKey(elementType)) {
            String processedLocator = TestParametersController.checkIfSpecialParameter(elementLocator);
            String xpathTemplate = specialLocatorsMap.get(elementType);
            String resultingXpath  = xpathTemplate.replaceAll("PARAMETER", processedLocator);
            locatorXpathString = locatorXpathString + resultingXpath.substring(6);
            locator = initElementLocator(locatorXpathString);
            if(!elementLocator.equals(processedLocator)){
                Reporter.log("<pre>[input test parameter] " + elementLocator + "' -> '" + processedLocator + "' [output value]</pre>");
            }
        } else {
            Reporter.fail("No such locator template key");
        }
        return this;
    }

    /**
     * Method to specify element by index if an array of elements was found by given locator
     *
     * @param index index to select element
     */
    public StepDefinitionBuilder setItemIndex(String index) {
        locatorXpathString = locatorXpathString.replace("xpath=","xpath=(") + ")[" + TestParametersController.checkIfSpecialParameter(index) + "]";
        locator = initElementLocator(locatorXpathString);
        return this;
    }

    /**
     * Method to add condition to the step
     * All conditions could be found in /src/main/java/ui/utils/Conditions.java
     *
     * @param conditionParameter subject of the condition. Can be a locator or EC_ variable
     * @param conditionStatement condition statement for given parameter. For example: 'Submit Button (parameter)' 'should be present (statement)'
     */
    public StepDefinitionBuilder setCondition(String conditionParameter, String conditionStatement) {
        //todo: check condition right before execution (in execute() method, instead of setCondition())
        conditionParameter = TestParametersController.checkIfSpecialParameter(conditionParameter);
        if(!conditions.checkCondition(conditionStatement,conditionParameter)){
            condition = false;
            Reporter.log("Condition " + conditionParameter + " " + conditionStatement + " is not true");
        }
        return this;
    }


    /**
     * Method to specify if the step should be executed repeatedly in loop.
     * All conditions could be found in /src/main/java/ui/utils/Conditions.java
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
     * All available actions cn be found under /src/test/java/cucumber/stepdefs/Actions directory
     *
     * Make sure to specify locator(if applicable) prior to action
     * All simple locators are listed in /src/resources/Locators.json
     * All parametrized(special) locators are listed in /src/resources/SpecialLocators.json
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
            case EXECUTE_BROWSER_NAVIGATION_COMMAND:
                action = () -> {
                    String browserOperation = parameter.toUpperCase();
                    switch (browserOperation) {
                        case "FORWARD":
                            driver().navigate().forward();
                            break;
                        case "BACK":
                            driver().navigate().back();
                            break;
                        case "REFRESH":
                            driver().navigate().refresh();
                            break;
                        case "DELETE_COOKIES":
                            driver().manage().deleteAllCookies();
                            break;
                        default:
                            setLog("No navigation operation performed. Check spelling for page navigation parameter. " +
                                    "Only 'Forward', 'Back', and 'Refresh' are supported.");
                            break;
                    }
                };
                break;
            case SWITCH_TO_WINDOW_BY_INDEX:
                action = () -> {
                    if (parameter.length() > 0) {
                        int index = Integer.parseInt(parameter.substring(0, 1));
                        switchToWindowByIndex(index);
                    } else {
                        Reporter.log("REQUIRED 'WINDOW INDEX' PARAMETER IS MISSED");
                    }
                };
                break;
            case EXECUTE_JS_CODE:
                action = () -> executeJSCode(param);;
                break;
        }
        return this;
    }

    /**
     * Method to specify action which the step will perform. Mandatory.
     * Depending on type and number of parameters different overloads of this method will be executed
     * All available actions cn be found under /src/test/java/cucumber/stepdefs/Actions directory
     *
     * Make sure to specify locator(if applicable) prior to action
     * All simple locators are listed in /src/resources/Locators.json
     * All parametrized(special) locators are listed in /src/resources/SpecialLocators.json
     *
     * @param actionName name of action to be performed. Taken from ActionsWithTwoParameters.enum
     * @param param1, param2 - string parameter. Depending on action can be: time to wait in seconds, reusable name, url e.t.c
     */
    public StepDefinitionBuilder setAction(ActionsWithTwoParameters actionName, String param1, String param2) {
        //todo: triggers a warning message 'EC not found' when REMEMBER_TEXT action is executed, due to this parameter is EC
        //todo: checking if special parameter should be refactored
        switch (actionName) {
            case REMEMBER_TEXT:
                String parameter1Rem = TestParametersController.checkIfSpecialParameter(param1);
                Reporter.log("<pre>[input test parameter] " + param1 + "' -> '" + parameter1Rem + "' [output value]</pre>");
                action = () -> ExecutionContextHandler.setExecutionContextValueByKey(param2, parameter1Rem);
                break;
            case SCROLL:
                action = () -> {
                    String parameter1 = TestParametersController.checkIfSpecialParameter(param1);
                    Reporter.log("<pre>[input test parameter] " + param1 + "' -> '" + parameter1 + "' [output value]</pre>");
                    String parameter2 = TestParametersController.checkIfSpecialParameter(param2);
                    Reporter.log("<pre>[input test parameter] " + param2 + "' -> '" + parameter2 + "' [output value]</pre>");
                    String xAxis, yAxis = "0";
                    xAxis = parameter1.equals("right") ? "document.body.scrollLeft" : parameter1.equals("left") ? "0" : parameter1;
                    yAxis = parameter2.equals("bottom") ? "document.body.scrollHigh" : parameter2.equals("top") ? "0" : parameter2;
                    executeJSCode("window.scrollBy(" + xAxis + ", " + yAxis +")");
                };
                break;
            case RETURN_REQUEST_WITH_JS:
                action = () -> {
                    JavascriptExecutor js = (JavascriptExecutor)  SeleniumHelper.driver();
                    String value = (String) js.executeScript(param1);

                    JSONParser parser = new JSONParser();
                    JSONObject json = null;
                    try {
                        json = (JSONObject) parser.parse(value);
                    } catch (org.json.simple.parser.ParseException e) {
                        e.printStackTrace();
                    }
                    String accessToken = (String) json.get("accessToken");

                    ExecutionContextHandler.setExecutionContextValueByKey(param2,accessToken);

                    BPPLogManager.getLogger().info("Saving " + param2 + " with parameter: " + accessToken);
                    Reporter.log("Saving " + param2 + " with parameter: " + accessToken);
                };
                break;
            case COUNTER:
                action = () -> {
                    int counter;
                    if (param2.equals("increment")) {
                        if (ExecutionContextHandler.getAllValues().containsKey(param1)) {
                            counter = Integer.parseInt(ExecutionContextHandler.getExecutionContextValueByKey(param1)) + 1;
                            ExecutionContextHandler.setExecutionContextValueByKey(param1, String.valueOf(counter));
                        } else {
                            ExecutionContextHandler.setExecutionContextValueByKey(param1, "1");
                        }
                    } else if (param2.equals("decrement")) {
                        if (ExecutionContextHandler.getAllValues().containsKey(param1)) {
                            counter = Integer.parseInt(ExecutionContextHandler.getExecutionContextValueByKey(param1)) - 1;
                            ExecutionContextHandler.setExecutionContextValueByKey(param1, String.valueOf(counter));
                        } else {
                            ExecutionContextHandler.setExecutionContextValueByKey(param1, "-1");
                        }
                    } else if (param2.equals("reset")) {
                        ExecutionContextHandler.setExecutionContextValueByKey(param1, "1");
                    }
                };
                break;
        }
        return this;
    }

    /**
     * Method to specify action which the step will perform. Mandatory.
     * Depending on type and number of parameters different overloads of this method will be executed
     * All available actions cn be found under /src/test/java/cucumber/stepdefs/Actions directory
     *
     * Make sure to specify locator(if applicable) prior to action
     * All simple locators are listed in /src/resources/Locators.json
     * All parametrized(special) locators are listed in /src/resources/SpecialLocators.json
     *
     * @param actionName name of action to be performed. Taken from ActionsWithTwoParameters.enum
     * @param param1, param2 - string parameter. Depending on action can be: time to wait in seconds, reusable name, url e.t.c
     */
    public StepDefinitionBuilder setAction(ActionsWithThreeParameters actionName, String param1, String param2, String param3) {
        String parameter1 = TestParametersController.checkIfSpecialParameter(param1);
        String parameter2 = TestParametersController.checkIfSpecialParameter(param2);
        String parameter3 = TestParametersController.checkIfSpecialParameter(param3);
        Reporter.log("<pre>[input test parameter] " + param1 + "' -> '" + parameter1 + "' [output value]</pre>");
        Reporter.log("<pre>[input test parameter] " + param2 + "' -> '" + parameter2 + "' [output value]</pre>");
        Reporter.log("<pre>[input test parameter] " + param3 + "' -> '" + parameter3 + "' [output value]</pre>");

        switch (actionName) {
            case VALIDATE_VALUE_RELATION:
                action = () -> {
                    boolean result = false;
                    BinaryOperation<Float,Float,Boolean> comparator;
                    switch (param2) {
                        case "equal to":
                            comparator = (x,y) -> x==y;
                            break;
                        case "more than":
                            comparator = (x,y) -> x>y;
                            break;
                        case "less than":
                            comparator = (x,y) -> x<y;
                            break;
                        case "more or equal to":
                            comparator = (x,y) -> x>=y;
                            break;
                        case "less or equal to":
                            comparator = (x,y) -> x<=y;
                            break;
                        default:
                            comparator = (x,y) -> x==y;
                            break;
                    }
                    String scaleName = param3.split("\\.")[0];
                    String scaleValue = param3.split("\\.")[1];
                    if (!Tools.isNumeric(parameter1) && (ProjectRelatedScales.scalesMap.containsKey(scaleName))) {
                        int value1 = ProjectRelatedScales.scalesMap.get(scaleName).indexOf(parameter1.toUpperCase());
                        int value2 = ProjectRelatedScales.scalesMap.get(scaleName).indexOf(scaleValue);
                        result = comparator.calculate((float) value1, (float) value2);
                    }else if (Tools.isNumeric(parameter1) && Tools.isNumeric(parameter3)) {
                        result = comparator.calculate(Float.parseFloat(parameter1),Float.parseFloat(parameter2));
                    } else {
                        Reporter.log("not comparable values");
                    }
                    Assert.assertTrue(result);
                };
                break;
        }
        return this;
    }

    /**
     * Method to specify action which the step will perform. Mandatory.
     * Depending on type and number of parameters different overloads of this method will be executed
     * All available actions cn be found under /src/test/java/cucumber/stepdefs/Actions directory
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
            case EXECUTE_FOR_EACH_CSV_ENTRY:
                action = () -> {
                    //get table from csv file
                    List<List<String>> records = FileIO.parseCsvAsList(PreProcessFiles.ROOT_FOLDER_PATH + "/src/test/resources/csv/" + parameter + ".csv", "\\|");
                    //get header of the table
                    List<String> header = records.get(0);
                    records.remove(0);
                    for(List<String> row : records) {
                        //BPPLogManager.getLogger().info("For " + i + " element");
                        for(Object stepObj : table) {
                            String step = stepObj.toString();
                            BPPLogManager.getLogger().info("Executing: " + step);
                            //replace all table entries with values from table
                            for (String headerEntry : header) {
                                step = step.replace("<"+headerEntry+">",row.get(header.indexOf(headerEntry)));
                            }
                            //execute step
                            ReusableRunner.getInstance().executeStep(step);
                        }
                    }
                };
                break;
        }
        return this;
    }

    /**
     * Method to specify action which the step will perform. Mandatory.
     * Depending on type and number of parameters different overloads of this method will be executed
     * All available actions cn be found under /src/test/java/cucumber/stepdefs/Actions directory
     *
     * @param actionName name of action to be performed. Taken from ActionsWithTwoLocators.enum
     */
    public StepDefinitionBuilder setAction(ActionsWithTwoLocators actionName) {
        switch (actionName) {
            case DRAG_AND_DROP:
                action = () -> dragAndDrop(locator,secondLocator);
                break;
        }
        return this;
    }

    /**
     * Method to specify action which the step will perform. Mandatory.
     * Depending on type and number of parameters different overloads of this method will be executed
     * All available actions cn be found under /src/test/java/cucumber/stepdefs/Actions directory
     *
     * @param actionName name of action to be performed. Taken from ActionsWithLocatorAndTable.enum
     * @param table table underneath the step, which can contain modified steps of reusable, or steps to be executed in loop
     */
    public StepDefinitionBuilder setAction(ActionsWithLocatorAndTable actionName, List<String> table) {
        switch (actionName) {
            case FOR_EACH:
                action = () -> {
                    if (isElementPresentAndDisplay(locator)) {
                        List<WebElement> elements = findElements(locator);
                        String xpathLocator = "";
                        BPPLogManager.getLogger().info("There are " + elements.size() + " '" + locator + "' elements found on the page");
                        int limit = loopLimit==5 ? elements.size() : loopLimit;
                        for(int i = 1; i <= elements.size(); i++) {
                            BPPLogManager.getLogger().info("For " + i + " element");
                            for(String step : table) {
                                BPPLogManager.getLogger().info("Executing: " + step + " iteration " + i);
                                if (locatorsMap.containsKey(locatorNameString)) {
                                    xpathLocator = locatorsMap.get(locatorNameString).replace("xpath=","xpath=(") + ")[" + i + "]";
                                } else {
                                    xpathLocator = "xpath=(//*[text()='" + TestParametersController.checkIfSpecialParameter(locatorNameString) + "'])[" + i + "]";
                                }
                                step = step.replace("FOR_ITEM",xpathLocator);
                                step = step.replace("FOR_COUNTER",String.valueOf(i + 1));
                                ReusableRunner.getInstance().executeStep(step);
                            }
                        }
                    } else {
                        Reporter.log("Element '" + locatorNameString + "' not found");
                        BPPLogManager.getLogger().info("Element '" + locatorNameString + "' not found");
                    }
                };
                break;
        }
        return this;
    }

    /**
     * Method to specify action which the step will perform. Mandatory.
     * Depending on type and number of parameters different overloads of this method will be executed
     * All available actions cn be found under /src/test/java/cucumber/stepdefs/Actions directory
     *
     * @param actionName name of action to be performed. Taken from ActionsWithLocatorAndTable.enum
     * @param table table underneath the step, which can contain modified steps of reusable, or steps to be executed in loop
     */
    public StepDefinitionBuilder setAction(ActionsWithTable actionName, List<String> table) {
        switch (actionName) {
            case EXECUTE_STEPS:
                action = () -> {
                    for(String step : table) {
                        ReusableRunner.getInstance().executeStep(step);
                    }
                };
                break;
            case EXECUTE_REUSABLES:
                action = () -> {
                    for(String reusable : table) {
                        ReusableRunner.getInstance().executeReusable(reusable);
                    }
                };
                break;
        }
        return this;
    }

    /**
     * Method to specify action which the step will perform. Mandatory.
     * Depending on type and number of parameters different overloads of this method will be executed
     * All available actions cn be found under /src/test/java/cucumber/stepdefs/Actions directory
     *
     * Make sure to specify locator(if applicable) prior to action
     * All simple locators are listed in /src/resources/Locators.json
     * All parametrized(special) locators are listed in /src/resources/SpecialLocators.json
     *
     * @param actionName name of action to be performed. Taken from ActionsWithLocator.enum
     */
    public StepDefinitionBuilder setAction(ActionsWithLocator actionName) {
        switch (actionName) {
            case CLICK:
                action = () -> clickOnElement(locator,
                        UiHandlers.PF_SPINNER_HANDLER,
                        UiHandlers.POPUP_HANDLER,
                        UiHandlers.ACCEPT_ALERT,
                        UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                        UiHandlers.PF_SCROLL_HANDLER,
                        UiHandlers.PF_SCROLL_UP_HANDLER,
                        UiHandlers.PAGE_NOT_LOAD_HANDLER,
                        UiHandlers.SF_CLICK_HANDLER,
                        UiHandlers.WAIT_HANDLER,
                        UiHandlers.PF_PREMATURE_MENU_CLICK_HANDLER,
                        UiHandlers.DEFAULT_HANDLER);
                break;
            case CLICK_IF_PRESENT:
                action = () -> {
                    if (seleniumHelper.isElementPresentAndDisplay(locator)) {
                        clickOnElement(locator,
                                UiHandlers.PF_SPINNER_HANDLER,
                                UiHandlers.POPUP_HANDLER,
                                UiHandlers.ACCEPT_ALERT,
                                UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                                UiHandlers.PF_SCROLL_HANDLER,
                                UiHandlers.PAGE_NOT_LOAD_HANDLER,
                                UiHandlers.SF_CLICK_HANDLER,
                                UiHandlers.WAIT_HANDLER,
                                UiHandlers.PF_PREMATURE_MENU_CLICK_HANDLER,
                                UiHandlers.DEFAULT_HANDLER);
                    }
                };
                break;
            case DOUBLE_CLICK:
                action = () -> doubleClick(locator,
                        UiHandlers.PF_SPINNER_HANDLER,
                        UiHandlers.POPUP_HANDLER,
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
            case OPEN_LINK_IN_NEW_TAB:
                action = () -> {
                    String clicklnk = Keys.chord(Keys.CONTROL, Keys.RETURN);
                    //hoverItem(locator);
                    //String link = getElementAttribute(locator,"href");
                    driver().findElement(locator).sendKeys(clicklnk);
                    switchToWindowByIndex(2);
                    //openInNewTab(locator);
                };
        }
        return this;
    }

    /**
     * Method to specify action which the step will perform. Mandatory.
     * Depending on type and number of parameters different overloads of this method will be executed
     * All available actions cn be found under /src/test/java/cucumber/stepdefs/Actions directory
     *
     * Make sure to specify locator(if applicable) prior to action
     * All simple locators are listed in /src/resources/Locators.json
     * All parametrized(special) locators are listed in /src/resources/SpecialLocators.json
     *
     * @param actionName name of action to be performed. Taken from ActionsWithLocator.enum
     */
    public StepDefinitionBuilder setAction(ActionsWithLocatorAndParameter actionName, String param) {
        //todo: checking if special parameter should be refactored
        //Reporter.log("<pre>[input test parameter] " + param + "' -> '" + parameter + "' [output value]</pre>");
        switch (actionName) {
            case CLICK_BY_ORDER:
                action = () -> {
                    if (isElementPresentAndDisplay(locator)) {
                        List<WebElement> elements = findElements(locator);
                        String xpathLocator = "";
                        BPPLogManager.getLogger().info("There are " + elements.size() + " '" + locator + "' elements found on the page");
                        if (locatorsMap.containsKey(locatorNameString)) {
                            xpathLocator = locatorsMap.get(locatorNameString).replace("xpath=","xpath=(") + ")[" + TestParametersController.checkIfSpecialParameter(param) + "]";
                        } else {
                            xpathLocator = "xpath=(//*[text()='" + TestParametersController.checkIfSpecialParameter(locatorNameString) + "'])[" + TestParametersController.checkIfSpecialParameter(param) + "]";
                        }
                        clickOnElement(initElementLocator(xpathLocator),
                                UiHandlers.PF_SPINNER_HANDLER,
                                UiHandlers.POPUP_HANDLER,
                                UiHandlers.ACCEPT_ALERT,
                                UiHandlers.PF_SCROLL_TO_ELEMENT_HANDLER,
                                UiHandlers.PF_SCROLL_HANDLER,
                                UiHandlers.PF_SCROLL_UP_HANDLER,
                                UiHandlers.PAGE_NOT_LOAD_HANDLER,
                                UiHandlers.SF_CLICK_HANDLER,
                                UiHandlers.WAIT_HANDLER,
                                UiHandlers.PF_PREMATURE_MENU_CLICK_HANDLER,
                                UiHandlers.DEFAULT_HANDLER);
                    } else {
                        Reporter.log("Element '" + locatorNameString + "' not found");
                        BPPLogManager.getLogger().info("Element '" + locatorNameString + "' not found");
                    }
                };
                break;
            case SET_TEXT:
                action = () -> setText(locator, TestParametersController.checkIfSpecialParameter(param));
                break;
            case SET_TEXT_WITH_JS:
                //todo: replace setText with setTextWithJs
                action = () -> setText(locator, TestParametersController.checkIfSpecialParameter(param));
                break;
            case SET_TEXT_FROM_KEYBOARD:
                action = () -> {
                    char[] string = TestParametersController.checkIfSpecialParameter(param).toCharArray();
                    clearEntireField(locator);
                    for (int i=0; i<string.length; i++) {
                        WebElement keyItem = findElement(locator);
                        keyItem.sendKeys(String.valueOf(string[i]));
                    }
                };
                break;
            case NUMBER_OF_ELEMENTS_PRESENT:
                action = () -> {
                    int actualNumberOfElements = numberOfElements(locator);
                    if (TestParametersController.checkIfSpecialParameter(param).contains("more than")) {
                        BPPLogManager.getLogger().info("Expected quantity of elements is more than " + TestParametersController.checkIfSpecialParameter(param) + ", but found " + actualNumberOfElements);
                        Assert.assertTrue(actualNumberOfElements > Integer.parseInt(TestParametersController.checkIfSpecialParameter(param).substring(10)));
                    } else if (TestParametersController.checkIfSpecialParameter(param).contains("less than")) {
                        BPPLogManager.getLogger().info("Expected quantity of elements is less than " + TestParametersController.checkIfSpecialParameter(param) + ", but found " + actualNumberOfElements);
                        Assert.assertTrue(actualNumberOfElements < Integer.parseInt(TestParametersController.checkIfSpecialParameter(param).substring(10)));
                    } else {
                        BPPLogManager.getLogger().info("Expected quantity of elements is: " + TestParametersController.checkIfSpecialParameter(param) + ", but found " + actualNumberOfElements);
                        Assert.assertTrue(TestParametersController.checkIfSpecialParameter(param).equals(String.valueOf(actualNumberOfElements)));
                    }
                };
                break;
            case EXECUTE_JS:
                action = () -> executeJSCodeForElement(locator,param);
                break;
            case CHECK_CHECKBOX:
                action = () -> {
                    boolean state = true;
                    if (TestParametersController.checkIfSpecialParameter(param).equals("check")) {
                        state = true;
                    } else if (TestParametersController.checkIfSpecialParameter(param).equals("uncheck")) {
                        state = false;
                    }
                    checkCheckbox(locator, state);
                };
                break;
            case PRESS_KEYBOARD:
                action = () -> pressKeyFromKeyboard(locator, TestParametersController.checkIfSpecialParameter(param));
                break;
            case UPLOAD_FILE_TO_ELEMENT:
                action = () -> fileUpload(locator, TestParametersController.checkIfSpecialParameter(param));
                break;
            case CAPTURE_ELEMENT_TEXT:
                action = () -> {
                    String value = getTextValueFromField(locator);
                    if (!param.equals("")) {
                        if (value.equals("")) {
                            Reporter.log("Saving EC key " + param + " with an empty string. No application data found.");
                        } else {
                            Reporter.log("Saving EC key " + param + " = " + value);
                        }
                        ExecutionContextHandler.setExecutionContextValueByKey(param, value);
                    } else
                        Reporter.log("Cannot save EC value with an empty key. Check your parameters.");
                };
                break;
            case COUNT_ELEMENTS:
                action = () -> ExecutionContextHandler.setExecutionContextValueByKey(param, String.valueOf(numberOfElements(locator)));
                break;
            case VALIDATE_ELEMENT_TEXT:
                action = () -> {
                    String actualValue = "";
                    Reporter.log("Executing step: I validate " + param + " to be displayed for: " + locatorNameString);
                    if (locatorNameString.equalsIgnoreCase("CHECK_URL")) {
                        actualValue = SeleniumHelper.driver().getCurrentUrl();
                        Reporter.log("Validating URL to match :" + param);
                        assertThat(actualValue, containsString(param));
                    } else {
                        actualValue = getTextValueFromField(locator);
                        String newValue = param.replaceAll("''", "\"");
                        if (param.toUpperCase().trim().startsWith("RE=")) {
                            newValue = newValue.substring("RE=".length());
                            assertThat(actualValue.trim(), matchesPattern(newValue));
                            Reporter.log("<pre>Actual value '" + actualValue + "' matches the pattern " + "'" + newValue + "'</pre>");
                            BPPLogManager.getLogger().info("Actual value '" + actualValue + "' matches the pattern " + "'" + newValue + "'");
                        } else if (param.toUpperCase().startsWith("CONTAINS=")) {
                            newValue = newValue.substring("CONTAINS=".length());
                            if (param.contains("EC")) {
                                String executionContextValue = ExecutionContextHandler.getExecutionContextValueByKey(newValue);
                                assertThat(actualValue.trim().toLowerCase(), Matchers.containsString(executionContextValue.toLowerCase()));
                            } else {
                                assertThat(actualValue.trim(), Matchers.containsString(newValue));
                                Reporter.log("<pre>Actual value '" + actualValue + "' contains the string " + "'" + newValue + "'</pre>");
                                BPPLogManager.getLogger().info("Actual value '" + actualValue + "' contains the string " + "'" + newValue + "'");
                            }
                        } else if (param.toUpperCase().startsWith("NOT_CONTAINS=")) {
                            newValue = newValue.substring("NOT_CONTAINS=".length());
                            if (param.contains("EC")) {
                                String executionContextValue = ExecutionContextHandler.getExecutionContextValueByKey(newValue);
                                assertThat(actualValue.trim(), not(Matchers.containsString(executionContextValue)));
                            } else {
                                assertThat(actualValue.trim(), not(Matchers.containsString(newValue)));
                                Reporter.log("<pre>Actual value '" + actualValue + "' not contains the string " + "'" + newValue + "'</pre>");
                                BPPLogManager.getLogger().info("Actual value '" + actualValue + "' not contains the string " + "'" + newValue + "'");
                            }
                        } else if (param.toUpperCase().startsWith("CASE=")) {
                            newValue = newValue.substring("CASE=".length());
                            assertThat(actualValue.trim(), Matchers.equalTo(newValue));
                            Reporter.log("<pre>Actual value '" + actualValue + "' equals to the case sensitive string " + "'" + newValue + "'</pre>");
                            BPPLogManager.getLogger().info("Actual value '" + actualValue + "' equals to the case sensitive string " + "'" + newValue + "'");
                        } else if (param.toUpperCase().contains("STARTS-WITH=")) {
                            newValue = newValue.substring("STARTS-WITH=".length());
                            assertThat(actualValue.trim(), Matchers.startsWith(newValue));
                            Reporter.log("<pre>Actual value '" + actualValue + "' starts with case sensitive string " + "'" + newValue + "'</pre>");
                            BPPLogManager.getLogger().info("Actual value '" + actualValue + "' starts with case sensitive string " + "'" + newValue + "'");
                        } else if (param.contains("EC_")) {
                            String executionContextValue = ExecutionContextHandler.getExecutionContextValueByKey(newValue);
                            assertThat(actualValue.trim(), Matchers.equalTo(executionContextValue));
                            Reporter.log("<pre>Actual value '" + actualValue + "' equals to " + "'" + newValue + ": " + executionContextValue + "'</pre>");
                            BPPLogManager.getLogger().info("Actual value '" + actualValue + "' equals to " + "'" + newValue + ": " + executionContextValue + "'");
                        } else {
                            assertThat(actualValue.trim(), Matchers.equalToIgnoringWhiteSpace(param));
                            BPPLogManager.getLogger().info("Actual value '" + actualValue + "' equals to the case insensitive string " + "'" + newValue + "'");
                            Reporter.log("<pre>Actual value '" + actualValue + "' equals to the case insensitive string " + "'" + newValue + "'</pre>");
                        }
                    }
                };
                break;
            case VALIDATE_ANY_ELEMENT_TEXT:
                action = () -> {
                    String actualValue = "";
                    Reporter.log("Executing step: I validate " + param + " to be displayed for: " + locatorNameString);
                    List<WebElement> elements = findElements(locator);
                    String newValue = param.replaceAll("''", "\"");

                    if (locatorNameString.equalsIgnoreCase("CHECK_URL")) {
                        actualValue = SeleniumHelper.driver().getCurrentUrl();
                        Reporter.log("Validating URL to match :" + param);
                        assertThat(actualValue, containsString(param));
                    } else {
                        if (param.toUpperCase().startsWith("CONTAINS=")) {
                            newValue = newValue.substring("CONTAINS=".length());
                            if (param.contains("EC")) {
                                String executionContextValue = ExecutionContextHandler.getExecutionContextValueByKey(newValue);
                                assertThat(actualValue.trim().toLowerCase(), Matchers.containsString(executionContextValue.toLowerCase()));
                            } else {
                                assertThat(actualValue.trim(), Matchers.containsString(newValue));
                                Reporter.log("<pre>Actual value '" + actualValue + "' contains the string " + "'" + newValue + "'</pre>");
                                BPPLogManager.getLogger().info("Actual value '" + actualValue + "' contains the string " + "'" + newValue + "'");
                            }
                        } else if (param.toUpperCase().startsWith("NOT_CONTAINS=")) {
                            newValue = newValue.substring("NOT_CONTAINS=".length());
                            if (param.contains("EC")) {
                                String executionContextValue = ExecutionContextHandler.getExecutionContextValueByKey(newValue);
                                assertThat(actualValue.trim(), not(Matchers.containsString(executionContextValue)));
                            } else {
                                assertThat(actualValue.trim(), not(Matchers.containsString(newValue)));
                                Reporter.log("<pre>Actual value '" + actualValue + "' not contains the string " + "'" + newValue + "'</pre>");
                                BPPLogManager.getLogger().info("Actual value '" + actualValue + "' not contains the string " + "'" + newValue + "'");
                            }
                        }
                        boolean textPresentInAnyElement = false;


                        for (WebElement element : elements) {
                            actualValue = element.getText();
                            if (actualValue.equals(newValue)) textPresentInAnyElement = true;
//                            assertThat(actualValue.trim(), Matchers.equalToIgnoringWhiteSpace(param));
                        }
                        Assert.assertTrue(textPresentInAnyElement);
                        BPPLogManager.getLogger().info("Actual value '" + actualValue + "' equals to the case insensitive string " + "'" + newValue + "'");
                        Reporter.log("<pre>Actual value '" + actualValue + "' equals to the case insensitive string " + "'" + newValue + "'</pre>");
                    }
                };
                break;
            case SELECT_FROM_ELEMENT:
                action = () -> {
                    if (param.equals("KW_AUTO_SELECT")) {
                        Reporter.log("Starting random selection from dropdown.");
                        String autoSelectedValue = autoSelectFromDropdown(locator);
                        Reporter.log("Selected \"" + autoSelectedValue + "\" value from " + locatorNameString);
                    } else {
                        Reporter.log("Selecting \"" + param + "\" value from " + locatorNameString);
                        selectValueFromDropDown(locator, TestParametersController.checkIfSpecialParameter(param));
                    }
                };
                break;
        }
        return this;
    }

    /**
     * Method to specify action which the step will perform. Mandatory.
     * Depending on type and number of parameters different overloads of this method will be executed
     * All available actions cn be found under /src/test/java/cucumber/stepdefs/Actions directory
     *
     * Make sure to specify locator(if applicable) prior to action
     * All simple locators are listed in /src/resources/Locators.json
     * All parametrized(special) locators are listed in /src/resources/SpecialLocators.json
     *
     * @param actionName name of action to be performed. Taken from ActionsWithLocatorAndTwoParameters.enum
     */
    public StepDefinitionBuilder setAction(ActionsWithLocatorAndTwoParameters actionName, String param1, String param2) {
        String parameter1 = TestParametersController.checkIfSpecialParameter(param1);
        String parameter2 = TestParametersController.checkIfSpecialParameter(param2);
        Reporter.log("<pre>[input test parameter] " + param1 + "' -> '" + parameter1 + "' [output value]</pre>");
        Reporter.log("<pre>[input test parameter] " + param2 + "' -> '" + parameter2 + "' [output value]</pre>");
        switch (actionName) {
            case VALIDATE_ELEMENT_ATTRIBUTE:
                action = () -> {
                    if (parameter2.toUpperCase().contains("CONTAINS=")) {
                        String attributeValueCropped = parameter2.substring("CONTAINS=".length());
                        if (parameter2.contains("EC_")) {
                            String executionContextValue = TestParametersController.checkIfSpecialParameter(ExecutionContextHandler.getExecutionContextValueByKey(attributeValueCropped));
                            Assert.assertTrue(findElement(locator).getAttribute(parameter1).contains(executionContextValue));
                        }
                    } else if (parameter2.contains("EC_")) {
                        String executionContextValue = TestParametersController.checkIfSpecialParameter(ExecutionContextHandler.getExecutionContextValueByKey(parameter2));
                        Assert.assertTrue(findElement(locator).getAttribute(parameter1).equalsIgnoreCase(executionContextValue));
                    } else {
                        Assert.assertTrue(findElement(locator).getAttribute(parameter1).equalsIgnoreCase(parameter2));
                    }
                };
                break;
            case VALIDATE_ELEMENT_CSS:
                action = () -> {
                    if (parameter2.toUpperCase().contains("CONTAINS=")) {
                        String attributeValueCropped = parameter2.substring("CONTAINS=".length());
                        if (parameter2.contains("EC_")) {
                            String executionContextValue = TestParametersController.checkIfSpecialParameter(ExecutionContextHandler.getExecutionContextValueByKey(attributeValueCropped));
                            Assert.assertTrue(findElement(locator).getCssValue(parameter1).contains(executionContextValue));
                        }
                    } else if (parameter2.contains("EC_")) {
                        String executionContextValue = TestParametersController.checkIfSpecialParameter(ExecutionContextHandler.getExecutionContextValueByKey(parameter2));
                        Assert.assertTrue(findElement(locator).getCssValue(parameter1).equalsIgnoreCase(executionContextValue));
                    } else {
                        Assert.assertTrue(findElement(locator).getCssValue(parameter1).equalsIgnoreCase(parameter2));
                    }
                };
                break;
            case CAPTURE_ELEMENT_ATTRIBUTE:
                action = () -> {
                    String attrValue = findElement(locator).getAttribute(TestParametersController.checkIfSpecialParameter(param1));
                    ExecutionContextHandler.setExecutionContextValueByKey(param2,attrValue);
                };
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
            //todo: add logs to mark iterations if loop is specified
            switch (loop) { //if any loop name is provided(for,until) executes step in corresponding loop
                case "until":
                    for (int i = 1; (i < loopLimit || loopLimit == 0) && !conditions.checkCondition(loopConditionStatement,loopConditionParameter); i++) {
                        action.execute();
                        sleepFor(5000);
                    }
                    break;
                case "for":
                    for (int i = 1; (i < loopLimit || loopLimit == 0) && conditions.checkCondition(loopConditionStatement,loopConditionParameter); i++) {
                        action.execute();
                    }
                    break;
                default: // if no loop name is provided, execute step as it is
                    action.execute();
                    break;
            }
//            waitForPageToLoad();
        }
    }
}
