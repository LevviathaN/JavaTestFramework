@Reusable
Feature: Clean Origin

  Scenario: Go to Clean Origin
    Given I am on "https://reskin.cleanorigin.com/" URL
    And I wait for "2" seconds
    And I click on the "Accept All Cookies" "button" if present

  Scenario: Log In To Clean Origin
    Given I am on "https://reskin.cleanorigin.com/" URL
    And I click on the "Sign In" "link"
    And I click on the "Accept Cookies" "text in span" if present
    And I set "ruslan.levytskyi@fortegrp.com" text to the "email" "element by id"
    And I set "TkjU8Ynr@" text to the "pass" "element by id"
    And I click on the "Sign In" "span"
    And I click on the "Clean Origin Go To Homepage" element

  Scenario: Build Ring
    Then I click on the "Start with settings" "span"
    And I click on the "Rings Listing Page Product Item" element
    # set ring attributes and add it to Ring
    And I click on the "Metal" "Rings Details Page Attribute Select"
    And I click on the "14K White Gold" "Rings Details Page Attribute Select Option"
    And I click on the "Metal" "Rings Details Page Attribute Select"
    And I click on the "Shape" "Rings Details Page Attribute Select" if present
    And I click on the "Round" "Rings Details Page Attribute Select Option" if present
    And I click on the "Prong" "Rings Details Page Attribute Select" if present
    And I click on the "6" "Rings Details Page Attribute Select Option" if present
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
    And I click on the "1" "Diamonds Listing Page Item By Index"
    # save data from diamond PDP
    And I capture text data "Diamonds Details Page Name" as "EC_PDP_DIAMOND_NAME" variable
    And I capture text data "Diamonds Details Page Price" as "EC_PDP_DIAMOND_PRICE" variable
    And I capture text data "Style Number" "Diamonds Details Page Details" as "EC_PDP_DIAMOND_SKU" variable
    And I capture text data "Carat" "Diamonds Details Page Attribute" as "EC_PDP_DIAMOND_WEIGHT" variable
    And I capture text data "Color" "Diamonds Details Page Attribute" as "EC_PDP_DIAMOND_COLOR" variable
    And I capture text data "Clarity" "Diamonds Details Page Attribute" as "EC_PDP_DIAMOND_CLARITY" variable
    And I capture text data "Cut" "Diamonds Details Page Attribute" as "EC_PDP_DIAMOND_CUT_GRADE" variable
    And I click on the "Add to Ring" "button"
    And I wait for "3" seconds
    # save data from builder panel and proceed to cart page
    And I capture text data "Builder Pane Ring Name" as "EC_BUILDER_RING_NAME" variable
    And I capture text data "Builder Pane Ring Price" as "EC_BUILDER_RING_PRICE" variable
    And I capture text data "Builder Pane Diamond Name" as "EC_BUILDER_DIAMOND_NAME" variable
    And I capture text data "Builder Pane Diamond Price" as "EC_BUILDER_DIAMOND_PRICE" variable