@BuildEmpire @DigitalSite
Feature: BPP Digital Update EPA gateway time

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive @EPA #TC-1823, 6743
  Scenario: Update EPA gateway time
    When I execute "Admin Hub Navigate to Applications list" reusable step
    And I click on the "Direct App Admin Apprenticeships Tab" link by JS
    And I fill the "Direct App Admin Filter By User" field with "AutomationEPAUser1@harakirimail.com"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    And I capture text data "BPP Digital Admin Applications Overall Off the Job training hours" as "EC_JOB_TRAINING_HOURS" variable
    And I click on the "Application BPP Professional Apprenticeships" "BPP Digital Admin Applications Edit button"
    And I wait for "3" seconds
    Then I validate text "Overwritten EPA gateway time" to be displayed for "BPP Digital Admin Overwritten EPA gateway time label" element
    Then I validate text "CONTAINS=The standard EPA gateway time is 12 weeks" to be displayed for "BPP Digital Admin Overwritten EPA gateway time tooltip message" element
    When I fill the "BPP Digital Admin Overwritten EPA gateway time input field" field with "-2"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I validate text "Overwritten epa gateway time in weeks must be greater than 0" to be displayed for "BPP Digital Admin Overwritten EPA gateway validation error message" element
    When I fill the "BPP Digital Admin Overwritten EPA gateway time input field" field with "2.2"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I validate text "Overwritten epa gateway time in weeks must be an integer" to be displayed for "BPP Digital Admin Overwritten EPA gateway validation error message" element
    When I fill the "BPP Digital Admin Overwritten EPA gateway time input field" field with "1000"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I validate text "Overwritten epa gateway time in weeks EPA Gateway Time cannot be longer than the duration of the full programme." to be displayed for "BPP Digital Admin Overwritten EPA gateway validation error message" element
    When I fill the "BPP Digital Admin Overwritten EPA gateway time input field" field with "7"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    And I remember "KW_AUTO_TODAY" text as "EC_DATE_TODAY" variable
    Then I validate text "CONTAINS=EC_DATE_TODAY" to be displayed for "BPP Digital Validate Note Date" element
    Then I validate text "CONTAINS=EPA Gateway Time amended to 7" to be displayed for "BPP Digital Validate Note Message" element
    Then I validate text "NOT_CONTAINS=EC_JOB_TRAINING_HOURS" to be displayed for "BPP Digital Overall Off the Job Training Hours" element
    And I should scroll to the "top" of the page
    And I click on the "Application BPP Professional Apprenticeships" "BPP Digital Admin Applications Edit button"
    And I wait for "3" seconds
    When I fill the "BPP Digital Admin Overwritten EPA gateway time input field" field with "4"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I validate text "CONTAINS=EC_DATE_TODAY" to be displayed for "BPP Digital Validate Note Date" element
    Then I validate text "CONTAINS=EPA Gateway Time amended to 4" to be displayed for "BPP Digital Validate Note Message" element
    Then I validate text "CONTAINS=EC_JOB_TRAINING_HOURS" to be displayed for "BPP Digital Overall Off the Job Training Hours" element
    And I click on the "Submit" "BPP Digital Admin Value attribute button"
    And I wait for "3" seconds
    When I select "In review" from "Direct App Admin Force Change Status Dropdown" element
    And I click on the "Change" "button"
    And I set "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINPASSWORD" text to the "Password" "Build Empire text field"
    And I click on the "OK" "button"
    And I wait for "3" seconds
    #Verification for BPP-17339
    Given I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/mobile_applications" URL
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I select "AAT - Level 2 - Certificate in Accounting (AQ2016) - Bookkeeping Transactions - February 2021 to February 2021" from "Totara course " "BPP Digital dropdown"
    And I select "AAT - Level 2 - Certificate in Accounting (AQ2016) - Elements of Costing - February 2022" from "Totara course " "BPP Digital dropdown"
    And I select "AAT - Level 2 - Certificate in Accounting (AQ2016) - Level 2 Foundation Certificate Synoptic - February 2022" from "Totara course " "BPP Digital dropdown"
    And I select "AAT - Level 3 - Diploma in Accounting (AQ2016) - Advanced Bookkeeping - December 2020" from "Totara course " "BPP Digital dropdown"
    And I select "AAT - Level 3 - Diploma in Accounting (AQ2016) - Advanced Bookkeeping - February 2022" from "Totara course " "BPP Digital dropdown"
    And I select "AAT - Level 4 - Diploma in Accounting Mandatory (AQ2016) - Management Accounting Decision &amp; Control - February 2021" from "Totara course " "BPP Digital dropdown"
    And I select "Liam's Mini Course for Volodymyr" from "Totara course " "BPP Digital dropdown"