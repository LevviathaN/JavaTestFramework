package cucumber.productFactory;

import api.ProductFactoryAuthentication;
import api.RestApiController;
import api.Utilities;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import ui.utils.BPPLogManager;
import ui.utils.Reporter;
import ui.utils.Tools;
import ui.utils.bpp.ExecutionContextHandler;
import ui.utils.bpp.PropertiesHelper;
import ui.utils.bpp.TestParametersController;
import java.io.IOException;
import static com.jcabi.matchers.RegexMatchers.matchesPattern;
import static org.junit.Assert.assertThat;
import static org.junit.internal.matchers.StringContains.containsString;
import static org.testng.Assert.assertEquals;


public class ProductFactoryStepDefs {

    private final RestApiController restController;
    private final PropertiesHelper propertiesHelper = new PropertiesHelper();
    public ProductFactoryStepDefs() {
        this.restController = new RestApiController();
    }

    @When("I generate new ISBN code saving as \"([^\"]*)\"$")
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

    @When("I create Financial Dimensions with Dimension Type of \"([^\"]*)\" and Target \"([^\"]*)\" saving as \"([^\"]*)\"$")
    public void i_create_financial_dimension(String dimensionType, String target, String ecFDValue) {

        JSONObject recordsList = restController.requestProcess("addFinancialDimension","createFinancialDimension", dimensionType,target);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String DimensionType = (String) recordsList.get("dimensionType");
        String Target = (String) recordsList.get("target");
        String Code = (String) recordsList.get("code");
        String Description = (String) recordsList.get("description");

        /*Set EC values for JSON object values*/

        ExecutionContextHandler.setExecutionContextValueByKey(ecFDValue + "_" + Target.toUpperCase().replace(" ", "_") + "_" + DimensionType.toUpperCase().replace(" ", "_") + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecFDValue + "_" + Target.toUpperCase().replace(" ", "_") + "_" + DimensionType.toUpperCase().replace(" ", "_") + "_DIMENSION_TYPE", DimensionType);
        ExecutionContextHandler.setExecutionContextValueByKey(ecFDValue + "_" + Target.toUpperCase().replace(" ", "_") + "_" + DimensionType.toUpperCase().replace(" ", "_") + "_TARGET", Target);
        ExecutionContextHandler.setExecutionContextValueByKey(ecFDValue + "_" + Target.toUpperCase().replace(" ", "_") + "_" + DimensionType.toUpperCase().replace(" ", "_") + "_CODE", Code);
        ExecutionContextHandler.setExecutionContextValueByKey(ecFDValue + "_" + Target.toUpperCase().replace(" ", "_") + "_" + DimensionType.toUpperCase().replace(" ", "_") + "_DESCRIPTION", Description);

        /*Report log with JSON object values*/
        Reporter.log("<pre>" +
                "<br>Financial Dimension - " + Target + " - " + DimensionType + ": " +
                "<br>" + "Financial Dimension " + Target + " " + DimensionType + " Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Financial Dimension " + Target + " " + DimensionType + " Code: " + "<font color='red'><b>" + Code + "</font></b>" +
                "<br>" + "Financial Dimension " + Target + " " + DimensionType + " Dimension Type: " + "<font color='red'><b>" + DimensionType + "</font></b>" +
                "<br>" + "Financial Dimension " + Target + " " + DimensionType + " Target: " + "<font color='red'><b>" + Target + "</font></b>" +
                "<br>" + "Financial Dimension " + Target + " " + DimensionType + " Description: " + "<font color='red'><b>" + Description + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Financial Dimension of " + dimensionType + " and " + target + " was successfully created.");
    }

    @When("I create new Sitting saving as \"([^\"]*)\"$")
    public void i_create_sitting(String ecSittingValue) {

        JSONObject recordsList = restController.requestProcess("addSitting","createSitting", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Name = (String) recordsList.get("name");
        String StartDate = (String) recordsList.get("startDate");
        String EndDate = (String) recordsList.get("endDate");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecSittingValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecSittingValue + "_NAME", Name);
        ExecutionContextHandler.setExecutionContextValueByKey(ecSittingValue + "_STARTDATE", StartDate);
        ExecutionContextHandler.setExecutionContextValueByKey(ecSittingValue + "_ENDDATE", EndDate);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Sitting: " +
                "<br>" + "Sitting Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Sitting Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "<br>" + "Sitting Start Date: " + "<font color='red'><b>" + StartDate + "</font></b>" +
                "<br>" + "Sitting End Date: " + "<font color='red'><b>" + EndDate + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Sitting was successfully created.");

    }

    @When("I create new Vat Rule saving as \"([^\"]*)\"$")
    public void i_create_vat_rule(String ecVatRuleValue) {

        JSONObject recordsList = restController.requestProcess("addVatRule","createVatRule", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Code = (String) recordsList.get("code");
        String Description = (String) recordsList.get("description");
        Long Rate = (Long) recordsList.get("rate");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecVatRuleValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecVatRuleValue + "_CODE", Code);
        ExecutionContextHandler.setExecutionContextValueByKey(ecVatRuleValue + "_DESCRIPTION", Description);
        ExecutionContextHandler.setExecutionContextValueByKey(ecVatRuleValue + "_RATE", String.valueOf(Rate));

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Vat Rule: " +
                "<br>" + "Vat Rule Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Vat Rule Code: " + "<font color='red'><b>" + Code + "</font></b>" +
                "<br>" + "Vat Rule Description: " + "<font color='red'><b>" + Description + "</font></b>" +
                "<br>" + "Vat Rule Rate: " + "<font color='red'><b>" + Rate + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Vat Rule was successfully created.");
    }

    @When("I create new Exam Preparation saving as \"([^\"]*)\"$")
    public void i_create_exam_preparation(String ecExamPreparationValue) {

        JSONObject recordsList = restController.requestProcess("addExamPreparation","createExamPreparation", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Name = (String) recordsList.get("name");
        String Description = (String) recordsList.get("description");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecExamPreparationValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecExamPreparationValue + "_NAME", Name);
        ExecutionContextHandler.setExecutionContextValueByKey(ecExamPreparationValue + "_DESCRIPTION", Description);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Exam Preparation: " +
                "<br>" + "Exam Preparation Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Exam Preparation Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "<br>" + "Exam Preparation Description: " + "<font color='red'><b>" + Description + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Exam Preparation was successfully created.");
    }

