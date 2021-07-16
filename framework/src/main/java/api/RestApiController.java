package api;

import io.restassured.http.ContentType;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import ui.utils.BPPLogManager;
import ui.utils.Reporter;
import ui.utils.Tools;
import ui.utils.bpp.PropertiesHelper;
import ui.utils.bpp.TestParametersController;

import java.util.*;

import static com.jcabi.matchers.RegexMatchers.matchesPattern;
import static io.restassured.RestAssured.given;
import static org.junit.Assert.assertThat;
import static org.junit.internal.matchers.StringContains.containsString;

public class RestApiController {

    private final PropertiesHelper propertiesHelper = new PropertiesHelper();
    String Reference = null;

    /**
     * @param baseURI     - will be changed based of record type to be created
     * @param requestBody - JSON format; depends on record type
     */

    public Response postRequest(String baseURI, String requestBody, RequestSpecification auth) {
        Response response = given()
                .spec(auth)
                .when()
                .contentType(ContentType.JSON)
                .baseUri(baseURI)
                .body(requestBody)
                .post();

        if (Integer.toString(response.getStatusCode()).matches("2.+")) {
            BPPLogManager.getLogger().info("Request sent successfully! Response code: " + response.getStatusCode());
        } else {
            BPPLogManager.getLogger().error("Response code: " + response.getStatusCode());
        }
        return response;
    }

    /**
     * @param baseURI - will be changed based of record type to be created
     */
    public Response getRequest(String baseURI, RequestSpecification auth) {
        Response response = given()
                .spec(auth)
                .when()
                .contentType(ContentType.JSON)
                .get(baseURI)
                .andReturn();

        if (Integer.toString(response.getStatusCode()).matches("2.+")) {
            BPPLogManager.getLogger().info("Request sent successfully! Response code: " + response.getStatusCode());
        } else {
           BPPLogManager.getLogger().error("Response code: " + response.getStatusCode());
        }
        return response;
    }

    /**
     * @param requestTemplate - the name of Json file which will be used to retrieve Json file as an Object
     */
    public String processProperties(String requestTemplate) {

        JSONObject map = new Utilities().getJsonObject(requestTemplate);

        map.keySet().forEach(keyStr -> {
            Object keyValue = map.get(keyStr);

            if (keyValue instanceof JSONArray) {
                JSONArray valueArray = (JSONArray) keyValue;
                keyValue = valueArray.get(new Random().nextInt(valueArray.size())).toString();
            }

            map.put(keyStr, TestParametersController.checkIfSpecialParameter(keyValue.toString()));

        });

        return map.toString();
    }

