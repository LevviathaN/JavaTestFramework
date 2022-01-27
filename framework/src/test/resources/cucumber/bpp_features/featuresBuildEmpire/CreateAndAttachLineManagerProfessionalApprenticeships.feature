@BuildEmpire @DirectApps @ProfessionalApprenticeships @Smoke
Feature: Submit Professional Apprenticeship Applications With New Line Manager

  Background:
    Given I register new "Standard" Hub account using API
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
    And I wait for "60" seconds
    Given I am on "https://www.guerrillamail.com/" URL
    And I wait for "2" seconds
    And I select "guerrillamail.com" from "Guerilla Mail Select Domain" element
    Then I click on the "Guerilla Edit" button
    And I fill the "Guerilla Email Input" field with "EC_LINEMANAGER_EMAIL"
    Then I click on the "Guerilla Email Set" button
    And I wait for "11" seconds
    And Browser performs "Refresh" command
    And I wait for "11" seconds
    And I select "guerrillamail.com" from "Guerilla Mail Select Domain" element
    And I wait for "1" seconds
    Then I click on the "Guerilla BPP Email" element by JS
    Then I capture a part of "Guerilla New Line Manager Email" element text by "https:\/\/bpp-stage.eu.auth0.com\/lo\/reset.+[aA-zZ0-9]\#" regex and save as "EC_RESET_PASSWORD" variable
    And I validate text "CONTAINS=We have received an apprenticeship application from an employee at your organisation" to be displayed for "Guerilla New Line Manager Email" element
    And I validate text "CONTAINS=As named line manager you are required to review their application and decide whether you would like us to proceed." to be displayed for "Guerilla New Line Manager Email" element
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
    Then Browser performs "REFRESH" command
    And I wait for "2" seconds
    And I click on the "Download Application of" "Build Empire application section"
    Then I switch to window with index "1"
    Then I upload "application_pack_document.pdf" file to "Direct App Apprenticeships Upload Documents" element
    Then I upload "application_pack_document.pdf" file to "Direct App Upload Job Role Documents" element
    And I wait for "2" seconds
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I click on the "Submit Approval" "button"
    And I click on the "OK" "button"
    And I execute "Log Out from Hub Student" reusable step