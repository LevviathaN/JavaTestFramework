@BuildEmpire @DirectApps @UniversityDegreeApprenticeships
Feature: Line Manager has an Ability to Delete Documents that was Uploaded by Mistake

  @Positive @BPP-2542 #TC-3632
  Scenario: Line Manager has an Ability to Delete Documents that were Uploaded by Mistake
    Given I register new Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    And I wait for "2" seconds
    When I execute "Create University Degree Apprenticeships Application" reusable step
    And I execute "Complete University Degree Apprenticeships Application Chartered Manager" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Pre Approve Apprenticeships Application As Admin" reusable step
    And I execute "Attach Automation Line Manager Apprenticeships" reusable step replacing some steps
      | 4 | I fill the "Direct App Admin Attach Line Manger Text Field" field with "automationLinemanager8@harakirimail.com" |
      | 5 | I click on the "Automation8 Linemanager8" "Build Empire line manager option"                                     |
    And I execute "Log Out from Hub Admin" reusable step
    Given I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And I set "automationLinemanager8@harakirimail.com" text to the "Email" "Build Empire text field"
    And I set "Line Manager008!" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button
    Given I click on the "Direct App My Approvals Tab" link by JS
    And I click on the "Direct App Line Manager Review Application" button
    And I click on the "Line Manager Review" "Build Empire application section"
    Then I fill the "Direct App Details Text Area  Line Manager" field with "Automation"
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Agree To Support Amount" element
    And I click on the "Direct App Line Manager New Role" button
    Then I click on the "I confirm that my organisation employs fewer than 50 people" "Build Empire checkbox"
    Then I click on the "I confirm that I understand it is my requirement to reserve" "Build Empire checkbox"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I wait for "1" seconds
    And Browser performs "Refresh" command
    And I click on the "Application documents" "Build Empire application section"
    And I click on the "Download Application of" "Build Empire application section"
    Then I switch to window with index "1"
    Then I upload "application_pack_document.pdf" file to "Direct App Apprenticeships Upload Documents" element
    Then I upload "application_pack_document.pdf" file to "Direct App Upload Job Role Documents" element
    And I wait for "3" seconds
    Then I should see the "Application pack" "Build Empire Downloaded Application Documents Title name"
    Then I should see the "Application of Learning Agreement" "Build Empire Downloaded Application Documents Title name"
    And I click on the "Direct App Remove Application Pack" button by JS
    And I click on the "Application of Learning Agreement" "Build Empire Delete Downloaded Application Document Title by name"
    And I wait for "3" seconds
    Then I shouldn't see the "Application pack" "Build Empire Downloaded Application Documents Title name"
    Then I shouldn't see the "Application of Learning Agreement" "Build Empire Downloaded Application Documents Title name"