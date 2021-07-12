package cucumber.regressionSpreadsheetUpdate;

import org.testng.annotations.Test;
import ui.utils.BaseUITest;
import ui.utils.SpreadsheetsHelper;

public class UpdateSFRegression {

    @Test(groups = {"SpreadsheetsUpdate"})
    public void udateSpreadsheet() {
        SpreadsheetsHelper.manageSpreadsheet("Salesforce");
    }
}