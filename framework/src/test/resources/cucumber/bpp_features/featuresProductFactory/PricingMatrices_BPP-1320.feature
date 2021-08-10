@ProductFactory @PricingMatrices @HappyPath
Feature: Pricing Matrix creation page - BPP-1320
  As a Senior Product Setter
  I want to be able to enter and amend Pricing Matrices
  so that Course prices are calculated.

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoBodyName" text as "EC_BODY_NAME" variable
    And I remember "AutoSittingName" text as "EC_SITTING_NAME" variable

  @Positive @Regression @P1 @CoveredWithApi #TC-981, TC-1868
  Scenario: Add a New Pricing Matrix Using a Modal
    Given I execute "Create Pricing Matrix" reusable step