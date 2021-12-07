@BuildEmpire @DirectApps @ChannelIslands @Smoke
Feature: Approve Channel Islands Application

  @Positive @Smoke @ApproveApplicationPage #TC-1268 TC-1269
  Scenario: Approve Channel Islands Application as Training Manager
    Given I register new "Channel" Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    And I wait for "2" seconds
    When I execute "Create Channel Islands Mk2 Application" reusable step
    And I execute "Complete Channel Islands Mk2 Application" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    Then I execute "Guerillamail Reset Line Manager Password" reusable step
    Then I execute "Reset Line Manager Password" reusable step
    Given I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And I set "EC_LINEMANAGER_EMAIL" text to the "Email" "Build Empire text field"
    And I set "Welcome2@#!Welc" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button
    And I should see the "Direct App My Approvals Tab" element
    Then I execute "Approve Channel Isalnds Application as Training Manager" reusable step
    And I click on the "Direct App Channel Islands Training Manager OK" button
    And I wait for "10" seconds
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Nada Validate Accepted Application Email" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    And I wait for "2" seconds
    Given I click on the "Direct App My Applications Left Menu Link" button by JS
    And I wait for "3" seconds
    Then I click on the "Direct App Start New Application Button" button
    And I wait for "2" seconds
    And I click on the "Direct App Create Application" button
    Given I click on the "Direct App Start Application" button
    And I click on the " Personal details" "Build Empire application section"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Payment Employer Funded" button
    And I wait for "2" seconds
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "1" seconds
    And I click on the "Direct App Save And Return" button
    And I wait for "1" seconds
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I wait for "2" seconds
    Then I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "EC_LINEMANAGER_EMAIL" text to the "Email" "Build Empire text field" |
      | 3 | I set "Welcome2@#!Welc" text to the "Password" "Build Empire text field"               |
    And I should see the "Direct App My Approvals Tab" element
    And I click on the "Direct App My Approvals Tab" button by JS
    And I click on the "Direct App Channel Islands Training Manager Review Application Details" button
    And I click on the "Approve" "button"
    And I fill the "Direct App Channel Islands Training Manager Reason" field with "Automation Testing"
    And I click on the "Direct App Channel Islands Training Manager OK" button
    And I wait for "1" seconds
    And I execute "Nada Validate Accepted Application Email" reusable step