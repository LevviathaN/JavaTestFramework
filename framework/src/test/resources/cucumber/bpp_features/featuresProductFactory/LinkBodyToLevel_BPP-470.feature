@ProductFactory @Bodies @LinkBodyToLevel
Feature: Reference Data - Link Body to Level - BPP-470
  As a Senior Product Setter
  I need to be able to specify which Levels are linked to a Body.
  (Relate Body to Level through "Allowed Level" relationship)

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoVerticalName" text as "EC_VERTICAL_NAME" variable
    And I remember "AutoBodyFDCode" text as "EC_BODY_FD_CODE" variable
    And I execute "Create Body" reusable step
    Then I execute "Create Level" reusable step

  @Positive @Regression @P1 #TC-703
  Scenario: Link Body to Level
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Bodies" "Product Factory navigation sub item"
    Then I click on the "EC_BODY_NAME" "Product Factory Link Levels button"
    And I "check" "EC_LEVEL_NAME" "Product Factory dialog checkbox"
    And I click on the "Save" "Product Factory button"