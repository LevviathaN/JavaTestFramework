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

    public String processPropertiesPF(String requestTemplate, Map<String, String> parameters) {

        JSONObject jo = new Utilities().getJsonObject(requestTemplate);
        if (parameters==null) parameters = new HashMap<String,String>();

        /*Get command list*/
        Map variables = ((Map) jo.get("variables"));
        Map.Entry<String,String> entry = (Map.Entry<String, String>) variables.entrySet().iterator().next();
        String key = entry.getKey();

        if(key.equals("command")) {

            Map command = (Map) variables.get(key);
            for (Object commandKey : command.keySet()) {
                Object value = null;
                if (parameters.containsKey(commandKey)) {
                    if (commandKey.toString().contains("References")) {
                        JSONArray arry = new JSONArray();
                        for (String element : parameters.get(commandKey).split(",")) {
                            arry.add(element);
                        }
                        value = arry;
                    } else {
                        value = parameters.get(commandKey);
                    }
                } else {
                    value = command.get(commandKey);
                }
                String updatedValue = value.equals(null) ? "null" : TestParametersController.checkIfSpecialParameter(String.valueOf(value));
                value = (value.toString().equals(updatedValue)||value instanceof JSONArray) ? value : updatedValue;
                if (!(value==null)) {
                    if (commandKey.equals("timings")) {
                        JSONArray bodyArray = (JSONArray) command.get("timings");
                        JSONObject timingObj = (JSONObject) bodyArray.get(0);
                        String sessionTimingReference = parameters.containsKey("sessionTimingReference") ? parameters.get("sessionTimingReference") : (String) timingObj.get("sessionTimingReference");
                        String sessionDate = parameters.containsKey("sessionDate") ? parameters.get("sessionDate") : (String) timingObj.get("sessionDate");
                        String startTime = parameters.containsKey("startTime") ? parameters.get("startTime") : (String) timingObj.get("startTime");
                        String endTime = parameters.containsKey("endTime") ? parameters.get("endTime") : (String) timingObj.get("endTime");
                        ((JSONObject) bodyArray.get(0)).put("sessionTimingReference", TestParametersController.checkIfSpecialParameter(sessionTimingReference));
                        ((JSONObject) bodyArray.get(0)).put("sessionDate", TestParametersController.checkIfSpecialParameter(sessionDate));
                        ((JSONObject) bodyArray.get(0)).put("startTime", TestParametersController.checkIfSpecialParameter(startTime));
                        ((JSONObject) bodyArray.get(0)).put("endTime", TestParametersController.checkIfSpecialParameter(endTime));
                        command.put(commandKey,bodyArray);
                    } else if (commandKey.equals("dateTimes")) {
                        ArrayList<String> bodyList = new ArrayList<String>();
                        JSONArray bodyArray = (JSONArray) command.get("dateTimes");
                        JSONObject timingObj = (JSONObject) bodyArray.get(0);
                        String sessionDate = (String) timingObj.get("sessionDate");
                        String startTime = (String) timingObj.get("startTime");
                        ((JSONObject) bodyArray.get(0)).put("sessionDate", TestParametersController.checkIfSpecialParameter(sessionDate));
                        ((JSONObject) bodyArray.get(0)).put("startTime", TestParametersController.checkIfSpecialParameter(startTime));
                        bodyList.add(String.valueOf(bodyArray));
                    } else if (commandKey.equals("paperExpiry")) {
                        ArrayList<String> bodyList = new ArrayList<String>();
                        JSONArray bodyArray = (JSONArray) command.get("paperExpiry");
                        JSONObject timingObj = (JSONObject) bodyArray.get(0);
                        String expiryWeeks = (String) timingObj.get("expiryWeeks");
                        String expiryOption = (String) timingObj.get("expiryOption");
                        String studyModeReference = (String) timingObj.get("studyModeReference");
                        ((JSONObject) bodyArray.get(0)).put("expiryWeeks", Integer.parseInt(TestParametersController.checkIfSpecialParameter(String.valueOf(expiryWeeks))));
                        ((JSONObject) bodyArray.get(0)).put("expiryOption", TestParametersController.checkIfSpecialParameter(expiryOption));
                        ((JSONObject) bodyArray.get(0)).put("studyModeReference", TestParametersController.checkIfSpecialParameter(studyModeReference));
                        bodyList.add(String.valueOf(bodyArray));
                    } else if (commandKey.toString().contains("References")) {
                        JSONArray jArray = (JSONArray) value;
                        ArrayList<String> bodyList = new ArrayList<String>();
                        for (Object v : jArray) {
                            bodyList.add(TestParametersController.checkIfSpecialParameter(String.valueOf(v)));
                        }
                        command.put(commandKey, bodyList);
                    } else if (commandKey.equals("stockSiteProductionMethods")) {
                        JSONArray jArray = (JSONArray) value;
                        JSONObject jObject = (JSONObject) jArray.get(0);
                        ArrayList<JSONArray> bodyList = new ArrayList<JSONArray>();
                        String stockSiteReference = (String) jObject.get("stockSiteReference");
                        ((JSONObject) jArray.get(0)).put("stockSiteReference", TestParametersController.checkIfSpecialParameter(stockSiteReference));
//                        bodyList.add((JSONArray)jArray);
                        command.put(commandKey, jArray);
                    } else if (value.equals(true) || value.equals(false) || value.equals("true") || value.equals("false")) {
                        command.put(commandKey, Boolean.parseBoolean(value.toString()));
                    } else if (value.toString().matches("\\d+")) {
                        if (commandKey.toString().equals("edition")
                                ||commandKey.toString().equals("referenceNumber")
                                ||commandKey.toString().equals("sisCode")
                                ||commandKey.toString().equals("termCode")
                                ||commandKey.toString().equals("productInstanceCode")) {
                            command.put(commandKey, value.toString());
                        } else {
                            command.put(commandKey, Integer.parseInt(TestParametersController.checkIfSpecialParameter(value.toString())));
                        }
                    } else {
                        command.put(commandKey, TestParametersController.checkIfSpecialParameter(String.valueOf(value)));
                    }
                }
            }

        } else {
                for (Object variablesKey : variables.keySet()) {
                    Object value = null;
                    if (parameters.containsKey(variablesKey)) {
                        if (variablesKey.toString().contains("References")) {
                            JSONArray arry = new JSONArray();
                            arry.add(parameters.get(variablesKey));
                            value = arry;
                        } else {
                            value = parameters.get(variablesKey);
                        }
                    } else {
                        value = variables.get(variablesKey);
                        if (variablesKey.equals("filter")) {
                            Map filter = ((Map) variables.get("filter"));
                            for (Object filterKey : filter.keySet()) {
                                if (!parameters.isEmpty()) {
                                    value = parameters.get(filterKey);
                                } else {
                                    value = filter.get(filterKey);
                                }
                                filter.put(filterKey, TestParametersController.checkIfSpecialParameter(value.toString()));
                            }
                        }
                    }
                    String updatedValue = value.equals(null) ? "null" : TestParametersController.checkIfSpecialParameter(value.toString());
                    value = (value.toString().equals(updatedValue) || value instanceof JSONArray) ? value : updatedValue;
                    if (!(value == null)) {
                        if (!(variables.get("reference") == null)
                                || (!(variables.get("instanceReference") == null))
                                || (!(variables.get("instanceGroupReference") == null))
                                || (!(variables.get("courseReference") == null)))
                        {
                            variables.put(variablesKey, TestParametersController.checkIfSpecialParameter(value.toString()));
                        }
                        if (!(variables.get("filter") == null)) {
                            if (variables.get("filter").toString().equals("{}")) {
                            variables.put("filter", new JSONObject());
                            }
                        }
                    }
                }
            }
        return jo.toString();
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
