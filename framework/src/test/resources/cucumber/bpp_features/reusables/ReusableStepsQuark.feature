@Reusable
Feature: Quark

  Scenario: Quark New Platform Login
    Given I am on "MD_COMMON_LINKS_QUARKURL" URL
    And I fill the "Quark Username" field with "MD_COMMON_CREDENTIALS_QUARKUSER"
    And I fill the "Direct App Admin Password" field with "MD_COMMON_CREDENTIALS_QUARKPASSWORD"
    Then I click on the "Single Sign-On" "button"
    And I fill the "Quark Microsoft Username" field with "MD_COMMON_CREDENTIALS_QUARKUSER"
    Then I click on the "submit" "element by type"
    Then I set "MD_COMMON_CREDENTIALS_QUARKPASSWORD" text to the "password" "element by type"
    Then I click on the "submit" "element by type"
    Then I click on the "Yes" "element by value"
    And I wait for "3" seconds
    Then I should see the "Quark Publishing Logo" element