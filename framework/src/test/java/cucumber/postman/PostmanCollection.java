package cucumber.postman;

import io.cucumber.java.en.When;
import ui.utils.BPPLogManager;
import ui.utils.Reporter;
import java.io.*;

public class PostmanCollection {

    /**
     * To Activate test execution. Follow next steps:
     * 1 - Navigate to terminal tab in IDEA
     * 2 - Enter commands:
     *  a - npm install -g newman
     *  b - npm install -g newman-reporter-htmlextra
     *  c - install Node.js
     * 3 - Run postman tests
     **/

    @When("^I execute postman \"([^\"]*)\" collection using \"([^\"]*)\" environment$")

    public PostmanCollection i_execute_postman_collection(String collection, String environment) throws IOException {

        String collectionPath = System.getProperty("user.dir") + File.separator + "src" + File.separator + "main" + File.separator + "resources" + File.separator + "api" + File.separator + "postman" + File.separator + "collections" + File.separator;
        String environmentPath = System.getProperty("user.dir") + File.separator + "src" + File.separator + "main" + File.separator + "resources" + File.separator + "api" + File.separator + "postman" + File.separator + "environments" + File.separator;
        String reporterPath = Reporter.getFilePath() + File.separator;

        String newmanRun = "newman run ";
        String newmanFile = collectionPath + collection + " ";
        String newmanEnvironment = "-e " + environmentPath + environment + " ";
        String newmanReporter = "-r htmlextra,cli --reporter-htmlextra-logs ";
        String newmanReporterPath = "--reporter-htmlextra-export " + reporterPath + collection + ".html";

        ProcessBuilder builder = new ProcessBuilder("cmd.exe", "/c", newmanRun + newmanFile + newmanEnvironment + newmanReporter + newmanReporterPath);
        builder.redirectErrorStream(true);
        Process p = builder.start();
        BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));

        String line;
        while (true) {
            line = r.readLine();
            if (line == null) {
                break;
            }
            Reporter.log(line);
            BPPLogManager.getLogger().info(line);
        }
        return this;
    }
}