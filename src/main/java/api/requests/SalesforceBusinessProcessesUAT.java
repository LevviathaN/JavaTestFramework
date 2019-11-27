package api.requests;

import api.RestApiController;
import api.SoapApiController;
import api.Utilities;
import io.restassured.response.Response;
import ui.utils.ReporterManager;
import ui.utils.bpp.ExecutionContextHandler;
import ui.utils.bpp.PropertiesHelper;
import java.util.ArrayList;

import static com.jcabi.matchers.RegexMatchers.matchesPattern;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.anyOf;
import static org.hamcrest.Matchers.containsString;

/**
 * Class will contain all methods required for main Salesforce API calls: e.g. Create Faculty, Student Account, Add Address.
 */

public class SalesforceBusinessProcessesUAT {

    private PropertiesHelper propertiesHelper = new PropertiesHelper();
    private RestApiController restController;
    private SoapApiController soapController;
    private Utilities utils;


    public SalesforceBusinessProcessesUAT() {
        this.restController = new RestApiController();
        this.soapController = new SoapApiController();
        this.utils = new Utilities();
    }

    public SalesforceBusinessProcessesUAT createNewStudentUAT() {

        Response accountResponse = restController.postRequest(propertiesHelper.getProperties().getProperty("sf_account_url_UAT"),
                restController.processProperties("addNewAccountUAT"));

        assertThat(accountResponse.getBody().asString(), containsString("success"));
        ReporterManager.info("<pre>" + "Account Id: " + accountResponse.getBody().asString() + "</pre>");

        ExecutionContextHandler.setExecutionContextValueByKey("EC_ACCOUNT_ID", new Utilities().getResponseProperty(accountResponse, "id"));

        return this;
    }

    public SalesforceBusinessProcessesUAT addAddressUAT() {

        Response addressResponse = restController.postRequest(propertiesHelper.getProperties().getProperty("sf_address_url_UAT"),
                restController.processProperties("addNewAddressUAT"));

        assertThat(addressResponse.getBody().asString(), containsString("success"));
        ReporterManager.info("<pre>" + "Address Id: " + addressResponse.getBody().asString() + "</pre>");

        return this;
    }

    public SalesforceBusinessProcessesUAT getAccountProfileIdUAT() {

        Response thisResponse = soapController.postSoapRequest(propertiesHelper.getProperties().getProperty("sf_student_get_profile_id_url_UAT"),
                soapController.processSoapProperties("account_GetProfileID", "accountId"));

        assertThat(thisResponse.getBody().asString(), containsString("Success"));

        return this;
    }

    public SalesforceBusinessProcessesUAT addOpportunityUAT() {

        Response opportunityResponse = restController.postRequest(propertiesHelper.getProperties().getProperty("sf_opportunity_url_UAT"),
                restController.processProperties("addNewOpportunityUAT"));

        assertThat(opportunityResponse.getBody().asString(), containsString("success"));
        ReporterManager.info("<pre>" + "Opportunity Id: " + opportunityResponse.getBody().asString() + "</pre>");

        ExecutionContextHandler.setExecutionContextValueByKey("EC_OPPORTUNITY_ID", new Utilities().getResponseProperty(opportunityResponse, "id"));

        return this;
    }

    public SalesforceBusinessProcessesUAT addOfferingUAT() {

        Response offeringResponse = restController.postRequest(propertiesHelper.getProperties().getProperty("sf_product_url_UAT"),
                restController.processProperties("addNewProductItemUAT"));

        assertThat(offeringResponse.getBody().asString(), containsString("success"));
        ReporterManager.info("<pre>" + "Offering Id: " + offeringResponse.getBody().asString() + "</pre>");

        return this;
    }

    public SalesforceBusinessProcessesUAT submitNewAccountUAT() {

        Response thisResponse = soapController.postSoapRequest(propertiesHelper.getProperties().getProperty("sf_student_submit_application_url_UAT"),
                soapController.processSoapProperties("account_SubmitApplication", "id"));

        assertThat(thisResponse.getBody().asString(), containsString("Application Submitted Successfully"));

        Response dataResponse = restController.getRequest(propertiesHelper.getProperties().getProperty("sf_account_url_UAT") + "/" + ExecutionContextHandler.getExecutionContextValueByKey("EC_ACCOUNT_ID"));
        ArrayList<String> recordData = utils.getRecordData(utils.getResponseProperty(dataResponse));
        //GlobalDataBridge.getInstance().setBufferValueByKey("Student UAT".concat(Integer.toString(new Random().nextInt(999999999))), recordData);

        assertThat(recordData.get(56), matchesPattern("BP[0-9]+"));

        return this;
    }

    public SalesforceBusinessProcessesUAT createNewFacultyUAT() {

        Response facultyResponse = restController.postRequest(propertiesHelper.getProperties().getProperty("sf_faculty_url_UAT"),
                restController.processProperties("addNewFacultyUAT"));

        assertThat(facultyResponse.getBody().asString(), containsString("success"));

        ExecutionContextHandler.setExecutionContextValueByKey("EC_FACULTY_ID", new Utilities().getResponseProperty(facultyResponse, "id"));
        ReporterManager.info("<pre>" + "Faculty Id: " + facultyResponse.getBody().asString() + "</pre>");

        return this;
    }

    public SalesforceBusinessProcessesUAT submitNewFacultyUAT() {

        Response thisResponse = soapController.postSoapRequest(propertiesHelper.getProperties().getProperty("sf_faculty_submit_url_UAT"),
                soapController.processSoapProperties("faculty_SubmitApplication", "FacultyId"));

        assertThat(thisResponse.getBody().asString(), containsString("Application Submitted Successfully"));

        Response dataResponse = restController.getRequest(propertiesHelper.getProperties().getProperty("sf_faculty_url_UAT") + "/" + ExecutionContextHandler.getExecutionContextValueByKey("EC_FACULTY_ID"));

        ArrayList<String> recordData = utils.getRecordData(utils.getResponseProperty(dataResponse));

        //GlobalDataBridge.getInstance().setBufferValueByKey("Faculty".concat(Integer.toString(new Random().nextInt(999999999))), recordData);

        assertThat(recordData.get(10), anyOf(matchesPattern("[a-z]\\.[a-z]+"), matchesPattern("[a-z]\\.[a-z]+[0-9]+$")));
        assertThat(recordData.get(25), matchesPattern("[A-Z][a-z]\\d+"));

        return this;
    }

}