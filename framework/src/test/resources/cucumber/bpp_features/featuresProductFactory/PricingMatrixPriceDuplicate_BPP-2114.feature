@ProductFactory @PricingMatrices @HappyPath
Feature: Pricing Matrix - price creation validation to prevent duplicates - BPP-2114
  As a Senior Product Setter
  I want to there to be validation that prevents Prices based on the combinations that have already been setup being created again,
  so that I do not create duplicate Prices, as this will break Course Price lookup.

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoBodyShortName" text as "EC_BODY_SHORT_NAME" variable
    And I remember "AutoBodyName" text as "EC_BODY_NAME" variable
    And I remember "AutoCourseTypeDescription" text as "EC_COURSE_TYPE_DESCRIPTION" variable
    And I remember "AutoRegionName" text as "EC_REGION_NAME" variable
    And I remember "AutoPaperName" text as "EC_PAPER_NAME" variable
    And I remember "AutoPaperDescription" text as "EC_PAPER_DESCRIPTION" variable

  @Negative @P1 @Duplicate #TC-1158
  Scenario: Add Duplicate Price in Pricing Matrix
    Given I execute "Create Pricing Matrix Full" reusable step
    Then I should see the "Unable to save prices, there may be existing prices for the selected reference data" message