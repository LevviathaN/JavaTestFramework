package cucumber.reusablesteps;

import cucumber.stepdefs.SpecialStepDefs;
import cucumber.stepdefs.StepDefinitions;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import ui.utils.SeleniumHelper;
import ui.utils.BPPLogManager;
import ui.utils.Reporter;
import ui.utils.Tools;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author Ruslan Levytskyi
 * <p>The class is used to handle all reusable scenarios and match them with apropriate step definitions</p>
 */
public class ReusableRunner {

private static final ThreadLocal<ReusableRunner> instance = new ThreadLocal<ReusableRunner>() {
    @Override
    protected ReusableRunner initialValue() {
        return new ReusableRunner();
    }
};

public static ReusableRunner getInstance() {
    return instance.get();
}

    private ReusableRunner() {

        //General stepdefs
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_CLICK_ON_THE_BUTTON"),() -> stepDefs.i_click_on_the_button(arg1));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_AM_ON_URL"),() -> stepDefs.i_am_on_url(arg1));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("FILL_THE_FIELD"),() -> stepDefs.fill_field(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("WAIT_FOR"),() -> stepDefs.wait_for(arg1));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("HOVER_OVER"),() -> stepDefs.hover_over(arg1));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_SHOULD_SEE_THE_TEXT"),() -> stepDefs.i_should_see_the_text(arg1));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_SHOULD_SEE_THE_MESSAGE_LOCATED_IN_FRAME"),() -> stepDefs.i_should_see_the_message_in_frame(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_SHOULD_BE_REDIRECTED_TO_THE_PAGE"),() -> stepDefs.i_should_be_redirected_to_page(arg1));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_EXECUTE_REUSABLE_STEP"),() -> stepDefs.i_execute_reusable_step(arg1));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_REMEMBER_TEXT"),() -> stepDefs.i_remember_text(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("ELEMENTS_ATTRIBUTE_SHOULD_HAVE_VALUE"),() -> stepDefs.elements_attribute_should_have_value(arg1, arg2, arg3));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_CHECK_UNCHECK"),() -> stepDefs.i_check_uncheck(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_PRESS_KEY"),() -> stepDefs.i_press_from_keyboard(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_VALIDATE_TEXT"),() -> stepDefs.i_validate_text_to_be_displayed_for_element(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_EXECUTE_REUSABLE_STEP_IF"),() -> stepDefs.i_execute_reusable_step_if(arg1, arg2, arg3));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_CLICK_ON_THE_BUTTON_IF"),() -> stepDefs.i_click_on_the_button_if(arg1, arg2, arg3));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_SELECT_FROM_DROPDOWN"),() -> stepDefs.i_select_from_element(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_SHOULD_SCROLL_TO_THE_TOP_BOTTOM_OF_THE_PAGE"),() -> stepDefs.i_should_scroll_to_top_bottom_of_the_page(arg1));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_UPLOAD_FILE"),() -> stepDefs.i_upload_file_to_element(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_SHOULD_NOT_SEE_ELEMENT"),() -> stepDefs.i_should_not_see_the_element(arg1));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_SHOULD_SEE_MESSAGE_IN_FRAME"),() -> stepDefs.i_should_see_the_message_in_frame(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_SWITCH_TO_WINDOW"),() -> stepDefs.i_switch_to_window_with_index(arg1));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_CLICK_WITH_JS"), ()-> stepDefs.i_click_with_JS(arg1));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("BROWSER_PERFORMS_COMMAND"), ()-> stepDefs.browser_navigates(arg1));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_CAPTURE_DATA"),() -> stepDefs.i_capture_text_data_as_variable(arg1,arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_EXECUTE_JS_CODE"),() -> stepDefs.i_execute_js_code(arg1));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_EXECUTE_JS_CODE_FOR_ELEMENT"),() -> stepDefs.i_execute_js_code_for_element(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_SHOULD_SEE_NUMBER_OF_ELEMENTS"),() -> stepDefs.i_should_see_number_of_elements(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_CAPTURE_SPECIAL_DATA"), () -> stepDefs.i_capture_special_data(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_SET_TEXT_WITH_JS"), () -> stepDefs.i_set_text_with_js(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_CAPTURE_URL_AS_VARIABLE"), () -> stepDefs.i_capture_url_as_variable(arg1));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_CLICK_ON_ELEMENT_UNTIL"), () -> stepDefs.i_click_on_element_until(arg1, arg2, arg3));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_CLICK_ON_THE_BUTTON_WITH_JS_IF"), () -> stepDefs.i_click_on_the_button_with_js_if(arg1, arg2, arg3));

        //Special stepdefs
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_CLICK_ON_ELEMENT_WITH_PARAMETER_SPECIAL"),() -> specialStepDefs.i_click_on_element_with_parameter_special(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_SET_TEXT_SPECIAL"),() -> specialStepDefs.i_set_text_special(arg1, arg2, arg3));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_SHOULD_SEE_SPECIAL"),() -> specialStepDefs.i_should_see_special(arg1, arg2));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("ELEMENTS_ATTRIBUTE_SHOULD_HAVE_VALUE_SPECIAL"),() -> specialStepDefs.elements_attribute_should_have_value_special(arg1, arg2, arg3, arg4));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_CHECK_UNCHECK_SPECIAL"),() -> specialStepDefs.i_check_uncheck_special(arg1, arg2, arg3));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_CLICK_ON_ELEMENT_WITH_PARAMETER_SPECIAL_IF"),() -> specialStepDefs.i_click_on_element_with_parameter_special_if(arg1, arg2, arg3, arg4));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_SELECT_FROM_ELEMENT_SPECIAL"),() -> specialStepDefs.i_select_from_element_special(arg1, arg2, arg3));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_SHOULD_SEE_NUMBER_OF_ELEMENTS_SPECIAL"),() -> specialStepDefs.i_should_see_number_of_elements_special(arg1, arg2, arg3));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_EXECUTE_JS_CODE_FOR_ELEMENT_SPECIAL"),() -> specialStepDefs.i_execute_js_code_for_element_special(arg1, arg2, arg3));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("I_CLICK_ON_ELEMENT_UNTIL_SPECIAL"),() -> specialStepDefs.i_click_on_element_until_special(arg1, arg2, arg3, arg4));
        stepDefsMap.put(SeleniumHelper.stepPatternsMap.get("HOVER_OVER_ELEMENT_SPECIAL"),() -> specialStepDefs.hover_over_element_special(arg1, arg2));
    }

    private StepDefinitions stepDefs = new StepDefinitions();
    private SpecialStepDefs specialStepDefs = new SpecialStepDefs();

    private ArrayList<String> reusable;

    public HashMap<String, RunReusable> stepDefsMap = new HashMap<>();

    private String arg1 = "";
    private String arg2 = "";
    private String arg3 = "";
    private String arg4 = "";

    /**
     * Execute reusable scenario with some additional steps
     *
     * @param reusableName name of scenario, that you want to use as a reusable step.
     *                     This scenario must be in src/main/resources/data/bpp/ReusableTestSteps.xml
     * @param subSteps     Map of steps you want to add to scenario beside it's own,
     *                     where key - index in scenario whe you want to insert your additional step
     *                     and value - step, written in gherkin notation
     * @author Ruslan Levytskyi
     */
    public void executeReusableAddSteps(String reusableName, Map<Integer, String> subSteps) {

        reusable = getStepsOfReusableScenario(reusableName);

        for (int i = 0; i < reusable.size(); i++) {

            if (subSteps.containsKey(i+1)) {
                BPPLogManager.getLogger().info("Adding \"" + subSteps.get(i+1) + "\" on the " + (i+1) + " position");
                reusable.add(i, subSteps.get(i+1));
            }
            executeStep(reusable.get(i));
        }
    }

    /**
     * Execute reusable scenario replacing some steps
     *
     * @param reusableName name of scenario, that you want to use as a reusable step.
     *                     This scenario must be in src/main/resources/data/bpp/ReusableTestSteps.xml
     * @param subSteps     Map of steps you want to to replace existing steps with,
     *                     where key - index of step in scenario you want to replace with a new step
     *                     and value - step, written in gherkin notation
     * @author Ruslan Levytskyi
     */
    public void executeReusableReplaceStep(String reusableName, Map<Integer, String> subSteps) {

        reusable = getStepsOfReusableScenario(reusableName);

        for (int i = 0; i < reusable.size(); i++) {

            if (subSteps.containsKey(i+1)) {
                BPPLogManager.getLogger().info("Replacing \"" + subSteps.get(i+1) + "\" on the " + (i+1) + " position");
                reusable.remove(i);
                reusable.add(i, subSteps.get(i+1));
            }
            executeStep(reusable.get(i));
        }
    }

    /**
     * Execute reusable scenario
     *
     * @param reusableName name of scenario, that you want to use as a reusable step.
     *                     This scenario must be in src/main/resources/data/bpp/ReusableTestSteps.xml
     * @author Ruslan Levytskyi
     */
    public void executeReusable(String reusableName) {

        reusable = getStepsOfReusableScenario(reusableName);
        BPPLogManager.getLogger().info("Executing: " + reusableName + " reusable step");
        for (int i = 0; i < reusable.size(); i++) {
            executeStep(reusable.get(i));
        }
    }

    /**
     * Execute step of reusable scenario
     *
     * @param step to execute
     * @author Ruslan Levytskyi
     */
    public void executeStep(String step) {
        List<String> arguments = Tools.getQuoted(step, '"');
        if (arguments.toArray().length == 1) {
            arg1 = arguments.get(0);
        } else if (arguments.toArray().length == 2) {
            arg1 = arguments.get(0);
            arg2 = arguments.get(1);
        } else if (arguments.toArray().length == 3) {
            arg1 = arguments.get(0);
            arg2 = arguments.get(1);
            arg3 = arguments.get(2);
        } else if (arguments.toArray().length == 4) {
            arg1 = arguments.get(0);
            arg2 = arguments.get(1);
            arg3 = arguments.get(2);
            arg4 = arguments.get(3);
        }

        for (String regx : stepDefsMap.keySet()) {
            if (step.matches(regx)) {
                BPPLogManager.getLogger().info("Executing step: " + step);
                stepDefsMap.get(regx).runReusable();
            }
        }
    }

    /**
     * Get list of steps of reusable scenario with specified name
     *
     * @param reusableName name of reusable scenario, steps of which you want to get.
     * @return list of steps of reusable scenario with specified name
     * @author Ruslan Levytskyi
     */
    private synchronized ArrayList<String> getStepsOfReusableScenario(String reusableName) {

        ArrayList<String> stepsList = new ArrayList<>();

        try {
            File inputFile = new File("src/main/resources/data/bpp/ReusableTestSteps.xml");
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(inputFile);
            doc.getDocumentElement().normalize();
            ArrayList<String> availableReusableStepsList = new ArrayList<>();

            Node reusablesNode = doc.getElementsByTagName("reusables").item(0);
            Element reusablesElement = (Element) reusablesNode;

            NodeList reusablesList = reusablesElement.getElementsByTagName("reusable");
            boolean isReusableExist = false;
            for (int i = 0; i < reusablesList.getLength(); i++) {
                Node reusableNode = reusablesList.item(i);
                Element reusableElement = (Element) reusableNode;
                availableReusableStepsList.add(reusableElement.getAttribute("name"));
                if (reusableElement.getAttribute("name").equals(reusableName)) {
                    NodeList steps = reusableElement.getElementsByTagName("step");
                    for (int j = 0; j < steps.getLength(); j++) {
                        stepsList.add(steps.item(j).getTextContent());
                    }
                    isReusableExist = true;
                }
            }
            if (!isReusableExist) {
                Reporter.fail(reusableName + " reusable step does not exist. " +
                        "Here is a list of available reusable steps: ");
                for (String availStep : availableReusableStepsList) {
                    Reporter.log("  " + availStep);
                }
                throw new RuntimeException("Reusable step does not exist");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stepsList;
    }

}
