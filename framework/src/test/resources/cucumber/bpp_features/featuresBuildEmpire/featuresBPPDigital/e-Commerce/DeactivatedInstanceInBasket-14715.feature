@BuildEmpire @DigitalSite @Ecommerce
Feature: Display disable basket item when no (ES) details available
If course is added to basket and the course is republished and no longer available to be booked,
then the course base information (e.g. course type, name) only should display, the course should be grayed out, a alert (red) message should be displayed and the checkout button should be disabled.
Unavailable courses should not contribute to the total basket price.
Unavailable courses need to be removed from the basket before the checkout button is enabled.

  @DeactivateInstance  #TC-5613
  Scenario: eCommerce - Display Disable Basket Item When no ES Details Available
    And I am on "MD_COMMON_LINKS_BPPDIGITALECOMMERCEDEACTIVATEURL" URL
    And I click on the "Paper MVM 1 name" "BPP Digital View Dates and Prices button"
    Then I click on the "1" "BPP Digital Add to Basket Item"
    Then I click on the "8" "BPP Digital Add to Basket Item"
    Then I click on the "9" "BPP Digital Add to Basket Item"
    Then I validate text "3" to be displayed for "Items" "BPP Digital Basket Summary Section"
    And I am on "https://uat-products.bpp.com/courses/edit/f052d387-3722-47c4-9722-6ec7769ab268" URL
    When I click on the "Deactivate" "Product Factory button last"
    Then I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "Deactivation Reason PR OFF" "Product Factory select button"
    And I click on the "Confirm Deactivation" "Product Factory button"