package api;

import io.restassured.http.ContentType;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import ui.utils.BPPLogManager;
import ui.utils.Reporter;
import ui.utils.Tools;
import ui.utils.bpp.ExecutionContextHandler;
import ui.utils.bpp.PropertiesHelper;
import ui.utils.bpp.TestParametersController;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static io.restassured.RestAssured.given;

public class RestApiController {

    private final PropertiesHelper propertiesHelper = new PropertiesHelper();
    String Reference = null;
    String requestLink = null;

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

    public String processPropertiesPF(String jsonPath, Map<String, String> parameters) {

        //get json string from file
        JSONObject jo = new Utilities().getJsonObject(jsonPath);
        String requestTemplate = jo.toString();

        //replace selected parameters in json string with values provided in parameters map
        if (parameters==null) parameters = new HashMap<String,String>();
        for (String parameter : parameters.keySet()) {
            String value = parameters.get(parameter);
            if (parameter.contains("References")) {
                requestTemplate = requestTemplate.replaceAll("\""+parameter+"\":\\[?\"?([^\"},]*)\"?\\]?","\""+parameter+"\":[\"" + value + "\"]");
            } else {
                requestTemplate = requestTemplate.replaceAll("\""+parameter+"\":\"?([^\"},]*)\"?","\""+parameter+"\":\"" + value + "\"");
            }
        }

        //process all special parameters in requestTemplate string
        requestTemplate = TestParametersController.checkIfSpecialParameter(requestTemplate);

        //extract all key-value properties from string into map
        Map<String,String> objectsList = new HashMap<>();
        Matcher dataPattern = Pattern.compile("\"([A-Za-z]*)\":\"(.*?)\"").matcher(requestTemplate);
        while (dataPattern.find()) { //add found data into previously created list
            objectsList.put(dataPattern.group(1),dataPattern.group(2));
        }

        //remove quotes from all integer values, except ones in list below
        List<String> intsWithQuotes =  new ArrayList<>(Arrays.asList("edition","referenceNumber","sisCode","termCode","productInstanceCode"));
        for (String object : objectsList.keySet()) {
            if (objectsList.get(object).matches("\\d+") && !intsWithQuotes.contains(object) || objectsList.get(object).equals("true") || objectsList.get(object).equals("false")) {
                requestTemplate = requestTemplate.replace("\"" + object + "\":\"" + objectsList.get(object) + "\"", "\"" + object + "\":" + objectsList.get(object));
            }
        }

        //process all special parameters in requestTemplate string
        return requestTemplate;

    }

    /**
     * Method for processing JSON file of request.
     * @param fileName - json file that is coresspondent for current request
     **/

    public synchronized JSONObject requestProcess(String fileName, Map<String, String> parameters)  {

        if (System.getProperty("environment").equals("UAT")) {
            requestLink = "pf_request_link_UAT";
        } else {
            requestLink = "pf_request_link";
        }

        Response Response = postRequest(propertiesHelper.getProperties().getProperty(requestLink),
                processPropertiesPF("ProductFactory/" + fileName, parameters),
                ProductFactoryAuthentication.getInstance().requestHeaderSpecification()
        );
        String ResponseString = Response.getBody().asString();

        JSONObject recordsObject = new Utilities().getResponseProperty(Response);
        JSONObject recordsData = (JSONObject) recordsObject.get("data");
        JSONObject recordsList = new JSONObject();

        if (recordsData.containsKey("steps")) {
            JSONArray recordsArr = (JSONArray) recordsData.get("steps");
            extractPropperties(recordsData.values().iterator().next(), recordsList, "", recordsArr.size());
        } else if (recordsData.containsKey("sessions")) {
            JSONArray recordsArr = (JSONArray) recordsData.get("sessions");
            extractPropperties(recordsData.values().iterator().next(), recordsList, "", recordsArr.size());
        } else if (recordsData.containsKey("activateInstances")) {
            JSONArray recordsArr = (JSONArray) recordsData.get("activateInstances");
            extractPropperties(recordsData.values().iterator().next(), recordsList, "", recordsArr.size());
        } else {
            extractPropperties(recordsData.values().iterator().next(), recordsList, "", 1);
        }
        /*Get Json object values*/
        try {
//            Reference = recordsList.get("Reference")==null ? (String) recordsList.get("CourseReference") : (String) recordsList.get("Reference");
            if (recordsList.get("Reference")!=null) {
                Reference = (String) recordsList.get("Reference");
            } else if (recordsList.get("CourseReference")!=null) {
                Reference = (String) recordsList.get("CourseReference");
            } else if (recordsList.get("DeletedResourceReference")!=null) {
                Reference = (String) recordsList.get("DeletedResourceReference");
            }
        } catch (Exception e) {
            BPPLogManager.getLogger().error(Tools.getStackTrace(e));
            Reporter.failTryTakingScreenshot("<br>" + Tools.getStackTrace(e) + "</br>");
            JSONArray errorData = (JSONArray) recordsObject.get("errors");
            JSONObject errorArray = (JSONObject) errorData.get(0);
            String error = (String) errorArray.get("message");
            Reporter.failTryTakingScreenshot("<br>" + error + "</br>");
            throw new RuntimeException("Can't proceed with response: " + error);
        }

//        assertThat(Reference, matchesPattern("([a-z0-9-]){36}"));
//        assertThat(ResponseString, containsString(objName));

        return recordsList;
    }

