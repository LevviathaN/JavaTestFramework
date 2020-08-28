@ProductFactory @SessionDurations
Feature: Reference Data - Create Session Duration - BPP-1316
  As a Senior Product Setter
  I want to be able create Session Duration data
  so that a Course Instance can be created using this Session.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 #TC-811
  Scenario: Add a New Session Duration Using a Modal
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Session Durations" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "SessionDurationDescription[######]" text to the "Description" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_SESSION_DURATION_DESCRIPTION" element

  @Negative @P2 #TC-812
  Scenario: Add Session Duration where Description Already Exists
    When I execute "Create Session Duration" reusable step
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Session Durations" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "EC_SESSION_DURATION_DESCRIPTION" text to the "Description" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "Description must be unique" "message"