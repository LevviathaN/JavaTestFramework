@BuildEmpire @DirectApps @Programmes @Smoke
Feature: Submit BPP University Programmes Application

  Background:
    Given I register new Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    When I execute "Create Programmes Application" reusable step

  @Positive @Smoke #TC-1236
  Scenario: Complete Programmes Application
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Diret App Do You Meet Eligilibility Criteria Yes" button
    And I click on the "Direct App Next" button
    And I fill the "Diret App Phone Number" field with "EC_PHONE"
    And I click on the "Direct App Country Dropdown" button
    And I click on the "Austria" "Direct App Country Dropdown Option"
    And I set "Address 1" text to the "Address Line 1*" "Build Empire text field"
    And I set "Address 1" text to the "Address Line 2" "Build Empire text field"
    And I set "London" text to the "Town/City*" "Build Empire text field"
    And I fill the "Diret App Postal Code" field with "12345"
    Then I remember "KW_AUTO_DOB|DD/MM/YYYY_21" text as "EC_DOB" variable
    And I fill the "Direct App DOB" field with "EC_DOB"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App DOB"
    And I set "London" text to the "Town/City*" "Build Empire text field"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Diret App Gender Dropdown" element
    And I click on the "Diret App Gender Not To Say" element
    And I click on the "Diret App Gender At Birth Dropdown" element
    And I click on the "Diret App Gender At Birth Yes" element
    And I click on the "Diret App Ethnicity Dropdown" element
    And I click on the "Diret App Ethnicity White And Black African" element
    And I click on the "Diret App Religion Dropdown" element
    And I click on the "Diret App Religion Chrisitan" element
    And I click on the "Diret App Sexual Orientation Dropdown" element
    And I click on the "Diret App Sexual Orientation Heterosexual" element
    And I click on the "Diret App Learning Disability No" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Country of birth" "Build Empire nationality dropdown"
    And I click on the "United States" "Build Empire nationality option"
    And I click on the "Country of nationality" "Build Empire nationality dropdown"
    And I click on the "United States" "Build Empire nationality option"
    And I click on the "Country of domicile/permanent residency" "Build Empire nationality dropdown"
    And I click on the "United States" "Build Empire nationality option"
    And I click on the "Is English your first language?" "Build Empire nationality dropdown"
    And I click on the "Yes" "Build Empire nationality option"
    And I click on the "Direct App Nationality No Visa" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Add Qualification" button
    And I click on the "Direct App Country of Study Dropdown" button
    And I click on the "United Kingdom" "Build Empire qualification option"
    And I click on the "Direct App Education Type Degree Radiobutton" button
    And I click on the "Direct App Qualification Title Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Foundation degree"
    Then I click on the "Foundation degree" "Build Empire application type"
    And I click on the "Direct App Subject Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Applied Law (QCF)"
    Then I click on the "Applied Law (QCF)" "Build Empire application type"
    And I click on the "Direct App Awarding Institution Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Zaskin College"
    Then I click on the "Zaskin College" "Build Empire application type"
    And I fill the "Direct App Year Completed" field with "11/11/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Year Completed"
    And I fill the "Direct App Grade" field with "AutoGrade"
    And I fill the "Direct App Examining Body" field with "AutoBody"
    And I click on the "Direct App Add Assesment" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I fill the "Direct App Details Text Area  Line Manager" field with "Automation personal statement"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Payment Sponsorhsip Company/Law Firm" button
    Then I set "Auto Test" text to the "Name of organisation/company" "Build Empire text field by title"
    Then I set "Test" text to the "Person authorising sponsorship" "Build Empire text field by title"
    Then I set "London" text to the "City" "Build Empire text field by title"
    Then I set "W35H1" text to the "Postcode" "Build Empire text field by title"
    Then I set "test@test.com" text to the "Email" "Build Empire text field by title"
    Then I set "1234567890" text to the "Telephone" "Build Empire text field by title"
    And I click on the "Country" "Build Empire dropdown"
    And I click on the "United Kingdom" "Build Empire dropdown option"
    Then I fill the "Direct App Channel Islands Address Training Manager" field with "Address 1"
    Then I set "***" text to the "Purchase order number" "Build Empire text field by title"
    And I should see the "Only alphanumeric characters, - and / are allowed" "text"
    And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
    Then I set "###" text to the "Purchase order number" "Build Empire text field by title"
    And I should see the "Only alphanumeric characters, - and / are allowed" "text"
    And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
    Then I set "$$" text to the "Purchase order number" "Build Empire text field by title"
    And I should see the "Only alphanumeric characters, - and / are allowed" "text"
    And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
    Then I set "%" text to the "Purchase order number" "Build Empire text field by title"
    And I should see the "Only alphanumeric characters, - and / are allowed" "text"
    And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
    Then I set "12345" text to the "Purchase order number" "Build Empire text field by title"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Other Information No Criminal Convictions" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    Then I upload "directApp.pdf" file to "Direct App Upload File" element
    And I fill the "Direct App Uploaded File Description" field with "Test"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save And Return" button
    Then I execute "Submit Application Hub" reusable step
    Then I validate text "CONTAINS=100" to be displayed for "Direct App Application Progress Percentage" element
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    Then  I execute modified "Accept Academic Appeals As Admin" reusable step
    |3|Delete||
    And I wait for "2" seconds
    Then I validate text "CONTAINS=Accepted" to be displayed for "Direct App Admin Status Changed for Programmes" element