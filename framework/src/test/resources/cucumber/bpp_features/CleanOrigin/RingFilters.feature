@Ring
Feature: Ring Filters
  As an user
  I want to be able to see Earings page
  So that I can order some nice earings.


  @Positive @Regression @P1
  Scenario Outline: Ring Filters Validation
    Given I am on "https://www.cleanorigin.com" URL
    And I click on the "Accept Cookies" "text in span"
    Then I click on the "Start with a Setting" "link"
    And I click on the "Metal" "Rings Listing Page Filter"
    And I click on the "<metal>" "Rings Listing Page Filter Item"
    And I click on the "Shape" "Rings Listing Page Filter"
    And I click on the "<shape>" "Rings Listing Page Filter Item"
    And I click on the "Ring Style" "Rings Listing Page Filter"
    And I click on the "<style>" "Rings Listing Page Filter Item"

    And For each "Rings Listing Page Product Item" element:
      |I click on the "FOR_ITEM" element|
      |I validate text "<style>" to be displayed for any "Rings Details Page Collection Attribute" element|
      |I validate text "<shape>" to be displayed for any "Rings Details Page Compatible Diamond Shapes Attribute" element|
      |Browser performs "BACK" command                                                               |

    Examples:
    |metal         |shape|style|
    |14K White Gold|Round|Classic   |
#    |Platinum      |Oval |Halo      |