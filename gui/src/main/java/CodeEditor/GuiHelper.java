package CodeEditor;

import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.JsonReader;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

import static java.nio.file.StandardOpenOption.CREATE;

public class GuiHelper {
    private static Gson gson = new GsonBuilder().setPrettyPrinting().serializeNulls().create();

    public static Map<String,String> getLocatorsMap(String locatorsFile) {
        Map<String,String> locatorsMap = new HashMap<>();
        try {
            List<Locator> locators = toObjectListFromFile(Locator[].class,
                    new File(locatorsFile));
            for (Locator locator : locators) {
                locatorsMap.put(locator.getName(),locator.getValue());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return locatorsMap;
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

    public static <T> String toJson(List<T> objects) {
        List<String> jsonList = Lists.transform(objects, object -> gson.toJsonTree(object).getAsJsonObject().toString());
        String jsonAsString = Joiner.on(",").join(jsonList);
        return "["+jsonAsString+"]";
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

    public static final <T> List<T> toObjectListFromFile(final Class<T[]> clazz, final File file) throws IOException {
        T[] jsonToObject = null;
        Gson gson = new GsonBuilder().setPrettyPrinting()
                .serializeNulls()
                .create();
        try {
            jsonToObject = gson.fromJson(new JsonReader(new FileReader(file)), clazz);
        } catch (JsonSyntaxException e){
            List<String> objects = Files.readAllLines(Paths.get(file.getAbsolutePath()));
            objects.removeAll(Collections.singleton(""));
            String jsonAsString = "["+ Joiner.on(",").join(objects)+"]";
            jsonToObject = gson.fromJson(jsonAsString, clazz);
        }
        List<T> result = new ArrayList<>(Arrays.asList(jsonToObject));
        result.removeAll(Collections.singleton(null));
        return result;
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

    /** Read file to string */
    public static String readFile(String path, Charset encoding) {
        byte[] encoded = new byte[1];
        try {
            encoded = Files.readAllBytes(Paths.get(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new String(encoded, encoding);
    }
}
