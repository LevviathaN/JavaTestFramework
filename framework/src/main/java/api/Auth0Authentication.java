package api;

import io.restassured.authentication.PreemptiveAuthProvider;
import io.restassured.authentication.PreemptiveBasicAuthScheme;
import io.restassured.authentication.PreemptiveOAuth2HeaderScheme;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.PreemptiveAuthSpec;
import io.restassured.specification.RequestSpecification;
import ui.utils.bpp.ExecutionContextHandler;

import java.util.HashMap;
import java.util.Map;

import static io.restassured.RestAssured.given;

/**
 * @author yzosin
 * <p> Class to get Access Token for Auth0 </p>
 */
public class Auth0Authentication {
    public static String token;
    RestApiController restApiController = new RestApiController();

    private static Auth0Authentication instance = null;

    public Auth0Authentication() {
        token = getAccessToken();
        ExecutionContextHandler.setExecutionContextValueByKey("EC_AUTH_ZERO_TOKEN", token);
    }

    public static Auth0Authentication getInstance() {

        if (instance == null) {
            instance = new Auth0Authentication();
        }

        return instance;
    }

    public String getAccessToken () {
        Map<String,Object> headerMap = new HashMap<String,Object>();
        headerMap.put("сonnection", "keep-alive");
        headerMap.put("content-type", "application/json");
        Response response = given()
                .headers(headerMap)
                .baseUri("https://bpp-stage.eu.auth0.com/oauth/token")
                .body(restApiController.processProperties("getAccessAuth0UAT"))
                .post();

        JsonPath jsonPathEvaluator = response.jsonPath();
        token = jsonPathEvaluator.get("access_token");

        return token;
    }

    public RequestSpecification requestHeaderSpecification() {
        PreemptiveOAuth2HeaderScheme scheme = new PreemptiveOAuth2HeaderScheme();
        scheme.setAccessToken(token);
        return new RequestSpecBuilder().setAuth(scheme).build();
    }
}
