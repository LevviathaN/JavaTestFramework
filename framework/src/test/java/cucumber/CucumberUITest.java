package cucumber;

import io.cucumber.testng.CucumberFeatureWrapper;
import io.cucumber.testng.CucumberOptions;
import io.cucumber.testng.PickleEventWrapper;
import io.cucumber.testng.TestNGCucumberRunner;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;
import ui.utils.BaseUITest;
import ui.utils.Reporter;
import ui.utils.RetryAnalyzer;

@CucumberOptions(
        features = "src/test/resources/cucumber/bpp_features",
        glue = {"cucumber.api", "cucumber.productFactory", "cucumber.stepdefs"},
        tags = {"@PF_API or @ProductFactory and not @BlockedByIssue and not @DoNotRun and not @DataGeneration and not @CoveredWithApi and not @PartiallyCoveredWithApi"},
        plugin = {"pretty"})

public class CucumberUITest extends BaseUITest {
    private TestNGCucumberRunner testNGCucumberRunner;
    public String scenarioName;

    public CucumberUITest() {
    }

    @BeforeClass(alwaysRun = true)
    public void setUpClass() {
        this.testNGCucumberRunner = new TestNGCucumberRunner(this.getClass());
    }

    @Test(
            groups = {"BPPAutomation"},
            dataProvider = "scenarios",
            retryAnalyzer = RetryAnalyzer.class
    )
    public void runScenario(PickleEventWrapper pickleWrapper, CucumberFeatureWrapper featureWrapper) throws Throwable {
        scenarioName = pickleWrapper.getPickleEvent().pickle.getName();
        Reporter.node("Executing: " + scenarioName + " scenario",
                "It contains " + pickleWrapper.getPickleEvent().pickle.getSteps().size() + " steps");
        this.testNGCucumberRunner.runScenario(pickleWrapper.getPickleEvent());
    }

    @DataProvider(parallel = true)
    public Object[][] scenarios() {
        return this.testNGCucumberRunner == null ? new Object[0][0] : this.testNGCucumberRunner.provideScenarios();
    }

    @AfterClass(alwaysRun = true)
    public void tearDownClass() {
        if (this.testNGCucumberRunner != null) {
            this.testNGCucumberRunner.finish();
        }
    }
}