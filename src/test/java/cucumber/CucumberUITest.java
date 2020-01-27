package cucumber;

import io.cucumber.testng.CucumberOptions;
import io.cucumber.testng.*;
import org.testng.annotations.*;
import ui.utils.BaseUITest;
import ui.utils.Reporter;

@CucumberOptions(
        features = "src/test/resources/cucumber/bpp_features",
        glue = {"cucumber.stepdefs"},
        tags = {"@Bodies"},
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
            groups = {"BPP Automation"},
            dataProvider = "scenarios"
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