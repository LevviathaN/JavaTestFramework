@CleanOrigin @RingBuilder
Feature: Ring Builder
  As an user
  I want to be able to use Ring Builder functionality
  So that I can create my custom ring.


  @Positive @Regression @P1
  Scenario: Ring Builder Validation Short
    # open builder and select ring from PLP
    Given I am on "https://www.cleanorigin.com" URL
    And I click on the "Accept Cookies" "text in span"
    Then I click on the "Start with a Setting" "link"
    And I click on the "Rings Listing Page Product Item" element

    # set ring attributes and add it to Ring
    And I click on the "Metal" "Rings Details Page Attribute Select"
    And I click on the "14K White Gold" "Rings Details Page Attribute Select Option"
    And I click on the "Ring Size" "Rings Details Page Attribute Select"
    And I click on the "4" "Rings Details Page Attribute Select Option"
    And I click on the "service_plan" "element by id"
    And I click on the "Choose This Setting" "button"

    #select diamond
    And I click on the "Ok" "span" if present
    And I click on the "Diamonds Listing Page View Product Button" element
    And I click on the "Add To Ring" "button"
    And I click on the "Add to Bag" "button"

  @Positive @Regression @P1
  Scenario: Ring Builder Edit Ring
    Given I am on "https://www.cleanorigin.com" URL
    And I click on the "Accept Cookies" "text in span"
    Then I click on the "Start with a Setting" "link"
    And I click on the "Rings Listing Page Product Item" element