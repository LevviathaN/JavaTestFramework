@ProductFactory @Courses
Feature: Course Wizard - add filter to Paper list - BPP-8382

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoDeactivationReasonDescription" text as "EC_DEACTIVATION_REASON_DESCRIPTION" variable
    And I remember "23/10/2020" text as "EC_SITTING_START_DATE" variable
    And I remember "10/10/2025" text as "EC_SITTING_END_DATE" variable
    And I remember "AutoStreamName" text as "EC_STREAM_NAME" variable
    And I remember "AutoBodyFDCode" text as "EC_BODY_FD_CODE" variable
    And I remember "AutoBodyFDDescription" text as "EC_BODY_FD_DESCRIPTION" variable
    And I remember "AutoBodyShortName" text as "EC_BODY_SHORT_NAME" variable
    And I remember "AutoBodyName" text as "EC_BODY_NAME" variable
    And I remember "AutoVatRuleCode" text as "EC_VAT_RULE_CODE" variable
    And I remember "AutoVatRuleDescription" text as "EC_VAT_RULE_DESCRIPTION" variable
    And I remember "AutoCourseTypeFDCode" text as "EC_COURSE_TYPE_FD_CODE" variable
    And I remember "AutoCourseTypeFDDescription" text as "EC_COURSE_TYPE_FD_DESCRIPTION" variable
    And I remember "AutoCourseTypeDescription" text as "EC_COURSE_TYPE_DESCRIPTION" variable
    And I remember "AutoLocationFDCode" text as "EC_LOCATION_FD_CODE" variable
    And I remember "AutoLocationFDDescription" text as "EC_LOCATION_FD_DESCRIPTION" variable
    And I remember "AutoRegionFDCode" text as "EC_REGION_FD_CODE" variable
    And I remember "AutoRegionFDDescription" text as "EC_REGION_FD_DESCRIPTION" variable
    And I remember "AutoRegionName" text as "EC_REGION_NAME" variable
    And I remember "AutoLocationName" text as "EC_LOCATION_NAME" variable
    And I remember "AutoLocationAddress" text as "EC_LOCATION_ADDRESS" variable
    And I remember "AutoLevelName" text as "EC_LEVEL_NAME" variable
    And I remember "AutoLevelShortName" text as "EC_LEVEL_SHORT_NAME" variable
    And I remember "AutoPprSN" text as "EC_PPR_SN" variable
    And I remember "AutoPaperName" text as "EC_PAPER_NAME" variable
    And I remember "AutoPaperDescription" text as "EC_PAPER_DESCRIPTION" variable
    And I remember "AutoSittingName" text as "EC_SITTING_NAME" variable
    And I remember "AutoMaterialTypeFDCode" text as "EC_MATERIAL_TYPE_FD_CODE" variable
    And I remember "AutoMaterialTypeFDDescription" text as "EC_MATERIAL_TYPE_FD_DESCRIPTION" variable
    And I remember "AutoMaterialTypeName" text as "EC_MATERIAL_TYPE_NAME" variable
    And I remember "AutoMaterialTypeDescription" text as "EC_MATERIAL_TYPE_DESCRIPTION" variable
    And I remember "AutoSessionDurationDescription" text as "EC_SESSION_DURATION_DESCRIPTION" variable
    And I remember "AutoClientName" text as "EC_CLIENT_NAME" variable
    And I remember "2000" text as "EC_PRICE" variable
    And I remember "10" text as "EC_WEIGHT" variable
    And I remember "1000" text as "EC_PRICING_MATRIX_PRICE" variable

  @Positive @P1 #TC-3609, TC-3612, TC-3617, TC-3618
  Scenario: Validate Paper and Course Type Filters in Course Creation Wizard
    And I execute modified "Create Course" reusable step
      |4|Add|I set "XXX" text to the "Search" "Product Factory text field" from keyboard|
      |5|Add|I click on the "submit" "element by type"|
      |6|Add|I shouldn't see the "EC_PAPER_NAME" "element"|
      |7|Add|I click on the "Clear the search text" "element by title"|
      |8|Add|I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard|
      |9|Add|I click on the "submit" "element by type"|
      |10|Add|I should see the "EC_PAPER_NAME" "element"|
      |11|Add|I click on the "Clear the search text" "element by title"|
      |12|Add|I set "EC_LEVEL_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard |
      |13|Add|I click on the "submit" "element by type"   |
      |14|Add|I should see the "EC_PAPER_NAME" "element"|
      |15|Add|I click on the "Clear the search text" "element by title"|
      |21|Add|I set "XXX" text to the "Search" "Product Factory text field two" from keyboard|
      |22|Add|I click on the "submit" "element by type two"|
      |23|Add|I shouldn't see the "EC_COURSE_TYPE_NAME" "element"|
      |24|Add|I click on the "Clear the search text" "element by title two"|