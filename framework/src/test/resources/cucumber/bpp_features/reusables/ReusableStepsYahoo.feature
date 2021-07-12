@Reusable
Feature: Yahoo

  Scenario: Login To Yahoo
    Given I am on "MD_COMMON_LINKS_YAHOOMAILURL" URL
    And I fill the "Yahoo Email" field with "MD_COMMON_CREDENTIALS_YAHOOEMAILCSAUSER"
    And I click on the "Yahoo Next" button by JS
    And I fill the "Yahoo Password" field with "MD_COMMON_CREDENTIALS_YAHOOEMAILCSAPASSWORD"
    And I click on the "Yahoo Sign In" button by JS