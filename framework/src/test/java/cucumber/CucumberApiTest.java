package cucumber;

import api.BaseApiTest;
import io.cucumber.testng.CucumberFeatureWrapper;
import io.cucumber.testng.CucumberOptions;
import io.cucumber.testng.PickleEventWrapper;
import io.cucumber.testng.TestNGCucumberRunner;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;
import ui.utils.Reporter;
import ui.utils.RetryAnalyzer;

@CucumberOptions(
        features = "src/test/resources/cucumber/bpp_features",
        glue = {"cucumber.api", "cucumber.productFactory"},
        tags = {"@PF-API"},
        plugin = {"pretty"})

public class CucumberApiTest extends BaseApiTest {
    private TestNGCucumberRunner testNGCucumberRunner;
    public String scenarioName;

    public CucumberApiTest() {
    }

    @BeforeClass(alwaysRun = true)
    public void setUpClass() {
        this.testNGCucumberRunner = new TestNGCucumberRunner(this.getClass());
    }

    @Test(
            groups = {"BPP API Automation"},
            dataProvider = "scenarios",
            retryAnalyzer = RetryAnalyzer.class,
            invocationCount = 1,
            threadPoolSize = 1
    )
    public void runScenario(PickleEventWrapper pickleWrapper, CucumberFeatureWrapper featureWrapper) throws Throwable {
        scenarioName = pickleWrapper.getPickleEvent().pickle.getName();
        Reporter.node("Executing: " + scenarioName + " scenario",
                "It contains " + pickleWrapper.getPickleEvent().pickle.getSteps().size() + " steps");
        this.testNGCucumberRunner.runScenario(pickleWrapper.getPickleEvent());
    }

    @DataProvider(parallel = true)
    public synchronized Object[][] scenarios() {
        return this.testNGCucumberRunner == null ? new Object[0][0] : this.testNGCucumberRunner.provideScenarios();
    }

    @AfterClass(alwaysRun = true)
    public void tearDownClass() {
        if (this.testNGCucumberRunner != null) {
            this.testNGCucumberRunner.finish();
        }
    }
}