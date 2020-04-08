@Salesforce @Student
Feature: Create Student Account
  Description

  @Positive #TC-253 TC-254 TC-294 TC-76
  Scenario: Create Student Account and Submit Application
    Given I execute "Log In To Salesforce" reusable step
#    And I execute "Switch to Sales App" reusable step
    When I click on the "Accounts" "Salesforce navigation menu dropdown"
    And I click on the "New Account" "Salesforce navigation menu dropdown option"
    And I click on the "Student Account" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I set "Auto[FIRSTNAME]" text to the "First Name" "Salesforce text field"
    And I set "Auto[LASTNAME]" text to the "Last Name" "Salesforce text field"
    And I click on the "Student Type" "Salesforce dropdown field"
    And I click on the "Domestic" "option"
    And I set "31/01/1998" text to the "Date of Birth" "Salesforce date field"
    And I click on the "Gender" "Salesforce dropdown field"
    And I click on the "Male" "option"
    And I set "Canada" text to the "Primary Nationality" "Salesforce search field"
    And I click on the "Canada" "option"
    And I click on the "Domicile" "Salesforce dropdown field"
    And I click on the "Canada" "Salesforce dropdown field option"
    And I click on the "Preferred Phone" "Salesforce dropdown field"
    And I click on the "Home" "Salesforce dropdown field option"
    And I set "[PHONE]" text to the "Home Phone" "Salesforce text field"
    And I click on the "Legal Entity" "Salesforce dropdown field"
    And I click on the "UC~COL" "Salesforce dropdown field option"
    And I click on the "Preferred Email" "Salesforce dropdown field"
    And I click on the "Personal" "Salesforce dropdown field option"
    And I set "Auto[EMAIL-HARAKIRI]" text to the "Personal Email" "Salesforce text field"
    And I click on the "Save" "button"
    Then I should see the " was created." message

    And I click on the "Addresses" "Salesforce related new button"
    And I click on the "Address Type" "Salesforce dropdown field"
    And I click on the "Billing" "option"
    And I set "KW_AUTO_STREET" text to the "Address Line 1" "Salesforce text field"
    And I set "KW_AUTO_CITYUSA" text to the "City" "Salesforce text field"
    And I set "KW_AUTO_ZIPCODE|#####" text to the "Postal Code" "Salesforce text field"
    And I set "United States" text to the "Country" "Salesforce search field"
    And I click on the "States" "option"
    And I click on the "Save" "button"
    Then I should see the " was created." message

    #And I click on the "Salesforce More Actions Dropdown" button by JS
    #And I click on the "Get Profile ID LEX" "Salesforce dropdown option"
    And I click on the "Salesforce Get Profile ID" option
    Then I should see the "Profile Id created Successfully" message

    And I click on the "Opportunities" "Salesforce related new button"
    And I click on the "Application" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I set "OpportunityName[###]" text to the "Opportunity Name" "Salesforce text field"
    And I click on the "Status" "Salesforce dropdown field"
    And I click on the "Accepted - Conditional Firm" "Salesforce dropdown field option"
    And I click on the "Customer Group" "Salesforce dropdown field"
    And I click on the "SELFFUND" "Salesforce dropdown field option"
    And I click on the "Application Type" "Salesforce dropdown field"
    And I click on the "University Application" "Salesforce dropdown field option"
    And I set "31/01/2022" text to the "Close Date" "Salesforce date field"
    And I click on the "Save" "button"
    And I should see the " was created." message

    And I click on the "EC_OPPORTUNITY_NAME" "Salesforce link"
    And I click on the "Product Catalog Items" "Salesforce related new button"
    And I click on the "New" "Salesforce dropdown option"
    And I fill the "Salesforce Offering Text Field" field with "2381626"
    And I click on the "Salesforce Search" button
    And I "check" "Salesforce Offering Checkbox" checkbox
    And I "check" "Salesforce Product Checkbox" checkbox
    And I click on the "Salesforce Add Products" button
    And I wait for "4" seconds

    And I click on the "Salesforce More Actions Dropdown" button
    And I click on the "Submit Application LEX" "Salesforce dropdown option"
    And I click on the "Salesforce Account Name Link" element
    And I click on the "Salesforce Account Details Tab" element
    And I validate text "STARTS-WITH=BP" to be displayed for "Salesforce Banner ID Field" element
    And I capture text data "Salesforce Banner ID Field" as "EC_BANNER_ID" variable
    And I capture text data "Salesforce Profile Services ID Field" as "EC_PROFILE_ID" variable