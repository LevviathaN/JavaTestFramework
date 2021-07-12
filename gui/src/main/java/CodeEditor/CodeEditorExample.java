package CodeEditor;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.net.URL;

public class CodeEditorExample extends Application {

    public static String rootFolder;
    public static String frameworkFolder;
    public static String guiFolder;

    @Override
    public void start(Stage primaryStage) throws Exception{
        rootFolder = System.getProperty("user.dir").replace("\\", "/");
        guiFolder = rootFolder + "/gui";
        frameworkFolder = rootFolder + "/framework";

        URL url = new URL("file:" + guiFolder + "/src/main/resources/CodeEditorLayout.fxml");
        final FXMLLoader loader = new FXMLLoader(url);
        final Parent root = loader.load();

        primaryStage.setTitle("BDD Test Manager");
        primaryStage.setScene(new Scene(root, 1200, 650));
        primaryStage.show();
    }


    public void startCodeEditor(String[] args) {
        launch(args);
    }


}
