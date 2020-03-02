@DigitalSite
Feature: BPP Digital Update EPA gateway time

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive #TC-1823
  Scenario: Update EPA gateway time
    When I execute "Admin Hub Navigate to Applications list" reusable step
    And I click on the "Direct App Admin Apprenticeships Tab" link by JS
    And I fill the "Direct App Admin Filter By User" field with "AutomationEPAUser@harakirimail.com"
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
    Then I validate text "CONTAINS=7 weeks" to be displayed for "BPP Digital Validate Note Message" element
    Then I validate text "NOT_CONTAINS=EC_JOB_TRAINING_HOURS" to be displayed for "BPP Digital Overall Off the Job Training Hours" element
    And I should scroll to the "top" of the page
    And I click on the "Application BPP Professional Apprenticeships" "BPP Digital Admin Applications Edit button"
    And I wait for "3" seconds
    When I fill the "BPP Digital Admin Overwritten EPA gateway time input field" field with "4"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I validate text "CONTAINS=EC_DATE_TODAY" to be displayed for "BPP Digital Validate Note Date" element
    Then I validate text "CONTAINS=4 weeks" to be displayed for "BPP Digital Validate Note Message" element
    Then I validate text "CONTAINS=EC_JOB_TRAINING_HOURS" to be displayed for "BPP Digital Overall Off the Job Training Hours" element
    And I click on the "Submit" "BPP Digital Admin Value attribute button"
    And I wait for "3" seconds
    When I select "In review" from "Direct App Admin Force Change Status Dropdown" element
    And I click on the "Change" "button"
    And I set "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINPASSWORD" text to the "Password" "Build Empire text field"
    And I click on the "OK" "button"