@BuildEmpire @Hub @BulkEditDeadlines @Totara
Feature: As a Totara admin, I expect to be able to bulk edit deadlines in courses
  within the course administration

  @Totara #TC-2525
    #Currently without checking data on end user site as we wait for a new course setup for automation team
  Scenario: As a Totara admin, I expect to be able to bulk edit deadlines in courses within the course administration
    And I execute "Login as Admin Totara" reusable step
    Then I click on the "Totara Automation Course" button by JS
    And I click on the "Totara Bulk Update Administration Link" link by JS
    Then I validate text "Due Date" to be displayed for "Totara Bulk Update Due Date Column Name" element
    Then I validate text "Expected Completion" to be displayed for "Totara Bulk Update Expected Completion Column Name" element
    Then I execute "window.stop()" JS code
    And I should scroll to the "bottom" of the page
    Then I click on the "Totara Bulk Update Basic Assignment Two Edit" button by JS
    Then I execute "window.stop()" JS code
    And I should see the "Totara Bulk Update Available From" element
    And I should see the "Totara Bulk Update Due Date" element
    And I should see the "Totara Bulk Update Expected Completed" element
    #Then I click on the "Totara Bulk Due Date Enable Checkbox" element by JS
    And I select "KW_AUTO_SELECT" from "Totara Bulk Expected Completed Day" element
    And I select "KW_AUTO_SELECT" from "Totara Bulk Expected Completed Hour" element
    And I click on the "Totara Save On Update Page" button by JS
    And I click on the "Totara Continue" button by JS
    And I validate text "CONTAINS=May" to be displayed for "Totara Bulk Update Basic Assignment Two Completed Date" element