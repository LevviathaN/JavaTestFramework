package pages;

import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.Select;
import utils.FileIO;

/**
 * Created by odiachuk on 07.07.17.
 */
public class MattressesPage extends BaseProductPage{

        private static MattressesPage instance;
        public static MattressesPage Instance = (instance != null) ? instance : new MattressesPage();

    public MattressesPage(){
        pageURL = "/mattresses";
    }

    /** Common elements **/

    public PageHeader header = PageHeader.Instance;

        /** UI Mappings */

        By selectMattressSize = By.cssSelector("div.bed-size-select");
     //   By addToCartButton = By.id("product-addtocart-button");


        /** Page Methods */

    public MattressesPage selectMattressSize(String value){
        reporter.info("Select mattress size: " + value);
        if (isElementPresentAndDisplay(selectMattressSize)){
            scrollToElement(driver().findElement(selectMattressSize));
            findElement(selectMattressSize).click();
            findElement(By.xpath("//div[@class='option' and contains(text(),'" + value + "')]")).click();
            if (!findElement(selectMattressSize).getText().contains(value)){
                reporter.fail("Item was not changed to: " + value);
            }
        }else {
            findElement(By.xpath("//div[@class='bed-size-select cx-safewait-loaded cx-bed-size-select']//div[@class=contains(text(),'" + value + "')][1]")).click();
        }
        return this;
    }

    public MattressesPage selectMattressFeel(String mattressFeel) {
        reporter.info("Select mattress feel: " + mattressFeel);
        if (isElementPresent(By.xpath("//div[@option-label='" + mattressFeel + "']"))) {
            findElement(By.xpath("//div[@option-label='" + mattressFeel + "']")).click();
            if (!findElement(By.xpath("//div[@option-label='" + mattressFeel + "']")).getAttribute("class").contains("selected"))
                reporter.fail("Item was not selected: " + mattressFeel);
        }
        return this;
    }

    public MattressesPage clickAddToCart() {
        super.clickAddToCart();
        return this;
    }
}
