package api;

import io.restassured.response.Response;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

public class Utilities {

    public String getResponseProperty(Response response, String property) {
        InputStream bodyStream = response.asInputStream();
        JSONParser parser = new JSONParser();
        try {
            JSONObject bodyObject = (JSONObject) parser.parse(
                    new InputStreamReader(bodyStream, StandardCharsets.UTF_8));

            return bodyObject.get(property).toString();
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }

        return null;
    }

    public JSONObject getResponseProperty(Response response) {
        InputStream bodyStream = response.asInputStream();
        JSONParser parser = new JSONParser();
        try {
            JSONObject bodyObject = (JSONObject) parser.parse(
                    new InputStreamReader(bodyStream, StandardCharsets.UTF_8));

            return bodyObject;
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Used to get all test data after record submitting/provisioning
     *
     * @param map - an Object used to get test data after record is submitted
     */
    public ArrayList<String> getRecordData(JSONObject map) {

        ArrayList<String> list = new ArrayList<>();

        map.keySet().forEach(keyStr -> {
            if (map.get(keyStr) != null) {
                list.add(map.get(keyStr).toString());
            }
        });

        return list;
    }

    /**
     * @param requestTemplate - the name of Json file which will be used to retrieve Json file as an Object
     */
    JSONObject getJsonObject(String requestTemplate) {

        JSONParser parser = new JSONParser();

        StringBuilder path = new StringBuilder();
        path.append(System.getProperty("user.dir"));
        path.append("/src/main/resources/api/requestBody/");
        path.append(requestTemplate);
        path.append(".json");

        try (FileReader reader = new FileReader(path.toString())) {

            Object obj = parser.parse(reader);

            return (JSONObject) obj;

        } catch (ParseException | IOException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    /**
     * @param soapRequestTemplate - the name of xml file which will be used to retrieve xml file as a Document
     */

    Document getXmlDocument(String soapRequestTemplate) {

        StringBuilder path = new StringBuilder();
        path.append(System.getProperty("user.dir"));
        path.append("/src/main/resources/api/soapActions/");
        path.append(soapRequestTemplate);
        path.append(".xml");

        DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();

        try {
            DocumentBuilder b = f.newDocumentBuilder();

            return b.parse(new File(path.toString()));

        } catch (SAXException | IOException | ParserConfigurationException e) {
            e.printStackTrace();
        }

        return null;
    }

}
