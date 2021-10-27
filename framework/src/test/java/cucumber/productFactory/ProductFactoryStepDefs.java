package cucumber.productFactory;

import api.RestApiController;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.junit.Test;
import org.testng.Assert;
import ui.utils.BPPLogManager;
import ui.utils.Conditions;
import ui.utils.Reporter;
import ui.utils.Tools;
import ui.utils.bpp.ExecutionContextHandler;
import ui.utils.bpp.PropertiesHelper;
import ui.utils.bpp.TestParametersController;

import java.io.IOException;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.jcabi.matchers.RegexMatchers.matchesPattern;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;
import static org.junit.internal.matchers.StringContains.containsString;


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
        String refDataName = jsonName.replace("create", "").replace("update", "").replace("get", "");
        JSONObject recordsList = restController.requestProcess(jsonName, null);

        /*Get JSON object values*/
        String log = "<pre><br>" + refDataName + ": ";
        for (Object key : recordsList.keySet()) {
            String keyString = key.toString();
            String valueString = recordsList.get(keyString) == null ? null : recordsList.get(keyString).toString();
            ExecutionContextHandler.setExecutionContextValueByKey("EC_" + Tools.fromCamelCaseToUpperWithDash(refDataName) + "_" + Tools.fromCamelCaseToUpperWithDash(keyString), valueString);
            if (!(valueString == null)) {
                if (!(valueString.contains("{\"reference\":") || keyString.contains("_typename"))) {
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
        String refDataName = jsonName.replace("create", "").replace("update", "");
        JSONObject recordsList = restController.requestProcess(jsonName, null);

        /*Get JSON object values*/
        String log = "<pre><br>" + refDataName + ": ";
        for (Object key : recordsList.keySet()) {
            String keyString = key.toString();
            String valueString = recordsList.get(keyString) == null ? null : recordsList.get(keyString).toString();
            ExecutionContextHandler.setExecutionContextValueByKey("EC_" + ecName + Tools.fromCamelCaseToUpperWithDash(refDataName) + "_" + Tools.fromCamelCaseToUpperWithDash(keyString), valueString);
            if (!(valueString == null)) {
                if (!(valueString.contains("{\"reference\":") || keyString.contains("_typename"))) {
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
        String refDataName = name.replace("create", "");
        JSONObject recordsList = restController.requestProcess(name, parameters);
        String log = "<pre><br>" + refDataName + ": ";

        /*Get JSON object values*/
        for (Object key : recordsList.keySet()) {
            String keyString = key.toString();
            String valueString = recordsList.get(keyString) == null ? null : recordsList.get(keyString).toString();
            ExecutionContextHandler.setExecutionContextValueByKey("EC_" + Tools.fromCamelCaseToUpperWithDash(refDataName) + "_" + Tools.fromCamelCaseToUpperWithDash(keyString), valueString);
            if (!(valueString == null)) {
                if (!(valueString.contains("{\"reference\":") || keyString.contains("_typename"))) {
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
        String refDataName = name.replace("create", "");
        JSONObject recordsList = restController.requestProcess(name, parameters);
        String log = "<pre><br>" + refDataName + ": ";

        /*Get JSON object values*/
        for (Object key : recordsList.keySet()) {
            String keyString = key.toString();
            String valueString = recordsList.get(keyString) == null ? null : recordsList.get(keyString).toString();
            ExecutionContextHandler.setExecutionContextValueByKey("EC_" + ecName + Tools.fromCamelCaseToUpperWithDash(refDataName) + "_" + Tools.fromCamelCaseToUpperWithDash(keyString), valueString);
            if (!(valueString == null)) {
                if (!(valueString.contains("{\"reference\":") || keyString.contains("_typename"))) {
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

    @When("^I execute negative \"([^\"]*)\" API step with expected error \"([^\"]*)\"$")
    public void i_execute_negative_api_step(String stepName, String errorName) {

        String jsonName = stepName.replaceAll(" ", "");
        jsonName = jsonName.substring(0, 1).toLowerCase() + jsonName.substring(1);
        String refDataName = jsonName.replace("negative", "");
        JSONObject recordsList = restController.requestNegativeProcess(jsonName, null);

        JSONObject recordExtensions = (JSONObject) recordsList.get("extensions");
        JSONArray recordArrayVarPath = (JSONArray) recordExtensions.get("variablePath");
        String recordError = (String) recordArrayVarPath.get(0);

        assertEquals(errorName, recordError);

        /*Get JSON object values*/
        String log = "<pre><br>" + jsonName + ": " + "<br>" + "Actual: " + "<font color='red'><b>" + errorName + "</font></b>" + " matches expected " + "<font color='red'><b>" + recordError + "</font></b>" + " Location can't be created without " + recordError + "</pre>";


    /*Report log with Json object values*/
        Reporter.log(log);
        BPPLogManager.getLogger().

    info(stepName +" negative step was executed successfully.");
        }

    @When("^I execute negative \"([^\"]*)\" API step with error name \"([^\"]*)\" and parameters$")
    public void i_execute_negative_api_step_with_parameters(String stepName, String errorName, Map<String, String> parameters) {
        String name = stepName.replaceAll(" ", "");
        name = name.substring(0, 1).toLowerCase() + name.substring(1);
        String refDataName = name.replace("Update", "").replace("Create","");
        JSONObject recordsList = restController.requestNegativeProcess(name, parameters);
        String message = (String) recordsList.get("message");

        if(errorName.contains("<EC_")) {
            String errorMessage = null;
            Pattern pattern = Pattern.compile("<(.*?)>");
            Matcher matcher = pattern.matcher(errorName);
            while(matcher.find()) {
               String errorSample = TestParametersController.checkIfSpecialParameter(matcher.group(1));
               errorMessage = errorName.replaceFirst(matcher.group(0), errorSample);
               errorName = errorMessage;
            }
            assertThat(message, containsString(errorMessage));
        } else {
            assertThat(message, containsString(errorName));
        }


        /*Get JSON object values*/
        String log = "<pre><br>" + refDataName + ": " + "<br>" + "<font color='red'><b>" + message + "</font></b>" + "</pre>";


        /*Report log with Json object values*/
        Reporter.log(log);
        BPPLogManager.getLogger().

                info(stepName +" negative step was executed successfully.");

    }

    /**
     * Definition to validate items are similar
     *
     */
    @Then("^I verify that \"([^\"]*)\" element \"(equal|contains)\" to \"([^\"]*)\" element$")
    public void i_verify_that_element_is(String elementOne, String value, String elementTwo) {
        String resultElement = TestParametersController.checkIfSpecialParameter(elementOne);
        String startElement = TestParametersController.checkIfSpecialParameter(elementTwo);
        Reporter.log("Executing step: I verify that" + resultElement + " is equal to: " + startElement);
        if (value.equals("contains")) {
            Assert.assertTrue(startElement.contains(resultElement));
        } else if (value.equals("equal")) {
            Assert.assertEquals(resultElement, startElement);
        }
    }

    }

