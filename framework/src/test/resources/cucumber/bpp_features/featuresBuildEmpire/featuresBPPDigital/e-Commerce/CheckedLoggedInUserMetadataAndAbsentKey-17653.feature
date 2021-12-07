@BuildEmpire @DigitalSite @Ecommerce
Feature: Check Logged in User Metadata and When Key Data Missing Add Update Capability
I have logged in to the checkout journey and have incomplete metadata in my Auth0 account
then I am presented with a form with mandatory fields for the phone number and marketing opt-in choice that I need to complete before proceeding to the Booking Details step

  @Positive @NoPhone #TC-6700
  Scenario: eCommerce - Check Logged In User Metadata and Absent Key
    Given I register new standard Hub account without phone field using API
    Then I execute "Log In to Hub as Student" reusable step
    And I wait for "2" seconds
    And I am on "MD_COMMON_LINKS_BPPDIGITALECOMMERCETWOURL" URL
    And I click on the "Elements of Costing" "BPP Digital View Dates and Prices button"
    And I click on the "BPP Digital Add to Basket First Course" button
    And I wait for "1" seconds
    Then I validate text "CONTAINS=in basket" to be displayed for "BPP Digital Add to Basket First Course" element
    And I click on the "BPP Digital Header Basket" button by JS
    Then I click on the "Proceed to checkout" "button"
    And I wait for "2" seconds
    #Update phone and check it displayed on Booking page and Auth0 is updated as well
    Then I should see the "Update your account" "text"
    Then I should see the "We appear to be missing some account details we need to progress your booking and ensure we can support your learning experience." "text contained in P element"
    And I set "[PHONE-0913]" text to the "Enter your telephone number" "Build Empire text field"
    And I click on the "Direct App I Am Happy To Receive Information" button
    And I click on the "submit" "element by type"
    Then I should see the "EC_AUTO_LASTNAME" "BPP Digital Checkout Personal Details Booking Page"
    Then I should see the "EC_AUTO_FIRSTNAME" "BPP Digital Checkout Personal Details Booking Page"
    And I validate text "CONTAINS=EC_PHONE" to be displayed for "EC_PHONE" "BPP Digital Checkout Personal Details Booking Page"
    #Complete checkout
    And I set "AddressOne[####]" text to the "Address line 1" "BPP Digital Checkout Registration Input Field"
    And I set "AddressTwo[####]" text to the "Address line 2" "BPP Digital Checkout Registration Input Field"
    And I set "London" text to the "Town or city" "BPP Digital Checkout Registration Input Field"
    And I set "Greater London" text to the "County" "BPP Digital Checkout Registration Input Field"
    And I set "AL1 1AB" text to the "Postcode" "BPP Digital Checkout Registration Input Field"
    Then I click on the "Continue to payment" "button"
    And I wait for "2" seconds
    And I set "Jack" text to the "Name on card" "BPP Digital Checkout Registration Input Field"
    Then I fill the "BPP Digital Checkout Payment Card Number" field with "MD_COMMON_VALIDDATA_CREDITCARDNUMBER"
    And I set "10/25" text to the "Expiry date" "BPP Digital Checkout Registration Input Field"
    Then I fill the "BPP Digital Checkout Payment CVV Number" field with "MD_COMMON_VALIDDATA_VISACARDCVV"
    Then I click on the "termsAndConditions" "element by id"
    Then I click on the " Pay now" "BPP Digital Button"
    And I wait for "2" seconds
    Then I should see the "Booking complete." "text contained in element"
    Then I should see the "You will be able to access your online course materials shortly." "text contained in element"
    And I capture text data "BPP Digital Checkout Basket Id" as "EC_BASKET_ID" variable
    Then I execute "Log In To Salesforce" reusable step
    Then I click on the "Salesforce Main Header Button Search" element
    And I fill the "Salesforce Main Header Search" field with "EC_BASKET_ID"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Main Header Search"
    And I wait for "2" seconds
    Then I click on the "Salesforce First Opportunity" element
    Then I click on the "Salesforce Account Details Tab" element
    And I click on the "Salesforce Account Name Link" element
    Then I validate text "CONTAINS=EC_PHONE" to be displayed for "Salesforce Account Phone Field" element