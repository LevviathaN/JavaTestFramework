@Ring
Feature: Ring Filters
  As an user
  I want to be able to see Earings page
  So that I can order some nice earings.


  @Positive @Regression @P1 @Run
  Scenario Outline: Ring Filters Validation
    Given I am on "https://www.cleanorigin.com/en_ca/" URL
    Then I click on the "Browse Settings" "Clean Origin button"
    And I click on the "Metal" "Rings Listing Page Filter"
    And I click on the "<metal>" "Rings Listing Page Filter Item"
    And I click on the "Shape" "Rings Listing Page Filter"
    And I click on the "<shape>" "Rings Listing Page Filter Item"
    And I click on the "Ring Collection" "Rings Listing Page Filter"
    And I click on the "<collection>" "Rings Listing Page Filter Item"
    And For each "Rings Listing Page Product Item" element:
      |I click on the "FOR_ITEM" element|
      |I validate text "<collection>" to be displayed for "Rings Details Page Collection Attribute" element|
      |I validate text "<shape>" to be displayed for "Rings Details Page Compatible Diamond Shapes Attribute" element|
      |Browser performs "BACK" command                                                               |
    And I should see the "<shape>" "Rings Details Page Compatible Diamond Shapes Attribute Value"

    Examples:
    |metal         |shape|collection|
#    |14K White Gold|Round|Classic   |
    |Platinum      |Oval |Halo      |