package cucumber.reusablesteps;

import cucumber.runner.Runner;
import cucumber.runner.ThreadLocalRunnerSupplier;
import cucumber.runtime.Glue;
import cucumber.runtime.StepDefinition;
import io.cucumber.testng.TestNGCucumberRunner;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
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

    private ReusableRunner() {}

    public void initiateStepdefsMap(TestNGCucumberRunner testNGCucumberRunner) {
        ThreadLocalRunnerSupplier runnerSupplier = (ThreadLocalRunnerSupplier) Tools.getObjectPrivateFinalField(testNGCucumberRunner,"runnerSupplier");
        Runner runner = runnerSupplier.get();
        Glue glue = (Glue) Tools.getObjectPrivateFinalField(runner,"glue");
        Map<String, StepDefinition> stepDefinitionsByPattern = (Map<String, StepDefinition>) Tools.getObjectPrivateFinalField(glue, "stepDefinitionsByPattern");
        stepDefinitionMap = stepDefinitionsByPattern;

    }

    private ArrayList<String> reusable;
    public Map<String, StepDefinition> stepDefinitionMap = new HashMap<>();

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
            BPPLogManager.getLogger().info("Reusable scenario step " + (i+1) + ":");
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
            BPPLogManager.getLogger().info("Reusable scenario step " + (i+1) + ":");
            executeStep(reusable.get(i));
        }
    }

    /**
     * Execute reusable scenario modified
     *
     * @param reusableName name of scenario, that you want to use as a reusable step.
     *                     This scenario must be in src/main/resources/data/bpp/ReusableTestSteps.xml
     * @param subSteps     Map of steps you want to to modify,
     * @author Ruslan Levytskyi
     */
    public void executeReusableModified(String reusableName, List<List<String>> subSteps) {

        reusable = getStepsOfReusableScenario(reusableName);
        Map<Integer,List<String>> subStepsMap= new HashMap<>();

        for (List<String> step: subSteps) {
            List<String> stepList = new ArrayList<>();
            stepList.add(step.get(1));
            stepList.add(step.get(2));
            subStepsMap.put(Integer.parseInt(step.get(0)), stepList);
        }

        for (int i = 0; i < reusable.size(); i++) {
            if (subStepsMap.containsKey(i+1)) {
                String action = subStepsMap.get(i+1).get(0);
                switch(action) {
                    case "Add":
                        BPPLogManager.getLogger().info("Adding \"" + subStepsMap.get(i+1).get(1) + "\" on the " + (i+1) + " position");
                        reusable.add(i, subStepsMap.get(i+1).get(1));
                        break;
                    case "Delete":
                        BPPLogManager.getLogger().info("Deleting step (" + reusable.get(i) + ") on the " + (i+1) + " position");
                        reusable.remove(i);
                        reusable.add(i, "I wait for \"1\" seconds");
                        break;
                    case "Replace":
                        BPPLogManager.getLogger().info("Replacing existing step (" + reusable.get(i) + ") with \"" + subStepsMap.get(i+1).get(1) + "\" on the " + (i+1) + " position");
                        reusable.remove(i);
                        reusable.add(i, subStepsMap.get(i+1).get(1));
                        break;

                }
            }
            BPPLogManager.getLogger().info("Reusable scenario step " + (i+1) + ":");
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
            BPPLogManager.getLogger().info("Reusable scenario step " + (i+1) + ":");
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
        String[] args = new String[0];
        if (arguments.toArray().length == 1) {
            args = new String[1];
            args[0] = arguments.get(0);
        } else if (arguments.toArray().length == 2) {
            args = new String[2];
            args[0] = arguments.get(0);
            args[1] = arguments.get(1);
        } else if (arguments.toArray().length == 3) {
            args = new String[3];
            args[0] = arguments.get(0);
            args[1] = arguments.get(1);
            args[2] = arguments.get(2);
        } else if (arguments.toArray().length == 4) {
            args = new String[4];
            args[0] = arguments.get(0);
            args[1] = arguments.get(1);
            args[2] = arguments.get(2);
            args[3] = arguments.get(3);
        }

        for (String regx : stepDefinitionMap.keySet()) {
            if (step.matches(regx)) {
                BPPLogManager.getLogger().info("Executing step: " + step);
                try {
                    stepDefinitionMap.get(regx).execute(args);
                } catch (Throwable throwable) {
                    throwable.printStackTrace();
                }
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
