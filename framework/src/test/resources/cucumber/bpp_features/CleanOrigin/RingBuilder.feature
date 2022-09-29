@CleanOrigin @RingBuilder
Feature: Ring Builder
  As an user
  I want to be able to use Ring Builder functionality
  So that I can create my custom ring.


  @Positive @Regression @P1
  Scenario: Ring Builder Validation Short
    # open builder and select ring from PLP
    Given I am on "https://reskin.cleanorigin.com/" URL
    And I click on the "Accept Cookies" "text in span" if present
    Then I execute "Build Ring" reusable step
    And I click on the "Add To Bag" "text in button"

    # save data from cart page and proceed to checkout page
    And I capture text data "Cart Item Name" as "EC_CART_RING_NAME" variable
    And I capture text data "Cart Item Price" as "EC_CART_RING_PRICE" variable
    And I capture text data "Ring Size" "Cart Item Attribute" as "EC_CART_RING_SIZE" variable
    And I capture text data "Ring Shape" "Cart Item Attribute" as "EC_CART_RING_SHAPE" variable
    And I capture text data "Diamond SKU" "Cart Item Attribute" as "EC_CART_DIAMOND_SKU" variable
    And I capture text data "Cart Second Item Name" as "EC_CART_DIAMOND_NAME" variable
    And I capture text data "Cart Second Item Price" as "EC_CART_DIAMOND_PRICE" variable
    And I capture text data "Carat" "Cart Item Attribute" as "EC_CART_DIAMOND_WEIGHT" variable
    And I capture text data "Color" "Cart Item Attribute" as "EC_CART_DIAMOND_COLOR" variable
    And I capture text data "Clarity" "Cart Item Attribute" as "EC_CART_DIAMOND_CLARITY" variable
    And I capture text data "Cut Grade" "Cart Item Attribute" as "EC_CART_DIAMOND_CUT_GRADE" variable
    And I capture text data "Ring SKU" "Cart Item Attribute" as "EC_CART_RING_SKU" variable
    And I capture text data "Subtotal" "Cart Totals Element" as "EC_CART_SUBTOTAL" variable
    And I click on the "Proceed to Checkout" "span"

    # validate values
    And I verify that "EC_PDP_RING_NAME" element "contains" to "EC_BUILDER_RING_NAME" element
    And I verify that "EC_PDP_RING_NAME" element "equal" to "EC_CART_RING_NAME" element
    And I verify that "EC_PDP_RING_PRICE" element "equal" to "EC_BUILDER_RING_PRICE" element
    And I verify that "EC_PDP_RING_PRICE" element "equal" to "[SUBSTRING(EC_CART_RING_PRICE,0,-3)]" element
    And I verify that "EC_PDP_RING_PRICE" element "equal" to "[SUBSTRING(EC_CART_RING_PRICE,0,-3)]" element
    And I verify that "EC_PDP_RING_METAL" element "contains" to "EC_BUILDER_RING_NAME" element
    And I verify that "EC_PDP_RING_SHAPE" element "equal" to "EC_CART_RING_SHAPE" element
    And I verify that "EC_PDP_RING_SIZE" element "equal" to "EC_CART_RING_SIZE" element
    And I verify that "EC_PDP_RING_SKU" element "contains" to "EC_CART_RING_SKU" element

    And I verify that "EC_PDP_DIAMOND_WEIGHT" element "contains" to "EC_BUILDER_DIAMOND_NAME" element
    And I verify that "EC_PDP_DIAMOND_SHAPE" element "contains" to "EC_BUILDER_DIAMOND_NAME" element
    And I verify that "EC_PDP_DIAMOND_NAME" element "equal" to "EC_CART_DIAMOND_NAME" element
    And I verify that "EC_PDP_DIAMOND_PRICE" element "equal" to "[SUBSTRING(EC_CART_DIAMOND_PRICE,0,-3)]" element
    And I verify that "EC_PDP_DIAMOND_PRICE" element "equal" to "[SUBSTRING(EC_BUILDER_DIAMOND_PRICE,0,-3)]" element
    And I verify that "EC_PDP_DIAMOND_WEIGHT" element "equal" to "EC_CART_DIAMOND_WEIGHT" element
    And I verify that "EC_PDP_DIAMOND_COLOR" element "equal" to "EC_CART_DIAMOND_COLOR" element
    And I verify that "EC_PDP_DIAMOND_CLARITY" element "equal" to "EC_CART_DIAMOND_CLARITY" element

  @Positive @Regression @P1
  Scenario: Ring Builder Change Ring
    # open builder and select first ring from PLP
    Given I am on "https://reskin.cleanorigin.com/" URL
    And I click on the "Accept Cookies" "text in span" if present
    Then I execute "Build Ring" reusable step

    # change ring
    And I click on the "Builder Pane Ring Change Button" element
    And I click on the "Margot Solitaire Ring" "Rings Listing Page Product Item By Name"

    # set first ring attributes and add it to Ring
    And I click on the "Metal" "Rings Details Page Attribute Select"
    And I click on the "14K Yellow Gold" "Rings Details Page Attribute Select Option"
    And I click on the "Ring Size" "Rings Details Page Attribute Select"
    And I click on the "5" "Rings Details Page Attribute Select Option"

    # save data from first ring PDP
    And I capture text data "Rings Details Page Name" as "EC_PDP_SECOND_RING_NAME" variable
    And I capture text data "Rings Details Page Price" as "EC_PDP_SECOND_RING_PRICE" variable
    And I remember "14K Yellow Gold" text as "EC_PDP_SECOND_RING_METAL" variable
    And I remember "5" text as "EC_PDP_SECOND_RING_SIZE" variable
    And I capture text data "Style Number" "Rings Details Page Attribute" as "EC_PDP_SECOND_RING_SKU" variable
    And I click on the "Choose This Setting" "button"

  @Positive @Regression @P1
  Scenario: Ring Builder Change Diamond
    # open builder and select first ring from PLP
    Given I am on "https://www.cleanorigin.com" URL
    And I click on the "Accept Cookies" "text in span" if present
    Then I click on the "Start with a Setting" "button"
    And I click on the "Rings Listing Page Product Item" element

    # set ring attributes and add it to Ring
    And I click on the "Metal" "Rings Details Page Attribute Select"
    And I click on the "14K White Gold" "Rings Details Page Attribute Select Option"
    And I click on the "Shape" "Rings Details Page Attribute Select"
    And I click on the "Round" "Rings Details Page Attribute Select Option"
    And I click on the "Prong" "Rings Details Page Attribute Select"
    And I click on the "6" "Rings Details Page Attribute Select Option"
    And I click on the "Ring Size" "Rings Details Page Attribute Select"
    And I click on the "4" "Rings Details Page Attribute Select Option"

    # save data from ring PDP
    And I capture text data "Rings Details Page Name" as "EC_PDP_RING_NAME" variable
    And I capture text data "Rings Details Page Price" as "EC_PDP_RING_PRICE" variable
    And I remember "14K White Gold" text as "EC_PDP_RING_METAL" variable
    And I remember "Round" text as "EC_PDP_RING_SHAPE" variable
    And I remember "4" text as "EC_PDP_RING_SIZE" variable
    And I capture text data "Style Number" "Rings Details Page Attribute" as "EC_PDP_RING_SKU" variable
    And I click on the "Choose This Setting" "button"

    # select diamond
    And I wait for "3" seconds
    And I click on the "Ok" "span" if present
    And I wait for "5" seconds
    And I click on the "Diamonds Listing Page View Product Button" element by order "2"

    # save data from diamond PDP
    And I capture text data "Diamonds Details Page Name" as "EC_PDP_DIAMOND_NAME" variable
    And I capture text data "Diamonds Details Page Price" as "EC_PDP_DIAMOND_PRICE" variable
    And I capture text data "SKU" "Diamonds Details Page Attribute" as "EC_PDP_DIAMOND_SKU" variable
    And I capture text data "Carat Weight" "Diamonds Details Page Attribute" as "EC_PDP_DIAMOND_WEIGHT" variable
    And I capture text data "Shape" "Diamonds Details Page Attribute" as "EC_PDP_DIAMOND_SHAPE" variable
    And I capture text data "Color" "Diamonds Details Page Attribute" as "EC_PDP_DIAMOND_COLOR" variable
    And I capture text data "Clarity" "Diamonds Details Page Attribute" as "EC_PDP_DIAMOND_CLARITY" variable
    And I capture text data "Cut Grade" "Diamonds Details Page Attribute" as "EC_PDP_DIAMOND_CUT_GRADE" variable
    And I click on the "Add to Ring" "button"
    And I wait for "3" seconds

    # save data from builder panel and proceed to cart page
    And I capture text data "Builder Pane Ring Name" as "EC_BUILDER_FIRST_RING_NAME" variable
    And I capture text data "Builder Pane Ring Price" as "EC_BUILDER_FIRST_RING_PRICE" variable
    And I capture text data "Builder Pane Diamond Name" as "EC_BUILDER_DIAMOND_NAME" variable
    And I capture text data "Builder Pane Diamond Price" as "EC_BUILDER_DIAMOND_PRICE" variable

    # change diamond
    And I click on the "Builder Pane Diamond Change Button" element
    And I click on the "Ok" "span" if present
    And I click on the "Diamonds Listing Page View Product Button" element by order "2"

    # save data from second diamond
    And I capture text data "Diamonds Details Page Name" as "EC_PDP_SECOND_DIAMOND_NAME" variable
    And I capture text data "Diamonds Details Page Price" as "EC_PDP_SECOND_DIAMOND_PRICE" variable
    And I capture text data "SKU" "Diamonds Details Page Attribute" as "EC_PDP_SECOND_DIAMOND_SKU" variable
    And I capture text data "Carat Weight" "Diamonds Details Page Attribute" as "EC_PDP_SECOND_DIAMOND_WEIGHT" variable
    And I capture text data "Shape" "Diamonds Details Page Attribute" as "EC_PDP_SECOND_DIAMOND_SHAPE" variable
    And I capture text data "Color" "Diamonds Details Page Attribute" as "EC_PDP_SECOND_DIAMOND_COLOR" variable
    And I capture text data "Clarity" "Diamonds Details Page Attribute" as "EC_PDP_SECOND_DIAMOND_CLARITY" variable
    And I capture text data "Cut Grade" "Diamonds Details Page Attribute" as "EC_PDP_SECOND_DIAMOND_CUT_GRADE" variable
    And I click on the "Add to Ring" "button"
    And I wait for "3" seconds

  @Positive @Regression @P1
  Scenario: Ring Builder Clear Ring
    # open builder and select ring from PLP
    Given I execute "Log In To Clean Origin" reusable step
    And I should scroll to the "top" of the page
    And I click on the "Cart Icon" element
    And I click on the "Cart Remove Item Any" element if present
    And I click on the "Clean Origin Go To Homepage" element

    Then I click on the "Start with a Setting" "button"
    And I click on the "Rings Listing Page Product Item" element

    # set ring attributes and add it to Ring
    And I click on the "Metal" "Rings Details Page Attribute Select"
    And I click on the "14K White Gold" "Rings Details Page Attribute Select Option"
    And I click on the "Shape" "Rings Details Page Attribute Select"
    And I click on the "Round" "Rings Details Page Attribute Select Option"
    And I click on the "Prong" "Rings Details Page Attribute Select"
    And I click on the "6" "Rings Details Page Attribute Select Option"
    And I click on the "Ring Size" "Rings Details Page Attribute Select"
    And I click on the "4" "Rings Details Page Attribute Select Option"
    And I click on the "Choose This Setting" "button"

    # select diamond
    And I wait for "3" seconds
    And I click on the "Ok" "span" if present
    And I wait for "5" seconds
    And I click on the "Diamonds Listing Page View Product Button" element
    And I click on the "Add to Ring" "button"
    And I wait for "3" seconds

    # clear ring
    And I click on the "Builder Pane Clear Ring Button" element
    Then I shouldn't see the "Builder Pane Clear Ring Button" element