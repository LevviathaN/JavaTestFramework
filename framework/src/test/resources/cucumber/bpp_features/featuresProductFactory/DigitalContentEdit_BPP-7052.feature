@ProductFactory @DigitalContent
Feature: Digital Content Id - Edit - BPP-7052
  As a Senior Product Setter
  I want to be able to edit the Digital Content Id Sittings
  so that Course the it assigned to the correct Courses.

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
#    And I remember "AutoCourseTypeDescription" text as "EC_COURSE_TYPE_DESCRIPTION" variable
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

    And I execute "Create Course Type" reusable step
    And I execute "Create Course Type" reusable step replacing some steps
      |4|I set "CourseTypeDescriptionTwo[######]" text to the "Description" "Product Factory text field"|
      |13|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard     |
      |15|I should see the "EC_COURSE_TYPE_DESCRIPTION_TWO" element                                         |
    And I execute "Create Sitting" reusable step replacing some steps
      |4|I set "SittingNameTwo[######]" text to the "Name" "Product Factory text field"|

  @Positive @P1 #TC-3169, TC-5450
  Scenario: Edit Digital Content
    Given I execute modified "Create Digital Content" reusable step
      |5|Add|Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"|
      |22|Add|I set "NameSuffix[###]" text to the "Name Suffix" "Product Factory text field"|
      |23|Add|I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_NAME] - [EC_SITTING_NAME] - [EC_NAME_SUFFIX]" element|
      |24|Add|I set "CourseReferenceID[###]" text to the "Course Reference ID" "Product Factory text field"|
      |25|Add|I should see the "EC_COURSE_REFERENCE_ID" "element by title"                                 |
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    When I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    And I click on the "Sittings" "Product Factory edit button"
    And I click on the "EC_SITTING_NAME_TWO" "Product Factory checkbox"
    And I click on the "Save" "Product Factory button last"
    And I click on the "Save" "Product Factory button last"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    When I click on the "Course Types" "Product Factory edit button"
    And I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type two"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory checkbox"
    And I click on the "Save" "Product Factory button last"
    And I click on the "Save" "Product Factory button last"
    And I click on the "Product Factory Course Reference ID edit button" element
    And I set "CourseReferenceIDEdited[###]" text to the "Course Reference ID" "Product Factory text field"
    And I click on the "Save" "Product Factory button last"
    Then I should see the "EC_COURSE_REFERENCE_ID_EDITED" "element"

  @Negative @P1 #TC-3198
  Scenario: Edit Digital Content Duplicate
    Given I execute "Create Digital Content" reusable step replacing some steps
      |15|I "check" "EC_SITTING_NAME_TWO" "Product Factory dialog checkbox"|
      |17|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
      |19|I "check" "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory dialog checkbox"|
    Given I execute modified "Create Digital Content" reusable step
      |21|Add|I set "Suffix[###]" text to the "Name Suffix" "Product Factory text field"|
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    When I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    And I click on the "Sittings" "Product Factory edit button"
    And I click on the "EC_SITTING_NAME_TWO" "Product Factory checkbox"
    And I click on the "Save" "Product Factory button two"
    And I click on the "Save" "Product Factory active button"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    When I click on the "Course Types" "Product Factory edit button"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type two"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory checkbox"
    And I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type two"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory checkbox"
    And I click on the "Save" "Product Factory button two"
    And I click on the "Save" "Product Factory active button"
    Then I should see the "Digital Content already exists" "text contained in element"

  @Positive @P1 #TC-3209
  Scenario: Edit Digital Content Not In Use
    Given I execute "Create Digital Content" reusable step with some additional steps
      |16|I "check" "EC_SITTING_NAME_TWO" "Product Factory dialog checkbox"|
      |21|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
      |22|I click on the "submit" "element by type"                                         |
      |23|I "check" "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory dialog checkbox"|
    Then I should see the "EC_BODY_SHORT_NAME" element
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    When I click on the "Course Types" "Product Factory edit button"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type two"
    And I "check" "EC_COURSE_TYPE_DESCRIPTION" "Product Factory dialog checkbox"
    And I click on the "Save" "Product Factory button two"
    And I click on the "Save" "Product Factory active button"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    And I click on the "Sittings" "Product Factory edit button"
    And I click on the "EC_SITTING_NAME_TWO" "Product Factory checkbox"
    And I click on the "Save" "Product Factory button two"
    And I click on the "Save" "Product Factory active button"

  @Negative @P1 #TC-3210
  Scenario: Edit Digital Content Additional Scenario
    Given I execute "Create Digital Content" reusable step with some additional steps
      |16|I "check" "EC_SITTING_NAME_TWO" "Product Factory dialog checkbox"|
      |21|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
      |22|I click on the "submit" "element by type"                                         |
      |23|I "check" "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory dialog checkbox"|
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    And I click on the "Course Types" "Product Factory edit button"
    And I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type two"
    And I "check" "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory dialog checkbox"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type two"
    And I "check" "EC_COURSE_TYPE_DESCRIPTION" "Product Factory dialog checkbox"
    And I click on the "Save" "Product Factory button two"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"
    And I click on the "Sittings" "Product Factory edit button"
    And I "check" "EC_SITTING_NAME_TWO" "Product Factory dialog checkbox"
    And I "check" "EC_SITTING_NAME" "Product Factory dialog checkbox"
    And I click on the "Save" "Product Factory button two"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"
    And I click on the "Course Types" "Product Factory edit button"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type two"
    And I "check" "EC_COURSE_TYPE_DESCRIPTION" "Product Factory dialog checkbox"
    And I click on the "Save" "Product Factory active button"
    And I click on the "Sittings" "Product Factory edit button"
    And I "check" "EC_SITTING_NAME" "Product Factory dialog checkbox"
    And I click on the "Save" "Product Factory active button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "0"