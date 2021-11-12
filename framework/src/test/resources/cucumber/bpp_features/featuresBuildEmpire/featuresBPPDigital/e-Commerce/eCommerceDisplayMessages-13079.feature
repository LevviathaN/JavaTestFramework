@BuildEmpire @DigitalSite @Ecommerce
Feature: Enable Display of Messages for Updated Course Instances in Basket
  Price change and another other change in information about the course.
  Display the old and new price with a alert (red) message when there is a price change.

  @DisplayMessages  #TC-5452
  Scenario: eCommerce - Enable Display of Messages for Updated Course Instances in Basket
    #Add and items
    And I am on "MD_COMMON_LINKS_BPPDIGITALECOMMERCELOCALSTORAGE" URL
    And I click on the "Paper MVM 1 name" "BPP Digital View Dates and Prices button"
    Then I click on the "1" "BPP Digital Add to Basket Item"
    Then I click on the "2" "BPP Digital Add to Basket Item"
    Then I click on the "3" "BPP Digital Add to Basket Item"
    Then I click on the "4" "BPP Digital Add to Basket Item"
    Then I click on the "5" "BPP Digital Add to Basket Item"
    Then I click on the "9" "BPP Digital Add to Basket Item"
    Then I click on the "10" "BPP Digital Add to Basket Item"
    Then I click on the "11" "BPP Digital Add to Basket Item"
    And I validate text "CONTAINS=8" to be displayed for "BPP Digital Header Basket" element
    And I click on the "BPP Digital Header Basket" button by JS
    Then I validate text "8" to be displayed for "Items" "BPP Digital Basket Summary Section"
    And I capture text data "5" "BPP Digital Basket Instance Item Price" as "EC_PRICEBEFORE" variable
    And I am on "https://uat-products.bpp.com/pricing/edit/c15e1e9a-9a89-4217-a76f-f04026679231" URL
    When I click on the "Sign in with Auth0" button
    And I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYUSER"
    And I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYPASSWORD"
    And I click on the "Product Factory Login" button
    And I wait for "1" seconds
    And I click on the "Course Type MVM 1" "text"
    And I click on the "Region MVM 1" "Product Factory Pricing Matrix dropdown"
    And I click on the "Paper MVM 1 name" "Product Factory Pricing Matrix change button"
    And I set "~UpdatedPMPrice[###]" text to the "Enter a Price (£)" "Product Factory text field"
    And I click on the "Save" "Product Factory active button"
    And I wait for "3" seconds
    And I am on "https://uat-products.bpp.com/courses/edit/07846e8a-20b6-425c-afa9-0bba2e6c7952" URL
    And I click on the "refresh" element
    And I click on the "Publish" element
    And I click on the "Yes" "text contained in SPAN element"
    And I wait for "190" seconds
    And I am on "https://web-stage-bppdigital.bppuniversity.com/basket/#/" URL
    Then I should see the "The price for 1 of your chosen courses has changed since you added it to your basket." "text contained in P element"
    Then I should see the "Check the latest price information to be sure you want to book it?" "text contained in P element"
    And I validate text "NOT_CONTAINS=EC_PRICEBEFORE" to be displayed for "5" "BPP Digital Basket Instance Item Price"
