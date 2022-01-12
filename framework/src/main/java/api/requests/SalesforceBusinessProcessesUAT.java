package api.requests;

import api.RestApiController;
import api.SalesforceAuthentication;
import api.SoapApiController;
import api.Utilities;
import io.restassured.response.Response;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import ui.utils.BPPLogManager;
import ui.utils.GlobalDataBridge;
import ui.utils.Reporter;
import ui.utils.bpp.ExecutionContextHandler;
import ui.utils.bpp.PropertiesHelper;
import java.util.ArrayList;
import java.util.Random;
import static com.jcabi.matchers.RegexMatchers.matchesPattern;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;

/**
 * <p> Contains all methods required for main Salesforce API calls in UAT: e.g. Create Faculty, Student Account, Add Address.</p>
 */

public class SalesforceBusinessProcessesUAT {

    private final PropertiesHelper propertiesHelper = new PropertiesHelper();
    private final RestApiController restController;
    private final SoapApiController soapController;
    private final Utilities utils;


    public SalesforceBusinessProcessesUAT() {
        this.restController = new RestApiController();
        this.soapController = new SoapApiController();
        this.utils = new Utilities();
    }

    public SalesforceBusinessProcessesUAT createNewStudentUAT() {

        Response accountResponse = restController.postRequest(propertiesHelper.getProperties().getProperty("sf_account_url_UAT"),
                restController.processProperties("addNewAccountUAT"), SalesforceAuthentication.getInstance().requestHeaderSpecification());

        assertThat(accountResponse.getBody().asString(), containsString("success"));
        Reporter.log("<pre>" + "Account Id: " + accountResponse.getBody().asString() + "</pre>");

        ExecutionContextHandler.setExecutionContextValueByKey("EC_ACCOUNT_ID", new Utilities().getResponseProperty(accountResponse, "id"));

        return this;
    }

    public SalesforceBusinessProcessesUAT addAddressUAT() {

        Response addressResponse = restController.postRequest(propertiesHelper.getProperties().getProperty("sf_address_url_UAT"),
                restController.processProperties("addNewAddressUAT"), SalesforceAuthentication.getInstance().requestHeaderSpecification());

        assertThat(addressResponse.getBody().asString(), containsString("success"));
        Reporter.log("<pre>" + "Address Id: " + addressResponse.getBody().asString() + "</pre>");

        return this;
    }

    public SalesforceBusinessProcessesUAT getAccountProfileIdUAT() {

        Response thisResponse = soapController.postSoapRequest(propertiesHelper.getProperties().getProperty("sf_student_get_profile_id_url_UAT"),
                soapController.processSoapProperties("account_GetProfileID", "accountId"));

        if(thisResponse.getBody().asString().contains("Success")){
            Reporter.log("<pre>" + "Get Profile ID Successful" + "</pre>");
        } else {
            try {
                Reporter.log("<pre>" + thisResponse.getBody().asString() + "</pre>");
            }
            catch (NoSuchMethodError | AssertionError | Exception e) {
                Reporter.failTryTakingScreenshot("Get Profile ID is not Successful. Cause: " + thisResponse.getBody().asString());
            }
        }

        return this;
    }

    public SalesforceBusinessProcessesUAT addOpportunityUAT() {

        Response opportunityResponse = restController.postRequest(propertiesHelper.getProperties().getProperty("sf_opportunity_url_UAT"),
                restController.processProperties("addNewOpportunityUAT"), SalesforceAuthentication.getInstance().requestHeaderSpecification());

        assertThat(opportunityResponse.getBody().asString(), containsString("success"));
        Reporter.log("<pre>" + "Opportunity Id: " + opportunityResponse.getBody().asString() + "</pre>");

        ExecutionContextHandler.setExecutionContextValueByKey("EC_OPPORTUNITY_ID", new Utilities().getResponseProperty(opportunityResponse, "id"));

        return this;
    }

    public SalesforceBusinessProcessesUAT addOfferingUAT() {

        Response offeringResponse = restController.postRequest(propertiesHelper.getProperties().getProperty("sf_product_url_UAT"),
                restController.processProperties("addNewProductItemUAT"), SalesforceAuthentication.getInstance().requestHeaderSpecification());

        assertThat(offeringResponse.getBody().asString(), containsString("success"));
        Reporter.log("<pre>" + "Offering Id: " + offeringResponse.getBody().asString() + "</pre>");

        return this;
    }

