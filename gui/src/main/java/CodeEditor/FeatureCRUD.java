package CodeEditor;

import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import static java.nio.file.StandardOpenOption.CREATE;

public class FeatureCRUD {

    public static Stage createFeatureWindow;
    public TextField featurePath;
    public TextField featureNameField;
    public Label messageLabel;

    /** Displays "Save Feature File modal window" */
    public void display() throws Exception {
        URL url = new URL("file:" + CodeEditorExample.guiFolder + "/src/main/resources/CreateFeatureModal.fxml");
        Parent root = FXMLLoader.load(url);
        createFeatureWindow = new Stage();
//        createFeatureWindow.initModality(Modality.APPLICATION_MODAL);
        createFeatureWindow.setTitle("Save feature file");
        createFeatureWindow.setMinWidth(250);

        Scene scene = new Scene(root, 320, 150);
        createFeatureWindow.setScene(scene);
        createFeatureWindow.showAndWait();

    }

    /** Method to create feature file using the name fom text field*/
    public void createFeatureFile() {
        byte[] data = CodeEditor.editingCode.getBytes();

        Path p = Paths.get(featurePath.getText() + featureNameField.getText() + ".feature");

        try {
            OutputStream out = new BufferedOutputStream(Files.newOutputStream(p, CREATE));
            out.write(data, 0, data.length);
            out.close();
            messageLabel.setText("File saved!");
        } catch (IOException x) {
            System.err.println(x);
        }

        createFeatureWindow.close();
    }

    /** Method to close Save File modal */
    public void cancelCreation() {
        createFeatureWindow.close();
    }
}
