package api;

import io.restassured.authentication.PreemptiveOAuth2HeaderScheme;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.specification.RequestSpecification;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import ui.utils.BPPLogManager;
import ui.utils.bpp.ExecutionContextHandler;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;

/**
 * @author yzosin
 * <p> Class to get Access Token for Salesforce using OAuth 2.0 </p>
 */

public class SalesforceAuthentication {

    private static String token;

    private static SalesforceAuthentication instance = null;

    private SalesforceAuthentication() {
        token = getAccessToken();
        ExecutionContextHandler.setExecutionContextValueByKey("EC_AUTH_TOKEN", token);
    }

    public static SalesforceAuthentication getInstance() {

        if (instance == null) {
            instance = new SalesforceAuthentication();
        }

        return instance;
    }

    private String getAccessToken() {

        JSONObject object;

        if (System.getProperties().containsKey("environment")&& System.getProperty("environment").equals("UAT")) {
            object = new Utilities().getJsonObject("getAccessTokenUAT");
        } else {
            object = new Utilities().getJsonObject("getAccessToken");
        }

        JSONParser jsonParser = new JSONParser();
        HttpClient httpclient = HttpClientBuilder.create().build();
        HttpPost post = new HttpPost(object.get("token_URL").toString());
        object.remove("token_URL");

        List<NameValuePair> params = new ArrayList<NameValuePair>();

        object.keySet().forEach(parameter -> {
            params.add(new BasicNameValuePair(parameter.toString(), object.get(parameter).toString()));
        });

        try {
            post.setEntity(new UrlEncodedFormEntity(params));
            HttpResponse response = httpclient.execute(post);
            InputStream bodyStream = response.getEntity().getContent();
            JSONObject bodyObject = (JSONObject) jsonParser.parse(
                    new InputStreamReader(bodyStream, StandardCharsets.UTF_8));

            String token = bodyObject.get("access_token").toString();
            BPPLogManager.getLogger().info(token);

            assertThat(bodyObject.toString(), not(containsString("errorCode")));

            return token;
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }

        return null;
    }

    public RequestSpecification requestHeaderSpecification() {
        PreemptiveOAuth2HeaderScheme scheme = new PreemptiveOAuth2HeaderScheme();
        scheme.setAccessToken(token);
        return new RequestSpecBuilder().setAuth(scheme).build();
    }
}
