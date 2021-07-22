@BuildEmpire @Hub @KeyActivities @Totara
Feature: Validate Key Activity Without Completion Settings On Topic Overview Page - BPP-6382
  As a user in the Hub,
  when a Key Activity, has been set without any completion settings,
  then I expect this to be reflected in the Topic Overview page within the Hub

  @Positive @NoCompletion #TC-2827, BPP-7057
  Scenario: Validate Key Activity Without Completion Settings On Topic Overview Page
    When I register new Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    Then I shouldn't see the "My Learning" "Build Empire Navigation Menu elements"
    When I execute "Log Out from Hub Student" reusable step
    And I execute "Logout Totara Workaround" reusable step
    Then I execute "Login as Admin Totara" reusable step
    When I click on the "Totara Volodymyr Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Enrol User button" button by JS
    And I set "EC_AUTO_EMAIL" text to the element with ID "enrolusersearch" using JS
    And I click on the "Totara Enrol User Search button" button by JS
    And I click on the "Totara Enrol Button" button by JS
    And I click on the "Totara Finish Enroling Users button" button by JS
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I execute "Log In to Hub as Student" reusable step
    And I click on the "Mini Course for Volodymyr" "Build Empire Homepage My Learning Course"
    And I click on the "Topic 3" "Build Empire Course Topic"
    And I shouldn't see the "Direct App Course Topic Key Activity Completion Settings" element
    Then I should see the "Hub Topic Three Test External Tool Inactive" element
    And I validate text "CONTAINS=Available until end of" to be displayed for "Hub Topic Three Test External Tool Info Restriction" element
