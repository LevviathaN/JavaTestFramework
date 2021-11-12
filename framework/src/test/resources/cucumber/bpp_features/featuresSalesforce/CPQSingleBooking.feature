@Salesforce @CPQ @Booking
Feature: Create a Single Booking
  Description

  @Positive @SingleBooking #TC-2609
  Scenario: CPQ Single Booking
    Given I execute "Log In To Salesforce" reusable step replacing some steps
      |2|I fill the "Salesforce Username" field with "MD_COMMON_CREDENTIALS_SALESFORCECPQUSER"|
      |3|I fill the "Salesforce Password" field with "MD_COMMON_CREDENTIALS_SALESFORCECPQPASSWORD"|
    #Check amount of available bookings
    And I execute "Switch to Key Clients App" reusable step if "Salesforce Billing Application Main Menu" "element is present"
    And I wait for "3" seconds
    Given I am on "MD_COMMON_LINKS_SALESFORCEINSTANCE" URL
    And I capture text data "Salesforce Instance Availability Data Field" as "EC_AVAILABILITY" variable
    #Create Student Account
    Given I execute "Create Student Account" reusable step
    And I execute "Create Address" reusable step
    Given I am on "MD_COMMON_LINKS_SALESFORCEINSTANCE" URL
    Then I wait for "2" seconds
    Then I execute "Create Business Account" reusable step
    And I execute "Create Address Business Account" reusable step
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
    Then I wait for "2" seconds
    Then I click on the "Salesforce Quotes Product Checkbox" option
    And I click on the "Salesforce Quotes Select Product Button" element
    And I wait for "2" seconds
    And I click on the "Salesforce Quotes Select Product Page Save" element
    #And I wait for "1" seconds
   # And I click on the "Salesforce Quotes Edit Page Save" element
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
    And Browser performs "REFRESH" command
    And I wait for "5" seconds
    Then I click on the "Salesforce Account Related Tab" element
    Then I execute "Add A Booking" reusable step

    Given I am on "MD_COMMON_LINKS_SALESFORCEINSTANCE" URL
    And Browser performs "REFRESH" command
    And I wait for "10" seconds
    And I should see the "[SUM(EC_AVAILABILITY,-1)]" element
    And I capture text data "Salesforce Instance Availability Data Field" as "EC_MINUSONE_BOOKING" variable
    And I click on the "Salesforce Instance Page View All Bookings" element
    And I click on the "Salesforce Booking Number Column Header" element by JS
    And I wait for "2" seconds
    And I hover over the "Salesforce Recent Booking Link" element
    Then I click on the "Salesforce Recent Booking Link" element by JS
    Then I click on the "Salesforce Recent Booking Link Active Cell" element by JS
    Then I click on the "Salesforce Quotes Edit" element
    And I wait for "2" seconds
    And I click on the "Status" "Salesforce booking dropdown field" by JS
    And I click on the "Cancelled" "Salesforce booking dropdown option"
    And I click on the "Status Reason" "Salesforce booking dropdown field" by JS
    And I click on the "Changed Mind" "Salesforce booking dropdown option"
    And I click on the "Cancellation Action" "Salesforce booking dropdown field" by JS
    And I click on the "Credit Fulfilled Materials" "Salesforce booking dropdown option"
    And I click on the "Cancellation Terms" "Salesforce booking dropdown field" by JS
    And I click on the "Inside" "Salesforce booking dropdown option"
    And I set "Automation Cancelled" text to the "Cancellation Reason" "Salesforce text field"
    And I click on the "Salesforce Quote Edited Save" element
    And I wait for "10" seconds
    Given I am on "MD_COMMON_LINKS_SALESFORCEINSTANCE" URL
    And I wait for "5" seconds
    Then I validate text "EC_AVAILABILITY" to be displayed for "Salesforce Instance Availability Data Field" element