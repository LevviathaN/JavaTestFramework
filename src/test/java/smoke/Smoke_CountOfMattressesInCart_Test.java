package smoke;

import annotations.TestName;
import entities.ItemEntity;
import enums.ProductTypes;
import org.testng.Assert;
import org.testng.annotations.Test;
import pages.HomePage;
import pages.MattressesPage;
import pages.ShopPage;
import pages.ViewCartPage;
import utils.BaseTest;
import utils.EntitiesFactory;
import utils.FileIO;
import utils.ProductSync;

/**
 * @author Taras
 * @since 7/25/2017.
 */
public class Smoke_CountOfMattressesInCart_Test extends BaseTest {

    @Test
    @TestName(name = "Check count of mattresses in cart and the cart flag in header")
    public void countOfMattressesInCart_Test() throws Exception {

        // creating of two system entities
        ItemEntity biggerMattress = EntitiesFactory.getItem(FileIO.getDataFile("Default_Mattress.json"));
        ItemEntity smallerMattress = EntitiesFactory.getItem(FileIO.getDataFile("Updated_Mattress.json"));

        int countOfGoodsFromCartIcon;
        int countOfGoodsInCart;

        //open pages
        HomePage homePage = HomePage.Instance;
        ViewCartPage cart = ViewCartPage.Instance;
        homePage.open();
        ProductSync.check(ProductTypes.MATTRESS);
        ShopPage shopPage = homePage.header.clickShopMenuItem();
        MattressesPage mattressesPage = shopPage.clickOnShopOurMattressButton();

        //adding two the identical "bigger" mattresses to the cart
        mattressesPage.selectOption(biggerMattress.getSize()).selectOption(biggerMattress.getType()).clickAddToCart();
        mattressesPage.open();

        mattressesPage.selectOption(biggerMattress.getSize()).selectOption(biggerMattress.getType()).clickAddToCart();
        mattressesPage.open();

        mattressesPage.selectOption(biggerMattress.getSize()).selectOption(biggerMattress.getType()).clickAddToCart();

        //checking if "bigger" mattresses were counted
        countOfGoodsFromCartIcon = mattressesPage.header.getCountOfGoodsFromMiniCartIcon();
        countOfGoodsInCart = mattressesPage.header.getCountOfGoodsInMiniCart();
        Assert.assertTrue(countOfGoodsInCart == countOfGoodsFromCartIcon, "First time. Count of added to cart items equal to count from cart icon");

        //adding another item (model of smaller mattresses) to the cart

        mattressesPage.open();
        mattressesPage.selectOption(smallerMattress.getSize()).selectOption(smallerMattress.getType()).clickAddToCart();

        mattressesPage.open();
        mattressesPage.selectOption(smallerMattress.getSize()).selectOption(smallerMattress.getType()).clickAddToCart();

        mattressesPage.open();

        ProductSync.uncheck(ProductTypes.MATTRESS);

        countOfGoodsFromCartIcon = mattressesPage.header.getCountOfGoodsFromMiniCartIcon();
        countOfGoodsInCart = mattressesPage.header.getCountOfGoodsInMiniCart();

        //checking if all mattress were added and counted
        Assert.assertTrue(countOfGoodsInCart == countOfGoodsFromCartIcon, "Second time. Count of added to cart items equal to count from cart icon");
    }

}
