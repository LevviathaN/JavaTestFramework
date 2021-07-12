package api;

import io.restassured.response.Response;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import ui.utils.BPPLogManager;
import ui.utils.bpp.ExecutionContextHandler;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.StringWriter;

import static io.restassured.RestAssured.given;

public class SoapApiController {

    /**
     * @param soapRequestTemplate - the name of XML file which will be used to retrieve Json file as an Object
     */
    private String getXMLObject(String soapRequestTemplate, String nodeId) {

        try {

            Document doc = new Utilities().getXmlDocument(soapRequestTemplate);

            for (String element : new String[]{"sessionId", nodeId}) {
                NodeList sessionID = doc.getElementsByTagName(element);
                Node aNode = sessionID.item(0);
                BPPLogManager.getLogger().info("Current " + element + ": " + aNode.getTextContent());
                aNode.setTextContent(ExecutionContextHandler.getExecutionContextValueByKey(aNode.getTextContent()));
                BPPLogManager.getLogger().info("New sessionId " + element + ": " + aNode.getTextContent());
            }

            //write the updated document to file or console
            doc.getDocumentElement().normalize();

            StringWriter writer = new StringWriter();

            Transformer transformer = TransformerFactory.newInstance().newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.transform(new DOMSource(doc), new StreamResult(writer));

            BPPLogManager.getLogger().info("XML object updated successfully");

            return writer.toString();

        } catch (TransformerException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * @param baseURI     - will be changed based of record type to be created
     * @param requestBody - XML format; depends on record type
     */
    public Response postSoapRequest(String baseURI, String requestBody) {
        Response response = given()
                .header("SOAPAction", "http://platform.apollogrp.edu/wsdl/")
                .when()
                .contentType("text/xml")
                .baseUri(baseURI)
                .body(requestBody)
                .post();

        if (Integer.toString(response.getStatusCode()).matches("2.+")) {
            BPPLogManager.getLogger().info("Success! Response code: " + response.getStatusCode());
            BPPLogManager.getLogger().info(response.body().print());
        } else {
            BPPLogManager.getLogger().error("Response code: " + response.getStatusCode());
            response.prettyPrint();
        }
        return response;
    }

    /**
     * @param soapRequestTemplate - the name of XML file which will be used to retrieve Json file as an Object
     */
    public String processSoapProperties(String soapRequestTemplate, String nodeId) {

        return new SoapApiController().getXMLObject(soapRequestTemplate, nodeId);
    }

}
