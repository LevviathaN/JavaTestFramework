package cucumber.productFactory;

import api.RestApiController;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import ui.utils.BPPLogManager;
import ui.utils.Reporter;
import ui.utils.Tools;
import ui.utils.bpp.ExecutionContextHandler;
import ui.utils.bpp.PropertiesHelper;
import java.io.IOException;
import java.util.Map;

import static com.jcabi.matchers.RegexMatchers.matchesPattern;
import static org.junit.Assert.assertThat;


public class ProductFactoryStepDefs {

    private final RestApiController restController;
    private final PropertiesHelper propertiesHelper = new PropertiesHelper();
    public ProductFactoryStepDefs() {
        this.restController = new RestApiController();
    }

    @Given("^I debug$")
    public void i_debug() {
        String debug = "debug";
    }

    @When("^I execute \"([^\"]*)\" API step$")
    public void i_execute_api_step(String stepName) {
        String objName = stepName.equals("changeInstanceCapacity") ? "updateInstance" : stepName;

        String jsonName = stepName.replaceAll(" ", "");
        jsonName = jsonName.substring(0, 1).toLowerCase() + jsonName.substring(1);
        String refDataName = jsonName.replace("create","").replace("update","").replace("get","");
        JSONObject recordsList = restController.requestProcess(jsonName, null);

        /*Get JSON object values*/
        String log = "<pre><br>" + refDataName + ": ";
        for (Object key : recordsList.keySet()) {
            String keyString = key.toString();
            String valueString = recordsList.get(keyString) == null ? null : recordsList.get(keyString).toString();
            ExecutionContextHandler.setExecutionContextValueByKey("EC_" + Tools.fromCamelCaseToUpperWithDash(refDataName) + "_" + Tools.fromCamelCaseToUpperWithDash(keyString), valueString);
            if (!(valueString==null)) {
                if (!(valueString.contains("{\"reference\":")||keyString.contains("_typename"))) {
                    log = log + "<br>" + refDataName + " " + keyString + ": " + "<font color='red'><b>" + valueString + "</font></b>";
                }
            }
        }
        log = log + "</pre>";

        /*Report log with Json object values*/
        Reporter.log(log);
        BPPLogManager.getLogger().info(stepName + " step was executed successfully.");
    }

    @When("^I execute \"([^\"]*)\" API step saving as \"([^\"]*)\"$")
    public void i_execute_api_step_saving_as(String stepName, String ecName) {
        String jsonName = stepName.replaceAll(" ", "");
        jsonName = jsonName.substring(0, 1).toLowerCase() + jsonName.substring(1);
        String refDataName = jsonName.replace("create","").replace("update","");
        JSONObject recordsList = restController.requestProcess(jsonName, null);

        /*Get JSON object values*/
        String log = "<pre><br>" + refDataName + ": ";
        for (Object key : recordsList.keySet()) {
            String keyString = key.toString();
            String valueString = recordsList.get(keyString) == null ? null : recordsList.get(keyString).toString();
            ExecutionContextHandler.setExecutionContextValueByKey("EC_" + ecName + Tools.fromCamelCaseToUpperWithDash(refDataName) + "_" + Tools.fromCamelCaseToUpperWithDash(keyString), valueString);
            if (!(valueString==null)) {
                if (!(valueString.contains("{\"reference\":")||keyString.contains("_typename"))) {
                    log = log + "<br>" + refDataName + " " + keyString + ": " + "<font color='red'><b>" + valueString + "</font></b>";
                }
            }
        }
        log = log + "</pre>";

        /*Report log with Json object values*/
        Reporter.log(log);
        BPPLogManager.getLogger().info(stepName + " step was executed successfully.");
    }

    @When("^I execute \"([^\"]*)\" API step with parameters$")
    public void i_execute_api_step_with_parameters(String stepName, Map<String, String> parameters) {
        String name = stepName.replaceAll(" ", "");
        name = name.substring(0, 1).toLowerCase() + name.substring(1);
        String refDataName = name.replace("create","");
        JSONObject recordsList = restController.requestProcess(name, parameters);
        String log = "<pre><br>" + refDataName + ": ";

        /*Get JSON object values*/
        for (Object key : recordsList.keySet()) {
            String keyString = key.toString();
            String valueString = recordsList.get(keyString) == null ? null : recordsList.get(keyString).toString();
            ExecutionContextHandler.setExecutionContextValueByKey("EC_" + Tools.fromCamelCaseToUpperWithDash(refDataName) + "_" + Tools.fromCamelCaseToUpperWithDash(keyString), valueString);
            if (!(valueString==null)) {
                if (!(valueString.contains("{\"reference\":")||keyString.contains("_typename"))) {
                    log = log + "<br>" + refDataName + " " + keyString + ": " + "<font color='red'><b>" + valueString + "</font></b>";
                }
            }
        }
        log = log + "</pre>";

        /*Report log with Json object values*/
        Reporter.log(log);
        BPPLogManager.getLogger().info(stepName + " step was executed successfully.");
    }

    @When("^I execute \"([^\"]*)\" API step with parameters saving as \"([^\"]*)\"$")
    public void i_execute_api_step_with_parameters_saving_as(String stepName, String ecName, Map<String, String> parameters) {
        String name = stepName.replaceAll(" ", "");
        name = name.substring(0, 1).toLowerCase() + name.substring(1);
        String refDataName = name.replace("create","");
        JSONObject recordsList = restController.requestProcess(name, parameters);
        String log = "<pre><br>" + refDataName + ": ";

        /*Get JSON object values*/
        for (Object key : recordsList.keySet()) {
            String keyString = key.toString();
            String valueString = recordsList.get(keyString) == null ? null : recordsList.get(keyString).toString();
            ExecutionContextHandler.setExecutionContextValueByKey("EC_" + ecName + Tools.fromCamelCaseToUpperWithDash(refDataName) + "_" + Tools.fromCamelCaseToUpperWithDash(keyString), valueString);
            if (!(valueString==null)) {
                if (!(valueString.contains("{\"reference\":")||keyString.contains("_typename"))) {
                    log = log + "<br>" + refDataName + " " + keyString + ": " + "<font color='red'><b>" + valueString + "</font></b>";
                }
            }
        }
        log = log + "</pre>";

        /*Report log with Json object values*/
        Reporter.log(log);
        BPPLogManager.getLogger().info(stepName + " step was executed successfully.");
    }

    @When("^I generate new ISBN code saving as \"([^\"]*)\"$")
    public void i_generate_new_isbn_code(String ecISBNValue) {
        Document doc = null;
        try {
            doc = Jsoup.connect("https://generate.plus/en/number/isbn").get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Element result = doc.select("div[class='content single text-center text-bold h1 char-break']").first();
        ExecutionContextHandler.setExecutionContextValueByKey(ecISBNValue, result.text());

        assertThat(result.text(), matchesPattern("^[0-9]{1}-[0-9]{4}-[0-9]{4}-[0-9A-Z]{1}"));

        Reporter.log("<pre>" + "ISBN nubmer: " + result.text() + "</pre>");
        BPPLogManager.getLogger().info("ISBN Code was successfully created. ISBN: " + result.text());
    }

}

