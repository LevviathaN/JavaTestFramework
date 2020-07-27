package ui.utils;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static java.nio.file.StandardOpenOption.CREATE;

/**
 * Class to store custom methods
 *
 * @author rlevytskyi
 */

public class Tools {

    public static long getCurDateTimeInMilliseconds() {
        return System.currentTimeMillis();
    }

    public static String getReportName() {

        String name;
        LocalDateTime dateTime = LocalDateTime.now();
        name = dateTime.toLocalDate() + "_" + dateTime.toLocalTime().getHour() + "_"
                + dateTime.toLocalTime().getMinute() + ".html";
        return name;
    }

    public static String getStackTrace(Throwable problem) {
        Writer result = new StringWriter();
        PrintWriter printWriter = new PrintWriter(result);
        problem.printStackTrace(printWriter);
        return result.toString();
    }

    /**
     * @param locatorsFile - the name of Json file which will be used to retrieve Json file as an Object
     */
    @SuppressFBWarnings("DM_DEFAULT_ENCODING")
    public JSONObject getJsonObjectForLocators(String locatorsFile) {

        JSONParser parser = new JSONParser();

        StringBuilder path = new StringBuilder();
        path.append(System.getProperty("user.dir"));
        path.append(locatorsFile);

        try {
            FileReader reader = new FileReader(path.toString());
            Object obj = parser.parse(reader);
            reader.close();

            return (JSONObject) obj;
        } catch (ParseException | IOException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public static List<String> getQuoted(final String input, final char quote) {
        final ArrayList<String> result = new ArrayList<>();
        int n = -1;
        for (int i = 0; i < input.length(); i++) {
            if (input.charAt(i) == quote) {
                if (n == -1) { //not currently inside quote -> start new quote
                    n = i + 1;
                } else { //close current quote
                    result.add(input.substring(n, i));
                    n = -1;
                }
            }
        }
        return result;
    }

    /** Convert Document into a String
     *
     * @author Ruslan Levytskyi
     * */
    public static String getHtmlFromDocument(Document doc) {
        String htmlString;
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        try {
            printDocument(doc, stream);
            htmlString = new String(stream.toByteArray());
            stream.close();
            return htmlString;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /** Method to convert Document into OutputStream
     *
     * @author Ruslan Levytskyi
     * */
    public static void printDocument(Document doc, OutputStream out) throws IOException, TransformerException {
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer = tf.newTransformer();
        transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
        transformer.setOutputProperty(OutputKeys.METHOD, "xml");
        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
        transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
        transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");

        transformer.transform(new DOMSource(doc),
                new StreamResult(new OutputStreamWriter(out, "UTF-8")));
    }

    public static void createFile(String fileName, String fileContent) {
        byte[] data = fileContent.getBytes();
        Path p = Paths.get(fileName);

        try{
            Files.deleteIfExists(p);
        }catch(IOException e){e.printStackTrace();}

        try {
            OutputStream out = new BufferedOutputStream(Files.newOutputStream(p, CREATE));
            out.write(data, 0, data.length);
            out.close();
        } catch (IOException x) {
            System.err.println(x);
        }
    }

    /** Method to get desired node from document by nodeName and nodeAttribute
     *
     * @author Ruslan Levytskyi
     * */
    public static List<Node> getNodeList(Document doc, String nodeName, String attributeName, String attributeValue) {
        List<Node> neededNodesList = new ArrayList<>();
        NodeList nodeList = doc.getElementsByTagName(nodeName);

        Node nodeFromList;
        List<String> nodeValuesList = new ArrayList<>();
        for (int i=0; i < nodeList.getLength(); i++) {
            nodeFromList = nodeList.item(i);
            NamedNodeMap nodeFromListAttributes = nodeFromList.getAttributes();

            Node attributeNode;
            for (int j=0; j < nodeFromListAttributes.getLength(); j++) {
                attributeNode = nodeFromListAttributes.item(j);
                if (attributeNode.getNodeName().contains(attributeName)){
                    if (attributeNode.getNodeValue().contains(attributeValue)) {
                        neededNodesList.add(nodeFromList);
                        String spanNodeValue = nodeFromList.getTextContent();
                        nodeValuesList.add(spanNodeValue);
//                        System.out.println(spanNodeValue);
                    }
                }
            }
        }
        return neededNodesList;
    }
}
