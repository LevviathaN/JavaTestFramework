package cucumber.reusablesteps;

import gherkin.pickles.Pickle;
import gherkin.pickles.PickleStep;
import gherkin.pickles.PickleTag;
import io.cucumber.testng.CucumberFeatureWrapper;
import io.cucumber.testng.CucumberOptions;
import io.cucumber.testng.PickleEventWrapper;
import io.cucumber.testng.TestNGCucumberRunner;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import static java.nio.file.StandardOpenOption.CREATE;

@CucumberOptions(
        features = "src/test/resources/cucumber/bpp_features",
        glue = {"cucumber.stepdefs"},
        tags = {"@ProductFactory and not @DataGeneration or @DirectApps or @Hub or @DigitalSite or @Banner or @Salesforce"},
        plugin = {"pretty"})

/**
 * Class created to collect all tests within framework into JSON file
 * */
public class Tests {

    private TestNGCucumberRunner testNGCucumberRunner;
    private String fileContent;
    private String step;

    public Tests() {}

    @BeforeClass(alwaysRun = true)
    public void setUpClass() {
        this.testNGCucumberRunner = new TestNGCucumberRunner(this.getClass());
        step = "Initial step";
        fileContent = "<scenarios>";
    }


    @Test(
            groups = {"cucumber"},
            description = "Runs Cucumber Scenarios",
            dataProvider = "scenarios"
    )
    public void findScenarios(PickleEventWrapper pickleWrapper, CucumberFeatureWrapper featureWrapper) throws Throwable {
        System.out.println("Debug " + pickleWrapper.getPickleEvent().pickle.getName());

        Pickle pickle = pickleWrapper.getPickleEvent().pickle;
        List<PickleTag> tags = pickle.getTags();
        step = "<scenario name=\"" + pickle.getName() + "\">";
        step = step + "<tags>";
        for (PickleTag tag : tags) {
            step = step + "<tag>" + tag.getName() + "</tag>";
        }
        step = step + "</tags>";
        for(PickleStep pickleStep : pickle.getSteps()){
            String currentStep = pickleStep.getText();
            currentStep = currentStep.replaceAll("<", "&lt;");
            currentStep = currentStep.replaceAll(">", "&gt;");
            currentStep = currentStep.replaceAll("&", "&amp;");
            step = step + "<step>" + currentStep + "</step>";
        }
        step = step + "</scenario>";
        fileContent = fileContent + step;
    }

    @DataProvider()
    public Object[][] scenarios() {
        return this.testNGCucumberRunner == null ? new Object[0][0] : this.testNGCucumberRunner.provideScenarios();
    }

    @AfterClass(alwaysRun = true)
    public void tearDownClass() {
        if (this.testNGCucumberRunner != null) {
            this.testNGCucumberRunner.finish();

            fileContent = fileContent + "</scenarios>";
            byte[] data = fileContent.getBytes();
            Path p = Paths.get("src/main/resources/data/bpp/PFScenarios.xml");

            try{
                Files.deleteIfExists(p);
            }catch(IOException e){e.printStackTrace();}

            try (OutputStream out = new BufferedOutputStream(Files.newOutputStream(p, CREATE))) {
                out.write(data, 0, data.length);
            } catch (IOException x) {
                System.err.println(x);
            }
        }
    }
}