    public void extractPropperties(Object inputObj, JSONObject targetList, String nameKey, Integer arrSize) {
        JSONObject inputObject;

        for (int i = 0; i < arrSize ; i++) {
            inputObject = inputObj instanceof JSONObject ? (JSONObject) inputObj : (JSONObject) ((JSONArray) inputObj).get(i);
            Iterator keys = inputObject.keySet().iterator();
            while (keys.hasNext()) {
                Object key = keys.next();
                String capKey = key.toString().substring(0, 1).toUpperCase() + key.toString().substring(1);
                if (inputObject.get(key) instanceof JSONArray) {
                    JSONArray jArr = (JSONArray) inputObject.get(key);
                    for (Object o : jArr) {
                        extractPropperties((JSONObject) o, targetList, nameKey + capKey, arrSize);
                    }
                } else if (inputObject.get(key) instanceof JSONObject) {
                    extractPropperties((JSONObject) inputObject.get(key), targetList, nameKey + capKey, arrSize);
                } else {
                    String entryKey = targetList.containsKey(nameKey + capKey) ? nameKey + capKey + "Copy" : nameKey + capKey;
                    targetList.put(entryKey, inputObject.get(key));
                }
            }
        }
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

    /**
     * Additional method is required as JSon for Hub has two Objects that should be handled separately
     * @param requestTemplate - the name of Json file which will be used to retrieve Json file as an Object
     */
    public String processPropertiesHubRegistration(String requestTemplate) {
        JSONObject map = new Utilities().getJsonObject(requestTemplate);
        Map user = ((Map) map.get("user_metadata"));

        String firstName =(String) user.get("first_name");
        String lastName =(String) user.get("last_name");
        String phone =(String) user.get("phone");
        String fullPhone =(String) user.get("full_phone");
        String terms =(String) user.get("terms");
        String marketingOpt =(String) user.get("marketing_opt_in");
        String registration =(String) user.get("registration_type");
        String registrationToken =(String) user.get("registration_type_token");
        String email = (String) map.get("email");
        String password = (String) map.get("password");
        ExecutionContextHandler.setExecutionContextValueByKey("EC_PASSWORD", password);
        ExecutionContextHandler.setExecutionContextValueByKey("EC_AUTO_FIRSTNAME", firstName);
        ExecutionContextHandler.setExecutionContextValueByKey("EC_PHONE", phone);

        //removing objects. they will be replaced with values from code below
        map.remove("user_metadata");
        map.remove("email");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("first_name",TestParametersController.checkIfSpecialParameter(firstName));
        jsonObject.put("last_name",TestParametersController.checkIfSpecialParameter(lastName));
        jsonObject.put("terms",TestParametersController.checkIfSpecialParameter(terms));
        jsonObject.put("marketing_opt_in",TestParametersController.checkIfSpecialParameter(marketingOpt));
        jsonObject.put("registration_type",TestParametersController.checkIfSpecialParameter(registration));
        jsonObject.put("registration_type_token",TestParametersController.checkIfSpecialParameter(registrationToken));
        if (!(phone == null)) {
            jsonObject.put("phone",TestParametersController.checkIfSpecialParameter(phone));
            jsonObject.put("full_phone",TestParametersController.checkIfSpecialParameter(fullPhone));
        }

        map.put("user_metadata",jsonObject);
        map.put("email",TestParametersController.checkIfSpecialParameter(email));

        return map.toString();
    }

    public synchronized JSONObject requestNegativeProcess(String fileName, Map<String, String> parameters)  {

        if (System.getProperty("environment").equals("UAT")) {
            requestLink = "pf_request_link_UAT";
        } else {
            requestLink = "pf_request_link";
        }

        Response Response = postRequest(propertiesHelper.getProperties().getProperty(requestLink),
                processPropertiesPF("ProductFactory/" + fileName, parameters),
                ProductFactoryAuthentication.getInstance().requestHeaderSpecification()
        );

        JSONObject recordsObject = new Utilities().getResponseProperty(Response);
        JSONArray recordsArrayData = (JSONArray) recordsObject.get("errors");
        JSONObject recordsObjData = (JSONObject) recordsArrayData.get(0);

        return recordsObjData;
    }

}
