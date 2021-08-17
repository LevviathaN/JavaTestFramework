@BuildEmpire @DirectApps @Appeals
Feature: Complete Academic Appeals Application - BPPPMO-1091

  Background:
    Given I register new Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    And I wait for "2" seconds
    When I execute "Create Academic Appeals Application" reusable step

  @Smoke #TC-3182
  Scenario: Complete Academic Appeals Application
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Direct App Final Award In Relation To Programme" button
    And I click on the "Direct App Next" button
    And I fill the "Diret App Phone Number" field with "EC_PHONE"
    And I click on the "Direct App Country Dropdown" button
    And I click on the "Direct App Country Dropdown UK Option" button
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
    And I set "12345" text to the "SRN" "Build Empire course details element"
    And I set "Auto Location" text to the "Location" "Build Empire course details element"
    And I set "Automation" text to the "Programme" "Build Empire course details element"
    And I set "Automation" text to the "Programme Leader" "Build Empire course details element"
    And I click on the "Direct App Course Details Mode" element
    And I click on the "Direct App Course Details Mode Part One" element
    And I fill the "Direct App Course Details Start Date" field with "12/2020"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Course Details Start Date"
    And I click on the "Direct App Course Details School" element
    And I click on the "Direct App Course Details School Law" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Add Assesment" button
    And I fill the "Direct App Assesment Title" field with "AutoTitle"
    And I click on the "Direct App Assesment Type" button
    And I click on the "Direct App Assesment Exam Type Option" button
    And I click on the "Direct App Assesment Attempt Number" button
    And I click on the "Direct App Assesment Attempt Number Option Two" button
    And I click on the "Direct App Sit Assesment Yes" button
    And I fill the "Direct App Assesment Date" field with "12/12/2017"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Assesment Date"
    And I fill the "Direct App Assesment Result Release Date" field with "12/12/2020"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Assesment Result Release Date"
    And I fill the "Direct App Assesment Examination Venue" field with "Venue"
    And I click on the "Direct App Assesment Ground A" button
    And I click on the "Direct App Add Filled Assesment" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Did you have learning support" "Build Empire reason for appeal element"
    And I click on the "Did you submit a Mitigating Circumstances" "Build Empire reason for appeal element"
    And I click on the "Are you appealing the result" "Build Empire reason for appeal element"
    And I click on the "Are you appealing a decision to reject your" "Build Empire reason for appeal element"
    And I click on the "Are you appealing the decision of an Examination Board" "Build Empire reason for appeal element"
    And I fill the "Direct App Details Text Area  Line Manager" field with "Automation Testing"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    #Additional validation required for BPP-12560 and BPP-10376
    And I fill the "Direct App Details Text Area  Line Manager" field with "Automation Testing"
    And Attribute "class" of "Direct App Inactive Step Completed Button" should have value "step-completed  "
    Then I upload "application_pack_document.pdf" file to "Direct App Upload File" element
    And Attribute "class" of "Direct App Inactive Step Completed Button" should have value "step-completed  disabled"
    And I fill the "Direct App Uploaded File Description" field with "Test"
    And Attribute "class" of "Direct App Inactive Step Completed Button" should have value "step-completed  "
    And I click on the "Direct App Remove Uploaded Document Button" button
    And Attribute "class" of "Direct App Inactive Step Completed Button" should have value "step-completed  "
    Then I upload "directApp.pdf" file to "Direct App Upload File" element
    And I fill the "Direct App Uploaded File Description" field with "Test"
    Then I upload "CallOut.png" file to "Direct App Upload File" element
    And I wait for "3" seconds
    And I fill the "Direct App Uploaded Second File Description" field with "Test Two"
    And I click on the "Direct App Save And Return" button
    Then I click on the "Yes" "Build Empire button"
    And I click on the "Personal Statement and Evidence" "Build Empire application section"
    Then I validate text "Test" to be displayed for "Direct App Uploaded File Description" element
    Then I validate text "Test Two" to be displayed for "Direct App Uploaded Second File Description" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save And Return" button
    Then I execute "Submit Application Hub" reusable step
    Then I validate text "CONTAINS=100" to be displayed for "Direct App Application Progress Percentage" element
    #Validate assessment details not populated from previous application
    Then I click on the "Direct App My Applications Left Menu Link" button by JS
    And I click on the "Direct App Start New Application Button" button
    And I hover over the "Direct App What Are You Applying For Dropdown" button
    And I click on the "Direct App What Are You Applying For Dropdown" element
    And I wait for "1" seconds
    Then I click on the "BPP University Academic Appeals" "Build Empire application type"
    And I click on the "Direct App Create Application" button
    And I wait for "1" seconds
    Given I click on the "Direct App Start Application" button
    And I click on the "Assessment details" "Build Empire application section"
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Please add at least one assessment" to be displayed for "Build Empire Assessment Step Error" element
    And I shouldn't see the "AutoTitle" "element"
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Accept Academic Appeals As Admin" reusable step
    Then I validate text "CONTAINS=Accepted" to be displayed for "Direct App Admin Status Changed for Academic Appeals" element