#@Salesforce @InArrears
Feature: Create a Single Booking
  #Test scenario will be executed after resolving of BPP-15606
  #Billing Frequency = Monthly, verify Usage Summaries quantity = Order Products quantity * 18
  #Billing Frequency = Quarterly,verify Usage Summaries quantity = Order Products quantity * 6
  #Billing Frequency = Semiannual,verify Usage Summaries quantity = Order Products quantity * 3
  #Billing Frequency = Annual, verify Usage Summaries quantity = Order Products quantity * 2

  #@Positive @BillingFrequency
  Scenario Outline: CPQ In Arrears <frequency> Booking
    Given I execute "Log In To Salesforce" reusable step replacing some steps
      |2|I fill the "Salesforce Username" field with "MD_COMMON_CREDENTIALS_SALESFORCECPQUSER"|
      |3|I fill the "Salesforce Password" field with "MD_COMMON_CREDENTIALS_SALESFORCECPQPASSWORD"|
    And I execute "Switch to Key Clients App" reusable step if "Salesforce Billing Application Main Menu" "element is present"
    And I wait for "3" seconds
    Given I am on "MD_COMMON_LINKS_SALESFORCETHIRDINSTANCE" URL
    And I capture text data "Salesforce Instance Availability Data Field" as "EC_AVAILABILITY" variable
    Then I click on the "Salesforce Instance Edit" button
    And I click on the "Start Date" "Salesforce text field"
    Then I click on the "Today" "button"
    Then I click on the "Save" "button"
    And I wait for "2" seconds
    #Create Student Account
    Given I execute "Create Student Account" reusable step
    And I execute "Create Address" reusable step
    Then I wait for "2" seconds
    #Create Business Account with billing frequency
    When I click on the "Account/home" "Salesforce navigation href links"
    And I wait for "2" seconds
    And I click on the "Salesforce New Case Button" button
    And I wait for "2" seconds
    And I click on the "Business Development Account" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I set "AutoBusiness[FIRSTNAME]" text to the "Account Name" "Salesforce text field label"
    And I click on the "Client Category" "Salesforce dropdown field" by JS
    And I wait for "1" seconds
    And I click on the "Key Client" "Salesforce dropdown field option"
    And I click on the "Account Tax Category" "Salesforce dropdown field"
    Then I click on the "Domestic Business" "Salesforce dropdown field option"
    And I set "[PHONE]" text to the "Phone" "element by name"
    When I click on the "Billing Type" "Salesforce dropdown field" by JS
    And I wait for "2" seconds
    And I click on the "In Arrears" "element by title" by JS
    Then I click on the "Billing Frequency" "Salesforce dropdown field" by JS
    And I wait for "2" seconds
    And I click on the "<frequency>" "element by title" by JS
    And I click on the "Billing Cycle Start Month" "Salesforce dropdown field" by JS
    And I wait for "1" seconds
    Then I click on the "<month>" "element by title" by JS
    And I set "www.bpp.com" text to the "Website" "element by name"
    And I set "London" text to the "Head Office City" "Salesforce text field label"
    And I set "Automation 1" text to the "Head Office Address 1" "Salesforce text field label"
    And I set "W3H56" text to the "Head Office Postal Code" "Salesforce text field label"
    And I set "United Kingdom" text to the "Head Office Country" "Salesforce search field"
    And I wait for "1" seconds
    And I click on the "Kingdom" "option"
    And I click on the "Salesforce Account Creation Save button" element
    And I wait for "2" seconds
    And I execute "Create Address Business Account" reusable step replacing some steps
    |5|I click on the "Billing" "option" by JS|
    Then I wait for "5" seconds
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
    And I wait for "2" seconds
    And I click on the "Salesforce Quotes Select Product Page Save" element
    Then I click on the "Salesforce Quotes Edit" element
    And I click on the "Salesforce Quotes Ordered Checkbox" element by JS
    And I click on the "Salesforce Quote Booking Type Dropdown" element
    And I click on the "Salesforce Quote Booking Type Apprenticeships Chargeable" element
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
    And I wait for "10" seconds
    Then I click on the "Salesforce Account Related Tab" element
    Then I execute "Add A Booking" reusable step replacing some steps
    |6|I fill the "Salesforce Booking Search Instance" field with "MD_COMMON_VALIDDATA_SFCPQTHIRDINSTANCENUMBER"|
    |7|I click on the "MD_COMMON_VALIDDATA_SFCPQTHIRDINSTANCENUMBER" "option"|
    And I wait for "10" seconds
    And I capture current URL as "EC_INARREARS_ORDER_URL" variable

    Examples:
      |frequency   |month|usages|
      |Quarterly   |1    |      |
      |Semiannual  |5    |      |
      |Annual      |1    |      |