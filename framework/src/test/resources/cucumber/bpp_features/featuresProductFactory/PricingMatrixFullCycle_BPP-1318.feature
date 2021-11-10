@ProductFactory @PricingMatrices @HappyPath
Feature: Pricing Matrix - price creation wizard - BPP-1318
  As a Senior Product Setter
  I want to be able to enter the Pricing Matrices details
  so that Course prices are calculated.

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoVatRuleCode" text as "EC_VAT_RULE_CODE" variable
    And I remember "AutoVatRuleDescription" text as "EC_VAT_RULE_DESCRIPTION" variable
    And I remember "AutoCourseTypeFDCode" text as "EC_COURSE_TYPE_FD_CODE" variable
    And I remember "AutoCourseTypeFDDescription" text as "EC_COURSE_TYPE_FD_DESCRIPTION" variable
    And I remember "AutoBodyShortName" text as "EC_BODY_SHORT_NAME" variable
    And I remember "AutoBodyName" text as "EC_BODY_NAME" variable
    And I remember "AutoCourseTypeFDDescription" text as "EC_COURSE_TYPE_FD_DESCRIPTION" variable
    And I remember "AutoCourseTypeDescription" text as "EC_COURSE_TYPE_DESCRIPTION" variable
    And I remember "AutoRegionName" text as "EC_REGION_NAME" variable
    And I remember "AutoPaperName" text as "EC_PAPER_NAME" variable
    And I remember "AutoPaperDescription" text as "EC_PAPER_DESCRIPTION" variable
    Given I execute "Create Course Type" reusable step replacing some steps
      |4|I set "CourseTypeDescription[######]~Two" text to the "Description" "Product Factory text field"|
      |13|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
      |15|I should see the "EC_COURSE_TYPE_DESCRIPTION_TWO" element                                         |

  @Positive @Regression @P1 @FullCycle @CoveredWithApi @NeedToBeUI #TC-1032
  Scenario: Add a New Pricing Matrix Full Cycle
  Given I execute "Create Pricing Matrix Full" reusable step replacing some steps
    |5|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
    |7|I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory select button"                       |