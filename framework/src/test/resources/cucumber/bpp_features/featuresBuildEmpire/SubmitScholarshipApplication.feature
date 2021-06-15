@BuildEmpire @DirectApps @Scholarship
Feature: Complete BPP University Scholarship Application

  @Positive @Smoke #TC-1247
  Scenario: Complete Scholarship Application
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "AutoLanceAbbigail5223@harakirimail.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    And I wait for "5" seconds
    And I click on the "Direct App My Applications Left Menu Link" link by JS
    When I execute "Create Scholarships Application" reusable step replacing some steps
      | 1 | I click on the "Direct App Start New Application Button" button |
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Diret App Do You Meet Eligilibility Criteria Yes" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save And Return" button
    Then I execute "Submit Application Hub" reusable step
    Then I validate text "CONTAINS=100" to be displayed for "Direct App Application Progress Percentage" element
    And I execute "Log Out from Hub Student" reusable step