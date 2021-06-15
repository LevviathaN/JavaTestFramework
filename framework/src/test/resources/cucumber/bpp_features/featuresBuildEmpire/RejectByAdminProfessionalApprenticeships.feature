@BuildEmpire @DirectApps @ProfessionalApprenticeships
Feature: Reject Professional Apprenticeship Applications

  @Negative @RejectByAdmin #TC-1023, TC-1573
  Scenario: Reject Professional Apprenticeship By Admin
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "AutoLuisaMercado5287@harakirimail.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    Then I wait for "3" seconds
    When I execute "Create Professional Apprenticeships Application Chartered Manager" reusable step replacing some steps
      | 2 | I click on the "Direct App Start New Application Button" button |
    Given I execute "Complete Professional Apprenticeships Application Chartered Manager Existing Student" reusable step replacing some steps
    |20|I click on the "I am a school / college leaver (This is my first professional role)" "Build Empire nationality option"|
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Reject University Degree Apprenticeships As Admin" reusable step replacing some steps
    |4|I fill the "Direct App Admin Filter By User" field with "AutoLuisaMercado5287@harakirimail.com"|
    #Validate employment status
    And I validate text "CONTAINS=I am a school / college leaver (This is my first professional role)" to be displayed for "Direct App Admin Employment Status Additional Answer" element
    Then I should scroll to the "top" of the page
    And I validate text "CONTAINS=SL" to be displayed for "Direct App Admin Employment Status for Apprenticeships" element
    Then I click on the "BPP Digital Admin Edit Application" button
    And I fill the "BPP Digital Overwritten Start Date" field with "2021/10/10 12:00"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Overwritten Start Date"
    And I fill the "BPP Digital Overwritten End Date" field with "2022/11/01 12:10"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Overwritten End Date"
    And I click on the "BPP Digital Admin Edit Application Save" element
    And I validate text "CONTAINS=Overwritten" to be displayed for "Direct App Admin Start Date for Apprenticeships" element
    And I validate text "CONTAINS=Overwritten" to be displayed for "Direct App Admin End Date for Apprenticeships" element
    And I execute "Log Out from Hub Admin" reusable step
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "AutoLuisaMercado5287@harakirimail.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    And I click on the "Direct App My Applications Left Menu Link" link by JS
    And I wait for "2" seconds
    Then I validate text "CONTAINS=Unfortunately," to be displayed for "Direct App Validate As Student Application Accepted" element