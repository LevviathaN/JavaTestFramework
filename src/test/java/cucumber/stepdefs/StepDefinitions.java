package cucumber.stepdefs;

import cucumber.api.java.en.*;
import org.testng.Assert;
import pages.BasePage;
import utils.*;

/**
 * Created by Ruslan Levytskyi on 15/3/2019.
 */
public class StepDefinitions extends BasePage {

    ReporterManager reporter = ReporterManager.Instance;

    @Given("^I am on \"([^\"]*)\" URL$")
    public void i_am_on_url(String url) {
        driver().get(url);
    }

    @Given("^I am on the (Assets|Collections) Page$")
    public void i_am_on_the_home_page(String page) {
        switch(page){
            case "Assets":
                driver().get("https://author-bass-assets-stage65.adobecqms.net/assets.html/content/dam");
                break;
            case "Collections":
                driver().get("https://author-bass-assets-stage65.adobecqms.net/mnt/overlay/dam/gui/content/collections.html/content/dam/collections");
                break;
            default:
                reporter.fail("No such page");
        }
    }

    @When("^I click on the \"([^\"]*)\" (?:button|link|option)(?: in [^\"]*)?$")
    public void i_click_on_the_button(String element) {
        clickOnAnyElement(byText(element));
    }

    @When("^I wait for ([^\"]*) seconds$")
    public void wait_for(String seconds) {
        sleepFor(Integer.parseInt(seconds)*1000);
    }

    @When("^I hover over the \"([^\"]*)\" (?:button|link|option|element)$")
    public void hover_over(String element) {
        hoverItem(byText(element));
    }

    @Then("^I should see the \"([^\"]*)\" (?:button|message|element)$")
    public void i_should_see_the_text(String element) {
        boolean isDisplayed = false;
        for(int i = 0; i<findElements(byText(element)).size(); i++){
            if(findElements(byText(element)).get(i).isDisplayed()){
                isDisplayed = true;
            }
        }
        Assert.assertTrue(isDisplayed, "Element with " + element + " text is not displayed");
    }

    @Then("^I should be redirected to the \"([^\"]*)\" page$")
    public void i_should_be_redirected_to_page(String page) {
        System.out.println("Current page is " + driver().getTitle());
        System.out.println("Expected page is " + page);
        Assert.assertEquals(driver().getTitle(), page, "Current page is " + page);
    }
}