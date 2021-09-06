@Salesforce @CSA @Cases
Feature: CSA Workflow Alerts
  As a Salesforce CSA member:

  @EndToEnd #TC-804 TC-805 TC-1418 TC-1419
  Scenario: CSA Workflow Alerts End To End
    Given I execute "Log In To Salesforce" reusable step
    And I execute "Create CSA Case My Course" reusable step
    And I execute "Log Out Salesforce" reusable step
    And I wait for "3" seconds
    Given I am on "https://harakirimail.com/" URL
    And I fill the "Harakirimail Inbox Name" field with "casemail777@harakirimail.com"
    Then I click on the "Harakirimail Get Inbox" button
    Then I click on the "Harakirimail First Email" element by JS
    Then I execute "document.getElementsByClassName('adsbygoogle adsbygoogle-noablate')[2].remove();" JS code if "Harakirimail Adds Banner" "element is present"
    And I wait for "3" seconds
    Then Browser performs "REFRESH" command
    And I wait for "3" seconds
    Then I click on the "Harakirimail First Email" element if "Harakirimail First Email" "element is present"
    And I validate text "CONTAINS=New case created." to be displayed for "Harakirimail Validate Letter Body" element
    And I wait for "3" seconds
    Given I am on "MD_COMMON_LINKS_SALESFORCEURL" URL
    Then I fill the "Salesforce Username" field with "MD_COMMON_CREDENTIALS_BPPADMINUSER"
    And I fill the "Salesforce Password" field with "MD_COMMON_CREDENTIALS_BPPADMINPASSWORD"
    And I click on the "Salesforce Login" button
    And I execute "Search Case by Number" reusable step
    And I should scroll to the "top" of the page
    Then I click on the "Salesforce Edit Case Status" button by JS
    And I click on the "Salesforce Case Status Dropdown" element
    And I click on the "Ready to Close" "Salesforce cases status option"
    And I click on the "Salesforce Save Account Button" button
    And I wait for "2" seconds
    And I execute "Log Out Salesforce" reusable step
    And I wait for "1" seconds
    Given I am on "https://harakirimail.com/" URL
    And I fill the "Harakirimail Inbox Name" field with "casemail777@harakirimail.com"
    Then I click on the "Harakirimail Get Inbox" button
    Then I click on the "Harakirimail First Email" element
    And I validate text "CONTAINS=Case ready to be closed." to be displayed for "Harakirimail Validate Letter Body" element