@ProductFactory @Courses @HappyPath
Feature: Create Course Instance - BPP-429
  As a Product Setter
  I need to be able to create a Course based on the Reference Data
  so that I can sell, schedule and publish a Course.

  Background:
    Given I execute "Generate ISBN" reusable step
    Given I execute "Log In" reusable step
    And I execute "Remember Variables For Creation " reusable step

  @Positive @P1 @PartiallyCoveredWithApi @NeedToBeUI #TC-696, TC-2793, TC-2794, TC-2769, TC-2382, TC-2402, TC-2403
  Scenario: Create Course Instance
    Given I execute modified "Create Course" reusable step
      |13|Add|I click on the "Finish" "Product Factory button"|
      |14|Add|I should see the "Number of Sessions must be Greater than 0" message|
      |20|Add|I validate text "1" to be displayed for "Product Factory Course Creation Wizard Number of Sessions" element|
    Then I execute "Create Course Instance" reusable step
    And I execute "Populate Course Instance Session Dates" reusable step
    And I execute "Populate Course Instance Step Due Dates" reusable step
    Then I click on the "Activate" "Product Factory button"
    And I should see the "Deactivate" "Product Factory button"
    And I click on the "EC_LOCATION_NAME" "Product Factory course instance Activate button"
    And I shouldn't see the "EC_LOCATION_NAME" "Product Factory course instance Delete button"