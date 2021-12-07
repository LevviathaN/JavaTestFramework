@BuildEmpire @DigitalSite @Ecommerce
Feature: Remove Items From Basket And Validation of Error Messages
  Users who wish to purchase courses using the BPP website will need to add and remove selected courses from their basket.
  This ticket is to enable the remove capability to a basket.
  A remove can be done by either deselecting the 'Add to basket' button on the Dates & Prices course instances view or by choosing the Remove option in the Basket view.

  @RemoveItems @Negative #TC-5201, 5445, 6175, 6205, 6364, 6368, 6531, 5441, 5455
  Scenario: eCommerce - Remove Items From Basket And Verify Error Messages
    #Add and remove items
    And I am on "MD_COMMON_LINKS_BPPDIGITALECOMMERCETWOURL" URL
    And I click on the "Paper auto-checkout regression" "BPP Digital View Dates and Prices button"
    And I click on the "BPP Digital Add to Basket First Course" button
    Then I validate text "CONTAINS=in basket" to be displayed for "BPP Digital Add to Basket First Course" element
    And I validate text "CONTAINS=1" to be displayed for "BPP Digital Header Basket" element
    Then I click on the "BPP Digital Add to Basket First Course" element
    Then I validate text "CONTAINS=Add to basket" to be displayed for "BPP Digital Add to Basket First Course" element
    Then I click on the "BPP Digital Add to Basket First Course" element
    And I click on the "BPP Digital Header Basket" button by JS
    And I wait for "1" seconds
    Then I click on the "Remove" "button"
    And I wait for "1" seconds
    Then I should see the "Your Basket is empty" "message"
    #Add more than 15 items
    And I am on "MD_COMMON_LINKS_BPPDIGITALECOMMERCETWOURL" URL
    And I click on the "Paper auto-checkout regression" "BPP Digital View Dates and Prices button"
    Then I click on the "1" "BPP Digital Add to Basket Item"
    Then I click on the "2" "BPP Digital Add to Basket Item"
    Then I click on the "3" "BPP Digital Add to Basket Item"
    Then I click on the "4" "BPP Digital Add to Basket Item"
    Then I click on the "5" "BPP Digital Add to Basket Item"
    Then I click on the "6" "BPP Digital Add to Basket Item"
    Then I click on the "7" "BPP Digital Add to Basket Item"
    Then I click on the "8" "BPP Digital Add to Basket Item"
    Then I click on the "9" "BPP Digital Add to Basket Item"
    Then I click on the "10" "BPP Digital Add to Basket Item"
    Then I click on the "11" "BPP Digital Add to Basket Item"
    Then I click on the "12" "BPP Digital Add to Basket Item"
    Then I click on the "13" "BPP Digital Add to Basket Item"
    Then I click on the "14" "BPP Digital Add to Basket Item"
    Then I click on the "15" "BPP Digital Add to Basket Item"
    Then I click on the "16" "BPP Digital Add to Basket Item"
    And I validate text "Add to basket" to be displayed for "16" "BPP Digital Add to Basket Item"
    And I validate text "CONTAINS=15" to be displayed for "BPP Digital Header Basket" element
    And I click on the "BPP Digital Header Basket" button by JS
    Then I validate text "15" to be displayed for "Items" "BPP Digital Basket Summary Section"
    Then I should see the "Are you sure you want to book them?" "message"
    Then I should see the "Session timing clashes exist for 14 of your chosen courses." "message"
    Then I click on the "1" "BPP Digital Basket Instance Item Remove"
    Then I click on the "2" "BPP Digital Basket Instance Item Remove"
    Then I click on the "3" "BPP Digital Basket Instance Item Remove"
    Then I click on the "4" "BPP Digital Basket Instance Item Remove"
    Then I click on the "5" "BPP Digital Basket Instance Item Remove"
    And Browser performs "BACK" command
    And I wait for "2" seconds
    And I click on the "Elements of Costing" "BPP Digital View Dates and Prices button"
    Then I click on the "1" "BPP Digital Add to Basket Item"
    Then I click on the "2" "BPP Digital Add to Basket Item"
    And I click on the "BPP Digital Header Basket" button by JS
    Then I should see the "AAT Level 2 - Certificate in Accounting (AQ2016) courses" "text"
    Then I should see the "Body auto-checkout regression Level Auto-checkout regression name courses" "text"
    Then I should see the "Inc. VAT" "element the last"
    Then I should see the "Elements of Costing" "element the last"
    Then I should see the "Paper auto-checkout regression" "element the last"
    Then I should see the "Exam Preparation MVM 1" "element the last"
    Then I should see the "EXAM SITTING" "element the last"
    Then I click on the "Proceed to checkout" "button"
    #Check invalid email
    And I click on the "Already got an account? Login" "text contained in A element"
    And I set "autoecommerce11111@harakirimail.com" text to the "Email" "Build Empire text field"
    And I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button by JS
    And I should see the "something went wrong when attempting to log in." "text contained in SPAN element"
    Then Browser performs "BACK" command
    And I wait for "3" seconds
    Then I should see the "Register for an account" "message"
    #Check error messages
    Then I click on the "Direct App Register" button
    And I should see the "Enter your first name" "Build Empire text field"
    And I should see the "Enter your surname" "Build Empire text field"
    And I should see the "Enter your email address" "Build Empire text field"
    And I should see the "Enter your telephone number" "Build Empire text field"
    And I should see the "Enter your password" "text contained in P element"
    And I should see the "Choose an option" "text contained in P element"
    And I set "q" text to the "First name" "BPP Digital Checkout Registration Input Field"
    And I set "q" text to the "Surname" "BPP Digital Checkout Registration Input Field"
    And I set "aaa" text to the "Email" "BPP Digital Checkout Registration Input Field"
    And I set "1" text to the "Enter your telephone number" "Build Empire text field"
    Then I remember "A@polloGlobal2020" text as "EC_PASSWORD" variable
    And I set "EC_PASSWORD" text to the "Choose a password" "Build Empire text field"
    And I click on the "Direct App I Am Happy To Receive Information" button
    Then I click on the "Direct App Register" button
    And I wait for "2" seconds
    And I should see the "Enter a valid email address" "text contained in P element"
    And I should see the "Enter a longer telephone number, 8 or more characters" "text contained in P element"
    And I should see the "Enter a longer first name, 2 or more characters" "text contained in P element"
    And I should see the "Enter a longer surname, 2 or more characters" "text contained in P element"
    And I set "asdasd@mail.com" text to the "Email" "BPP Digital Checkout Registration Input Field"
    And I set "[PHONE-0913]" text to the "Enter your telephone number" "Build Empire text field"
    And I set "Auto[FIRSTNAME]" text to the "First name" "BPP Digital Checkout Registration Input Field"
    And I set "Checkout" text to the "Surname" "BPP Digital Checkout Registration Input Field"
    Then I click on the "Direct App Register" button
    And I should see the "This email address is already registered." "text contained in P element"
    And I set "Auto[EMAIL-HARAKIRI]" text to the "Email" "BPP Digital Checkout Registration Input Field"
    Then I click on the "Direct App Register" button
    And I wait for "2" seconds
    #Delivery details errors
    Then I click on the "Continue to payment" "button"
    And I should see the "Enter your address line 1" "text contained in P element"
    And I should see the "Enter your address line 2" "text contained in P element"
    And I should see the "Enter your town/city or county" "text contained in P element"
    And I should see the "Enter your county or town/city" "text contained in P element"
    And I should see the "Enter your postcode" "text contained in P element"
    And I set "A" text to the "Address line 1" "BPP Digital Checkout Registration Input Field"
    And I set "AddressTwo[####]" text to the "Address line 2" "BPP Digital Checkout Registration Input Field"
    And I set "A" text to the "Town or city" "BPP Digital Checkout Registration Input Field"
    And I set "A" text to the "County" "BPP Digital Checkout Registration Input Field"
    And I set "1" text to the "Postcode" "BPP Digital Checkout Registration Input Field"
    And I should see the "Enter a valid postcode e.g. AL1 1AB, BM1 5YZ" "text contained in P element"
    And I should see the "Enter a longer county, 2 or more characters" "text contained in P element"
    And I should see the "Enter a longer town/city, 2 or more characters" "text contained in P element"
    And I should see the "Enter a longer address, 2 or more characters" "text contained in P element"
    And I set "A123456789012345678901234567890123456789901234567890" text to the "Address line 1" "BPP Digital Checkout Registration Input Field"
    And I set "A123456789012345678901234567890123456789901234567890" text to the "Town or city" "BPP Digital Checkout Registration Input Field"
    And I set "A123456789012345678901234567890123456789901234567890" text to the "County" "BPP Digital Checkout Registration Input Field"
    And I should see the "Enter a shorter address, 50 or less characters" "text contained in P element"
    And I should see the "Enter a shorter town/city, 50 or less characters" "text contained in P element"
    And I should see the "Enter a shorter county, 50 or less characters" "text contained in P element"
    And I set "AddressOne[####]" text to the "Address line 1" "BPP Digital Checkout Registration Input Field"
    And I set "London" text to the "Town or city" "BPP Digital Checkout Registration Input Field"
    And I set "Greater London" text to the "County" "BPP Digital Checkout Registration Input Field"
    And I set "AL1 1AB" text to the "Postcode" "BPP Digital Checkout Registration Input Field"
    Then I click on the "Continue to payment" "button"
    And I wait for "2" seconds
    #Payment details errors
    Then I click on the " Pay now" "BPP Digital Button"
    And I should see the "Accept the terms and conditions" "text contained in P element"
    And I should see the "Enter expiry date" "text contained in P element"
    And I should see the "Enter a valid card number" "text contained in P element"
    And I should see the "Enter the name as it appears on your card" "text contained in P element"
    And I should see the "Enter CVV" "text contained in P element"
    Then I click on the "termsAndConditions" "element by id"
    Then I click on the "Use a different address" "text contained in SPAN element"
    And I set "A" text to the "Name on card" "BPP Digital Checkout Registration Input Field"
    And I set "1" text to the "Expiry date" "BPP Digital Checkout Registration Input Field"
    Then I click on the " Pay now" "BPP Digital Button"
    And I should see the "Enter a longer name, 2 or more characters" "text contained in P element"
    And I should see the "Enter a valid expiry date" "text contained in P element"
    And I should see the "Enter your address line 1" "text contained in P element"
    And I should see the "Enter your address line 2" "text contained in P element"
    And I should see the "Enter your town/city or county" "text contained in P element"
    And I should see the "Enter your county or town/city" "text contained in P element"
    And I should see the "Enter your postcode" "text contained in P element"