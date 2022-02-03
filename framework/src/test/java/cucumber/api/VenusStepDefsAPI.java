package cucumber.api;

import api.Auth0Authentication;
import api.RestApiController;
import api.Utilities;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import ui.utils.BPPLogManager;
import ui.utils.Reporter;
import ui.utils.bpp.ExecutionContextHandler;
import ui.utils.bpp.PropertiesHelper;

import java.util.ArrayList;


public class VenusStepDefsAPI {

    private final PropertiesHelper propertiesHelper = new PropertiesHelper();
    private final RestApiController restController;
    private final Utilities utils;

    public VenusStepDefsAPI() {
        this.restController = new RestApiController();
        this.utils = new Utilities();
    }

    @When("^I register new \"([^\"]*)\" Hub account using API$")
    public VenusStepDefsAPI i_register_new_hub_account(String accountType) {

        Response accountResponse;
        if (accountType.contains("Bespoke")) {
            accountResponse = restController.postRequest(propertiesHelper.getProperties().getProperty("hub_register_linkUAT"),
                    String.valueOf(restController.processPropertiesHubRegistration("registerHubBespokeAccountVerifiedUAT")), Auth0Authentication.getInstance().requestHeaderSpecification());
        } else if (accountType.contains("Channel")) {
            accountResponse = restController.postRequest(propertiesHelper.getProperties().getProperty("hub_register_linkUAT"),
                    String.valueOf(restController.processPropertiesHubRegistration("registerHubChannelAccountVerifiedUAT")), Auth0Authentication.getInstance().requestHeaderSpecification());
        } else {
            accountResponse = restController.postRequest(propertiesHelper.getProperties().getProperty("hub_register_linkUAT"),
                    String.valueOf(restController.processPropertiesHubRegistration("registerHubAccountVerifiedUAT")), Auth0Authentication.getInstance().requestHeaderSpecification());
        }
        JSONObject recordsObject = new Utilities().getResponseProperty(accountResponse);
        String userID = String.valueOf(recordsObject.get("user_id"));
        BPPLogManager.getLogger().info("Hub user is successfully registered via API request. User id is: " + userID.substring(6));
        Reporter.log("<pre>" + "User Id: " + userID + "</pre>");

        return this;
    }

    //required to test BPP-17653
    @When("^I register new standard Hub account without phone field using API$")
    public VenusStepDefsAPI i_register_new_hub_account_without_phone_field() {

        Response accountResponse;
        accountResponse = restController.postRequest(propertiesHelper.getProperties().getProperty("hub_register_linkUAT"),
                String.valueOf(restController.processPropertiesHubRegistration("registerHubAccountNoPhoneUAT")), Auth0Authentication.getInstance().requestHeaderSpecification());

        JSONObject recordsObject = new Utilities().getResponseProperty(accountResponse);
        String userID = String.valueOf(recordsObject.get("user_id"));
        BPPLogManager.getLogger().info("Hub user is successfully registered via API request. User id is: " + userID.substring(6));
        Reporter.log("<pre>" + "User Id: " + userID + "</pre>");

        return this;
    }
}
