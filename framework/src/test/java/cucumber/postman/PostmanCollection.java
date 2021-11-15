package cucumber.postman;


import io.cucumber.java.en.When;
import ui.utils.Reporter;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

public class PostmanCollection {

    @When("^I execute postman \"([^\"]*)\" collection using \"([^\"]*)\" environment$")

    public PostmanCollection i_execute_postman_collection(String collection, String environment) throws IOException {

        StringBuilder collectionPath = new StringBuilder();
        collectionPath.append(System.getProperty("user.dir"));
        collectionPath.append(File.separator + "postman" + File.separator + "collections" + File.separator);

        StringBuilder envPath = new StringBuilder();
        envPath.append(System.getProperty("user.dir"));
        envPath.append(File.separator + "postman" + File.separator + "environments" + File.separator);

        String newmanRun = "newman run ";
        String newmanFile = collectionPath + collection + " ";
        String newmanEnvironment = "-e " + envPath + environment + " ";
        String newmanReporter = "-r htmlextra";


        ProcessBuilder builder = new ProcessBuilder("cmd.exe", "/c", newmanRun + newmanFile + newmanEnvironment + newmanReporter);
        builder.redirectErrorStream(true);
        Process p = builder.start();
        BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));

        String line;
        while (true) {
            line = r.readLine();
            if (line == null) { break; }
            Reporter.log(line);
        }
        return this;
    }
}