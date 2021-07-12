@ProductFactory @Bodies @LinkBodyToPaper
Feature: Reference Data - Link Body/Paper(Module) - BPP-471
  As a Senior Product Setter
  I need to be able to specify which Levels are linked to a Body.
  (Relate Body to Level through "Allowed Level" relationship)

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoVerticalName" text as "EC_VERTICAL_NAME" variable
    And I remember "AutoBodyFDCode" text as "EC_BODY_FD_CODE" variable
    And I execute "Create Body" reusable step
    Then I execute "Create Paper" reusable step

  @Positive @Regression @P1 #TC-697
  Scenario: Link Body to Paper
  Given I execute "Link Body to Paper" reusable step