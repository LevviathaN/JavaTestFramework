@CleanOrigin @EndToEnd
Feature: End to End
  As an user
  I want to be able to proceed through all purchase process


  @Positive @Regression @P1
  Scenario: Earrings E2E
    # open PLP and select earring
    Given I am on "https://www.cleanorigin.com" URL
    And I click on the "Accept Cookies" "text in span"
    Then I hover over the "JEWELRY" "Navigation Menu Item"
    And I click on the "Diamond Earrings" "Navigation Submenu Item"
    And I click on the "Rings Listing Page Product Item" element

    # set earring attributes
    And I click on the "Total Carat Weight" "Rings Details Page Attribute Select"
    And I click on the "0.75" "Rings Details Page Attribute Select Option"
    And I click on the "Diamond Color" "Rings Details Page Attribute Select"
    And I click on the "IJ" "Rings Details Page Attribute Select Option"
    And I click on the "Prong" "Rings Details Page Attribute Select" if present
    And I click on the "4" "Rings Details Page Attribute Select Option" if present
    And I click on the "Metal" "Rings Details Page Attribute Select"
    And I click on the "14K White Gold" "Rings Details Page Attribute Select Option"

    # save data from earring PDP and add it to Cart
    And I capture text data "Rings Details Page Name" as "EC_PDP_EARRING_NAME" variable
    And I capture text data "Rings Details Page Price" as "EC_PDP_EARRING_PRICE" variable
    And I click on the "Add to Bag" "span"
    And I should scroll to the "top" of the page
    And I click on the "Cart Icon" element

    # save data from cart page and proceed to checkout page
    And I capture text data "Cart Item Name" as "EC_CART_EARRING_NAME" variable
    And I capture text data "Cart Item Price" as "EC_CART_EARRING_PRICE" variable

    # validate values
    And I verify that "EC_PDP_EARRING_NAME" element "equal" to "EC_CART_EARRING_NAME" element
    And I verify that "EC_PDP_EARRING_PRICE" element "equal" to "[SUBSTRING(EC_CART_EARRING_PRICE,0,-3)]" element

  @Positive @Regression @P1
  Scenario: Bracelets E2E
    # open PLP and select bracelet
    Given I am on "https://www.cleanorigin.com" URL
    And I click on the "Accept Cookies" "text in span"
    Then I hover over the "JEWELRY" "Navigation Menu Item"
    And I click on the "Diamond Tennis Bracelets" "Navigation Submenu Item"
    And I click on the "Rings Listing Page Product Item" element

    # set bracelet attributes
    And I click on the "Metal" "Rings Details Page Attribute Select"
    And I click on the "14K White Gold" "Rings Details Page Attribute Select Option" if present
    And I click on the "14K Yellow Gold" "Rings Details Page Attribute Select Option" if present
    And I click on the "Bracelet Length" "Rings Details Page Attribute Select" if present
    And I click on the "Standard" "Rings Details Page Attribute Select Option" if present
    And I click on the "6”" "Rings Details Page Attribute Select Option" if present

    # save data from bracelet PDP and add it to Cart
    And I capture text data "Rings Details Page Name" as "EC_PDP_BRACELET_NAME" variable
    And I capture text data "Rings Details Page Price" as "EC_PDP_BRACELET_PRICE" variable
    And I click on the "Add to Bag" "span"
    And I should scroll to the "top" of the page
    And I click on the "Cart Icon" element

    # save data from cart page and proceed to checkout page
    And I capture text data "Cart Item Name" as "EC_CART_BRACELET_NAME" variable
    And I capture text data "Cart Item Price" as "EC_CART_BRACELET_PRICE" variable

    # validate values
    And I verify that "EC_PDP_BRACELET_NAME" element "equal" to "EC_CART_BRACELET_NAME" element
    And I verify that "EC_PDP_BRACELET_PRICE" element "equal" to "[SUBSTRING(EC_CART_BRACELET_PRICE,0,-3)]" element

  @Positive @Regression @P1
  Scenario: Pendants E2E
    # open PLP and select pendant
    Given I am on "https://www.cleanorigin.com" URL
    And I click on the "Accept Cookies" "text in span"
    Then I hover over the "JEWELRY" "Navigation Menu Item"
    And I click on the "Diamond Pendants" "Navigation Submenu Item"
    And I click on the "Rings Listing Page Product Item" element

    # set pendant attributes
    And I click on the "Metal" "Rings Details Page Attribute Select"
    And I click on the "14K White Gold" "Rings Details Page Attribute Select Option" if present
    And I click on the "14K Yellow Gold" "Rings Details Page Attribute Select Option" if present

    # save data from pendant PDP and add it to Cart
    And I capture text data "Rings Details Page Name" as "EC_PDP_PENDANT_NAME" variable
    And I capture text data "Rings Details Page Price" as "EC_PDP_PENDANT_PRICE" variable
    And I click on the "Add to Bag" "span"
    And I should scroll to the "top" of the page
    And I click on the "Cart Icon" element

    # save data from cart page and proceed to checkout page
    And I capture text data "Cart Item Name" as "EC_CART_PENDANT_NAME" variable
    And I capture text data "Cart Item Price" as "EC_CART_PENDANT_PRICE" variable

    # validate values
    And I verify that "EC_PDP_PENDANT_NAME" element "equal" to "EC_CART_PENDANT_NAME" element
    And I verify that "EC_PDP_PENDANT_PRICE" element "equal" to "[SUBSTRING(EC_CART_PENDANT_PRICE,0,-3)]" element