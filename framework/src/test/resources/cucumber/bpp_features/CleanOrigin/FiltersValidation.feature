@CleanOrigin @FiltersValidation
Feature: Filters Validation
  As an user
  I want to be able to filter items on plp


  @Positive @Regression @P1
  Scenario Outline: Ring Filters Validation
    Given I execute "Log In To Clean Origin" reusable step
    Then I click on the "Start with a Setting" "link"
    And I click on the "Metal" "Rings Listing Page Filter"
    And I click on the "<metal>" "Rings Listing Page Filter Item"
    And I click on the "Shape" "Rings Listing Page Filter"
    And I click on the "<shape>" "Rings Listing Page Filter Item"
    And I click on the "Ring Style" "Rings Listing Page Filter"
    And I click on the "<style>" "Rings Listing Page Filter Item"

    And I click on the "Rings Listing Page Product Item" element
    And I validate text "<style>" to be displayed for any "Rings Details Page Collection Attribute" element
    And I validate text "<shape>" to be displayed for any "Rings Details Page Compatible Diamond Shapes Attribute" element
    And Browser performs "BACK" command

#    And For each "Rings Listing Page Product Item" element:
#      |I click on the "FOR_ITEM" element|
#      |I validate text "<style>" to be displayed for any "Rings Details Page Collection Attribute" element|
#      |I validate text "<shape>" to be displayed for any "Rings Details Page Compatible Diamond Shapes Attribute" element|
#      |Browser performs "BACK" command                                                               |

    Examples:
      |metal         |shape|style  |
      |14K White Gold|Round|Classic|
      |Platinum      |Oval |Halo   |


  @Positive @Regression @P1
  Scenario Outline: Diamond Filters Validation
    Given I execute "Log In To Clean Origin" reusable step
    Then I click on the "Diamonds" "Navigation Menu Item"

    And I click on the "<shape>" "Diamonds Listing Page Filter Item"
    And I set "<caratFrom>" text to the "Carat" "Diamonds Listing Page Filter From Field"
    And I set "<caratTo>" text to the "Carat" "Diamonds Listing Page Filter To Field"
    And I set "<priceFrom>" text to the "Price" "Diamonds Listing Page Filter From Field"
    And I set "<priceTo>" text to the "Price" "Diamonds Listing Page Filter To Field"

    And I drag "Cut" "Diamonds Listing Page Filter From Slider Point" to "<cutFrom>" "Diamonds Listing Page Filter Slider Marker"
    And I drag "Cut" "Diamonds Listing Page Filter To Slider Point" to "<cutTo>" "Diamonds Listing Page Filter Slider Marker"
    And I drag "Color" "Diamonds Listing Page Filter From Slider Point" to "<colorFrom>" "Diamonds Listing Page Filter Slider Marker"
    And I drag "Color" "Diamonds Listing Page Filter To Slider Point" to "<colorTo>" "Diamonds Listing Page Filter Slider Marker"
    Then I should scroll to the "top" of the page
    And I drag "Clarity" "Diamonds Listing Page Filter From Slider Point" to "<clarityFrom>" "Diamonds Listing Page Filter Slider Marker"
    And I drag "Clarity" "Diamonds Listing Page Filter To Slider Point" to "<clarityTo>" "Diamonds Listing Page Filter Slider Marker"
    And I wait for "3" seconds

    And I click on the "Diamonds Listing Page View Product Button" element
    And I capture text data "Cut Grade" "Diamonds Details Page Attribute" as "EC_CUT" variable
    And I validate "EC_CUT" value is "more or equal to" "diamondCut.<cutFrom>" value
    And I validate "EC_CUT" value is "less or equal to" "diamondCut.<cutTo>" value
    And I capture text data "Color" "Diamonds Details Page Attribute" as "EC_COLOR" variable
    And I validate "EC_COLOR" value is "more or equal to" "diamondColor.<colorFrom>" value
    And I validate "EC_COLOR" value is "less or equal to" "diamondColor.<colorTo>" value
    And I capture text data "Clarity" "Diamonds Details Page Attribute" as "EC_CLARITY" variable
    And I validate "EC_CLARITY" value is "more or equal to" "diamondClarity.<clarityFrom>" value
    And I validate "EC_CLARITY" value is "less or equal to" "diamondClarity.<clarityTo>" value
    And Browser performs "BACK" command

#    And For each "diamond_shape" "element by data attribute":
#      |I click on the "FOR_ITEM" element|
#      |I validate text "<style>" to be displayed for "Rings Details Page Collection Attribute" element|
#      |I validate text "<shape>" to be displayed for any "Rings Details Page Compatible Diamond Shapes Attribute" element|
#      |Browser performs "BACK" command                                                               |

    Examples:
      |shape|caratFrom|caratTo|priceFrom|priceTo|cutFrom|cutTo    |colorFrom|colorTo|clarityFrom|clarityTo|
      |Round|2        |6      |500      |50000  |GOOD   |EXCELLENT|I        |F      |SI1        |VVS2     |