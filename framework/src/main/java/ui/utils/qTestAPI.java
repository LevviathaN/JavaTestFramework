package ui.utils;

import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.jooq.tools.json.JSONArray;
import org.jooq.tools.json.JSONObject;
import org.jooq.tools.json.JSONParser;
import org.jooq.tools.json.ParseException;
import org.openqa.selenium.remote.RemoteWebDriver;

import java.io.FileReader;
import java.io.IOException;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import static io.restassured.RestAssured.given;

public class qTestAPI {

    /**@TestRunStatusUpdate method used to update the Test Run status in qTest to Passed or Failed. It has a constructor that contains:
     * @param test - declares the current test name that is finished and should be updated in qTest.
     * @param Result - defines the Passed or Failed status to send through JSON POST request for specific test
     * @param Code - according to qTest API should send 601 - for Passed, 602 for Failed etc.
     * @param TestRunID - ID of current test that has been finished. This ID is defined by getTestRunIDfromSuite method
     * @param errorInformation - send error to show in qtest**/

    public static synchronized void TestRunStatusUpdate(String test, String Result, int Code, String TestRunID, String errorInformation) throws IOException, ParseException {

        /**This block is created to update Execution History with Browser Name and Version
         * @param browserName - used to get Name of the Current Browser
         * @param browserVersion - used to get Version of the Current Browser
         * @param browserInformation - Variable to get Browser Type and Version. Currently this information is sent to qTest execution logs to Operating System column**/

        String browserInformation = "";
        if (!(DriverProvider.instance.get() == null)) {
            String browserName = DriverProvider.getCurrentBrowserName();
            String browserVersion = ((RemoteWebDriver) DriverProvider.getDriver()).getCapabilities().getVersion();
            browserInformation = browserName.toUpperCase() + " " + browserVersion;
        } else {
            BPPLogManager.getLogger().info("WebDriver instance not found. If UI test is executed, please check browser configuration");
        }

        /**This block is created to generate specific data in Date/Time/Time Zone format
         * @param formattedDate - generate current Date in (YYYY-MM-ddThh:mm:ssXXX) format
         * @param currentDateTime - generate current Date, Time and TimeZone format.
         * Example is currentDateTime = (2018-04-25T11:22:33+03:00)**/

        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("YYYY-MM-dd'T'hh:mm:ssXXX");
        String formattedDate = ZonedDateTime.now().format(dateFormat);
        String currentDateTime = (formattedDate);

        /**@param bearerToken - is Token of qTest user that should be used to create a GET/POST requests
         * Example - (Bearer #######-####-####-####-########) This Token is located inside Resources -> API & SDK in qTest
         * @param ProjectID - Declares inside configuration.properties file. This variable is located in the URL of the qTest Web Application.**/

        String bearerToken = FileIO.getConfigProperty("QTest_Bearer_token");
        String ProjectID = FileIO.getConfigProperty("QTest_Test_ProjectID");

        // request URL
        String baseURI = "https://bpp.qtestnet.com/api/v3/projects/" + ProjectID + "/test-runs/" + TestRunID + "/test-logs";

        // define  json file
        Object obj = new JSONParser().parse(new FileReader("src/main/resources/api/requestBody/qTestGetTestRunIDfromSuite.json"));

        // typecasting obj to JSONObject
        JSONObject jo = new JSONObject((Map) obj);

        // getting status
        Map status = ((Map)jo.get("status"));

        // iterating status Map
        Iterator<Map.Entry> itr1 = status.entrySet().iterator();
        while (itr1.hasNext()) {
            Map.Entry pair = itr1.next();
        }

        // getting property values
        JSONArray property = (JSONArray) jo.get("properties");

        // iterating property values
        Iterator itr2 = property.iterator();
        while (itr2.hasNext())
        {
            itr1 = ((Map) itr2.next()).entrySet().iterator();
            while (itr1.hasNext()) {
                Map.Entry pair = itr1.next();
            }
        }

        status.put("name",Result);
        status.put("id", Code);
        jo.put("exe_start_date", currentDateTime);
        jo.put("exe_end_date", currentDateTime);
        ((JSONObject) property.get(0)).put("field_value", errorInformation);
        ((JSONObject) property.get(1)).put("field_value", browserInformation);

        Response response = given()
                .header("Authorization", bearerToken)
                .contentType(ContentType.JSON)
                .baseUri(baseURI)
                .when()
                .body(jo)
                .post();

        if (response.getStatusCode() == 201) {
            BPPLogManager.getLogger().info("Response code: " + response.getStatusCode() + " - Test Run Status was successfully updated for " + test + " test");
        } else if (response.getStatusCode() == 400) {
            BPPLogManager.getLogger().error("Response code: " + response.getStatusCode() + " - Bad Request. Test Run Status wasn't updated for " + test + " test");
            response.prettyPrint();
        } else if (response.getStatusCode() == 500) {
            BPPLogManager.getLogger().error("Response code: " + response.getStatusCode() + " - Internal Server Error. Test Run Status wasn't updated for " + test + " test");
            response.prettyPrint();
        } else {
            BPPLogManager.getLogger().error("Response code: " + response.getStatusCode() + " Test Run Status wasn't updated for " + test + " test");
            response.prettyPrint();
        }
    }

    /**@getTestRunIDfromSuite is a GET method. It is used to get Test Run ID's for each test run inside the specific suite.
     * ProjectID and TestSuiteID are variables that are declared inside configuration.properties file and can be changed
     * according to project and TestSuite you are working with.
     * **/

    public static synchronized Map<String, String> getTestRunIDfromSuite() {

        String TestSuiteID = null;
        String bearerToken = FileIO.getConfigProperty("QTest_Bearer_token");
        String ProjectID = FileIO.getConfigProperty("QTest_Test_ProjectID");

        if(System.getProperty("qtestSuite").equals("PF")) {
            TestSuiteID = FileIO.getConfigProperty("QTest_Test_PF_SuiteID");
        } else if (System.getProperty("qtestSuite").equals("BE")) {
            TestSuiteID = FileIO.getConfigProperty("QTest_Test_BE_SuiteID");
        } else if (System.getProperty("qtestSuite").equals("SF")) {
            TestSuiteID = FileIO.getConfigProperty("QTest_Test_SF_SuiteID");
        } else if (System.getProperty("qtestSuite").equals("BA")) {
            TestSuiteID = FileIO.getConfigProperty("QTest_Test_BA_SuiteID");
        } else if (System.getProperty("qtestSuite").equals("MOBILE_BE")) {
            TestSuiteID = FileIO.getConfigProperty("QTest_Test_MOBILE_BE_SuiteID");
        }

        String baseURI = "https://bpp.qtestnet.com/api/v3/projects/" + ProjectID + "/test-suites/" + TestSuiteID + "/test-runs";
        Response response = given()
                .header("Authorization", bearerToken)
                .baseUri(baseURI)
                .when()
                .get();

        JsonPath jsonPathEvaluator = response.jsonPath();
        List<String> id = jsonPathEvaluator.get("id");
        List<String> name = jsonPathEvaluator.get("name");
        Map<String,String> map = new LinkedHashMap<String, String>();


        for (int i=0; i<id.size(); i++) {
            map.put(name.get(i),String.valueOf(id.get(i)));
        }
        return map;
    }

}
