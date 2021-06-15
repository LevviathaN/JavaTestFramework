@BuildEmpire @DirectApps @Timestamp
Feature: As an admin, viewing my downloads in the admin area,
  I expect to see a timestamp of when document was generated

  Scenario: As an Admin, I Expect to See a Timestamp of When Document Was Generated
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "AutoShaunReid3104@harakirimail.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    And I wait for "5" seconds
    And I click on the "Direct App My Applications Left Menu Link" link by JS
    When I execute "Create Academic Appeals Application" reusable step replacing some steps
      | 1 | I click on the "Direct App Start New Application Button" button |
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Direct App Final Award In Relation To Programme" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
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
    Then I upload "directApp.pdf" file to "Direct App Upload File" element
    And I fill the "Direct App Uploaded File Description" field with "Test"
    And I fill the "Direct App Details Text Area  Line Manager" field with "Automation Testing"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save And Return" button
    Then I execute "Submit Application Hub" reusable step
    Then I validate text "CONTAINS=100" to be displayed for "Direct App Application Progress Percentage" element
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Accept Academic Appeals As Admin" reusable step replacing some steps
    |4|I fill the "Direct App Admin Filter By User" field with "AutoShaunReid3104@harakirimail.com"|
    Then I validate text "CONTAINS=Accepted" to be displayed for "Direct App Admin Status Changed for Academic Appeals" element
    Then I click on the "Direct App Admin Download Menu" button
    And I click on the "Direct App Admin Download Menu Salesforce CSV" button
    And I fill the "Direct App Admin Application Page Password Field" field with "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINPASSWORD"
    And I click on the "OK" "button"
    Then I should scroll to the "top" of the page
    Given I click on the "Direct App User Icon Menu Admin" button by JS
    And I click on the "Downloads" "link"
    Then I should see the "Direct App Admin Downloads Type" element
    Then I validate text "RE=\d{2}\s\w{3}\s\d{2}.\d{2}" to be displayed for "Direct App Admin Downloads Generated At" element


