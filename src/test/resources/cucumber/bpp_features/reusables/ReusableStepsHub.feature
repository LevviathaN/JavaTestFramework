@Reusable
Feature: Hub, Totara

  Scenario: Login as Admin Totara
    Given I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I fill the "Salesforce Username" field with "MD_COMMON_CREDENTIALS_TOTARAADMINUSER"
    And I fill the "Salesforce Password" field with "MD_COMMON_CREDENTIALS_TOTARAADMINPASSWORD"
    Then I click on the "Totara Login" button by JS

  Scenario: Logout as Admin Totara
    Then I click on the "Totara Account Expandable Menu" element by JS
    Then I click on the "Totara Logout Link" button by JS
    And I wait for "2" seconds
    And I execute "document.getElementsByClassName('logininfo')[0].innerText;" JS code for "Totara Logout Message" element
