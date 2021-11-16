package cucumber.postman;

import io.cucumber.java.en.When;
import ui.utils.Reporter;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PostmanCollection {

    /*
     * To Activate test execution. Follow next steps:
     * 1 - Navigate to terminal tab in IDEA
     * 2 - Enter commands:
     *  a - npm install -g newman
     *  b - npm install -g newman-reporter-htmlextra
     * 3 - Run postman tests
     * */

    @When("^I execute postman \"([^\"]*)\" collection using \"([^\"]*)\" environment$")

    public PostmanCollection i_execute_postman_collection(String collection, String environment) throws IOException {

        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd_HH_mm_ss");
        Date date = new Date(System.currentTimeMillis());

        StringBuilder collectionPath = new StringBuilder();
        collectionPath.append(System.getProperty("user.dir"))
                .append(File.separator + "src")
                .append(File.separator + "main")
                .append(File.separator + "resources")
                .append(File.separator + "api")
                .append(File.separator + "postman")
                .append(File.separator + "collections" + File.separator);

        StringBuilder envPath = new StringBuilder();
        envPath.append(System.getProperty("user.dir"))
                .append(File.separator + "src")
                .append(File.separator + "main")
                .append(File.separator + "resources")
                .append(File.separator + "api")
                .append(File.separator + "postman")
                .append(File.separator + "environments" + File.separator);

        StringBuilder reporterPath = new StringBuilder();
        reporterPath.append(System.getProperty("user.dir"))
                .append(File.separator + "report" + File.separator)
                .append("newman_report_" + formatter.format(date) + File.separator);

        String newmanRun = "newman run ";
        String newmanFile = collectionPath + collection + " ";
        String newmanEnvironment = "-e " + envPath + environment + " ";
        String newmanReporter = "-r htmlextra ";
        String newmanReporterPath = "--reporter-htmlextra-export " + reporterPath + collection + ".html ";

        ProcessBuilder builder = new ProcessBuilder("cmd.exe", "/c", newmanRun + newmanFile + newmanEnvironment + newmanReporter + newmanReporterPath);
        builder.redirectErrorStream(true);
        Process p = builder.start();
        BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
        ;

        String line;
        while (true) {
            line = r.readLine();
            if (line == null) {
                break;
            }
            Reporter.log(line);
        }
        return this;
    }
}