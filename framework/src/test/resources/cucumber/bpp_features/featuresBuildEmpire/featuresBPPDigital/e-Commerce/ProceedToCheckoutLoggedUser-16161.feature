@BuildEmpire @DigitalSite @Ecommerce
Feature: Checkout Journey for Logged User MasterCard
  The purpose of this ticket is to implement the payment form as part of the eCommerce checkout journey.
  The payment form needs to enable a user to enter credit card and billing address details
  and submit these to progress the purchase of their selected course instances.

  @Positive @LoggedUser #TC-6534, 6207, 6359, 6533
  Scenario: eCommerce - Checkout Journey Logged User MasterCard
    #Login as user
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "AutoHarriettKierra5523@harakirimail.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    And I wait for "10" seconds
    Then I click on the "Direct App My Applications Left Menu Link" element
    And I am on "MD_COMMON_LINKS_BPPDIGITALECOMMERCETWOURL" URL
    And I click on the "Level 2 Foundation Certificate Synoptic" "BPP Digital View Dates and Prices button"
    Then I click on the "2" "BPP Digital Add to Basket Item"
    And I wait for "1" seconds
    And I click on the "BPP Digital Header Basket" button by JS
    And I wait for "2" seconds
    And I capture text data "Total" "BPP Digital Basket Summary Section" as "EC_TOTAL" variable
    And I capture text data "Sub total" "BPP Digital Basket Summary Section" as "EC_SUBTOTAL" variable
    And I capture text data "VAT (20%)" "BPP Digital Basket Summary Section" as "EC_VAT" variable
    Then I should see the "We can only take UK bookings via the online shop. If you live outside the UK, call " "message"
    Then I click on the "Proceed to checkout" "button"
    And I wait for "2" seconds
    #Booking details page verification
    Then I should see the "Your contact address" "text"
    Then I should see the "Booking details" "text"
    Then I should see the "AutoAyaan AutoCarson" "BPP Digital Checkout Personal Details Booking Page"
    Then I should see the "autoharriettkierra5523@harakirimail.com" "BPP Digital Checkout Personal Details Booking Page"
    Then I should see the "+449135420086" "BPP Digital Checkout Personal Details Booking Page"
    And I should see the "Address 1" "element by value"
    And I should see the "Address 222" "element by value"
    And I should see the "London" "element by value"
    And I should see the "County" "element by value"
    And I should see the "BM1 5YZ" "element by value"
    Then I should see the "EC_SUBTOTAL" "text contained in SPAN element"
    Then I should see the "EC_VAT" "text contained in SPAN element"
    Then I should see the "EC_TOTAL" "element the last"
    Then I click on the "Continue to payment" "button"
    And I wait for "2" seconds
    #Payment page verification with contact address
    Then I should see the "AutoAyaan AutoCarson" "BPP Digital Checkout Personal Details Booking Page"
    Then I should see the "autoharriettkierra5523@harakirimail.com" "BPP Digital Checkout Personal Details Booking Page"
    Then I should see the "+449135420086" "BPP Digital Checkout Personal Details Booking Page"
    And I validate text "CONTAINS=Address 1" to be displayed for "BPP Digital Checkout Payment Contact Address" element
    And I validate text "CONTAINS=Address 222" to be displayed for "BPP Digital Checkout Payment Contact Address" element
    And I validate text "CONTAINS=LONDON" to be displayed for "BPP Digital Checkout Payment Contact Address" element
    And I validate text "CONTAINS=COUNTY" to be displayed for "BPP Digital Checkout Payment Contact Address" element
    And I validate text "CONTAINS=BM1 5YZ" to be displayed for "BPP Digital Checkout Payment Contact Address" element
    And I set "Jack" text to the "Name on card" "BPP Digital Checkout Registration Input Field"
    #Check invalid data and message for payment details
    Then I fill the "BPP Digital Checkout Payment Card Number" field with "4222 1111 2222 1111"
    And I set "09/21" text to the "Expiry date" "BPP Digital Checkout Registration Input Field"
    Then I fill the "BPP Digital Checkout Payment CVV Number" field with "MD_COMMON_VALIDDATA_VISACARDCVV"
    Then I click on the "termsAndConditions" "element by id"
    Then I click on the " Pay now" "BPP Digital Button"
    And I should see the "Unfortunately your payment has failed. Please check your details and try again." "message"
    Then I fill the "BPP Digital Checkout Payment Card Number" field with "MD_COMMON_VALIDDATA_MASTERCARDNUMBER"
    And I set "10/25" text to the "Expiry date" "BPP Digital Checkout Registration Input Field"
    Then I click on the " Pay now" "BPP Digital Button"
    And I wait for "3" seconds
    Then I should see the "Booking complete." "text contained in element"
    Then I should see the "You will be able to access your online course materials shortly." "text contained in element"
    And I capture text data "BPP Digital Checkout Basket Id" as "EC_BASKET_ID" variable
    #Hub login page
    Then I click on the "Go to Hub" "BPP Digital Button"
    And I wait for "5" seconds
    And I should see the "Timeline and Dashboard" "element"
    Then I should see the "Booking complete" "element"
    And I should see the "EC_BASKET_ID" "text contained in element"
    #Then I should see the "EC_TOTAL" "element the last" WILL BE UNCOMMENTED AFTER PRICE IS FORMATTED CORRECTLY
    #SF Opportunity, Order and Invoice verification
    Then I execute "Log In To Salesforce" reusable step
    Then I click on the "Salesforce Main Header Button Search" element
    And I fill the "Salesforce Main Header Search" field with "EC_BASKET_ID"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Main Header Search"
    And I wait for "2" seconds
    Then I click on the "Salesforce First Opportunity" element
    Then I click on the "Salesforce Account Details Tab" element
    Then I validate text "CONTAINS=Closed Won" to be displayed for "Salesforce Case Status Data Field" element
    And I validate text "EC_SUBTOTAL" to be displayed for "Amount" "Salesforce readonly field"
    And I click on the "Salesforce Orders Quick Link Tab on Quote Page" element
    Then I click on the "Salesforce Orders First Link" link
    And I wait for "1" seconds
    Then I validate text "EC_SUBTOTAL" to be displayed for "Salesforce Order Amount Data Field" element
    And I click on the "Salesforce Account Related Tab" element
    And I wait for "2" seconds
    Then I execute "window.scrollTo(1250, 800);" JS code
    And I wait for "8" seconds
    Then I should see the "Salesforce Invoices First Link" element
    And I click on the "Salesforce Invoices First Link" element
    Then I should see the "Subtotal" "Salesforce Invoice Price Info"
    Then I should see the "Tax" "Salesforce Invoice Price Info"
    Then I should see the "Total Amount (With Tax)" "Salesforce Invoice Price Info"
    And I capture text data "Subtotal" "Salesforce Invoice Price Info" as "EC_SFSUBTOTAL" variable
    And I capture text data "Total Amount (With Tax)" "Salesforce Invoice Price Info" as "EC_SFTOTAL" variable
    And I capture text data "Tax" "Salesforce Invoice Price Info" as "EC_SFTAX" variable