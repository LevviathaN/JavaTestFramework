package smoke;

import annotations.TestName;
import entities.ItemEntity;
import entities.UserEntity;
import enums.ProductTypes;
import org.testng.Assert;
import org.testng.annotations.Test;
import pages.*;
import utils.BaseTest;
import utils.EntitiesFactory;
import utils.FileIO;
import utils.ProductSync;

public class Smoke_Monitor_FullTest extends BaseTest {

    @Test
    @TestName(name="Monitor Workflow test")
    public void smoke_Monitor_FullTest() throws Exception {

        //init test entities
        ItemEntity item = EntitiesFactory.getItem( FileIO.getDataFile("Default_Monitor.json") );
        UserEntity user = EntitiesFactory.getUser( FileIO.getDataFile("Default_User.json")); // get user data from file

        //init pages
        HomePage home = HomePage.Instance;
        ViewCartPage cart = ViewCartPage.Instance;
        CheckoutPage checkout = CheckoutPage.Instance;
        CheckoutReviewPage review = CheckoutReviewPage.Instance;

        //open home page and add Monitor to cart
        home.open();
        ProductSync.check(ProductTypes.MONITOR);
        ShopPage shopPage = home.header.clickShopMenuItem();

        shopPage.clickOnShopOurMonitorButton()
                .selectMonitorType(item.getType())
                .clickAddToCart();
        home.header.clickShopMenuItem();

        ProductSync.uncheck(ProductTypes.MONITOR);
        // check item in cart
        Assert.assertTrue(home.header.itemWasFoundInCart(item),  "Item was not displayed in cart");

        //check item displayed in order
        home.header.clickOnViewCartButton();
        Assert.assertTrue(cart.itemDisplayedOnViewCartPage(item), "Item was not displayed in cart");
        cart.clickOnProceedToChechout();


        //set all user related felds
        checkout.populateAllCheckoutFields(user);

        //check Order Review page was opened
        Assert.assertTrue(review.isPaymentMethodTitleDisplayed(),"Payment page was not displayed");

        //check item in final order
        Assert.assertTrue(review.itemWasFoundInOrder(item), "Item was not displayed on final page");


    }
}
