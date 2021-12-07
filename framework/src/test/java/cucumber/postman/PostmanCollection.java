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
     *  b - npm install -g allure-commandline --save-dev (Allure require Java 8+)
     *  c - npm install -g newman-reporter-allure
     *  d - install Node.js
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
        String newmanReporter = "-r allure ";
        String newmanReporterPath = "--reporter-allure-export " + reporterPath  + "allure-results";

        ProcessBuilder builder = new ProcessBuilder("cmd.exe", "/c", newmanRun + newmanFile + newmanEnvironment + newmanReporter + newmanReporterPath);
        builder.redirectErrorStream(true);
        Process p = builder.start();
        BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));

        String line;

        while (true) {
            line = r.readLine();
            if (line == null) {
                break;
            } else {
                BPPLogManager.getLogger().info(line);
                Reporter.log(line);
            }
        }

        ProcessBuilder reportBuilder = new ProcessBuilder("cmd.exe", "/c", "allure generate " + newmanReporterPath + " --clean");
        reportBuilder.start();

        Reporter.addPostmanReporterLink("allure-report" + File.separator + "index.html");

        return this;

    }
}