    @When("I create new Study Mode saving as \"([^\"]*)\"$")
    public void i_create_study_mode(String ecStudyModeValue) {

        JSONObject recordsList = restController.requestProcess("addStudyMode","createStudyMode", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Name = (String) recordsList.get("name");
        String Description = (String) recordsList.get("description");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecStudyModeValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecStudyModeValue + "_NAME", Name);
        ExecutionContextHandler.setExecutionContextValueByKey(ecStudyModeValue + "_DESCRIPTION", Description);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Study Mode: " +
                "<br>" + "Study Mode Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Study Mode Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "<br>" + "Study Mode Description: " + "<font color='red'><b>" + Description + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Study Mode was successfully created.");
    }

    @When("I create new Course Type saving as \"([^\"]*)\"$")
    public void i_create_course_type(String ecCourseTypeValue) {

        JSONObject recordsList = restController.requestProcess("addCourseType","createCourseType", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Description = (String) recordsList.get("description");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecCourseTypeValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecCourseTypeValue + "_DESCRIPTION", Description);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Course Type: " +
                "<br>" + "Course Type Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Course Type Description: " + "<font color='red'><b>" + Description + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Course Type was successfully created.");
    }

    @When("I create new Vertical saving as \"([^\"]*)\"$")
    public synchronized void i_create_vertical(String ecVerticalValue) {

        JSONObject recordsList = restController.requestProcess("addVertical","createVertical", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Name = (String) recordsList.get("name");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecVerticalValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecVerticalValue + "_NAME", Name);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Vertical: " +
                "<br>" + "Vertical Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Vertical Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Vertical was successfully created.");
    }

    @When("I create new Body saving as \"([^\"]*)\"$")
    public synchronized void i_create_body(String ecBodyValue) {

        JSONObject recordsList = restController.requestProcess("addBody","createBody", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String ShortName = (String) recordsList.get("shortName");
        String Name = (String) recordsList.get("name");
        String Description = (String) recordsList.get("description");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecBodyValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecBodyValue + "_SHORTNAME", ShortName);
        ExecutionContextHandler.setExecutionContextValueByKey(ecBodyValue + "_NAME", Name);
        ExecutionContextHandler.setExecutionContextValueByKey(ecBodyValue + "_DESCRIPTION", Description);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Body: " +
                "<br>" + "Body Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Body Short Name: " + "<font color='red'><b>" + ShortName + "</font></b>" +
                "<br>" + "Body Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "<br>" + "Body Description: " + "<font color='red'><b>" + Description + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Body was successfully created.");
    }

    @When("I create new Paper with CBA \"([^\"]*)\" saving as \"([^\"]*)\"$")
    public void i_create_paper(Boolean isCBA, String ecPaperValue) {

        JSONObject recordsList = restController.requestProcess("addPaper","createPaper", String.valueOf(isCBA), null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String ShortName = (String) recordsList.get("shortName");
        String Name = (String) recordsList.get("name");
        String Description = (String) recordsList.get("description");
        Boolean IsCBA = (Boolean) recordsList.get("isCba");
        Long TimeInHours = (Long) recordsList.get("timeInHours");
        String ExamSchedule = (String) recordsList.get("examSchedule");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecPaperValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecPaperValue + "_SHORTNAME", ShortName);
        ExecutionContextHandler.setExecutionContextValueByKey(ecPaperValue + "_NAME", Name);
        ExecutionContextHandler.setExecutionContextValueByKey(ecPaperValue + "_DESCRIPTION", Description);
        ExecutionContextHandler.setExecutionContextValueByKey(ecPaperValue + "_ISCBA", String.valueOf(IsCBA));
        ExecutionContextHandler.setExecutionContextValueByKey(ecPaperValue + "_TIMEINHOURS", String.valueOf(TimeInHours));
        ExecutionContextHandler.setExecutionContextValueByKey(ecPaperValue + "_EXAMSCHEDULE", ExamSchedule);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Paper: " +
                "<br>" + "Paper Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Paper Short Name: " + "<font color='red'><b>" + ShortName + "</font></b>" +
                "<br>" + "Paper Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "<br>" + "Paper Description: " + "<font color='red'><b>" + Description + "</font></b>" +
                "<br>" + "Paper Is CBA: " + "<font color='red'><b>" + IsCBA + "</font></b>" +
                "<br>" + "Paper Time in Hours: " + "<font color='red'><b>" + TimeInHours + "</font></b>" +
                "<br>" + "Paper Exam Schedule: " + "<font color='red'><b>" + ExamSchedule + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Paper was successfully created.");
    }

    @When("I create new Level saving as \"([^\"]*)\"$")
    public void i_create_level(String ecLevelValue) {

        JSONObject recordsList = restController.requestProcess("addLevel","createLevel", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String ShortName = (String) recordsList.get("shortName");
        String Name = (String) recordsList.get("name");
        String Description = (String) recordsList.get("description");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecLevelValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecLevelValue + "_SHORTNAME", ShortName);
        ExecutionContextHandler.setExecutionContextValueByKey(ecLevelValue + "_NAME", Name);
        ExecutionContextHandler.setExecutionContextValueByKey(ecLevelValue + "_DESCRIPTION", Description);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Level: " +
                "<br>" + "Level Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Level Short Name: " + "<font color='red'><b>" + ShortName + "</font></b>" +
                "<br>" + "Level Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "<br>" + "Level Description: " + "<font color='red'><b>" + Description + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Level was successfully created.");
    }

    @When("I link Body to Levels")
    public void i_link_body_to_levels() {

        JSONObject recordsList = restController.requestProcess("linkBodyToLevels","linkBodyToLevels", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String BodyReference = TestParametersController.checkIfSpecialParameter("EC_BODY_REFERENCE");

        assertEquals(Reference,BodyReference);

        /*Report log with Json object values*/
        Reporter.log("<pre>" + "Response Reference: [" + Reference + "] is equal to Body Reference: [" + BodyReference + "]" + "</pre>");

        BPPLogManager.getLogger().info("Body was successfully linked to Level.");
    }

    @When("I change Paper Body")
    public void i_change_paper_body() {

        JSONObject recordsList = restController.requestProcess("changePaperBody","changePaperBody", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String PaperReference = TestParametersController.checkIfSpecialParameter("EC_PAPER_REFERENCE");

        assertEquals(Reference,PaperReference);

        /*Report log with Json object values*/
        Reporter.log("<pre>" + "Response Reference: [" + Reference + "] is equal to Paper Reference: [" + PaperReference + "]" + "</pre>");

        BPPLogManager.getLogger().info("Paper's Body was successfully changed.");
    }

    @When("I link Paper to Levels")
    public void i_link_paper_to_levels() {

        JSONObject recordsList = restController.requestProcess("linkPaperToLevels","linkPaperToLevels", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String PaperReference = TestParametersController.checkIfSpecialParameter("EC_PAPER_REFERENCE");

        assertEquals(Reference,PaperReference);

        /*Report log with Json object values*/
        Reporter.log("<pre>" + "Response Reference: [" + Reference + "] is equal to Paper Reference: [" + PaperReference + "]" + "</pre>");

        BPPLogManager.getLogger().info("Paper was successfully linked to Level.");
    }

    @When("I create new Region saving as \"([^\"]*)\"$")
    public void i_create_region(String ecRegionValue) {

        JSONObject recordsList = restController.requestProcess("addRegion","createRegion", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Name = (String) recordsList.get("name");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecRegionValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecRegionValue + "_NAME", Name);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Region: " +
                "<br>" + "Region Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Region Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Region was successfully created.");
    }

    @When("I create new Location saving as \"([^\"]*)\"$")
    public void i_create_location(String ecLocationValue) {

        JSONObject recordsList = restController.requestProcess("addLocation","createLocation", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Name = (String) recordsList.get("name");
        String AddressLine1 = (String) recordsList.get("addressLine1");
        String AddressLine2 = (String) recordsList.get("addressLine2");
        String AddressLine3 = (String) recordsList.get("addressLine3");
        String PostCode = (String) recordsList.get("postcode");
        String City = (String) recordsList.get("city");
        String CountryCode = (String) recordsList.get("countryCode");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecLocationValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecLocationValue + "_NAME", Name);
        ExecutionContextHandler.setExecutionContextValueByKey(ecLocationValue + "_ADDRESS_LINE_ONE", AddressLine1);
        ExecutionContextHandler.setExecutionContextValueByKey(ecLocationValue + "_ADDRESS_LINE_TWO", AddressLine2);
        ExecutionContextHandler.setExecutionContextValueByKey(ecLocationValue + "_ADDRESS_LINE_THREE", AddressLine3);
        ExecutionContextHandler.setExecutionContextValueByKey(ecLocationValue + "_POST_CODE", PostCode);
        ExecutionContextHandler.setExecutionContextValueByKey(ecLocationValue + "_CITY", City);
        ExecutionContextHandler.setExecutionContextValueByKey(ecLocationValue + "_COUNTRY_CODE", CountryCode);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Location: " +
                "<br>" + "Location Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Location Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "<br>" + "Location Address Line 1: " + "<font color='red'><b>" + AddressLine1 + "</font></b>" +
                "<br>" + "Location Address Line 2: " + "<font color='red'><b>" + AddressLine2 + "</font></b>" +
                "<br>" + "Location Address Line 3: " + "<font color='red'><b>" + AddressLine3 + "</font></b>" +
                "<br>" + "Location Post Code: " + "<font color='red'><b>" + PostCode + "</font></b>" +
                "<br>" + "Location Coty: " + "<font color='red'><b>" + City + "</font></b>" +
                "<br>" + "Location Country Code: " + "<font color='red'><b>" + CountryCode + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Location was successfully created.");
    }

    @When("I create new Session Duration with Allowed for CBA \"([^\"]*)\" saving as \"([^\"]*)\"$")
    public void i_create_session_duration(Boolean allowedForCba, String ecSessionDurationValue) {

        JSONObject recordsList = restController.requestProcess("addSessionDuration","createSessionDuration", String.valueOf(allowedForCba), null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Description = (String) recordsList.get("description");
        Long DateCount = (Long) recordsList.get("dateCount");
        Boolean AllowedForCBA = (Boolean) recordsList.get("allowedForCba");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecSessionDurationValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecSessionDurationValue + "_DESCRIPTION", Description);
        ExecutionContextHandler.setExecutionContextValueByKey(ecSessionDurationValue + "_DATE_COUNT", String.valueOf(DateCount));
        ExecutionContextHandler.setExecutionContextValueByKey(ecSessionDurationValue + "_ALLOWED_FOR_CBA", String.valueOf(AllowedForCBA));


        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Session Duration: " +
                "<br>" + "Session Duration Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Session Duration Description: " + "<font color='red'><b>" + Description + "</font></b>" +
                "<br>" + "Session Duration Date Count: " + "<font color='red'><b>" + DateCount + "</font></b>" +
                "<br>" + "Session Duration Allowed For CBA: " + "<font color='red'><b>" + AllowedForCBA + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Session Duration was successfully created.");
    }

    @When("I create new Pricing Matrix saving as \"([^\"]*)\"$")
    public void i_create_pricing_matrix(String ecPricingMatrixValue) {

        JSONObject recordsList = restController.requestProcess("addPricingMatrix","createPricingMatrix", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecPricingMatrixValue + "_REFERENCE", Reference);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Pricing Matrix: " +
                "<br>" + "Pricing Matrix Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Pricing Matrix was successfully created.");
    }

    @When("I create new Prices saving as \"([^\"]*)\"$")
    public void i_create_prices(String ecPricesValue) {

        JSONObject recordsList = restController.requestProcess("addPrices","createPrices", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecPricesValue + "_REFERENCE", Reference);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Prices: " +
                "<br>" + "Pricing Matrix Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Prices was successfully created for Pricing Matrix.");
    }

    @When("I create new Digital Content with Content Type \"([^\"]*)\" and Target Platform \"([^\"]*)\" saving as \"([^\"]*)\"$")
    public void i_create_digital_content(String contentType, String targetPlatform,String ecDigitalContentValue) {

        JSONObject recordsList = restController.requestProcess("addDigitalContent","createDigitalContent", contentType, targetPlatform);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Name = (String) recordsList.get("name");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecDigitalContentValue + "_REFERENCE", Reference);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Digital Content: " +
                "<br>" + "Digital Content Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Digital Content was successfully created.");
    }

    @When("I create new University Programmes saving as \"([^\"]*)\"$")
    public void i_create_university_programmes(String ecUniversityProgrammesValue) {

        JSONObject recordsList = restController.requestProcess("addUniversityProgrammes","createProgramme", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Code = (String) recordsList.get("code");
        String Name = (String) recordsList.get("name");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecUniversityProgrammesValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecUniversityProgrammesValue + "_PROGRAMME_CODE", Code);
        ExecutionContextHandler.setExecutionContextValueByKey(ecUniversityProgrammesValue + "_PROGRAMME_NAME", Name);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>University Programmes: " +
                "<br>" + "University Programmes Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "University Programmes Code: " + "<font color='red'><b>" + Code + "</font></b>" +
                "<br>" + "University Programmes Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("University Programme was successfully created.");
    }

    @When("I create new Programme Cohorts saving as \"([^\"]*)\"$")
    public void i_create_programme_cohorts(String ecProgrammeCohortsValue) {

        JSONObject recordsList = restController.requestProcess("addProgrammeCohort","createCohort", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Name = (String) recordsList.get("name");
        String StartTeachingDate = (String) recordsList.get("startTeachingDate");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecProgrammeCohortsValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecProgrammeCohortsValue + "_NAME", Name);
        ExecutionContextHandler.setExecutionContextValueByKey(ecProgrammeCohortsValue + "_START_TEACHING_DATE", StartTeachingDate);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Programme Cohort: " +
                "<br>" + "Programme Cohort Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Programme Cohort Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "<br>" + "Programme Cohort Start Teaching Date: " + "<font color='red'><b>" + StartTeachingDate + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Programme Cohort was successfully created.");
    }

    @When("I create new Module Sections with Timetabled checkbox set as \"([^\"]*)\" and Group Requirements set as \"([^\"]*)\" saving as \"([^\"]*)\"$")
    public void i_create_module_sections(String timeTabled, String checkBox, String ecModuleSectionValue) {

        JSONObject recordsList = restController.requestProcess("addModuleSections","createModule", String.valueOf(timeTabled), String.valueOf(checkBox));

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Name = (String) recordsList.get("name");
        String TermCode = (String) recordsList.get("termCode");
        Boolean TimeTabled = (Boolean) recordsList.get("timetabled");
        Boolean GroupRequirementCohort = (Boolean) recordsList.get("groupRequirementCohort");
        Boolean GroupRequirementMode = (Boolean) recordsList.get("groupRequirementMode");
        Boolean GroupRequirementLocation = (Boolean) recordsList.get("groupRequirementLocation");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecModuleSectionValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecModuleSectionValue + "_NAME", Name);
        ExecutionContextHandler.setExecutionContextValueByKey(ecModuleSectionValue + "_TERM_CODE", TermCode);
        ExecutionContextHandler.setExecutionContextValueByKey(ecModuleSectionValue + "_TIMETABLED", String.valueOf(TimeTabled));
        ExecutionContextHandler.setExecutionContextValueByKey(ecModuleSectionValue + "_GROUP_REQUIREMENT_COHORT", String.valueOf(GroupRequirementCohort));
        ExecutionContextHandler.setExecutionContextValueByKey(ecModuleSectionValue + "_GROUP_REQUIREMENT_MODE", String.valueOf(GroupRequirementMode));
        ExecutionContextHandler.setExecutionContextValueByKey(ecModuleSectionValue + "_REQUIREMENT_LOCATION", String.valueOf(GroupRequirementLocation));

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Module Sections: " +
                "<br>" + "Module Sections Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Module Sections Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "<br>" + "Module Sections Term Code: " + "<font color='red'><b>" + TermCode + "</font></b>" +
                "<br>" + "Module Sections Timetabled: " + "<font color='red'><b>" + TimeTabled + "</font></b>" +
                "<br>" + "Module Sections Group Requirement Cohort: " + "<font color='red'><b>" + GroupRequirementCohort + "</font></b>" +
                "<br>" + "Module Sections Group Requirement Mode: " + "<font color='red'><b>" + GroupRequirementMode + "</font></b>" +
                "<br>" + "Module Sections Group Requirement Location: " + "<font color='red'><b>" + GroupRequirementLocation + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Module Section was successfully created.");
    }

    @When("I create new Stock Site saving as \"([^\"]*)\"$")
    public void i_create_stock_site(String ecStockSiteValue) {

        JSONObject recordsList = restController.requestProcess("addStockSites","createStockSite", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Name = (String ) recordsList.get("name");
        String AddressLine1 = (String ) recordsList.get("addressLine1");
        String AddressLine2 = (String ) recordsList.get("addressLine2");
        String AddressLine3 = (String ) recordsList.get("addressLine3");
        String PostCode = (String ) recordsList.get("postcode");
        String City = (String ) recordsList.get("city");
        String CountryCode = (String ) recordsList.get("countryCode");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecStockSiteValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecStockSiteValue + "_NAME", Name);
        ExecutionContextHandler.setExecutionContextValueByKey(ecStockSiteValue + "_ADDRESS_LINE_ONE", AddressLine1);
        ExecutionContextHandler.setExecutionContextValueByKey(ecStockSiteValue + "_ADDRESS_LINE_TWO", AddressLine2);
        ExecutionContextHandler.setExecutionContextValueByKey(ecStockSiteValue + "_ADDRESS_LINE_THREE", AddressLine3);
        ExecutionContextHandler.setExecutionContextValueByKey(ecStockSiteValue + "_POST_CODE", PostCode);
        ExecutionContextHandler.setExecutionContextValueByKey(ecStockSiteValue + "_CITY", City);
        ExecutionContextHandler.setExecutionContextValueByKey(ecStockSiteValue + "_COUNTRY_CODE", CountryCode);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Stock Site: " +
                "<br>" + "Stock Site Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Stock Site Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "<br>" + "Stock Site Address Line 1: " + "<font color='red'><b>" + AddressLine1 + "</font></b>" +
                "<br>" + "Stock Site Address Line 2: " + "<font color='red'><b>" + AddressLine2 + "</font></b>" +
                "<br>" + "Stock Site Address Line 3: " + "<font color='red'><b>" + AddressLine3 + "</font></b>" +
                "<br>" + "Stock Site Post Code: " + "<font color='red'><b>" + PostCode + "</font></b>" +
                "<br>" + "Stock Site Coty: " + "<font color='red'><b>" + City + "</font></b>" +
                "<br>" + "Stock Site Country Code: " + "<font color='red'><b>" + CountryCode + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Stock Site was successfully created.");
    }

    @When("I create new Material Type with all Checkboxes \"([^\"]*)\"  saving as \"([^\"]*)\"$")
    public void i_create_material_type(Boolean checkBoxes, String ecMaterialTypeValue) {

        JSONObject recordsList = restController.requestProcess("addMaterialType","createMaterialType", String.valueOf(checkBoxes), null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Name = (String) recordsList.get("name");
        String Description = (String) recordsList.get("description");
        Boolean IsExpiryDateRequired = (Boolean) recordsList.get("isExpiryDateRequired");
        Boolean IsIsbnRequired = (Boolean) recordsList.get("isIsbnRequired");
        Boolean IsPriceRequired = (Boolean) recordsList.get("isPriceRequired");
        Boolean IsWeightRequired = (Boolean) recordsList.get("isWeightRequired");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecMaterialTypeValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecMaterialTypeValue + "_NAME", Name);
        ExecutionContextHandler.setExecutionContextValueByKey(ecMaterialTypeValue + "_DESCRIPTION", Description);
        ExecutionContextHandler.setExecutionContextValueByKey(ecMaterialTypeValue + "_IS_EXPIRY_DATE_REQUIRED", String.valueOf(IsExpiryDateRequired));
        ExecutionContextHandler.setExecutionContextValueByKey(ecMaterialTypeValue + "_IS_ISBN_REQUIRED", String.valueOf(IsIsbnRequired));
        ExecutionContextHandler.setExecutionContextValueByKey(ecMaterialTypeValue + "_IS_PRICE_REQUIRED", String.valueOf(IsPriceRequired));
        ExecutionContextHandler.setExecutionContextValueByKey(ecMaterialTypeValue + "_IS_WEIGHT_REQUIRED", String.valueOf(IsWeightRequired));

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Material Type: " +
                "<br>" + "Material Type Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Material Type Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "<br>" + "Material Type Description: " + "<font color='red'><b>" + Description + "</font></b>" +
                "<br>" + "Material Type Is Expiry Date Required: " + "<font color='red'><b>" + IsExpiryDateRequired + "</font></b>" +
                "<br>" + "Material Type Is Isbn Required: " + "<font color='red'><b>" + IsIsbnRequired + "</font></b>" +
                "<br>" + "Material Type Is Price Required: " + "<font color='red'><b>" + IsPriceRequired + "</font></b>" +
                "<br>" + "Material Type Is Weight Required: " + "<font color='red'><b>" + IsWeightRequired + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Material Type was successfully created.");
    }

    @When("I create new Clients saving as \"([^\"]*)\"$")
    public void i_create_clients(String ecClientsValue) {

        JSONObject recordsList = restController.requestProcess("addClients","createClient", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Name = TestParametersController.checkIfSpecialParameter(String.valueOf(recordsList.get("name")));

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecClientsValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecClientsValue + "_NAME", Name);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Clients: " +
                "<br>" + "Clients Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Clients Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Client was successfully created.");
    }

    @When("I create new Streams saving as \"([^\"]*)\"$")
    public void i_create_streams(String ecStreamsValue) {

        JSONObject recordsList = restController.requestProcess("addStreams","createStream", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Name = TestParametersController.checkIfSpecialParameter(String.valueOf(recordsList.get("name")));

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecStreamsValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecStreamsValue + "_NAME", Name);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Streams: " +
                "<br>" + "Streams Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Streams Name: " + "<font color='red'><b>" + Name + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Stream was successfully created.");
    }

    @When("I create new Deactivation Reason with all Checkboxes \"([^\"]*)\" saving as \"([^\"]*)\"$")
    public void i_create_deactivation_reason(Boolean preventReactivation, String ecDeactivationReasonValue) {

        JSONObject recordsList = restController.requestProcess("addDeactivationReason","createDeactivationReason", String.valueOf(preventReactivation), null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String Description = (String) recordsList.get("description");
        Boolean PreventReactivation = (Boolean) recordsList.get("preventReactivation");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecDeactivationReasonValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecDeactivationReasonValue + "_DESCRIPTION", Description);
        ExecutionContextHandler.setExecutionContextValueByKey(ecDeactivationReasonValue + "_PREVENT_REACTIVATION", String.valueOf(PreventReactivation));

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Deactivation Reason: " +
                "<br>" + "Deactivation Reason Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Deactivation Reason Description: " + "<font color='red'><b>" + Description + "</font></b>" +
                "<br>" + "Deactivation Reason Prevent Reactivation: " + "<font color='red'><b>" + PreventReactivation + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Deactivation Reason was successfully created.");
    }

    @When("I create new Course saving as \"([^\"]*)\"$")
    public void i_create_course(String ecCourseValue) {

        JSONObject recordsList = restController.requestProcess("addCourse","createCourse", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecCourseValue + "_REFERENCE", Reference);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Course: " +
                "<br>" + "Course Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Course was successfully created.");
    }

    @When("I create new Instance saving as \"([^\"]*)\" and saving new session as \"([^\"]*)\"$")
    public void i_create_instance_for_course(String ecInstanceValue, String ecSessionValue) {

        JSONObject recordsList = restController.requestProcess("addInstance","createInstance", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        JSONArray sessionsArray = (JSONArray) recordsList.get("sessions");
        JSONObject sessionsObj = (JSONObject) sessionsArray.get(0);
        String SessionReference = (String) sessionsObj.get("reference");
        String Status = (String) recordsList.get("status");
        Integer Capacity = (Integer) recordsList.get("capacity");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecInstanceValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecSessionValue + "_REFERENCE", SessionReference);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Instance: " +
                "<br>" + "Instance Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Instance Status: " + "<font color='red'><b>" + Status + "</font></b>" +
                "<br>" + "Instance Capacity: " + "<font color='red'><b>" + Capacity + "</font></b>" +
                "<br>" + "Session Reference: " + "<font color='red'><b>" + SessionReference + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Instance was successfully created.");
    }

    @When("I change Instance Capacity with Capacity \"([^\"]*)\" saving as \"([^\"]*)\"$")
    public void i_change_instance_capacity(Integer capacity, String ecInstanceCapacityValue) {

        JSONObject recordsList = restController.requestProcess("changeInstanceCapacity","updateInstance", String.valueOf(capacity), null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        Long Capacity = (Long) recordsList.get("capacity");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecInstanceCapacityValue + "_CAPACITY", String.valueOf(Capacity));

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Instance: " +
                "<br>" + "Instance Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Instance Capacity: " + "<font color='red'><b>" + Capacity + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Instance Capacity was successfully changed.");
    }

    @When("I get Instance Sessions saving as \"([^\"]*)\"$")
    public void i_get_instance_sessions(String ecSessionTimingValue) {

        Response Response = restController.postRequest(propertiesHelper.getProperties().getProperty("pf_request_link"),
                restController.processPropertiesPF("ProductFactory/getInstanceSessions", null, null),
                ProductFactoryAuthentication.getInstance().requestHeaderSpecification()
        );

        String ResponseString = Response.getBody().asString();

        /*Get JSON object values*/
        JSONObject recordsObject = new Utilities().getResponseProperty(Response);
        JSONObject recordsData = (JSONObject) recordsObject.get("data");
        JSONArray recordsArray = (JSONArray) recordsData.get("sessions");
        JSONObject recordsList = (JSONObject) recordsArray.get(0);
        JSONArray recordsArrayList = (JSONArray) recordsList.get("timings");
        JSONObject item = (JSONObject) recordsArrayList.get(0);
        String timingReference = (String) item.get("reference");
        String Reference = (String) recordsList.get("reference");

        /*Get Json object values*/
        try {
            Reference = timingReference;
        } catch (Exception e) {
            BPPLogManager.getLogger().error(Tools.getStackTrace(e));
            Reporter.fail("<br>" + Tools.getStackTrace(e) + "</br>");
            throw new RuntimeException("Can't proceed with response: " + Reference + " Please check -corespondent.json- file. Possible duplication or empty strings");
        }

        assertThat(Reference, matchesPattern("([a-z0-9-]){36}"));
        assertThat(ResponseString, containsString("session"));

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecSessionTimingValue + "_REFERENCE", Reference);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Session Timing: " +
                "<br>" + "Session Timing Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Session Timing Reference timing was successfully received.");
    }

    @When("I change Session Timings saving as \"([^\"]*)\"$")
    public void i_change_session_timings(String ecSessionValue) {

        JSONObject recordsList = restController.requestProcess("changeSessionTimings","changeSessionTimings", null, null);

        /*Get JSON object values*/
        JSONArray recordsArrayList = (JSONArray) recordsList.get("timings");
        JSONObject item = (JSONObject) recordsArrayList.get(0);
        String sessionDate = (String) item.get("sessionDate");
        String startTime = (String) item.get("startTime");
        String endTime = (String) item.get("endTime");
        String Reference = (String) recordsList.get("reference");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecSessionValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecSessionValue + "_DATE", sessionDate);
        ExecutionContextHandler.setExecutionContextValueByKey(ecSessionValue + "_START_TIME", String.valueOf(startTime));
        ExecutionContextHandler.setExecutionContextValueByKey(ecSessionValue + "_END_TIME", String.valueOf(endTime));

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Session: " +
                "<br>" + "Session : " + "<font color='red'><b> Changed successfully</font></b>" +
                "<br>" + "Session Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Session Date: " + "<font color='red'><b>" + sessionDate + "</font></b>" +
                "<br>" + "Session Start Time: " + "<font color='red'><b>" + startTime + "</font></b>" +
                "<br>" + "Session End Time: " + "<font color='red'><b>" + endTime + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Session Timing was successfully changed.");
    }

    @When("I get Instance Steps saving as \"([^\"]*)\"$")
    public void i_get_instance_steps(String ecStepValue) {

        Response Response = restController.postRequest(propertiesHelper.getProperties().getProperty("pf_request_link"),
                restController.processPropertiesPF("ProductFactory/getInstanceSteps", null, null),
                ProductFactoryAuthentication.getInstance().requestHeaderSpecification()
        );

        String ResponseString = Response.getBody().asString();

        /*Get JSON object values*/
        JSONObject recordsObject = new Utilities().getResponseProperty(Response);
        JSONObject recordsData = (JSONObject) recordsObject.get("data");
        JSONArray recordsArray = (JSONArray) recordsData.get("steps");
        JSONObject recordsList = (JSONObject) recordsArray.get(0);
        String Reference = (String) recordsList.get("reference");
        String dueDate = (String) recordsList.get("dueDate");
        Long stepNumber = (Long) recordsList.get("stepNumber");

        /*Get Json object values*/
        try {
            Reference = String.valueOf(recordsList.get("reference"));;
        } catch (Exception e) {
            BPPLogManager.getLogger().error(Tools.getStackTrace(e));
            Reporter.fail("<br>" + Tools.getStackTrace(e) + "</br>");
            throw new RuntimeException("Can't proceed with response: " + Reference + " Please check -corespondent.json- file. Possible duplication or empty strings");
        }

        assertThat(Reference, matchesPattern("([a-z0-9-]){36}"));
        assertThat(ResponseString, containsString("steps"));

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecStepValue + "_REFERENCE", Reference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecStepValue + "_DUE_DATE", dueDate);
        ExecutionContextHandler.setExecutionContextValueByKey(ecStepValue + "_STEPNUMBER", String.valueOf(stepNumber));

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Steps: " +
                "<br>" + "Step Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Step Due Date: " + "<font color='red'><b>" + dueDate + "</font></b>" +
                "<br>" + "Step Number: " + "<font color='red'><b>" + stepNumber + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Step Reference was successfully received.");
    }

    @When("I change Instance Steps saving as \"([^\"]*)\"$")
    public void i_change_instance_steps(String ecStepValue) {

        JSONObject recordsList = restController.requestProcess("changeStepDueDate","changeStepDueDate", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String dueDate = (String) recordsList.get("dueDate");
        Long stepNumber = (Long) recordsList.get("stepNumber");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecStepValue + "_DUE_DATE", dueDate);
        ExecutionContextHandler.setExecutionContextValueByKey(ecStepValue +"_STEPNUMBER", String.valueOf(stepNumber));

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Changed Steps: " +
                "<br>" + "Step Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Step Due Date: " + "<font color='red'><b>" + dueDate + "</font></b>" +
                "<br>" + "Step Number: " + "<font color='red'><b>" + stepNumber + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Steps was successfully changed.");
    }

    @When("I calculate Course Price saving as \"([^\"]*)\"$")
    public void i_calculate_course_price(String ecPriceValue) {

        JSONObject recordsList = restController.requestProcess("calculateCoursePrice","calculateCoursePrice", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        Long price = (Long) recordsList.get("price");
        String status = (String) recordsList.get("status");


        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecPriceValue, String.valueOf(price));

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Price: " +
                "<br>" + "Course Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Course Price: " + "<font color='red'><b>" + price + "</font></b>" +
                "<br>" + "Course Status: " + "<font color='red'><b>" + status + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Course Price was successfully calculated.");
    }

    @When("I activate Course saving as \"([^\"]*)\"$")
    public void i_activate_course(String ecActivateCourseValue) {

        JSONObject recordsList = restController.requestProcess("activateCourse","activateCourse", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String status = (String) recordsList.get("status");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecActivateCourseValue + "_STATUS", status);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Course Activation: " +
                "<br>" + "Course Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Course Activation Status: " + "<font color='red'><b>" + status + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Course was successfully activated.");
    }

    @When("I activate Instance saving as \"([^\"]*)\"$")
    public void i_activate_instance(String ecActivateInstanceValue) {

        JSONObject recordsList = restController.requestProcess("activateInstance","activateInstance", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");
        String status = (String) recordsList.get("status");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecActivateInstanceValue + "_STATUS", status);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Instance Activation: " +
                "<br>" + "Instance Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Instance Activation Status: " + "<font color='red'><b>" + status + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Instance was successfully activated.");
    }

    @When("I create Course Bulk Operation saving as \"([^\"]*)\"$")
    public void i_create_course_bulk_operation(String ecCourseBulkOperationValue) {

        JSONObject recordsList = restController.requestProcess("createCourseBulkOperation","createCourseBulkOperation", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecCourseBulkOperationValue + "_REFERENCE", Reference);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Course Bulk Operation: " +
                "<br>" + "Course Bulk Operation Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Course Bulk Operation was successfully created.");
    }

    @When("I execute Bulk Web Publishing with publish to WEB \"([^\"]*)\" saving course as \"([^\"]*)\" and instance as \"([^\"]*)\"$")
    public void i_execute_bulk_web_publishing(Boolean makeAvailable, String ecCourseAvailableValue, String ecInstanceAvailableValue) {

        JSONObject recordsList = restController.requestProcess("bulkWebPublish","courseBulkOperationWebPublish", String.valueOf(makeAvailable), null);

        /*Get Json object values*/
        JSONArray coursesArray = (JSONArray) recordsList.get("courses");
        JSONObject coursesFirstArray = (JSONObject) coursesArray.get(0);
        Boolean courseIncluded = (Boolean) coursesFirstArray.get("included");
        JSONObject coursesCourseObject = (JSONObject) coursesFirstArray.get("course");
        Boolean courseAvailableOnWEB = (Boolean) coursesCourseObject.get("availableOnWebsite");
        String courseStatus = (String) coursesCourseObject.get("status");
        JSONArray coursesInstancesArray = (JSONArray) coursesFirstArray.get("instances");
        JSONObject instancesFirstArray = (JSONObject) coursesInstancesArray.get(0);
        Boolean instanceIncluded = (Boolean) coursesFirstArray.get("included");
        JSONObject instancesObject = (JSONObject) instancesFirstArray.get("instance");
        Boolean instanceAvailableOnWEB = (Boolean) instancesObject.get("availableOnWebsite");
        String instanceStatus = (String) instancesObject.get("status");
        String Reference = (String) recordsList.get("reference");


        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecCourseAvailableValue + "_INCLUDED", String.valueOf(courseIncluded));
        ExecutionContextHandler.setExecutionContextValueByKey(ecCourseAvailableValue + "_AWAILABLE_ON_WEB", String.valueOf(courseAvailableOnWEB));
        ExecutionContextHandler.setExecutionContextValueByKey(ecCourseAvailableValue + "_STATUS",courseStatus );
        ExecutionContextHandler.setExecutionContextValueByKey(ecInstanceAvailableValue + "_INCLUDED", String.valueOf(instanceIncluded));
        ExecutionContextHandler.setExecutionContextValueByKey(ecInstanceAvailableValue + "_AWAILABLE_ON_WEB", String.valueOf(instanceAvailableOnWEB));
        ExecutionContextHandler.setExecutionContextValueByKey(ecInstanceAvailableValue + "_STATUS",instanceStatus);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Course Web Publish: " +
                "<br>" + "Course Bulk Operation Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Course Included: " + "<font color='red'><b>" + courseIncluded + "</font></b>" +
                "<br>" + "Course Available on Web: " + "<font color='red'><b>" + courseAvailableOnWEB + "</font></b>" +
                "<br>" + "Course Status: " + "<font color='red'><b>" + courseStatus + "</font></b>" +
                "<br>" + "Instance Included: " + "<font color='red'><b>" + instanceIncluded + "</font></b>" +
                "<br>" + "Instance Available on Web: " + "<font color='red'><b>" + instanceAvailableOnWEB + "</font></b>" +
                "<br>" + "Instance Status: " + "<font color='red'><b>" + instanceStatus + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Bulk Web Publish was successfully executed.");

    }

    @When("I change Material Financial Dimension saving as \"([^\"]*)\"$")
    public void i_change_material_fd(String ecMaterialFDValue) {

        JSONObject recordsList = restController.requestProcess("changeMaterialFinancialDimensions","changeMaterialFinancialDimensions", null, null);

        /*Get JSON object values*/
        String EntityFinancialDimensionReference = (String) recordsList.get("entityFinancialDimensionReference");
        String RevenueFinancialDimensionReference = (String) recordsList.get("revenueFinancialDimensionReference");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecMaterialFDValue + "_ENTITY_FINANCIAL_DIMENSION_REFERENCE", EntityFinancialDimensionReference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecMaterialFDValue + "_REVENUE_FINANCIAL_DIMENSION_REFERENCE", RevenueFinancialDimensionReference);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Change Material Financial Dimension: " +
                "<br>" + "Material Entity Financial Dimension Reference: " + "<font color='red'><b>" + EntityFinancialDimensionReference + "</font></b>" +
                "<br>" + "Material Revenue Financial Dimension Reference: " + "<font color='red'><b>" + RevenueFinancialDimensionReference + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Material Financial Dimension was successfully changed.");
    }

    @When("I change Course Financial Dimension saving as \"([^\"]*)\"$")
    public void i_change_course_fd(String ecCourseFDValue) {

        JSONObject recordsList = restController.requestProcess("changeCourseFinancialDimensions","changeCourseFinancialDimensions", null, null);

        /*Get JSON object values*/
        String EntityFinancialDimensionReference = (String) recordsList.get("entityFinancialDimensionReference");
        String RevenueFinancialDimensionReference = (String) recordsList.get("revenueFinancialDimensionReference");

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecCourseFDValue + "_ENTITY_FINANCIAL_DIMENSION_REFERENCE", EntityFinancialDimensionReference);
        ExecutionContextHandler.setExecutionContextValueByKey(ecCourseFDValue + "_REVENUE_FINANCIAL_DIMENSION_REFERENCE", RevenueFinancialDimensionReference);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Change Material Financial Dimension: " +
                "<br>" + "Material Entity Financial Dimension Reference: " + "<font color='red'><b>" + EntityFinancialDimensionReference + "</font></b>" +
                "<br>" + "Material Revenue Financial Dimension Reference: " + "<font color='red'><b>" + RevenueFinancialDimensionReference + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Material Financial Dimension was successfully changed.");
    }

    @When("I create new Material with Checkboxes set to \"([^\"]*)\" saving as \"([^\"]*)\"$")
    public void i_create_material(Boolean checkbox, String ecMaterialValue) {

        Response Response = restController.postRequest(propertiesHelper.getProperties().getProperty("pf_request_link"),
                restController.processPropertiesPF("ProductFactory/addMaterial", String.valueOf(checkbox), null),
                ProductFactoryAuthentication.getInstance().requestHeaderSpecification()
        );

        String ResponseString = Response.getBody().asString();

        /*Get JSON object values*/
        JSONObject recordsObject = new Utilities().getResponseProperty(Response);
        JSONObject recordsData = (JSONObject) recordsObject.get("data");
        JSONObject materialObj = (JSONObject) recordsData.get("createMaterial");
        String Reference = (String) materialObj.get("reference");
        Boolean isInternalMaterial = (Boolean) materialObj.get("isInternalMaterial");
        Boolean isDigitalMaterial = (Boolean) materialObj.get("isDigitalMaterial");
        Boolean isCourseMaterial = (Boolean) materialObj.get("isCourseMaterial");

        /*Get Json object values*/
        try {
            Reference = (String) materialObj.get("reference");
        } catch (Exception e) {
            BPPLogManager.getLogger().error(Tools.getStackTrace(e));
            Reporter.fail("<br>" + Tools.getStackTrace(e) + "</br>");
            throw new RuntimeException("Can't proceed with response: " + Reference + " Please check -corespondent.json- file. Possible duplication or empty strings");
        }

        assertThat(Reference, matchesPattern("([a-z0-9-]){36}"));
        assertThat(ResponseString, containsString("createMaterial"));

        /*Set EC values for JSON object values*/
        ExecutionContextHandler.setExecutionContextValueByKey(ecMaterialValue + "_REFERENCE", Reference);

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Material: " +
                "<br>" + "Material Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Material is Internal Material: " + "<font color='red'><b>" + isInternalMaterial + "</font></b>" +
                "<br>" + "Material is Digital Material: " + "<font color='red'><b>" + isDigitalMaterial + "</font></b>" +
                "<br>" + "Material is Course Material: " + "<font color='red'><b>" + isCourseMaterial + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Material was successfully created.");
    }

    @When("I create new Course Material")
    public void i_create_material_for_course() {

        Response Response = restController.postRequest(propertiesHelper.getProperties().getProperty("pf_request_link"),
                restController.processPropertiesPF("ProductFactory/" + "addCourseMaterials", null, null),
                ProductFactoryAuthentication.getInstance().requestHeaderSpecification()
        );

        String ResponseString = Response.getBody().asString();

        JSONObject recordsObject = new Utilities().getResponseProperty(Response);
        JSONObject recordsData = (JSONObject) recordsObject.get("data");
        JSONArray recordsListArray = (JSONArray) recordsData.get("createCourseMaterials");

        String Reference = null;
        String materialReference = null;

        /*Get Json object values*/
        try {
            JSONObject recordsList = (JSONObject) recordsListArray.get(0);
            JSONObject courseObj = (JSONObject) recordsList.get("course");
            Reference = (String) courseObj.get("reference");
            JSONObject materialObj = (JSONObject) recordsList.get("material");
            materialReference = (String) materialObj.get("reference");
        } catch (Exception e) {
            BPPLogManager.getLogger().error(Tools.getStackTrace(e));
            Reporter.failTryTakingScreenshot("<br>" + Tools.getStackTrace(e) + "</br>");
            JSONArray errorData = (JSONArray) recordsObject.get("errors");
            JSONObject errorArray = (JSONObject) errorData.get(0);
            String error = (String) errorArray.get("message");
            Reporter.failTryTakingScreenshot("<br>" + error + "</br>");
            throw new RuntimeException("Can't proceed with response: " + error);
        }

        assertThat(Reference, matchesPattern("([a-z0-9-]){36}"));
        assertThat(ResponseString, containsString("createCourseMaterials"));

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Course Material: " +
                "<br>" + "Course Reference: " + "<font color='red'><b>" + Reference + "</font></b>" +
                "<br>" + "Material Reference: " + "<font color='red'><b>" + materialReference + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Material was successfully linked to the Course.");
    }

    @When("I update new Course Material with Delivery set to \"([^\"]*)\"$")
    public void i_update_material_for_course(String deliveryDefault) {

        Response Response = restController.postRequest(propertiesHelper.getProperties().getProperty("pf_request_link"),
                restController.processPropertiesPF("ProductFactory/" + "UpdateJson/updateCourseMaterial", deliveryDefault, null),
                ProductFactoryAuthentication.getInstance().requestHeaderSpecification()
        );

        String Reference = null;

        String ResponseString = Response.getBody().asString();

        JSONObject recordsObject = new Utilities().getResponseProperty(Response);
        JSONObject recordsData = (JSONObject) recordsObject.get("data");
        JSONObject recordsList = (JSONObject) recordsData.get("updateCourseMaterial");

        /*Get JSON object values*/
        String DeliveryDefault = (String) recordsList.get("deliveryDefault");

        /*Get Json object values*/
        try {
            JSONObject courseObj = (JSONObject) recordsList.get("course");
            Reference = (String) courseObj.get("reference");
        } catch (Exception e) {
            BPPLogManager.getLogger().error(Tools.getStackTrace(e));
            Reporter.failTryTakingScreenshot("<br>" + Tools.getStackTrace(e) + "</br>");
            JSONArray errorData = (JSONArray) recordsObject.get("errors");
            JSONObject errorArray = (JSONObject) errorData.get(0);
            String error = (String) errorArray.get("message");
            Reporter.failTryTakingScreenshot("<br>" + error + "</br>");
            throw new RuntimeException("Can't proceed with response: " + error);
        }

        assertThat(Reference, matchesPattern("([a-z0-9-]){36}"));
        assertThat(ResponseString, containsString("updateCourseMaterial"));

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Change Course Materials: " +
                "<br>" + "Delivery method was changed to: " + "<font color='red'><b>" + DeliveryDefault + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Delivery method was successfully changed.");
    }

    @When("I link Clients to Course")
    public void i_link_clients_to_course() {

        JSONObject recordsList = restController.requestProcess("linkCourseToClients","linkCourseToClients", null, null);

        /*Get JSON object values*/
        String Reference = (String) recordsList.get("reference");

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Instance Activation: " +
                "<br>" + "Instance Reference: " + "<font color='red'><b>" + "Clients was successfully linked to Course" + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Clients was successfully linked to Course.");
    }

    @When("I create new Location without Region")
    public void i_create_location_no_region() {

        Response Response = restController.postRequest(propertiesHelper.getProperties().getProperty("pf_request_link"),
                restController.processPropertiesPF("ProductFactory/UpdateJson/addLocationNoRegion", null, null),
                ProductFactoryAuthentication.getInstance().requestHeaderSpecification()
        );

        String ResponseString = Response.getBody().asString();

        JSONObject recordsObject = new Utilities().getResponseProperty(Response);
        JSONArray errorData = (JSONArray) recordsObject.get("errors");
        JSONObject errorArray = (JSONObject) errorData.get(0);
        JSONObject errorExt = (JSONObject) errorArray.get("extensions");
        JSONArray variablePath = (JSONArray) errorExt.get("variablePath");
        String reason = (String) variablePath.get(0);

        assertThat(reason, containsString("regionReference"));

        /*Report log with Json object values*/
        Reporter.log("<pre>" +
                "<br>Location: " +
                "<br>" + "Location can't be created without: " + "<font color='red'><b>" + reason + "</font></b>" +
                "</pre>");

        BPPLogManager.getLogger().info("Location was not created. As " + reason + " is empty");
    }

}

