@BuildEmpire @DigitalSite @Ecommerce
Feature: Checkout Journey for Not Logged User
  The purpose of this ticket is to implement a skeleton checkout journey, representated by a series of pages that are accessed
  in a linear and sequential way.
  The journey needs to consist of 'registration', 'booking details', 'payment details' and 'booking completion' pages, accessed in this order.
  It should NOT be possible to access a subsequent page without accessing the previous page in this linear sequence.
  So for example, I should NOT be able to view the 'payment details' page without accessing the 'booking details' page first.
  Also, reloading any page should reset the journey page to the first page.

  @Positive @NotLogged #TC-5454, 6103, 6008, 6129, 6130, 6467, 6532, 6131, 6468
  Scenario: eCommerce - Checkout Journey Not Logged User VISA
    #Navigation through checkout
    And I am on "MD_COMMON_LINKS_BPPDIGITALECOMMERCEURL" URL
    And I click on the "Data Technician" "BPP Digital View Dates and Prices button"
    And I click on the "BPP Digital Add to Basket First Course" button
    Then I validate text "CONTAINS=in basket" to be displayed for "BPP Digital Add to Basket First Course" element
    And I validate text "CONTAINS=1" to be displayed for "BPP Digital Header Basket" element
    And I click on the "BPP Digital Header Basket" button by JS
    #Then I validate text "1" to be displayed for "BPP Digital Basket Section Items" element
    And I capture text data "Total" "BPP Digital Basket Summary Section" as "EC_TOTAL" variable
    And I capture text data "Sub total" "BPP Digital Basket Summary Section" as "EC_SUBTOTAL" variable
    And I capture text data "VAT (20%)" "BPP Digital Basket Summary Section" as "EC_VAT" variable
    Then I click on the "Proceed to checkout" "button"
    And I validate text "https://web-stage-bppdigital.bppuniversity.com/basket/#/checkout" to be displayed for "CHECK_URL" element
    And Browser performs "BACK" command
    And I validate text "https://web-stage-bppdigital.bppuniversity.com/basket/#/" to be displayed for "CHECK_URL" element
    Then I click on the "Proceed to checkout" "button"
    #Registration and navigation
    And I wait for "2" seconds
    And Browser performs "REFRESH" command
    Then I should see the "First name" "BPP Digital Checkout Registration Input Field"
    And I am on "https://web-stage-bppdigital.bppuniversity.com/basket/#/" URL
    Then I should see the "Proceed to checkout" "button"
    Then I click on the "Proceed to checkout" "button"
    And I set "Auto[FIRSTNAME]" text to the "First name" "BPP Digital Checkout Registration Input Field"
    And I set "Checkout" text to the "Surname" "BPP Digital Checkout Registration Input Field"
    And I set "Auto[EMAIL-HARAKIRI]" text to the "Email" "BPP Digital Checkout Registration Input Field"
    And I set "[PHONE-0913]" text to the "Enter your telephone number" "Build Empire text field"
    Then I remember "A@polloGlobal2020" text as "EC_PASSWORD" variable
    And I set "EC_PASSWORD" text to the "Choose a password" "Build Empire text field"
    And I click on the "Direct App I Am Happy To Receive Information" button
    Then I click on the "Direct App Register" button
    And I wait for "2" seconds
    #Booking details page verification
    And I set "AddressOne[####]" text to the "Address line 1" "BPP Digital Checkout Registration Input Field"
    And I set "AddressTwo[####]" text to the "Address line 2" "BPP Digital Checkout Registration Input Field"
    And I set "London" text to the "Town or city" "BPP Digital Checkout Registration Input Field"
    And I set "Greater London" text to the "County" "BPP Digital Checkout Registration Input Field"
    And I set "AL1 1AB" text to the "Postcode" "BPP Digital Checkout Registration Input Field"
    Then I should see the "Booking details" "text"
    Then I should see the "EC_AUTO_FIRSTNAME" "BPP Digital Checkout Personal Details Booking Page"
    Then I should see the "EC_AUTO_EMAIL" "BPP Digital Checkout Personal Details Booking Page"
    Then I should see the "Booking Summary" "text"
    Then I should see the "Apprenticeship Level 3 course" "text"
    Then I should see the "Data Technician" "text"
    Then I should see the "0 Sessions starting " "text"
    Then I should see the "Online" "text"
    Then I should see the "VAT (20%)" "text"
    Then I should see the "Sub total" "text"
    Then I should see the "Total" "text"
    Then I should see the "Items" "text"
    And I click on the "Show details" "element by title"
    Then I should see the "0 Day sessions" "text"
    Then I should see the "Learning materials included" "text"
    And Сss "background-color" of "Details" "BPP Digital Checkout Progress Bar" should have value "rgba(55, 99, 173, 1)"
    Then I click on the "Continue to payment" "button"
    And I wait for "2" seconds
    #Payment page verification with contact address
    Then I should see the "EC_AUTO_FIRSTNAME" "BPP Digital Checkout Personal Details Booking Page"
    Then I should see the "EC_AUTO_EMAIL" "BPP Digital Checkout Personal Details Booking Page"
    Then I should see the "Contact address" "text"
    And I validate text "CONTAINS=EC_ADDRESS_ONE" to be displayed for "BPP Digital Checkout Payment Contact Address" element
    And I validate text "CONTAINS=EC_ADDRESS_TWO" to be displayed for "BPP Digital Checkout Payment Contact Address" element
    And I validate text "CONTAINS=LONDON" to be displayed for "BPP Digital Checkout Payment Contact Address" element
    And I validate text "CONTAINS=GREATER LONDON" to be displayed for "BPP Digital Checkout Payment Contact Address" element
    And I validate text "CONTAINS=AL1 1AB" to be displayed for "BPP Digital Checkout Payment Contact Address" element
    And Сss "background-color" of "Payment" "BPP Digital Checkout Progress Bar" should have value "rgba(55, 99, 173, 1)"
    And I set "Jack" text to the "Name on card" "BPP Digital Checkout Registration Input Field"
    Then I fill the "BPP Digital Checkout Payment Card Number" field with "MD_COMMON_VALIDDATA_CREDITCARDNUMBER"
    And I set "10/25" text to the "Expiry date" "BPP Digital Checkout Registration Input Field"
    Then I fill the "BPP Digital Checkout Payment CVV Number" field with "MD_COMMON_VALIDDATA_VISACARDCVV"
    Then I click on the "termsAndConditions" "element by id"
    Then I click on the " Pay now" "BPP Digital Button"
    And I wait for "2" seconds
    #Complete page verification
    Then I should see the "Booking complete." "text contained in element"
    Then I should see the "You’ll shortly receive an email confirming your booking details." "text contained in element"
    And Сss "background-color" of "Complete" "BPP Digital Checkout Progress Bar" should have value "rgba(55, 99, 173, 1)"
    And I capture text data "BPP Digital Checkout Basket Id" as "EC_BASKET_ID" variable
    #Hub login page
    Then I click on the "Go to hub" "BPP Digital Button"
    Then I should see the "Email" "Build Empire text field"
    And I execute "Harakirimail Verify Email" reusable step
    And I execute "Log In to Hub as Student" reusable step
    Then I should see the "Booking complete" "element"
    And I should see the "EC_BASKET_ID" "text contained in element"
    #Then I should see the "EC_TOTAL" "element the last" WILL BE UNCOMMENTED AFTER PRICE IS FORMATTED CORRECTLY
    #Empty basket check
    Given I am on "https://web-stage-bppdigital.bppuniversity.com/basket/#/checkout" URL
    And I wait for "1" seconds
    Then I should see the "Your Basket is empty" "message"
    #Check blank page appears under not existing URL
    And I am on "https://web-stage-bppdigital.bppuniversity.com/basket/#/xyz" URL
    And I shouldn't see the "Proceed to checkout" "button"
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
    And I verify that "EC_SFTOTAL" element "equal" to "EC_TOTAL" element
    And I verify that "EC_SFTAX" element "equal" to "EC_VAT" element
    And I verify that "EC_SUBTOTAL" element "equal" to "EC_SFSUBTOTAL" element