    public String processPropertiesPF(String requestTemplate, String parameter1, String parameter2) {

        JSONObject jo = new Utilities().getJsonObject(requestTemplate);

        /*Get command list*/
        Map variables = ((Map) jo.get("variables"));
        Map.Entry<String,String> entry = (Map.Entry<String, String>) variables.entrySet().iterator().next();
        String key = entry.getKey();

        if(key.equals("command")) {

            Map command = (Map) variables.get(key);

            /*Get and Put Special Parameter*/
            if (!(command.get("dimensionType") == null)) {
                command.put("dimensionType", parameter1);
            }
            if (!(command.get("contentType") == null)) {
                command.put("contentType", parameter1);
            }
            if (!(command.get("deliveryDefault") == null)) {
                command.put("deliveryDefault", parameter1);
            }
            if (!(command.get("target") == null)) {
                command.put("target", parameter2);
            }
            if (!(command.get("targetPlatform") == null)) {
                command.put("targetPlatform", parameter2);
            }
            /*Integer List*/
            if (!(command.get("capacity") == null)) {
                command.put("capacity", Integer.valueOf(parameter1));
            }
            if (!(command.get("price") == null)) {
                int price = Integer.parseInt(TestParametersController.checkIfSpecialParameter(String.valueOf(command.get("price"))));
                command.put("price", price);
            }
            if (!(command.get("cost") == null)) {
                int cost = Integer.parseInt(TestParametersController.checkIfSpecialParameter(String.valueOf(command.get("cost"))));
                command.put("cost", cost);
            }
            /*Boolean List*/
            String[] booleanArray = {"isCba","allowedForCba","isExpiryDateRequired","isExpiryDateRequired","isIsbnRequired","isWeightRequired","timetabled","isInternalMaterial",
                    "isDigitalMaterial","isCourseMaterial"};

            for (String s1: booleanArray) {
                if (!(command.get(s1) == null)) {
                    boolean boolStr1 = Boolean.parseBoolean(parameter1);
                    command.put(s1, boolStr1);
                }
            }
            /*Boolean List*/
            String[] booleanSecondArray = {"groupRequirementCohort","groupRequirementMode","groupRequirementLocation"};

            for (String s2: booleanSecondArray) {
                if (!(command.get(s2) == null)) {
                    boolean boolStr2 = Boolean.parseBoolean(parameter2);
                    command.put(s2, boolStr2);
                }
            }
            /*Object List*/
            String[] objectArray = {"code", "shortName", "name", "description", "startDate", "endDate", "startTeachingDate", "termCode", "bodyReference",
                    "operationReference", "reference", "streamReference", "courseReference", "defaultLocationReference", "defaultSessionDurationReference",
                    "paperReference", "sittingReference", "vatRuleReference", "verticalReference", "regionReference", "courseTypeReference",
                    "pricingMatrixReference", "levelReference", "programmeReference", "cohortReference", "sessionReference", "stepReference",
                    "dueDate", "costCentreFinancialDimensionReference", "projectFinancialDimensionReference", "financialDimensionReference",
                    "examPreparationReference", "studyModeReference","addressLine1","addressLine2","addressLine3", "sisCode", "referenceNumber",
                    "entityFinancialDimensionReference", "revenueFinancialDimensionReference","materialTypeReference","learningMediaVatRuleReference",
                    "courseMaterialVatRuleReference","edition","isbn","availableDate","expiryDate","materialReference"};

            for (String s: objectArray) {
                if (!(command.get(s) == null)) {
                    command.put(s, TestParametersController.checkIfSpecialParameter(String.valueOf(command.get(s))));
                }
            }
            /*Property List*/
            if (!(command.get("timings") == null)) {
                ArrayList<String> bodyList = new ArrayList<String>();
                JSONArray bodyArray = (JSONArray) command.get("timings");
                JSONObject timingObj = (JSONObject) bodyArray.get(0);
                String sessionTimingReference = (String) timingObj.get("sessionTimingReference");
                String sessionDate = (String) timingObj.get("sessionDate");
                String startTime = (String) timingObj.get("startTime");
                String endTime = (String) timingObj.get("endTime");
                ((JSONObject) bodyArray.get(0)).put("sessionTimingReference", TestParametersController.checkIfSpecialParameter(sessionTimingReference));
                ((JSONObject) bodyArray.get(0)).put("sessionDate", TestParametersController.checkIfSpecialParameter(sessionDate));
                ((JSONObject) bodyArray.get(0)).put("startTime", TestParametersController.checkIfSpecialParameter(startTime));
                ((JSONObject) bodyArray.get(0)).put("endTime", TestParametersController.checkIfSpecialParameter(endTime));
                bodyList.add(String.valueOf(bodyArray));
            }
            /*Property List*/
            if (!(command.get("stockSiteProductionMethods") == null)) {
                ArrayList<String> bodyList = new ArrayList<String>();
                JSONArray bodyArray = (JSONArray) command.get("stockSiteProductionMethods");
                JSONObject stockObj = (JSONObject) bodyArray.get(0);
                String stockSiteReference = (String) stockObj.get("stockSiteReference");
                ((JSONObject) bodyArray.get(0)).put("stockSiteReference", TestParametersController.checkIfSpecialParameter(stockSiteReference));
                bodyList.add(String.valueOf(bodyArray));
            }
            /*Array List*/
            List<String> anotherList = (List<String>) Arrays.asList("bodyReferences", "courseReferences", "levelReferences", "paperReferences", "regionReferences",
                    "sittingReferences", "courseTypeReferences","materialReferences","clientReferences");

            for (String l: anotherList) {
                if (!(command.get(l) == null)) {
                    JSONArray bodyArray = (JSONArray) command.get(l);
                    ArrayList<String> bodyList = new ArrayList<String>();
                    bodyList.add(TestParametersController.checkIfSpecialParameter(String.valueOf(bodyArray.get(0))));
                    command.put(l, bodyList);
                    }
                }
        } else {
            if (!(variables.get("instanceReference") == null)) {
                variables.put("instanceReference", TestParametersController.checkIfSpecialParameter(String.valueOf(variables.get("instanceReference"))));
            }
        }

        return jo.toString();
    }

    /**
     * Method for processing JSON file of request.
     * @param fileName - json file that is coresspondent for current request
     * @param objName - json object (operationName) of current json file
     **/

    public synchronized JSONObject requestProcess(String fileName,String objName, String parameter1, String parameter2)  {

        Response Response = postRequest(propertiesHelper.getProperties().getProperty("pf_request_link"),
                processPropertiesPF("ProductFactory/" + fileName, parameter1, parameter2),
                ProductFactoryAuthentication.getInstance().requestHeaderSpecification()
        );
        String ResponseString = Response.getBody().asString();

        JSONObject recordsObject = new Utilities().getResponseProperty(Response);
        JSONObject recordsData = (JSONObject) recordsObject.get("data");
        JSONObject recordsList = (JSONObject) recordsData.get(objName);

        /*Get Json object values*/
        try {
            Reference = (String) recordsList.get("reference");
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
        assertThat(ResponseString, containsString(objName));

        return recordsList;
    }

    public Map processLocatorProperties(String locatorsFile) {

        JSONObject map = new Tools().getJsonObjectForLocators(locatorsFile);

        map.keySet().forEach(keyStr -> {
            Object keyValue = map.get(keyStr);

            if (keyValue instanceof JSONArray) {
                JSONArray valueArray = (JSONArray) keyValue;
                keyValue = valueArray.get(new Random().nextInt(valueArray.size())).toString();
            }

            map.put(keyStr, keyValue.toString());

        });

        return map;
    }
}
