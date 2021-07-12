@Reusable
Feature: Banner

  Scenario: Log In To Banner
    Given I am on "MD_COMMON_LINKS_BPPBANNERURL" URL
    And I click on the "Banner Application Navigator" link
    And I fill the "Banner Username" field with "MD_COMMON_CREDENTIALS_BPPBANNERUSER"
    And I fill the "Banner Password" field with "MD_COMMON_CREDENTIALS_BPPBANNERPASSWORD"
    Then I click on the "Banner Login" button
    Then I should see the "Banner User Menu Icon" element

  Scenario: Navigate To Form
    When I fill the "Banner Go To Form" field with "SAADCRV"
    Then I press "MD_COMMON_KEYBOARD_ENTER" for "Banner Go To Form"
    And I wait for "7" seconds
