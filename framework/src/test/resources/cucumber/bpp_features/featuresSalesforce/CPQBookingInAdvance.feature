@Salesforce @CPQ @Booking
Feature: Create a Single Booking
  Description

  @Positive @InAdvance
  Scenario: CPQ In Advance Booking
    Given I execute "Log In To Salesforce" reusable step replacing some steps
      |2|I fill the "Salesforce Username" field with "MD_COMMON_CREDENTIALS_SALESFORCECPQUSER"|
      |3|I fill the "Salesforce Password" field with "MD_COMMON_CREDENTIALS_SALESFORCECPQPASSWORD"|
    #Check amount of available bookings
    And I execute "Switch to Key Clients App" reusable step if "Salesforce Billing Application Main Menu" "element is present"
    And I wait for "3" seconds
    Given I am on "MD_COMMON_LINKS_SALESFORCESECONDINSTANCE" URL
    And I capture text data "Salesforce Instance Availability Data Field" as "EC_AVAILABILITY" variable
    Then I click on the "Salesforce Instance Edit" button
    And I click on the "Start Date" "Salesforce text field"
    And I wait for "1" seconds
    Then I click on the "Today" "button"
    Then I click on the "Save" "button"
    And I wait for "2" seconds
    #Create Student Account
    Given I execute "Create Student Account" reusable step with some additional steps
    |11|I click on the "Account Tax Category" "Salesforce dropdown field" by JS|
    |12|I click on the "Domestic Business" "element by title"|
    |13|I wait for "2" seconds|
    |14|I click on the "Billing Type" "Salesforce dropdown field" by JS|
    |15|I wait for "2" seconds|
    |16|I click on the "In Advance" "element by title" by JS|
    And I execute "Create Address" reusable step
    Then I wait for "2" seconds
    Then I execute "Create Business Opportunity" reusable step
    #Add Quote
    And I click on the "EC_AUTO_OPPORTUNITY" "Salesforce link"
    And I wait for "2" seconds
    Then I click on the "Salesforce Create Quote" element
    And I wait for "2" seconds
    And I click on the "Salesforce Quote Save" button
    And I wait for "3" seconds
    And I click on the "Salesforce Quotes Quick Link Tab" element
    Then I click on the "Salesforce Quotes First Link" element
    And I wait for "2" seconds
    Then I capture current URL as "EC_QUOTE_URL" variable
    And I click on the "Salesforce Quotes Edit Lines" element
    Then I wait for "15" seconds
    And I hover over the "Salesforce Quotes Add Products" button
    And I click on the "Salesforce Quotes Add Products" element
    Then I fill the "Salesforce Quotes Search Products" field with "MD_COMMON_VALIDDATA_SFCPQPRODUCTSECOND"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Quotes Search Products"
    Then I click on the "Salesforce Quotes Product Checkbox" option
    And I click on the "Salesforce Quotes Select Product Button" element
    And I wait for "3" seconds
    #Add 10 to quantity for Bulk Update
    Then I doubleclick on the "6" "Salesforce Quotes Page Product Quantity Element To Click"
    And I click on the "6" "Salesforce Quotes Page Product Quantity Pencil Element"
    Then I fill the "Salesforce Quotes Page Product Quantity Input" field with "1"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Quotes Page Product Quantity Input"
    Then I click on the "5" "Salesforce Quotes Page Product Quantity Element To Click"
    And I click on the "5" "Salesforce Quotes Page Product Quantity Pencil Element"
    Then I fill the "Salesforce Quotes Page Product Quantity Input" field with "1"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Quotes Page Product Quantity Input"
    Then I click on the "4" "Salesforce Quotes Page Product Quantity Element To Click"
    And I click on the "4" "Salesforce Quotes Page Product Quantity Pencil Element"
    Then I fill the "Salesforce Quotes Page Product Quantity Input" field with "1"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Quotes Page Product Quantity Input"
    Then I click on the "3" "Salesforce Quotes Page Product Quantity Element To Click"
    And I click on the "3" "Salesforce Quotes Page Product Quantity Pencil Element"
    Then I fill the "Salesforce Quotes Page Product Quantity Input" field with "1"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Quotes Page Product Quantity Input"
    Then I click on the "2" "Salesforce Quotes Page Product Quantity Element To Click"
    And I click on the "2" "Salesforce Quotes Page Product Quantity Pencil Element"
    Then I fill the "Salesforce Quotes Page Product Quantity Input" field with "1"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Quotes Page Product Quantity Input"
    Then I click on the "1" "Salesforce Quotes Page Product Quantity Element To Click"
    And I click on the "1" "Salesforce Quotes Page Product Quantity Pencil Element"
    Then I fill the "Salesforce Quotes Page Product Quantity Input" field with "1"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Quotes Page Product Quantity Input"
    And I click on the "Salesforce Quotes Select Product Page Save" element
    #And I click on the "Salesforce Quotes Edit Page Save" element
    Then I click on the "Salesforce Quotes Edit" element
    And I click on the "Salesforce Quotes Ordered Checkbox" element by JS
    And I click on the "Salesforce Quote Booking Type Dropdown" element
    And I click on the "Salesforce Quote Booking Type Apprenticeships Chargeable" element
    And I click on the "Salesforce Quote Billing Mode Dropdown" element
    And I click on the "Salesforce Quote Billing Mode Salesforce Option" element
    And I capture text data "Salesforce Quote Edited Quote Number" as "EC_QUOTE" variable
    And I click on the "Salesforce Quote Edited Save" element
    And I wait for "30" seconds
    Then I am on "EC_QUOTE_URL" URL
    And I wait for "1" seconds
    And I click on the "Salesforce Orders Quick Link Tab on Quote Page" element
    Then I click on the "Salesforce Orders First Link" link
    And I should scroll to the "top" of the page
    Then I click on the "Salesforce Order Activate" button
    And I click on the "Salesforce Order Activate Popup" button
    And I wait for "3" seconds
    And Browser performs "REFRESH" command
    And I wait for "5" seconds
    Then I click on the "Salesforce Account Related Tab" element
    #Add Booking for student account
    And I click on the "Salesforce New Booking" button
    And I click on the "Salesforce Status Booking" element by JS
    And I click on the "Confirmed" "option"
    And I fill the "Salesforce Booking Search Instance" field with "MD_COMMON_VALIDDATA_SFCPQSECONDINSTANCENUMBER"
    And I click on the "MD_COMMON_VALIDDATA_SFCPQSECONDINSTANCENUMBER" "option"
    And I click on the "Salesforce Save Booking Button" element
    And I wait for "10" seconds
    And I capture current URL as "EC_INADVANCE_ORDER_URL" variable
    #Check usages
    And I wait for "2" seconds
    Then I click on the "Edit" "text in div element"
    And I click on the "Bill Now" "Salesforce checkbox"
    Then I click on the "Save" "element by title"
    And I wait for "5" seconds
    Then Browser performs "REFRESH" command
    And I wait for "5" seconds
    And I click on the "Salesforce Account Related Tab" element
    And I wait for "2" seconds
    Then I execute "window.scrollTo(1250, 800);" JS code
    And I wait for "8" seconds
    Then I should see the "Salesforce Invoices First Link" element
    And I validate text "CONTAINS=INV" to be displayed for "Salesforce Invoices First Link" element
    Then I should see the "Salesforce Usages Number" element
    And I validate text "CONTAINS=(5)" to be displayed for "Salesforce Usages Number" element