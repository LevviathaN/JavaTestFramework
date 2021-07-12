package cucumber.regressionSpreadsheetUpdate;

import org.testng.annotations.Test;
import ui.utils.BaseUITest;
import ui.utils.SpreadsheetsHelper;

public class UpdateBERegression {

    @Test(groups = {"SpreadsheetsUpdate"})
    public void updateSpreadsheet() {
        SpreadsheetsHelper.manageSpreadsheet("BuildEmpire");
    }
}