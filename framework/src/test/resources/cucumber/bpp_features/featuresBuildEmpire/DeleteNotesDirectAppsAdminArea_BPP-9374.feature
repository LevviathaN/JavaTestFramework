@DirectApps
Feature: As a user with permission to access/edit an application in the admin area,
  I expect to be able to delete any notes that were created in association with an application.

  @DeleteNotes #TC-5199
  Scenario: Ability to Delete Notes for Direct Apps in Admin Area
    Given I register new Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    And I wait for "2" seconds
    When I execute "Create Professional Apprenticeships Application UAT Accounting Option Two" reusable step
    Given I execute "Complete Professional Apprenticeships UAT Accounting Assistant" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Given I click on the "Direct App Admin Apprenticeships Tab" link by JS
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I click on the "Add note" "BPP Digital Button"
    And I fill the "Direct App Admin Note Message" field with "Automation Note"
    Then I click on the "Add" "BPP Digital Button"
    And I wait for "1" seconds
    Then I should see the "Automation Note" "element"
    And I click on the "Delete note" "text contained in A element"
    Then I validate text "CONTAINS=Direct Application Note was successfully removed." to be displayed for "Direct App Admin Area Notification Message" element
    Then I shouldn't see the "Automation Note" "element"
