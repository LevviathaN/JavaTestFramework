package CodeEditor;

import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.stage.Stage;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;

public class ReusableScenariosManager {

    public static Stage reusableScenariosWindow;
    public ListView<String> reusablesListView;
    public ListView<String> scenarioStepsListView;
    public Button initiateButton;

    /** Displays "Reusable Scenarios Manager" */
    public void display() throws Exception {
        URL url = new URL("file:" + CodeEditorExample.guiFolder + "/src/main/resources/ReusableScenariosManagerLayout.fxml");
        Parent root = FXMLLoader.load(url);
        reusableScenariosWindow = new Stage();
        reusableScenariosWindow.setTitle("Reusable Scenarios Manager");
        reusableScenariosWindow.setMinWidth(250);

        Scene scene = new Scene(root, 620, 500);
        reusableScenariosWindow.setScene(scene);
        reusableScenariosWindow.showAndWait();

    }

    /** Method to fill the reusables list*/
    public void initiateList() {
        reusablesListView.getItems().addAll(getReusableScenariosList());
    }

    public void updateStepsList() {
        scenarioStepsListView.getItems().clear();
        scenarioStepsListView.getItems().addAll(getStepsOfReusableScenario(reusablesListView.getSelectionModel().getSelectedItem()));
    }

    /** Method to close Save File modal */
    public void cancelCreation() {
        reusableScenariosWindow.close();
    }

    /**
     * @author Ruslan Levytskyi
     */
    private ArrayList<String> getReusableScenariosList() {

        ArrayList<String> availableReusableStepsList = new ArrayList<>();

        try {
            File inputFile = new File("src/main/resources/data/bpp/ReusableTestSteps.xml");
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

    /**
     * @author Ruslan Levytskyi
     */
    private ArrayList<String> getStepsOfReusableScenario(String reusableName) {

        ArrayList<String> stepsList = new ArrayList<>();

        try {
            File inputFile = new File("src/main/resources/data/bpp/ReusableTestSteps.xml");
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(inputFile);
            doc.getDocumentElement().normalize();
            ArrayList<String> availableReusableStepsList = new ArrayList<>();

            Node reusablesNode = doc.getElementsByTagName("reusables").item(0);
            Element reusablesElement = (Element) reusablesNode;

            NodeList reusablesList = reusablesElement.getElementsByTagName("reusable");
            for (int i = 0; i < reusablesList.getLength(); i++) {
                Node reusableNode = reusablesList.item(i);
                Element reusableElement = (Element) reusableNode;
                availableReusableStepsList.add(reusableElement.getAttribute("name"));
                if (reusableElement.getAttribute("name").equals(reusableName)) {
                    NodeList steps = reusableElement.getElementsByTagName("step");
                    for (int j = 0; j < steps.getLength(); j++) {
                        stepsList.add(steps.item(j).getTextContent());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stepsList;
    }
}
