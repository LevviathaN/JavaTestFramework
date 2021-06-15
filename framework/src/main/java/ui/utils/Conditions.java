package ui.utils;

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
                String value1 = TestParametersController.checkIfSpecialParameter(conditionParameter.split(",")[0]);
                String value2 = TestParametersController.checkIfSpecialParameter(conditionParameter.split(",")[1]);
                return value1.equals(value2);
            default:
                return false;
        }
    }
}
