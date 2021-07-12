@Reusable
Feature: Hub, Totara

  Scenario: Login as Admin Totara
    Given I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    Then I click on the "Totara Login" button by JS
    And I fill the "Direct App Admin Email" field with "MD_COMMON_CREDENTIALS_TOTARAADMINUSER"
    And I fill the "Direct App Admin Password" field with "MD_COMMON_CREDENTIALS_TOTARAADMINPASSWORD"
    Then I click on the "Direct App Login Button" button by JS

  Scenario: Logout as Admin Totara
    Then I click on the "Totara Account Expandable Menu" element by JS
    Then I click on the "Totara Logout Link" button by JS
    And I wait for "3" seconds
#    And I execute "document.getElementsByClassName('logininfo')[0].innerText;" JS code

  Scenario: Enrol Student to ICAEW Course
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Enrol User button" button by JS
    And I set "EC_AUTO_EMAIL" text to the element with ID "enrolusersearch" using JS
    And I click on the "Totara Enrol User Search button" button by JS
    And I click on the "Totara Enrol Button" button by JS
    And I click on the "Totara Finish Enroling Users button" button by JS

  Scenario: Logout Totara Workaround
    Given I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    Then I click on the "Totara Account Expandable Menu" element with JS if "Totara Account Expandable Menu" "element is present"
    Then I click on the "Totara Logout Link" element with JS if "Totara Logout Link" "element is present"
    And I wait for "3" seconds