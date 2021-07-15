@BuildEmpire @DirectApps @ProfessionalApprenticeships @Smoke
Feature: Submit Professional Apprenticeship Applications With New Line Manager

  Background:
    Given I register new Hub account using API
    Then I execute "Harakirimail Verify Email" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    And I wait for "2" seconds

  @Positive @CreateLineManager @UATAccounting #TC-1025 #TC-1021 #TC-1022
  Scenario: Professional Apprenticeships Create And Attach Line Manager
    When I execute "Create Professional Apprenticeships Application UAT Accounting Option Two" reusable step
    Given I execute "Complete Professional Apprenticeships UAT Accounting Assistant" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Pre Approve Apprenticeships Application As Admin" reusable step
    And I execute "Create Automation Line Manager" reusable step
    #Validate employment status
    Then I should scroll to the "top" of the page
    And I validate text "CONTAINS=>2 YEARS" to be displayed for "Direct App Admin Employment Status for Apprenticeships" element
    And I execute "Log Out from Hub Admin" reusable step
    And I execute "Nada Reset Line Manager Password" reusable step
    And I execute "Reset Line Manager Password" reusable step
    Given I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And I set "EC_LINEMANAGER_EMAIL" text to the "Email" "Build Empire text field"
    And I set "Welcome2@#!Welc" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button
    And I should see the "Direct App My Approvals Tab" element
    Given I click on the "Direct App My Approvals Tab" link by JS
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Review Application" button
    And I click on the "Line Manager Review" "Build Empire application section"
    Then I fill the "Direct App Line Manager End Point Assessment" field with "Automation"
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Agree To Support Amount" element
    And I click on the "Direct App Line Manager New Role" button
    Then I fill the "Direct App Details Text Area  Line Manager" field with "Automation"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Next" button
    And I click on the "Direct App Line Manager Review Health And Safety Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I wait for "3" seconds
    Then Browser performs "REFRESH" command
    And I wait for "5" seconds
    Given I click on the "Direct App My Approvals Tab" link by JS
    Then I click on the "Direct App PopUp Continue Button For Incomplete Documents" element
    And I wait for "5" seconds
    Then I execute "window.stop();" JS code
    And I click on the "Download Application of" "Build Empire application section"
    Then I switch to window with index "2"
    Then I upload "application_pack_document.pdf" file to "Direct App Apprenticeships Upload Documents" element
    Then I upload "application_pack_document.pdf" file to "Direct App Upload Job Role Documents" element
    And I wait for "2" seconds
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I click on the "Submit Approval" "button"
    And I click on the "OK" "button"
    And I execute "Log Out from Hub Student" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    And I execute "Complete Professional Apprenticeships Application After Review" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Accept Application As Admin" reusable step
    And I execute "Log Out from Hub Admin" reusable step
    And I execute "Log In to Hub as Student" reusable step
    And I execute "Validate Successful Application As Student" reusable step
    And I execute "Log Out from Hub Student" reusable step