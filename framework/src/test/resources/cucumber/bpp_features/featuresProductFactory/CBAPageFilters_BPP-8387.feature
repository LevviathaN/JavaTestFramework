@ProductFactory @CBA @Filters
Feature: CBA - Create Courses and Instances - BPP-3206
  As a Product Setter
  I want a search filter added to the CBA List page
  so that the records can be filtered.

  Background:
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|

    And I remember "AutoDeactivationReasonDescriptionPrevent" text as "EC_DEACTIVATION_REASON_DESCRIPTION_PREVENT" variable
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
    And I remember "AtCBAPprSN" text as "EC_PPR_SN" variable
    And I remember "AutoCBAPaperName" text as "EC_PAPER_NAME" variable
    And I remember "AutoCBAPaperDescription" text as "EC_PAPER_DESCRIPTION" variable
    And I remember "AutoSittingName" text as "EC_SITTING_NAME" variable
    And I remember "AutoMaterialTypeFDCode" text as "EC_MATERIAL_TYPE_FD_CODE" variable
    And I remember "AutoMaterialTypeFDDescription" text as "EC_MATERIAL_TYPE_FD_DESCRIPTION" variable
    And I remember "AutoMaterialTypeName" text as "EC_MATERIAL_TYPE_NAME" variable
    And I remember "AutoMaterialTypeDescription" text as "EC_MATERIAL_TYPE_DESCRIPTION" variable
    And I remember "AutoCBASessionDurationDescription" text as "EC_SESSION_DURATION_DESCRIPTION" variable
    And I remember "AutoClientName" text as "EC_CLIENT_NAME" variable
    And I remember "2000" text as "EC_PRICE" variable
    And I remember "10" text as "EC_WEIGHT" variable
    And I remember "1000" text as "EC_PRICING_MATRIX_PRICE" variable

    And I remember "AutoSittingNameTwo" text as "EC_SITTING_NAME_TWO" variable
    And I remember "AutoCBASessionDurationDescriptionTwo" text as "EC_SESSION_DURATION_DESCRIPTION_TWO" variable
    And I remember "AutoCourseTypeDescriptionTwo" text as "EC_COURSE_TYPE_DESCRIPTION_TWO" variable
    And I remember "AutoRegionNameTwo" text as "EC_REGION_NAME_TWO" variable
    And I remember "AutoLocationNameTwo" text as "EC_LOCATION_NAME_TWO" variable
    And I remember "AutoLocationAddressTwo" text as "EC_LOCATION_ADDRESS_TWO" variable

  @Positive @Regression @P1 #TC-3771
  Scenario: CBA Page Filters Validation
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"

    Then I set "EC_SESSION_DURATION_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I should see the "EC_SESSION_DURATION_DESCRIPTION" "element"
    And I click on the "Clear the search text" "element by title"

    Then I set "EC_REGION_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I should see the "EC_REGION_NAME" "element"
    And I click on the "Clear the search text" "element by title"

  @Negative @Regression @P1 @DoNotRun @NotActual #TC-3772
  Scenario: CBA Page Filters Validation Additional Scenarios
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"

    Then I set "EC_SITTING_NAME_TWO" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I shouldn't see the "EC_SITTING_NAME_TWO" "element"
    And I click on the "Clear the search text" "element by title"

    And I execute "Create CBA Record" reusable step replacing some steps
      |4|I click on the "EC_SITTING_NAME_TWO" "Product Factory select button"|
      |5|I click on the "EC_SESSION_DURATION_DESCRIPTION_TWO" "Product Factory select button"|
      |7|I click on the "EC_REGION_NAME_TWO" "element"                            |
      |9|I click on the "EC_LOCATION_NAME_TWO" "element"                         |
      |10|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Description" "Product Factory text field"|
      |12|I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory select button"              |
      |13|I should see the "EC_SITTING_NAME_TWO" element|
      |14|I should see the "EC_SESSION_DURATION_DESCRIPTION_TWO" element|
      |15|I should see the "EC_REGION_NAME_TWO" element|
      |16|I should see the "EC_LOCATION_NAME_TWO" element|
      |17|I should see the "EC_COURSE_TYPE_DESCRIPTION_TWO" element|

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"

    And I set "EC_SITTING_NAME_TWO" text to the "Sitting" "Product Factory text field"
    And I set "EC_SESSION_DURATION_DESCRIPTION" text to the "Session Duration" "Product Factory text field"
    And I click on the "Search" "Product Factory button"
    And I shouldn't see the "EC_SITTING_NAME_TWO" "element"
    And I shouldn't see the "EC_SESSION_DURATION_DESCRIPTION" "element"
    And I click on the "Clear Filters" "Product Factory button"

    And I set "EC_SITTING_NAME" text to the "Sitting" "Product Factory text field"
    And I set "EC_SESSION_DURATION_DESCRIPTION" text to the "Session Duration" "Product Factory text field"
    And I click on the "Search" "Product Factory button"
    And I should see the "EC_SITTING_NAME" "element"
    And I click on the "Clear Filters" "Product Factory button"

    And I set "EC_SITTING_NAME" text to the "Sitting" "Product Factory text field"
    And I set "EC_SESSION_DURATION_DESCRIPTION" text to the "Session Duration" "Product Factory text field"
    And I set "EC_REGION_NAME" text to the "Region" "Product Factory text field"
    And I click on the "Search" "Product Factory button"
    And I should see the "EC_SITTING_NAME" "element"
    And I click on the "Clear Filters" "Product Factory button"

    And I set "EC_SITTING_NAME" text to the "Sitting" "Product Factory text field"
    And I set "EC_SESSION_DURATION_DESCRIPTION" text to the "Session Duration" "Product Factory text field"
    And I set "EC_REGION_NAME" text to the "Region" "Product Factory text field"
    And I set "EC_LOCATION_NAME" text to the "Location" "Product Factory text field"
    And I click on the "Search" "Product Factory button"
    And I should see the "EC_SITTING_NAME" "element"
    And I click on the "Clear Filters" "Product Factory button"

    And I set "EC_SITTING_NAME" text to the "Sitting" "Product Factory text field"
    And I set "EC_SESSION_DURATION_DESCRIPTION" text to the "Session Duration" "Product Factory text field"
    And I set "EC_REGION_NAME" text to the "Region" "Product Factory text field"
    And I set "EC_LOCATION_NAME" text to the "Location" "Product Factory text field"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Course Type" "Product Factory text field"
    And I click on the "Search" "Product Factory button"
    And I should see the "EC_SITTING_NAME" "element"
    And I click on the "Clear Filters" "Product Factory button"

    And I set "EC_SITTING_NAME" text to the "Sitting" "Product Factory text field"
    And I set "EC_SESSION_DURATION_DESCRIPTION" text to the "Session Duration" "Product Factory text field"
    And I set "EC_REGION_NAME" text to the "Region" "Product Factory text field"
    And I set "EC_LOCATION_NAME" text to the "Location" "Product Factory text field"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Course Type" "Product Factory text field"
    And I set "EC_CLIENT_NAME" text to the "Client" "Product Factory text field"
    And I click on the "Search" "Product Factory button"
    And I should see the "EC_SITTING_NAME" "element"
    And I click on the "Clear Filters" "Product Factory button"

    And I set "EC_SITTING_NAME" text to the "Sitting" "Product Factory text field"
    And I set "EC_SITTING_NAME_TWO" text to the "Sitting" "Product Factory text field"
    And I click on the "Search" "Product Factory button"
    And I shouldn't see the "EC_SITTING_NAME" "element"
    And I click on the "Clear Filters" "Product Factory button"

    And I set "EC_SITTING_NAME" text to the "Region" "Product Factory text field"
    And I click on the "Search" "Product Factory button"
    And I shouldn't see the "EC_SITTING_NAME" "element"
    And I click on the "Clear Filters" "Product Factory button"

    And I set "EC_REGION_NAME" text to the "Sitting" "Product Factory text field"
    And I click on the "Search" "Product Factory button"
    And I shouldn't see the "EC_REGION_NAME" "element"
    And I click on the "Clear Filters" "Product Factory button"