package CodeEditor;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class GherkinValidator {

    public static Map<String,String> specialLocatorsMap;
    public static Map<String,String> locatorsMap;
    public static Map<String,String> stepPatternsMap;
    public static Map<String,String> stepSignaturesMap;
    public static List<String> reusablesList;


    public GherkinValidator() {
        locatorsMap = GuiHelper.getLocatorsMap(CodeEditorExample.frameworkFolder + "/src/main/resources/Locators.json");
        specialLocatorsMap = GuiHelper.getLocatorsMap(CodeEditorExample.frameworkFolder + "/src/main/resources/SpecialLocators.json");
        stepPatternsMap = GuiHelper.getLocatorsMap(CodeEditorExample.frameworkFolder + "/src/main/resources/NewStepPatterns.json");
        stepSignaturesMap = GuiHelper.getLocatorsMap(CodeEditorExample.frameworkFolder + "/src/main/resources/NewStepSignatures.json");
        reusablesList = getReusableScenariosList();
    }


    /** Method to get parameters that are not matching any available Locator from Locators.json from Document
     *
     * @author Ruslan Levytskyi
     * */
    public List<String> getInvalidParameters(Document doc) {
        List<Node> parametersNodeList = GuiHelper.getNodeList(doc, "span","class","cm-string");
        List<String> invalidParameters = new ArrayList<>();

        for (Node parameterNode : parametersNodeList) {
            String parameterText = parameterNode.getTextContent();
            if (parameterText.startsWith("\"") && parameterText.endsWith("\"")) {
                String parameterWithoutParentheses = parameterText.substring(1,parameterText.length()-1);
                if (!locatorsMap.containsKey(parameterWithoutParentheses)) {
                    invalidParameters.add(parameterWithoutParentheses);
                }
            }
        }
        return invalidParameters;
    }

    /** Method to get parameters that are not matching any available Locator from Locators.json from Document
     *
     * @author Ruslan Levytskyi
     * */
    public List<String> getInvalidStepdefs(Document doc) {
        List<Node> linessNodeList = GuiHelper.getNodeList(doc, "span","role","presentation");
        List<String> invalidStepdefs = new ArrayList<>();

        for (Node lineNode : linessNodeList) {
            String lineText = lineNode.getTextContent().trim();
            if (lineText.startsWith("Given") || lineText.startsWith("When")
                    || lineText.startsWith("Then") || lineText.startsWith("And") || lineText.startsWith("But")) {
                String lineWithoutkeyword = lineText.replaceAll("^(Given |When |Then |And |But )", "");
                if (!isValidStepdef(lineWithoutkeyword)) {
                    invalidStepdefs.add(lineWithoutkeyword);
                }
            }
        }
        return invalidStepdefs;
    }

    /** Method to get parameters that are not matching any available Locator from Locators.json from String
     *
     * @author Ruslan Levytskyi
     * */
    public List<String> getInvalidParameters(String doc) {
        List<String> quotedList = GuiHelper.getQuoted(doc,'"');
        List<String> invalidParameters = new ArrayList<>();

        for (String quoted : quotedList) {
            if (!locatorsMap.containsKey(quoted)) {
                invalidParameters.add(quoted);
            }
        }
        return invalidParameters;
    }

    public boolean isValidStepdef(String stepdef) {
        boolean validNode = false;
        for (String stepPattern : stepPatternsMap.values()) {
            if (stepdef.matches(stepPattern)) {
                validNode = true;
                break;
            }
        }
        return validNode;
    }

    public List<String> getReusableScenariosList() {
        ArrayList<String> availableReusableStepsList = new ArrayList<>();

        try {
            File inputFile = new File(CodeEditorExample.frameworkFolder + "/src/main/resources/data/bpp/ReusableTestSteps.xml");
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(inputFile);
            doc.getDocumentElement().normalize();

            Node reusablesNode = doc.getElementsByTagName("reusables").item(0);
            Element reusablesElement = (Element) reusablesNode;

            NodeList reusablesList = reusablesElement.getElementsByTagName("reusable");
            for (int i = 0; i < reusablesList.getLength(); i++) {
                Node reusableNode = reusablesList.item(i);
                Element reusableElement = (Element) reusableNode;
                availableReusableStepsList.add(reusableElement.getAttribute("name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return availableReusableStepsList;
    }
}
