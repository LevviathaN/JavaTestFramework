@ProductFactory @DigitalContent
Feature: Better alignment of Totara Course and Product Factory Digital Content (Terra Changes) - BPP-8095
  As a member of VLE Operations
  I would like the Course Name and Category in Totara to reflect the Digital Content that's setup in Product Factory
  So that I know what my Course represents
  Students aren't confused by a Course Name that doesn't reflect what they are studying

  Background:
    Given I execute "Log In" reusable step
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

  @Positive @P1 #TC-3453, TC-3455
  Scenario: Verify Digital Content Name Suffix Field
    Given I execute modified "Create Digital Content" reusable step
      |21|Add|I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_NAME] - [EC_SITTING_NAME]" element|
      |22|Add|I set "NameSuffix[###]" text to the "Name Suffix" "Product Factory text field"|
      |23|Add|I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_NAME] - [EC_SITTING_NAME] - [EC_NAME_SUFFIX]" element|
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element

  @Positive @P1 @Redundant @DoNotRun #TC-3455
  Scenario: Verify Digital Content Name Suffix Field Empty
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I should see the "undefined" element
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "EC_BODY_NAME" "Product Factory dropdown option"
    And I click on the "Level" "Product Factory dropdown"
    And I click on the "EC_LEVEL_NAME" "Product Factory dropdown option"
    And I click on the "Paper" "Product Factory dropdown"
    And I click on the "EC_PAPER_DESCRIPTION" "Product Factory dropdown option"
    And I click on the "Sittings" "Product Factory edit button"
    And I "check" "EC_SITTING_NAME" "Product Factory dialog checkbox"
    And I click on the "Save" "Product Factory active button"
    And I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_DESCRIPTION] - [EC_SITTING_NAME]" element
    And I click on the "Course Types" "Product Factory edit button"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Description" "Product Factory text field"
    And I click on the "Search" "Product Factory button two"
    And I "check" "EC_COURSE_TYPE_DESCRIPTION" "Product Factory dialog checkbox"
    And I click on the "Save" "Product Factory active button"
    And I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_DESCRIPTION] - [EC_SITTING_NAME]" element
    And I click on the "Save" "Product Factory button"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Course Type" "Product Factory text field"
    And I click on the "Search" "Product Factory button"
    Then I should see the "EC_BODY_SHORT_NAME" element

  @Negative @P1 @CoveredWithApi #TC-3453
  Scenario: Digital Content Name Suffix Field Prevent Duplicate
    Given I execute "Create Digital Content" reusable step with some additional steps
      |21|I set "Suffix[###]" text to the "Name Suffix" "Product Factory text field"|
      |22|I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_NAME] - [EC_SITTING_NAME] - [EC_SUFFIX]" element|
    Given I execute "Create Digital Content" reusable step with some additional steps
      |21|I set "EC_SUFFIX" text to the "Name Suffix" "Product Factory text field"|
    Then I should see the "Digital Content already exists for the combination of Body, Level, Paper, Sitting ([EC_SITTING_NAME]) & Course Type ([EC_COURSE_TYPE_DESCRIPTION])" message