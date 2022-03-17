@CleanOrigin @ServicePlan
Feature: Service Plan
  As an user
  I want to be able to see Earings page
  So that I can order some nice earings.


  @Positive @Regression @P1
  Scenario: Service Plan
    Given I am on "https://www.cleanorigin.com" URL
    And I click on the "Accept Cookies" "text in span"
    Then I click on the "Start with a Setting" "link"
    And I click on the "Price" "Rings Listing Page Filter"
    And I set "500" text to the "price-from" "element by id"
    And I press "ENTER" for "price-from" "element by id"
    And I wait for "5" seconds
    And I click on the "Rings Listing Page Product Item" element

    And I should see the "service_plan" "element by id"
    And Attribute "style" of "service_plan" "element by id" should have value "display: none;"
    And I click on the "Metal" "Rings Details Page Attribute Select"
    And I click on the "14K White Gold" "Rings Details Page Attribute Select Option"
    And I click on the "Ring Size" "Rings Details Page Attribute Select"
    And I click on the "4" "Rings Details Page Attribute Select Option"
    And Attribute "style" of "service_plan" "element by id" should have value "display: block;"
    And I click on the "service_plan" "element by id"
    And I click on the "Add To Bag" "button"