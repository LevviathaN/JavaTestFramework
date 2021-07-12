package CodeEditor;


import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.layout.StackPane;
import javafx.scene.web.WebView;
import org.openqa.selenium.WebElement;
import org.w3c.dom.Document;

import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathException;
import javax.xml.xpath.XPathFactory;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

import static java.nio.file.StandardOpenOption.CREATE;

public class CodeEditor extends StackPane implements Initializable {

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        fileTreeView.setRoot(trimFileTreeView(new SimpleFileTreeItem(new File(CodeEditorExample.frameworkFolder + "/src/test/resources/cucumber/bpp_features"))));
        editingTemplate = GuiHelper.readFile(CodeEditorExample.guiFolder + "/src/main/resources/htmlFileContent.txt", StandardCharsets.UTF_8);
        editingCode = GuiHelper.readFile(CodeEditorExample.guiFolder + "/src/main/resources/sampleText.txt", StandardCharsets.UTF_8).replaceAll("\r","");
    }

    private final GherkinValidator validator = new GherkinValidator();
    private final FeatureCRUD crud = new FeatureCRUD();
    private final LocatorsManager locatorsManager = new LocatorsManager();
    private final ReusableScenariosManager reusablesManager = new ReusableScenariosManager();

    public WebView webview;
    public Label labeledCode;
    public Button copyCode;
    public Button saveChangesButton;
    public Button createFeature;
    public ComboBox<String> locatorComboBox;
    public ComboBox<String> stepdefComboBox;
    public TreeView<String> fileTreeView;
    public ListView<String> predictedLocatorsList;
    public ListView<String> predictedStepdefsList;
    public Button loadFeatureButton;

    public static String editingCode;
    public static String editingTemplate;
    public static String updatedCode;
    public static Document updatedDoc;
    public static int editingCursorPosition;
    public static String editableWord;
    public static String editableLine;

    public Map<String,String> featureFilesMap = new HashMap<>();

    public List<String> validLocatorsList = new ArrayList<>(GherkinValidator.locatorsMap.keySet());
    public List<String> validSpecialLocatorsList = new ArrayList<>(GherkinValidator.specialLocatorsMap.keySet());
    public List<String> validStepdefsList = new ArrayList<>(GherkinValidator.stepPatternsMap.values());

    /** Set Feature Template button listener */
    public void setCode() {
        webview.getEngine().loadContent(applyEditingTemplate());
        createFeature.setDisable(false);
    }

    /** WebEditor listener */
    public void updateEditingData() {
        updatedCode = getCode();
        updatedDoc = webview.getEngine().getDocument();
        if (updatedCode.length()>3) {
            editingCursorPosition = compareStrings(editingCode, updatedCode);
            editableLine = getEditableLine();
            editableWord = getEditableWord();
        }

        updateValidationItems();
        snapshot();
    }

    /** Method to refresh prediction lists and invalid elements dropdowns */
    public void updateValidationItems() {
        predictedLocatorsList.getItems().clear();

        String originalStepdef = "";
        String lineText = CodeEditor.editableLine.trim();

        if (lineText.startsWith("Given") || lineText.startsWith("When")
                || lineText.startsWith("Then") || lineText.startsWith("And") || lineText.startsWith("But")) {
            lineText = lineText.replaceAll("^(Given |When |Then |And |But )", "");
        }

        for (String stepPattern : GherkinValidator.stepPatternsMap.values()) {
            if (lineText.matches(stepPattern)) {
                originalStepdef = CodeEditor.beutifyStepdef(stepPattern).substring(1,CodeEditor.beutifyStepdef(stepPattern).length()-1);
                break;
            }
        }

        if (!originalStepdef.equals("")) {
            Map<String, String> signatureMap = CodeEditor.getStepSignatureMap(lineText, originalStepdef);
            String parameterType = signatureMap.get(editableWord);
            switch (parameterType) {
                case "LOCATOR":
                    System.out.println("LOCATOR");
                    predictedLocatorsList.getItems().addAll(suggestionList(editableWord,validLocatorsList,8));
                    break;
                case "LOC_TEMPLATE":
                    System.out.println("LOC_TEMPLATE");
                    predictedLocatorsList.getItems().addAll(suggestionList(editableWord,validSpecialLocatorsList,8));
                    break;
                case "REUSABLE":
                    System.out.println("REUSABLE");
                    predictedLocatorsList.getItems().addAll(suggestionList(editableWord,GherkinValidator.reusablesList,8));
                    break;
                case "PARAM":
                    System.out.println("PARAM");
                    break;
                default:
                    System.out.println("Default");
                    predictedLocatorsList.getItems().addAll(suggestionList(editableWord,validLocatorsList,8));
                    break;
            }
        } else {
            predictedLocatorsList.getItems().addAll(suggestionList(editableWord,validLocatorsList,8));
        }


        predictedStepdefsList.getItems().clear();
        predictedStepdefsList.getItems().addAll(beutifyStepdefs(suggestionList(editableLine,validStepdefsList,8)));

        locatorComboBox.getItems().clear();
        if (validator.isValidStepdef(editableWord)) {
            System.out.println("Parameter is valid");
            locatorComboBox.setPromptText("VALID");
        } else {
            locatorComboBox.setPromptText(editableWord);
        }
        locatorComboBox.getItems().addAll(validator.getInvalidParameters(updatedCode));

        stepdefComboBox.getItems().clear();
        if (validator.isValidStepdef(editableLine.trim().replaceAll("^(Given |When |Then |And |But )", ""))) {
            System.out.println("Stepdef is valid");
            stepdefComboBox.setPromptText("VALID");
        } else {
            stepdefComboBox.setPromptText(editableLine);
        }
        stepdefComboBox.getItems().addAll(validator.getInvalidStepdefs(updatedDoc));
    }

    /** Save Feature File button listener */
    public void createNewFeature() {
        snapshot();
        try {
            crud.display();
            fileTreeView.setRoot(trimFileTreeView(new SimpleFileTreeItem(new File(
                    CodeEditorExample.frameworkFolder + "/src/test/resources/cucumber/bpp_features"))));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void debugButtonListener() {
        getEditingCursorPosition();
        System.out.println("Debug");
   }

    /** Valid Parameters list listener */
   public void clickOnLocatorsList() {
       fixParameter();
   }

    /** Valid Stepdefs list listener */
   public void clickOnStepdefsList() {
       fixStepdef();
   }

    /** onClick() for fileTreeView.
     * If selected item is feature file - enables "Load" button*/
   public void checkLoadButtonAvailability() {
        if (!fileTreeView.getSelectionModel().isEmpty()) {
            if (fileTreeView.getSelectionModel().getSelectedItem().getValue().endsWith(".feature")) {
                loadFeatureButton.setDisable(false);
                saveChangesButton.setDisable(false);
            } else {
                loadFeatureButton.setDisable(true);
                saveChangesButton.setDisable(true);
            }
        }
   }

    /** Load button listener */
   public void loadFeature() {
       String filePath = featureFilesMap.get(fileTreeView.getSelectionModel().getSelectedItem().getValue());
       editingCode = GuiHelper.readFile(filePath, StandardCharsets.UTF_8).replaceAll("\r","");
       setCode();
   }

   public void saveChanges() {
       byte[] data = CodeEditor.editingCode.getBytes();
       Path p = Paths.get(featureFilesMap.get(fileTreeView.getSelectionModel().getSelectedItem().getValue()));
       
       try {
           OutputStream out = new BufferedOutputStream(Files.newOutputStream(p, CREATE));
           out.write(data, 0, data.length);
           out.close();
//           messageLabel.setText("File saved!");
       } catch (IOException x) {
           System.err.println(x);
       }
   }

   //___________________________menu items listeners____________________________

    public void openLocatorsManager() {
        try {
            locatorsManager.display();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void openReusablesManager() {
        try {
            reusablesManager.display();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    _____________________________additional functions________________________________

    /** applies the editing template to the editing code to create the html+javascript source for a code editor.
     *
     * @author Ruslan Levytskyi
     * */
    private String applyEditingTemplate() {
        return editingTemplate.replace("${code}", editingCode);
    }

    /** Method to get current text from WebEditor
     *
     * text from WebEditor
     * */
    private String getCode() {
        return (String ) webview.getEngine().executeScript("editor.getValue();");
    }

    /** Saves the current text from WebEditor into a variable
     *
     * @author Ruslan Levytskyi
     * */
    private void snapshot() {
        editingCode = (String ) webview.getEngine().executeScript("editor.getValue();");
    }

    /** Method to compare 2 strings and get first distinct character
     *
     * @author Ruslan Levytskyi
     * */
    private int compareStrings(String s1, String s2) {
        int distinctPosition = 0;
        String smallerString = s1.length()<s2.length() ? s1 : s2;
        String biggerString = s1.length()>s2.length() ? s1 : s2;
        for (int i=0; i<smallerString.length(); i++) {
            char ch1 = s1.charAt(i);
            char ch2 = s2.charAt(i);
            if (ch1!=ch2) {
                distinctPosition = i;
                break;
            }
        }
        if (!smallerString.equals(biggerString) && distinctPosition==0) {
            return s2.length();
        } else {
            return distinctPosition;
        }
    }

    //todo: make this method more universal. Pass strings before and after as parameters
    /** Custom method to get the word between parentheses that was updated recently in web view.
     *
     * @author Ruslan Levytskyi
     * */
    private String getEditableWord() {
        String editableWord = "";
        String possibleR = "";
        String possibleL = "";
        int rightRim = updatedCode.length();
        int leftRim = 0;
        int centerRim = 0;
        for (int i=0; i+editingCursorPosition<updatedCode.length(); i++) {
            if (updatedCode.charAt(editingCursorPosition + i)=='"') {
                rightRim = editingCursorPosition + i;
                if (i==0) {
                    centerRim = editingCursorPosition;
                } else {
                    break;
                }
            }
        }
        for (int i=0; editingCursorPosition-i>1; i++) {
            if (updatedCode.charAt(editingCursorPosition - 1 - i)=='"') {
                leftRim = editingCursorPosition - i;
                if (i==0) {
                    centerRim = editingCursorPosition;
                } else {
                    break;
                }
            }
        }
        editableWord = updatedCode.substring(leftRim, rightRim);
        if (centerRim != 0) {
            possibleR = updatedCode.substring(centerRim, rightRim);
            possibleL = updatedCode.substring(leftRim, centerRim);
        }

        List<String> invalidParametersList = validator.getInvalidParameters(updatedCode);
        if (invalidParametersList.contains(editableWord)) {
            System.out.println(editableWord);
            return editableWord;
        } else if (invalidParametersList.contains(possibleR)) {
            System.out.println(possibleR);
            return possibleR;
        } else if (invalidParametersList.contains(possibleL)) {
            System.out.println(possibleL);
            return possibleL;
        } else {
            System.out.println("Invalid Locator");
            return editableWord;
        }
    }

    //todo: make this method more universal. Pass strings before and after as parameters
    /** Custom method to get the line that was updated recently in web view.
     *
     * @author Ruslan Levytskyi
     * */
    private String getEditableLine() {
        String editableLine = "";
        String possibleR = "";
        String possibleL = "";
        int rightRim = updatedCode.length();
        int leftRim = 0;
        int centerRim = 0;
        for (int i=0; i+editingCursorPosition<updatedCode.length(); i++) {
            if (updatedCode.charAt(editingCursorPosition + i)=='\n') {
                rightRim = editingCursorPosition + i;
                if (i==0) {
                    centerRim = editingCursorPosition;
                } else {
                    break;
                }
            }
        }
        for (int i=0; editingCursorPosition-i>1; i++) {
            if (updatedCode.charAt(editingCursorPosition - 1 - i)=='\n') {
                leftRim = editingCursorPosition - i;
                if (i!=0) {
                    break;
                }
            }
        }
        editableLine = updatedCode.substring(leftRim, rightRim).trim().replaceAll("^(Given |When |Then |And |But )", "");
        if (centerRim != 0) {
            possibleR = updatedCode.substring(centerRim, rightRim).trim().replaceAll("^(Given |When |Then |And |But )", "");
            possibleL = updatedCode.substring(leftRim, centerRim).trim().replaceAll("^(Given |When |Then |And |But )", "");
        }

        List<String> invalidLinesList = validator.getInvalidStepdefs(updatedDoc);
        if (invalidLinesList.contains(editableLine)) {
            System.out.println(editableLine);
            return editableLine;
        } else if (invalidLinesList.contains(possibleR)) {
            System.out.println(possibleR);
            return possibleR;
        } else if (invalidLinesList.contains(possibleL)) {
            System.out.println(possibleL);
            return possibleL;
        } else {
            System.out.println("Invalid Stepdef");
            return editableLine;
        }
    }

    /** Method to get a list of suggestions from chooseList based on the given word
     *
     * @param word - suggestion key
     * @param chooseList - list of valid parameters to choose from
     * @param restriction - max number of suggestions in the list
     *
     * @author Ruslan Levytskyi
     * */
    private List<String> suggestionList(String word, List<String> chooseList, int restriction) {
        List<String> suggestions = new ArrayList<>();
        int w = 0;
        for (int i=0; word.length()-i>2; i++) {
            for (String option : chooseList) {
                String trimmedWord = word.substring(0,word.length()-i);
                if (option.contains(trimmedWord) && !suggestions.contains(option)) {
                    if (w > restriction) {
                        break;
                    }
                    suggestions.add(option);
                    w++;
                }
            }
        }
        return suggestions;
    }

    /** Method to replace invalid parameter, being edited, to the valid one, selected from the list
     *
     * @author Ruslan Levytskyi
     * */
    private void fixParameter() {
        if (!predictedLocatorsList.getSelectionModel().isEmpty()) {
            editingCode = editingCode.replaceAll('"'+editableWord+'"','"'+predictedLocatorsList.getSelectionModel().getSelectedItem()+'"');
            setCode();
        }
    }

    /** Method to replace invalid step, being edited, to the valid one, selected from the list
     *
     * @author Ruslan Levytskyi
     * */
    private void fixStepdef() {
        if (!predictedStepdefsList.getSelectionModel().isEmpty()) {
            String fixedLine = predictedStepdefsList.getSelectionModel().getSelectedItem();
            List<String> params = GuiHelper.getQuoted(editableLine,'"');
            List<String> signature = GuiHelper.getQuoted(predictedStepdefsList.getSelectionModel().getSelectedItem(),'"');
            for (int i = 0; i < Math.min(params.size(), signature.size()); i++) {
                fixedLine = fixedLine.replaceFirst(signature.get(i),params.get(i));
            }
            editingCode = editingCode.replace(editableLine, fixedLine.substring(1,fixedLine.length()-1));
            setCode();
        }
    }

    /** Method to get a signature of each parameter of the step, if it is valid
     *
     * @param step - step, to get parameters from
     * @param template - valid stepdef, to get parameter signature from
     *
     * @return a map, where key is actual parameter of provided stepdef, and value - it`s signature (LOCATOR,REUSABLE,LOC_TEMPLATE e.t.c.)
     *
     * @author Ruslan Levytskyi
     * */
    public static Map<String,String> getStepSignatureMap(String step, String template) {
        Map<String,String> stepSignatureMap = new HashMap<>();
        List<String> params = GuiHelper.getQuoted(step,'"');
        List<String> signature = GuiHelper.getQuoted(template,'"');
        for (int i = 0; i < Math.min(params.size(), signature.size()); i++) {
            stepSignatureMap.put(params.get(i),signature.get(i));
        }
        return stepSignatureMap;
    }

    /** Method to replace all regex parameters in stepdef template with their signatures
     *
     * @author Ruslan Levytskyi
     * */
    private List<String> beutifyStepdefs(List<String> stepDefs) {

        List<String> beutifiedStepdefs = new ArrayList<>();
        for (String stepdef : stepDefs) {
            List<String> signature = new ArrayList<>(Arrays.asList(GherkinValidator.stepSignaturesMap.get(stepdef).split(",")));
            for (String element : signature) {
                stepdef = stepdef.replaceFirst("(\\(\\[\\^\\\"\\]\\*\\))", element);
            }
            beutifiedStepdefs.add(stepdef);
        }
        return beutifiedStepdefs;
    }

    /** Method to replace all regex parameters in stepdef template with their signatures
     *
     * @author Ruslan Levytskyi
     * */
    public static String beutifyStepdef(String stepdef) {
        List<String> signature = new ArrayList<>(Arrays.asList(GherkinValidator.stepSignaturesMap.get(stepdef).split(",")));
        for (String element : signature) {
            stepdef = stepdef.replaceFirst("(\\(\\[\\^\\\"\\]\\*\\))", element);
        }
        return stepdef;
    }

    private WebElement getElementFromWebViewByXpath(String xpath) {
        WebElement element;
        try {
            element = (WebElement)
                    XPathFactory.newInstance().newXPath().evaluate(
                            "xpath",
                            updatedDoc, XPathConstants.NODE);
            return element;
        } catch (XPathException e) {
            e.printStackTrace();
        }
        return null;
    }

    /** Method to trim all the unnecessary absolute path from fileTree elements
     *
     * @author Ruslan Levytskyi
     * */
    private TreeItem<String> trimFileTreeView(TreeItem<File> fileTree) {
        TreeItem<String> nameTree = new TreeItem<>();
        String separator = "/";
        String rootName = fileTree.getValue().getPath()
                .split(separator)[fileTree.getValue().getPath().split(separator).length-1];
        nameTree.setValue(rootName);
        for (TreeItem<File> child : fileTree.getChildren()) {
            if(!child.isLeaf()) {
                nameTree.getChildren().add(trimFileTreeView(child));
            } else {
                String childName = child.getValue().getPath()
                        .split(separator)[child.getValue().getPath().split(separator).length-1];
                nameTree.getChildren().add(new TreeItem<>(childName));
                featureFilesMap.put(childName,child.getValue().getPath());
            }
        }
        return nameTree;
    }


    //______________________New editor Functions___________________

    private int[] getEditingCursorPosition() {
        int[] pos = new int[2];
        pos[0] = (Integer ) webview.getEngine().executeScript("editor.getCursor().line;");
        pos[1] = (Integer ) webview.getEngine().executeScript("editor.getCursor().ch;");
        return pos;
    }
}
