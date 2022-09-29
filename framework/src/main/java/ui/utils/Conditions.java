package ui.utils;

import org.testng.Assert;
import ui.utils.bpp.TestParametersController;

/**
 * @author rlevytskyi
 * <p> Allows to create and check different condisions. Currently is used only in StepDefinitions </p>
 *
 */
public class Conditions extends SeleniumHelper {

    /**
     * Method to check, if given condition is true.
     * @param condition - logical statement to check
     * @param conditionParameter - subject, to which logical statement is applied
     *
     * For example, your condition is "element is present". Then, your conditionParameter will be some element on the page
     * "Bodies element is present", "Save button element is present"
     */
    public boolean checkCondition(String condition, String conditionParameter){
        String elementLocator;
        String elementType;
        String value1 = "", value2 = "";
        int v1 = 0, v2 = 0;
        if (conditionParameter.contains(",")) {
            value1 = TestParametersController.checkIfSpecialParameter(conditionParameter.split(",")[0]);
            value2 = TestParametersController.checkIfSpecialParameter(conditionParameter.split(",")[1]);
            v1 = Integer.parseInt(value1);
            v2 = Integer.parseInt(value2);
        }
        switch (condition) {
            case "element is present":
                return isElementPresentAndDisplay(initElementLocator(conditionParameter));
            case "element is absent":
                return !isElementPresentAndDisplay(initElementLocator(conditionParameter));
            case "EC variable is needed":
                return !conditionParameter.equals(TestParametersController.checkIfSpecialParameter(conditionParameter));
            case "JavaScript is loaded":
                return waitForJavaScriptToRun();
            case "special element is present":
                elementLocator = conditionParameter.split(",")[0];
                elementType = conditionParameter.split(",")[1];
                return isElementPresentAndDisplay(initElementLocator(getSpecialElementXPath(elementLocator,elementType)));
            case "special element is absent":
                elementLocator = conditionParameter.split(",")[0];
                elementType = conditionParameter.split(",")[1];
                return !isElementPresentAndDisplay(initElementLocator(getSpecialElementXPath(elementLocator,elementType)));
            case "value is empty":
                return conditionParameter.isEmpty();
            case "value is not empty":
                return !conditionParameter.isEmpty();
            case "values are equal":
                return value1.equals(value2);
            case "values are not equal":
                return !value1.equals(value2);
            case "first value is greater":
                return v1 > v2;
            case "first value is equal or greater":
                return v1 >= v2;
            case "Product Factory special element is enabled":
                elementLocator = conditionParameter.split(",")[0];
                elementType = conditionParameter.split(",")[1];
                if(specialLocatorsMap.containsKey(elementType)) {
                    String xpathTemplate = specialLocatorsMap.get(elementType);
                    String resultingXpath = xpathTemplate.replaceAll("PARAMETER",
                            TestParametersController.checkIfSpecialParameter(elementLocator));
                    String actualAttributeValue = findElement(initElementLocator(resultingXpath)).getAttribute("tabindex");
                    return actualAttributeValue.equalsIgnoreCase(TestParametersController.checkIfSpecialParameter("0"));
                } else {
                    Reporter.fail("No such locator template key");
                    return false;
                }
            case "Product Factory special element is disabled":
                elementLocator = conditionParameter.split(",")[0];
                elementType = conditionParameter.split(",")[1];
                if(specialLocatorsMap.containsKey(elementType)) {
                    String xpathTemplate = specialLocatorsMap.get(elementType);
                    String resultingXpath = xpathTemplate.replaceAll("PARAMETER",
                            TestParametersController.checkIfSpecialParameter(elementLocator));
                    String actualAttributeValue = findElement(initElementLocator(resultingXpath)).getAttribute("tabindex");
                    return actualAttributeValue.equalsIgnoreCase(TestParametersController.checkIfSpecialParameter("-1"));
                } else {
                    Reporter.fail("No such locator template key");
                    return false;
                }
            case "Product Factory element is enabled":
                    Assert.assertTrue(findElement(initElementLocator(conditionParameter)).getAttribute("tabindex")
                            .equalsIgnoreCase("0"));
            case "Product Factory element is disabled":
                Assert.assertTrue(findElement(initElementLocator(conditionParameter)).getAttribute("tabindex")
                        .equalsIgnoreCase("-1"));
            default:
                return false;
        }
    }
}