    public SalesforceBusinessProcessesUAT submitNewAccountUAT() {

        Response thisResponse = soapController.postSoapRequest(propertiesHelper.getProperties().getProperty("sf_student_submit_application_url_UAT"),
                soapController.processSoapProperties("account_SubmitApplication", "id"));

        if(thisResponse.getBody().asString().contains("Application Submitted Successfully")){
            Reporter.log("<pre>" + "Application Submitted Successfully" + "</pre>");
        } else {
            try {
                Reporter.log("<pre>" + thisResponse.getBody().asString() + "</pre>");
            }
            catch (NoSuchMethodError | AssertionError | Exception e) {
                Reporter.failTryTakingScreenshot("Application was not submitted. Cause: " + thisResponse.getBody().asString());
            }
        }

        Response dataResponse = restController.getRequest(propertiesHelper.getProperties().getProperty("sf_account_url_UAT") + "/" + ExecutionContextHandler.getExecutionContextValueByKey("EC_ACCOUNT_ID"), SalesforceAuthentication.getInstance().requestHeaderSpecification());
        ArrayList<String> recordData = utils.getRecordData(utils.getResponseProperty(dataResponse));
        ExecutionContextHandler.setExecutionContextValueByKey("EC_AUTO_FIRSTNAME", recordData.get(102));
        ExecutionContextHandler.setExecutionContextValueByKey("EC_AUTO_LASTNAME", recordData.get(110));
        ExecutionContextHandler.setExecutionContextValueByKey("EC_AUTO_EMAIL", recordData.get(58));
        GlobalDataBridge.getInstance().setBufferValueByKey("Student UAT".concat(Integer.toString(new Random().nextInt(999999999))), recordData);

        return this;
    }

    public SalesforceBusinessProcessesUAT validateBannerIDUAT() {

        Response validateBanner = restController.getRequest(propertiesHelper.getProperties().getProperty("sf_get_account_bannerID_url_UAT") + "'" + ExecutionContextHandler.getExecutionContextValueByKey("EC_ACCOUNT_ID") +"'", SalesforceAuthentication.getInstance().requestHeaderSpecification());
        JSONObject recordsObject = new Utilities().getResponseProperty(validateBanner);
        JSONArray recordsArray = (JSONArray) recordsObject.get("records");
        JSONObject bannerSObjectID = (JSONObject) recordsArray.get(0);
        String bannerID = (String) bannerSObjectID.get("BNR_Banner_ID__pc");
        assertThat(bannerID , matchesPattern("BP[0-9]+"));
        Reporter.log("<pre>" + "Banner Id: " + bannerID + "</pre>");

        return this;
    }

    public SalesforceBusinessProcessesUAT createNewFacultyUAT() {

        Response facultyResponse = restController.postRequest(propertiesHelper.getProperties().getProperty("sf_faculty_url_UAT"),
                restController.processProperties("addNewFacultyUAT"), SalesforceAuthentication.getInstance().requestHeaderSpecification());

        assertThat(facultyResponse.getBody().asString(), containsString("success"));

        ExecutionContextHandler.setExecutionContextValueByKey("EC_FACULTY_ID", new Utilities().getResponseProperty(facultyResponse, "id"));
        Reporter.log("<pre>" + "Faculty Id: " + facultyResponse.getBody().asString() + "</pre>");

        return this;
    }

    public SalesforceBusinessProcessesUAT submitNewFacultyUAT() {

        Response thisResponse = soapController.postSoapRequest(propertiesHelper.getProperties().getProperty("sf_faculty_submit_url_UAT"),
                soapController.processSoapProperties("faculty_SubmitApplication", "FacultyId"));

        assertThat(thisResponse.getBody().asString(), containsString("Application Submitted Successfully"));

        Response dataResponse = restController.getRequest(propertiesHelper.getProperties().getProperty("sf_faculty_url_UAT") + "/" + ExecutionContextHandler.getExecutionContextValueByKey("EC_FACULTY_ID"), SalesforceAuthentication.getInstance().requestHeaderSpecification());

        ArrayList<String> recordData = utils.getRecordData(utils.getResponseProperty(dataResponse));

        GlobalDataBridge.getInstance().setBufferValueByKey("Faculty".concat(Integer.toString(new Random().nextInt(999999999))), recordData);

        assertThat(recordData.get(10), matchesPattern("[a-z]\\.[a-z]+"));
        assertThat(recordData.get(25), matchesPattern("[A-Z][a-z]\\d+"));

        return this;
    }

}
