@CleanOrigin @Checkout
Feature: Checkout
  As an user
  I want to be able to proceed with checkout process
  So that I can purchase and item.


  @Positive @Regression @P1
  Scenario: Cross Sell
    # open builder and select ring from PLP
    Given I execute "Log In To Clean Origin" reusable step

    # clear cart
    And I should scroll to the "top" of the page
    And I click on the "Cart Icon" element
    And I click on the "Cart Remove Item Any" element if present

    # search item
    And I click on the "search" "element by id"
    And I set "LMP1121" text to the "search" "element by id"
    And I press "ENTER" for "search" "element by id"
    And I wait for "3" seconds
    And I click on the "Rings Listing Page Product Item" element

    # set attributes and add item to Bag
    And I click on the "Metal" "Rings Details Page Attribute Select"
    And I click on the "14K White Gold" "Rings Details Page Attribute Select Option"
    And I click on the "Add to Bag" "span"

    # validate cross sell items presence in cart
    And I should scroll to the "top" of the page
    And I click on the "Cart Icon" element
    And I should see the "Based on your cart, you may like these." "normalized element"
    And I should see the "2 ct. tw. Luminescent Halo Studs" element
    And I should see the "1 1/2 ct. tw. Luminescent Halo Studs" element
    And I should see the "1 ct. tw. Luminescent Halo Studs" element

    # select item from cross sell block and add it to cart
    And I click on the "2 ct. tw. Luminescent Halo Studs" element
    And I click on the "Metal" "Rings Details Page Attribute Select"
    And I click on the "14K White Gold" "Rings Details Page Attribute Select Option"
    And I click on the "Add to Bag" "span"

    # validate cross sell items presence in cart
    And I should scroll to the "top" of the page
    And I click on the "Cart Icon" element
    And I should see the "Based on your cart, you may like these." "normalized element"
    And I should see the "Classic 3 ct. tw. Tennis Bracelet" element
    And I should see the "1 1/2 ct. tw. Luminescent Halo Studs" element
    And I should see the "Classic 5 ct. tw. Tennis Bracelet" element
    And I should see the "Classic 7 ct. tw. Tennis Bracelet" element
    And I should see the "1 ct. tw. Luminescent Halo Studs" element

  @Positive @Regression @P1
  Scenario: Check Zillion Presence
    # open builder and select ring from PLP
    Given I execute "Log In To Clean Origin" reusable step
    And I should scroll to the "top" of the page
    And I click on the "Cart Icon" element
    And I click on the "Cart Remove Item Any" element if present
    And I click on the "Clean Origin Go To Homepage" element

    Then I click on the "Start with a Setting" "link"
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
    And I click on the "Add to Bag" "button"
    And I wait for "7" seconds

    And I click on the "Cart Checkout Button" element
    And I click on the "Checkout First Shipping Method Radiobutton" element
    And I click on the "Checkout Next Button" element
    And I click on the "Checkout Zillion Checkbox" element
    And I click on the "Checkout Accept Zillion Button" element