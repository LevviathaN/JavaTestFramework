@BuildEmpire @DirectApps @Bespoke
Feature: Submit Bespoke Applications

  Background:
    Given I execute "Register New Student Account" reusable step replacing some steps
    |1|I am on "MD_COMMON_LINKS_BUILDEMPIREBESPOKEURL" URL|

  @BespokeScotland #TC-2433 #TC-2434 #TC-2435 #TC-2436 #TC-2437 #TC-2432
  Scenario: Submit Bespoke Scotland Application
    Then I execute "Harakirimail Verify Email" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    When I execute "Create Bespoke Scotland Application" reusable step
    Given I execute "Complete Bespoke Scotland Application" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Pre Approve Apprenticeships Application As Admin" reusable step
    And I execute "Attach Automation Line Manager" reusable step
    And I execute "Log Out from Hub Admin" reusable step
    Given I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And I set "idlgfcvgdh@harakirimail.com" text to the "Email" "Build Empire text field"
    And I set "qwerty azerty1!" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button
    And I should see the "Direct App My Applications Left Menu Link" element
    Then I execute "Line Manager Review Bespoke Scotland" reusable step
    And I execute "Log Out from Hub Student" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    And I execute "Complete Bespoke Sctotland Application After Review" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Accept Application As Admin" reusable step
    And I execute "Log Out from Hub Admin" reusable step
    And I execute "Log In to Hub as Student" reusable step
    And I execute "Validate Successful Application As Student" reusable step

  @England @Smoke #TC-1202 TC-1204 TC-1217 TC-1218 TC-1219, TC-5200
  Scenario: Submit Bespoke England Application
    Then I execute "Harakirimail Verify Email" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    When I execute "Create Bespoke England Application" reusable step
    Given I execute "Complete Bespoke England Application" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Pre Approve Apprenticeships Application As Admin" reusable step
    And I execute "Attach Automation Line Manager" reusable step
    And I execute "Log Out from Hub Admin" reusable step
    Given I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And I set "idlgfcvgdh@harakirimail.com" text to the "Email" "Build Empire text field"
    And I set "qwerty azerty1!" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button
    And I should see the "Direct App My Applications Left Menu Link" element
    Then I execute "Line Manager Review Bespoke England" reusable step
    And I execute "Log Out from Hub Student" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    And I execute "Complete Apprenticeships Application After Review" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Accept Application As Admin" reusable step
    And I execute "Log Out from Hub Admin" reusable step
    And I execute "Log In to Hub as Student" reusable step
    And I execute "Validate Successful Application As Student" reusable step