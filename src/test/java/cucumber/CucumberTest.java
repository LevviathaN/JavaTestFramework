package cucumber;

import io.cucumber.testng.CucumberOptions;
import io.cucumber.testng.*;
import org.testng.annotations.*;
import utils.BaseTest;

@CucumberOptions(
        features = "src/test/resources/cucumber/bpp_features",
        glue = {"cucumber.stepdefs"},
        tags = {"not @Ignore"},
        plugin = {"pretty"})

public class CucumberTest  extends BaseTest {
    private TestNGCucumberRunner testNGCucumberRunner;

    public CucumberTest() {
    }

    @BeforeClass(
            alwaysRun = true
    )
    public void setUpClass() {
        this.testNGCucumberRunner = new TestNGCucumberRunner(this.getClass());
    }

    @Test(
            groups = {"cucumber"},
            description = "Runs Cucumber Scenarios",
            dataProvider = "scenarios"
    )
    public void runScenario(PickleEventWrapper pickleWrapper, CucumberFeatureWrapper featureWrapper) throws Throwable {
        this.testNGCucumberRunner.runScenario(pickleWrapper.getPickleEvent());
    }

    @DataProvider
    public Object[][] scenarios() {
        return this.testNGCucumberRunner == null ? new Object[0][0] : this.testNGCucumberRunner.provideScenarios();
    }

    @AfterClass(
            alwaysRun = true
    )
    public void tearDownClass() {
        if (this.testNGCucumberRunner != null) {
            this.testNGCucumberRunner.finish();
        }
    }
}