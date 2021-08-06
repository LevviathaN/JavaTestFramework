@DigitalSite @BuildEmpire
Feature: BPP Digital Changing Student Personal Password

  Background:
    Given I register new Hub account using API
    Then I execute "Log In to Hub as Student" reusable step

  @Positive @ChangePassword @Smoke #TC-3626
  Scenario: Changing Student Personal Password
    When I execute "Edit Hub Student" reusable step
    Then I click on the "Change My Password" "BPP Digital Profile button"
    When I set "EC_PASSWORD" text to the "Current password" "Build Empire text field"
    And I remember "Welcome1!@bppauto" text as "EC_NEW_PASSWORD" variable
    And I set "EC_NEW_PASSWORD" text to the "New password" "Build Empire text field"
    And I set "EC_NEW_PASSWORD" text to the "Confirm new password" "Build Empire text field"
    And I click on the "Update" button
    Then I click on the "OK" button
    When I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Student" reusable step replacing some steps
      |3|I set "EC_NEW_PASSWORD" text to the "Password" "Build Empire text field"|