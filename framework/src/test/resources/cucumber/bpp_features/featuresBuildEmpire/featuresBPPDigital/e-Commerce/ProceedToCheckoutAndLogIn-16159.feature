@BuildEmpire @DigitalSite @Ecommerce
Feature: Checkout Journey to Login While Registration Amex
  The goal of this ticket is to deliver the Booking Details form as part of the eCommerce checkout journey and
  wire submission of the form's contents (along with personal details and basket details) to the backend endpoint
  which then integrates with Salesforce to create an opportunity and quote.

  @Positive @LoggedByCheckout #TC-6239, 6021, 6178, 6201, 6535, 6811
  Scenario: eCommerce - Checkout Journey Log In While Registration American Express
    And I am on "MD_COMMON_LINKS_BPPDIGITALECOMMERCETWOURL" URL
    And I click on the "Elements of Costing" "BPP Digital View Dates and Prices button"
    And I click on the "BPP Digital Add to Basket First Course" button
    And I wait for "1" seconds
    Then I validate text "CONTAINS=in basket" to be displayed for "BPP Digital Add to Basket First Course" element
    And I click on the "BPP Digital Header Basket" button by JS
    And I capture text data "Total" "BPP Digital Basket Summary Section" as "EC_TOTAL" variable
    And I capture text data "Sub total" "BPP Digital Basket Summary Section" as "EC_SUBTOTAL" variable
    And I capture text data "VAT (20%)" "BPP Digital Basket Summary Section" as "EC_VAT" variable
    Then I should see the "We can only take UK bookings via the online shop. If you live outside the UK, call " "message"
    Then I click on the "Proceed to checkout" "button"
    And I wait for "2" seconds
    #Booking details page verification and log in
    Then I should see the "Already got an account? Login" "text contained in A element"
    And I click on the "Already got an account? Login" "text contained in A element"
    And I set "AutoKarlyLou5450@harakirimail.com" text to the "Email" "Build Empire text field"
    And I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button by JS
    And I wait for "5" seconds
    Then I should see the "Delivery address" "text"
    Then I should see the "Booking details" "text"
    Then I should see the "We can only take UK bookings via the online shop. If you live outside the UK, call " "message"
    Then I should see the "AutoSantino AutoMueller" "BPP Digital Checkout Personal Details Booking Page"
    Then I should see the "autokarlylou5450@harakirimail.com" "BPP Digital Checkout Personal Details Booking Page"
    Then I should see the "+441234567892" "BPP Digital Checkout Personal Details Booking Page"
    And I should see the "Something 100" "element by value"
    And I should see the "Delivery 1" "element by value"
    And I should see the "London" "element by value"
    And I should see the "County" "element by value"
    And I should see the "BM1 5YZ" "element by value"
    Then I should see the "EC_SUBTOTAL" "text contained in SPAN element"
    Then I should see the "EC_VAT" "text contained in SPAN element"
    Then I should see the "EC_TOTAL" "element the last"
    Then I click on the "Continue to payment" "button"
    And I wait for "2" seconds
    #Payment page verification with new delivery address
    Then I should see the "AutoSantino AutoMueller" "BPP Digital Checkout Personal Details Booking Page"
    Then I should see the "autokarlylou5450@harakirimail.com" "BPP Digital Checkout Personal Details Booking Page"
    Then I should see the "+441234567892" "BPP Digital Checkout Personal Details Booking Page"
    And I validate text "CONTAINS=Something 100" to be displayed for "BPP Digital Checkout Payment Delivery Address" element
    And I validate text "CONTAINS=Delivery 1" to be displayed for "BPP Digital Checkout Payment Delivery Address" element
    And I validate text "CONTAINS=LONDON" to be displayed for "BPP Digital Checkout Payment Delivery Address" element
    And I validate text "CONTAINS=COUNTY" to be displayed for "BPP Digital Checkout Payment Delivery Address" element
    And I validate text "CONTAINS=BM1 5YZ" to be displayed for "BPP Digital Checkout Payment Delivery Address" element
    #Change delivery address
    Then I click on the "termsAndConditions" "element by id"
    Then I click on the "Use a different address" "text contained in SPAN element"
    And I set "AddressChanged[###]" text to the "Address line 1" "BPP Digital Checkout Registration Input Field"
    And I set "AddressSecondChanged[###]" text to the "Address line 2" "BPP Digital Checkout Registration Input Field"
    And I set "Manchester" text to the "Town or city" "BPP Digital Checkout Registration Input Field"
    And I set "South" text to the "County" "BPP Digital Checkout Registration Input Field"
    And I set "AL1 1AB" text to the "Postcode" "BPP Digital Checkout Registration Input Field"
    And I set "Test" text to the "Name on card" "BPP Digital Checkout Registration Input Field"
    And I set "10/25" text to the "Expiry date" "BPP Digital Checkout Registration Input Field"
    Then I fill the "BPP Digital Checkout Payment Card Number" field with "MD_COMMON_VALIDDATA_AMEXCARDNUMBER"
    Then I fill the "BPP Digital Checkout Payment CVV Number" field with "MD_COMMON_VALIDDATA_AMEXCARDCVV"
    Then I click on the " Pay now" "BPP Digital Button"
    And I wait for "3" seconds
    Then I should see the "Booking complete." "text contained in element"
    Then I should see the "You will be able to access your online course materials shortly." "text contained in element"
    Then I should see the "Delivery of learning materials to" "text contained in element"
    Then I should see the "Something 100" "text contained in element"
    Then I should see the "Delivery 1" "text contained in element"
    Then I should see the "LONDON" "text contained in element"
    Then I should see the "COUNTY" "text contained in element"
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
    Then I validate text "Closed Won" to be displayed for "Salesforce Case Status Data Field" element
    And I should see the "Amount" "Salesforce readonly field"
    And I click on the "Salesforce Orders Quick Link Tab on Quote Page" element
    Then I click on the "Salesforce Orders First Link" link
    And I wait for "1" seconds
    #Check Delivery and Shipping Addresses
    Then I validate text "EC_SUBTOTAL" to be displayed for "Salesforce Order Amount Data Field" element
    And I validate text "CONTAINS=EC_ADDRESS_CHANGED" to be displayed for "Salesforce Billing Address Order Page" element
    And I validate text "CONTAINS=EC_ADDRESS_SECOND_CHANGED" to be displayed for "Salesforce Billing Address Order Page" element
    And I validate text "CONTAINS=Manchester" to be displayed for "Salesforce Billing Address Order Page" element
    And I validate text "CONTAINS=London" to be displayed for "Salesforce Shipping Address Order Page" element
    And I validate text "CONTAINS=County" to be displayed for "Salesforce Shipping Address Order Page" element
    And I validate text "CONTAINS=Delivery 1" to be displayed for "Salesforce Shipping Address Order Page" element
    And I validate text "CONTAINS=Something 100" to be displayed for "Salesforce Shipping Address Order Page" element
    And I validate text "CONTAINS=BM1 5YZ" to be displayed for "Salesforce Shipping Address Order Page" element
    And I click on the "Salesforce Account Related Tab" element
    And I wait for "2" seconds
    Then I execute "window.scrollTo(1250, 800);" JS code
    And I wait for "10" seconds
    Then I should see the "Salesforce Invoices First Link" element
    And I click on the "Salesforce Invoices First Link" element
    Then I should see the "Subtotal" "Salesforce Invoice Price Info"
    Then I should see the "Tax" "Salesforce Invoice Price Info"
    Then I should see the "Total Amount (With Tax)" "Salesforce Invoice Price Info"
    And I capture text data "Subtotal" "Salesforce Invoice Price Info" as "EC_SFSUBTOTAL" variable
    And I capture text data "Total Amount (With Tax)" "Salesforce Invoice Price Info" as "EC_SFTOTAL" variable
    And I capture text data "Tax" "Salesforce Invoice Price Info" as "EC_SFTAX" variable
    And I verify that "EC_SFTOTAL" element "equal" to "EC_TOTAL" element
    And I verify that "EC_SFTAX" element "equal" to "EC_VAT" element
    And I verify that "EC_SUBTOTAL" element "equal" to "EC_SFSUBTOTAL" element