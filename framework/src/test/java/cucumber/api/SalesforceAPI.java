package cucumber.api;

import api.requests.SalesforceBusinessProcesses;
import api.requests.SalesforceBusinessProcessesUAT;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import ui.utils.bpp.PropertiesHelper;

public class SalesforceAPI {

    @When("I create new faculty record")
    public void i_create_new_faculty_record() {
        if (PropertiesHelper.determineEffectivePropertyValue("environment").equalsIgnoreCase("UAT"))
            new SalesforceBusinessProcessesUAT().createNewFacultyUAT();
        else
            new SalesforceBusinessProcesses().createNewFaculty();
    }

    @Then("I should submit faculty API")
    public void i_should_submit_faculty() {
        if (PropertiesHelper.determineEffectivePropertyValue("environment").equalsIgnoreCase("UAT"))
            new SalesforceBusinessProcessesUAT().submitNewFacultyUAT();
        else
            new SalesforceBusinessProcesses().submitNewFaculty();
    }

    @And("I create new student account API")
    public void i_should_create_student_account() {
        if (PropertiesHelper.determineEffectivePropertyValue("environment").equalsIgnoreCase("UAT"))
            new SalesforceBusinessProcessesUAT().
                    createNewStudentUAT().
                    addAddressUAT().
                    getAccountProfileIdUAT().
                    addOpportunityUAT().
                    addOfferingUAT().
                    submitNewAccountUAT().
                    validateBannerIDUAT();
        else {
            new SalesforceBusinessProcesses().
                    createNewStudent().
                    addAddress().
                    getAccountProfileId().
                    addOpportunity().
                    addOffering().
                    submitNewAccount().
                    validateBannerID();
        }
    }
}
