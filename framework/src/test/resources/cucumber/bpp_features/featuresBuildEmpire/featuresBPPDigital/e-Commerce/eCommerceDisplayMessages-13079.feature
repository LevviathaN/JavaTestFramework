@BuildEmpire @DigitalSite @Ecommerce
Feature: Enable Display of Messages for Updated Course Instances in Basket
  Price change and another other change in information about the course.
  Display the old and new price with a alert (red) message when there is a price change.

  @DisplayMessages  #TC-5452
  Scenario: eCommerce - Enable Display of Messages for Updated Course Instances in Basket
    #Add items
    And I am on "MD_COMMON_LINKS_BPPDIGITALECOMMERCELOCALSTORAGE" URL
    And I click on the "Paper MVM 1 name" "BPP Digital View Dates and Prices button"
    Then I click on the "1" "BPP Digital Add to Basket Item"
    Then I click on the "2" "BPP Digital Add to Basket Item"
    Then I click on the "3" "BPP Digital Add to Basket Item"
    Then I click on the "5" "BPP Digital Add to Basket Item"
    Then I click on the "8" "BPP Digital Add to Basket Item"
    And I validate text "CONTAINS=5" to be displayed for "BPP Digital Header Basket" element
    And I click on the "BPP Digital Header Basket" button by JS
    Then I validate text "5" to be displayed for "Items" "BPP Digital Basket Summary Section"
    And I capture text data "4" "BPP Digital Basket Instance Item Price" as "EC_PRICEBEFORE" variable
    #Change Price
    And I am on "https://uat-products.bpp.com/pricing/edit/c15e1e9a-9a89-4217-a76f-f04026679231" URL
    When I click on the "Sign in with Auth0" button
    And I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYUSER"
    And I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYPASSWORD"
    And I click on the "Product Factory Login" button
    And I wait for "1" seconds
    And I click on the "Course Type MVM 1" "text"
    And I click on the "Region MVM 1" "Product Factory Pricing Matrix dropdown"
    And I click on the "Paper MVM 1 name" "Product Factory Pricing Matrix change button"
    And I set "~UpdatedPMPrice[##]" text to the "Enter a Price (£)" "Product Factory text field"
    And I click on the "Save" "Product Factory active button"
    And I wait for "3" seconds
    And I am on "https://uat-products.bpp.com/courses/edit/07846e8a-20b6-425c-afa9-0bba2e6c7952" URL
    And I click on the "refresh" element
    Then I wait for "1" seconds
    And I capture text data "Product Factory Course Page Price Without VAT" as "EC_PRICEVAT" variable
    And I click on the "Publish" element
    And I click on the "Yes" "text contained in SPAN element"
    And I wait for "190" seconds
    And I am on "https://web-stage-bppdigital.bppuniversity.com/basket/#/" URL
    Then I should see the "The price for 1 of your chosen courses has changed since you added it to your basket." "text contained in P element"
    Then I should see the "Check the latest price information to be sure you want to book it?" "text contained in P element"
    And I validate text "NOT_CONTAINS=EC_PRICEBEFORE" to be displayed for "4" "BPP Digital Basket Instance Item Price"
    And I validate text "CONTAINS=EC_PRICEVAT" to be displayed for "4" "BPP Digital Basket Instance Item Price"
    Then I click on the "4" "BPP Digital Basket Instance Item Remove"
    And I wait for "1" seconds
    And I am on "MD_COMMON_LINKS_BPPDIGITALECOMMERCELOCALSTORAGE" URL
    And I click on the "Paper MVM 1 name" "BPP Digital View Dates and Prices button"
    Then I click on the "5" "BPP Digital Add to Basket Item"
    And I click on the "BPP Digital Header Basket" button by JS
    Then I validate text "5" to be displayed for "Items" "BPP Digital Basket Summary Section"
    #Change Instance Location
    And I am on "https://uat-products.bpp.com/courses/edit/07846e8a-20b6-425c-afa9-0bba2e6c7952" URL
    When I click on the "Location MVM 2" "Product Factory course instance sessions dropdown button"
    When I click on the "Default Location" "Product Factory edit button"
    And I click on the "Location MVM 1" "Product Factory select button"
    And I click on the "Yes" "Product Factory button"
    And I click on the "Location MVM 1" "Product Factory course instance Publish button"
    And I click on the "Yes" "text contained in SPAN element"
    Then I wait for "190" seconds
    And I am on "https://web-stage-bppdigital.bppuniversity.com/basket/#/" URL
    Then I should see the "Information for 1 of your chosen courses has changed since you added it to your basket." "text contained in P element"
    Then I should see the "Check the latest information to be sure you want to book it?" "text contained in P element"
    #Return instance location to primary state
    And I am on "https://uat-products.bpp.com/courses/edit/07846e8a-20b6-425c-afa9-0bba2e6c7952" URL
    When I click on the "Location MVM 1" "Product Factory course instance sessions dropdown button"
    When I click on the "Default Location" "Product Factory edit button"
    And I click on the "Location MVM 2" "Product Factory select button"
    And I click on the "Yes" "Product Factory button"
    And I click on the "Location MVM 2" "Product Factory course instance Publish button"
    And I click on the "Yes" "text contained in SPAN element"
    Then I wait for "10" seconds