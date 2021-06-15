@BuildEmpire @DirectApps @MitigatingCircumstances1
Feature: Mitigating Circumstances Application in Review

  @Negative #TC-1265 BPP-11602
  Scenario: Mitigating Circumstances Application in Review
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "autojustusursula4545@getnada.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    And I wait for "5" seconds
    And I click on the "Direct App My Applications Left Menu Link" link by JS
    When I execute "Create Mitigating Circumstances Application" reusable step replacing some steps
      | 1 | I click on the "Direct App Start New Application Button" button |
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Direct App Final Award In Relation To Programme" button
    And I click on the "Direct App Ten Working Days To Submit Application Yes" button
    And I wait for "1" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "1" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    Then I wait for "1" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Add Assesment" button
    And I fill the "Direct App Assesment Title" field with "AutoTitle"
    And I click on the "Direct App Assesment Type" button
    And I click on the "Direct App Assesment Exam Type Option" button
    And I click on the "Direct App Assesment Attempt Number" button
    And I click on the "Direct App Assesment Attempt Number Option Two" button
    And I click on the "Direct App Sit Assesment Yes" button
    And I fill the "Direct App Assesment Date" field with "12/12/2020"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Assesment Date"
    And I click on the "Direct App Mitigating Checkbox If Application Is Successful" button
    And I fill the "Direct App Assesment Examination Venue" field with "Venue"
    And I click on the "Direct App Did You Apply For Deferral" button
    Then I click on the "Direct App Sit Assessment No" element
    And I shouldn't see the "Direct App Mitigating Checkbox If Application Is Successful" "element"
    And I click on the "Direct App Assesment Type" button
    And I click on the "Direct App Assessment Coursebook Type Option" button
    And I fill the "Direct App Assessment Handout Date" field with "12/12/2020"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Assessment Handout Date"
    And I should see the "Direct App Assessment Not Submitted Coursebook Please Note Message" element
    Then I validate text "CONTAINS=As you have not submitted your coursework(s), the sit(s) will be disregarded from your record and, if eligible" to be displayed for "Direct App Assessment Not Submitted Coursebook Please Note Message" element
    And I click on the "Direct App Submit Coursebook Yes" button
    Then I validate text "CONTAINS=PLEASE NOTE: If the application is granted" to be displayed for "Direct App Assessment Not Submitted Coursebook Please Note Message" element
    And I click on the "I confirm that I wish to have the assessment listed disregarded" "Build Empire radiobutton" by JS
    And I click on the "Direct App Add Filled Assesment" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "1" seconds
    And I click on the "Direct App Next" button
    Then I upload "directApp.pdf" file to "Direct App Upload File" element
    And I fill the "Direct App Uploaded File Description" field with "Test"
    And I fill the "Direct App Details Text Area  Line Manager" field with "Automation Testing"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "1" seconds
    And I click on the "Direct App Save And Return" button
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Reject Mitigating Circumstances As Admin" reusable step replacing some steps
      |5|I fill the "Direct App Admin Filter By User" field with "autojustusursula4545@getnada.com"|
    And I execute "Log Out from Hub Admin" reusable step
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "autojustusursula4545@getnada.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    Given I click on the "Direct App My Applications Left Menu Link" button by JS
    And I wait for "3" seconds
    Then I validate text "CONTAINS=Unfortunately, your application wasn't successful this time" to be displayed for "Direct App Validate As Student Application Accepted" element
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Put in Review Mitigating Circumstances" reusable step replacing some steps
    |5|I fill the "Direct App Admin Filter By User" field with "autojustusursula4545@getnada.com"|