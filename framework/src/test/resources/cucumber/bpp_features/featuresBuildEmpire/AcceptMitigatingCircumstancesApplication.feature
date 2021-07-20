@BuildEmpire @DirectApps @MitigatingCircumstances
Feature: Accept Mitigating Circumstances Application

  @PositiveEmails  @Smoke #TC-1266 #TC-1257 #TC-1264
  Scenario: Mitigating Circumstances Send Emails to Students
    Given I register new Hub account using API
    Then I execute "Harakirimail Verify Email" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    And I wait for "2" seconds
    When I execute "Create Mitigating Circumstances Application" reusable step
    And I execute "Complete Mitigating Circumstances" reusable step
    Then I execute "Submit Application Hub" reusable step
     #Validate assessment details not populated from previous application
    Then I click on the "Direct App My Applications Left Menu Link" button by JS
    And I click on the "Direct App Start New Application Button" button
    Given I click on the "Direct App My Applications Left Menu Link" button by JS
    And I hover over the "Direct App What Are You Applying For Dropdown" button
    And I click on the "Direct App What Are You Applying For Dropdown" element
    Then I wait for "1" seconds
    Then I click on the "BPP University Mitigating Circumstances" "Build Empire application type"
    And I wait for "1" seconds
    And I click on the "Direct App Create Application" button
    Then I wait for "1" seconds
    Given I click on the "Direct App Start Application" button
    And I click on the "Assessment details" "Build Empire application section"
    And I wait for "1" seconds
    And I shouldn't see the "AutoTitle" "element"
    And I shouldn't see the "Written Exam" "element"
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Mitigating Circumstances Admin Status Change" reusable step
    And I execute "Mitigating Circumstances Admin Status Validation" reusable step
    And I execute "Maildrop Mitigating Circustances Status Validations" reusable step