@ProductFactory @SessionDurations @HappyPath
Feature: Reference Data - Create Session Duration - BPP-1316
  As a Senior Product Setter
  I want to be able create Session Duration data
  so that a Course Instance can be created using this Session.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 @CoveredWithApi #TC-811
  Scenario: Add a New Session Duration Using a Modal
    Given I execute "Create Session Duration" reusable step

  @Negative @P2 @CoveredWithApi #TC-812
  Scenario: Add Session Duration where Description Already Exists
    And I remember "AutoSessionDurationDescription" text as "EC_AUTO_SESSION_DURATION_DESCRIPTION" variable
    When I execute modified "Create Session Duration" reusable step
      |4|Replace|I set "EC_SESSION_DURATION_DESCRIPTION" text to the "Description" "Product Factory text field"|
      |7|Replace|I should see the "Description must be unique" "message"                                       |