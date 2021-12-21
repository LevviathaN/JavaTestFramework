package api;

import io.restassured.authentication.PreemptiveOAuth2HeaderScheme;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import ui.utils.bpp.ExecutionContextHandler;
import static io.restassured.RestAssured.given;

/**
 * @author ayakymchuk
 * <p> Class to get Access Token for Product Factory using OAuth 2.0 </p>
 */

public class ProductFactoryAuthentication {

    private static String token;
    RestApiController restApiController = new RestApiController();

    private static api.ProductFactoryAuthentication instance = null;

    private ProductFactoryAuthentication() {
        if(System.getProperty("environment").equals("UAT")) {
            token = ExecutionContextHandler.getExecutionContextValueByKey("EC_AUTH_TOKEN_PF_UAT");
        } else {
            token = getAccessTokenPF();
            ExecutionContextHandler.setExecutionContextValueByKey("EC_AUTH_TOKEN_PF", token);
        }
    }

    public static api.ProductFactoryAuthentication getInstance() {

        if (instance == null) {
            instance = new api.ProductFactoryAuthentication();
        }

        return instance;
    }

    private String getAccessTokenPF() {
        Response response = given()
                .header("content-type", "application/json")
                .baseUri("https://bpp-qa.eu.auth0.com/oauth/token")
                .body(restApiController.processProperties("getAccessTokenPF"))
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
