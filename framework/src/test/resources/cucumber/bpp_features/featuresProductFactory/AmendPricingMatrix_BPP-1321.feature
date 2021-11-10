@ProductFactory @PricingMatrices @Amend
Feature: Pricing Matrix - update prices - BPP-1321
  As a Senior Product Setter
  I want to be able to change individual Prices on a Pricing Matrix,
  so that any industry or business price-related changes are reflected in the appropriate Course(s).

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoBodyName" text as "EC_BODY_NAME" variable
    And I remember "AutoCourseTypeDescription" text as "EC_COURSE_TYPE_DESCRIPTION" variable
    And I remember "AutoRegionName" text as "EC_REGION_NAME" variable
    And I remember "AutoPaperName" text as "EC_PAPER_NAME" variable

  @Positive @Regression @P1 @CoveredWithApi #TC-1145
  Scenario: Update Pricing Matrix Price
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Prices" "Product Factory navigation sub item"
    When I click on the "EC_BODY_NAME" "Product Factory edit button"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "text"
    And I click on the "EC_REGION_NAME" "text"
    And I click on the "EC_PAPER_NAME" "Product Factory change button"
    And I set "999" text to the "Enter a Price (£)" "Product Factory text field"
    And I click on the "Save" "Product Factory active button"
    Then I should see the "£999" element