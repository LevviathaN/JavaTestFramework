@ProductFactory @SessionDurations @Amend
Feature: Reference Data - Amend Session Duration - BPP-1315
  As a Senior Product Setter
  I want to be able amend Session Duration data
  so that a Course Instance can be created using this Session.

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoSessionDurationDescriptionEdit" text as "EC_SESSION_DURATION_DESCRIPTION" variable

  @Positive @Regression @P1 #TC-813
  Scenario: Amend a Session Duration Using a Modal
    Given I execute "Create Session Duration" reusable step replacing some steps
      |3|I click on the "EC_SESSION_DURATION_DESCRIPTION" "Product Factory edit button"|