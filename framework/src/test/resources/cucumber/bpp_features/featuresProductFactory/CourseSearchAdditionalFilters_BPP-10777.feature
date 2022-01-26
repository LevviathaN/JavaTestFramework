@ProductFactory @Courses @Search @AdditionalFilters
Feature: Course Search - Start Date filter - BPP-10777
  As a Senior Product Setter
  I want to be able to apply as Start Date filter
  so that I can filter the set of Courses based on the start date (based on Session Date).

  Background:
    Given I execute "Log In" reusable step


  @Positive #TC-4416
  Scenario: Course Search - Start Date filter
    And I execute "Remember Variables " reusable step
    And I execute "Remember Variables Two" reusable step

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    # Check Body Additional Filter
    And I click on the "Product Factory Additional Filters Button" button
    And I wait for "7" seconds
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "[EC_BODY_SHORT_NAME] - [EC_BODY_NAME]" "Product Factory dropdown option"
    And I click on the "Done" "Product Factory button"
    Then I should see the "EC_BODY_SHORT_NAME" "button"
    And I shouldn't see the "EC_BODY_SHORT_NAME_TWO" element
    And I click on the "Product Factory Clear Body Additional Filter" button
    # Check Level Additional Filter
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Level" "Product Factory dropdown"
    And I click on the "[EC_LEVEL_SHORT_NAME] - [EC_LEVEL_NAME]" "Product Factory dropdown option"
    And I click on the "Done" "Product Factory button"
    Then I should see the "EC_LEVEL_NAME" "button"
    And I shouldn't see the "EC_LEVEL_NAME_TWO" element
    And I click on the "Product Factory Clear Level Additional Filter" button
    # Check Course Type Additional Filter
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "CourseType" "Product Factory dropdown"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory dropdown option"
    And I click on the "Done" "Product Factory button"
    Then I should see the "EC_COURSE_TYPE_DESCRIPTION" "button"
    And I shouldn't see the "EC_COURSE_TYPE_DESCRIPTION_TWO" element
    And I click on the "Product Factory Clear Course Type Additional Filter" button
    # Check Sitting Additional Filter
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Sitting" "Product Factory dropdown"
    And I click on the "[EC_SITTING_NAME] ([EC_SITTING_START_DATE] - [EC_SITTING_END_DATE])" "Product Factory dropdown option"
    And I click on the "Done" "Product Factory button"
    Then I should see the "EC_SITTING_NAME" "button"
    And I shouldn't see the "EC_SITTING_NAME_TWO" element
    And I click on the "Product Factory Clear Sitting Additional Filter" button
    # Check Paper Additional Filter
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Paper" "Product Factory dropdown"
    And I click on the "Equals" "Product Factory dropdown option"
    And I set "EC_PAPER_NAME" text to the "Paper" "Product Factory text field"
    And I click on the "Done" "Product Factory button"
    Then I should see the "EC_PAPER_NAME" "button"
    And I shouldn't see the "EC_PAPER_NAME_TWO" element
    And I click on the "Product Factory Clear Paper Additional Filter" button
    # Check Session Date Additional Filter
    And I click on the "Product Factory Additional Filters Button" button
    And I remember "22/02/2022" text as "EC_SESSION_DATE_FROM" variable
    And I fill the "Product Factory Course Page Session Date Additional Filter From Field" field with "EC_SESSION_DATE_FROM"
    And I remember "10/10/2025" text as "EC_SESSION_DATE_TO" variable
    And I fill the "Product Factory Course Page Session Date Additional Filter To Field" field with "EC_SESSION_DATE_TO"
    And I click on the "Done" "Product Factory button"
    And I click on the "Clear Additional Filters" "element by title"
    # Check all Additional Filters at once
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "[EC_BODY_SHORT_NAME] - [EC_BODY_NAME]" "Product Factory dropdown option"
    And I click on the "Level" "Product Factory dropdown"
    And I click on the "[EC_LEVEL_SHORT_NAME] - [EC_LEVEL_NAME]" "Product Factory dropdown option"
    And I click on the "CourseType" "Product Factory dropdown"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory dropdown option"
    And I click on the "Sitting" "Product Factory dropdown"
    And I click on the "[EC_SITTING_NAME] ([EC_SITTING_START_DATE] - [EC_SITTING_END_DATE])" "Product Factory dropdown option"
    And I click on the "Paper" "Product Factory dropdown"
    And I click on the "Equals" "Product Factory dropdown option"
    And I set "EC_PAPER_NAME" text to the "Paper" "Product Factory text field"
    And I click on the "Done" "Product Factory button"
    Then I should see the "EC_PAPER_NAME" "button"
    And I shouldn't see the "EC_PAPER_NAME_TWO" element
    And I click on the "Product Factory Clear Paper Additional Filter" button

  @Positive #TC-4432
  Scenario: Course Search Additional Filters - Additional Scenarios
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT   |
      |target       |REGION|
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT   |
      |target       |LOCATION|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step

    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Instance" API step
    And I execute "Get Instance Sessions" API step
    And I execute "Change Session Timings" API step

    And I execute "Create Course" API step saving as "SECOND_"
    And I execute "Create Instance" API step with parameters saving as "SECOND_"
      |courseReference|EC_SECOND_COURSE_REFERENCE|
    And I execute "Get Instance Sessions" API step with parameters saving as "SECOND_"
      |instanceReference|EC_SECOND_INSTANCE_REFERENCE|
    And I debug
    And I execute "Change Session Timings Second" API step with parameters saving as "SECOND_"
      |sessionReference|EC_SECOND_INSTANCE_SESSIONS_REFERENCE|
      |sessionTimingReference|EC_SECOND_GET_INSTANCE_SESSIONS_TIMINGS_REFERENCE|
      |sessionDate|[TIMENOW(YTD)-yyyy-MM-dd]|

    And I execute "Create Course" API step saving as "THIRD_"
    And I execute "Create Instance" API step with parameters saving as "THIRD_"
      |courseReference|EC_THIRD_COURSE_REFERENCE|
    And I execute "Get Instance Sessions" API step with parameters saving as "THIRD_"
      |instanceReference|EC_THIRD_INSTANCE_REFERENCE|
    And I execute "Change Session Timings Third" API step with parameters saving as "THIRD_"
      |sessionReference|EC_THIRD_INSTANCE_SESSIONS_REFERENCE|
      |sessionTimingReference|EC_THIRD_GET_INSTANCE_SESSIONS_TIMINGS_REFERENCE|
      |sessionDate|[TIMENOW(TMR)-yyyy-MM-dd]|


    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"

    # Check Session Date Additional Filter All 3
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "[EC_BODY_SHORT_NAME] - [EC_BODY_NAME]" "Product Factory dropdown option"
    And I fill the "Product Factory Course Page Session Date Additional Filter From Field" field with "[DATEFORMAT(EC_SECOND_CHANGE_SESSION_TIMINGS_SECOND_TIMINGS_SESSION_DATE,yyyy-MM-dd,dd/MM/yyyy)]"
    And I fill the "Product Factory Course Page Session Date Additional Filter To Field" field with "[DATEFORMAT(EC_THIRD_CHANGE_SESSION_TIMINGS_THIRD_TIMINGS_SESSION_DATE,yyyy-MM-dd,dd/MM/yyyy)]"
    And I click on the "Done" "Product Factory button"
    Then I should see "EC_BODY_SHORT_NAME" "Product Factory edit button" in quantity of "3"
    And I click on the "Clear Additional Filters" "element by title"

    # Check Session Date Additional Filter 1 and 2
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "[EC_BODY_SHORT_NAME] - [EC_BODY_NAME]" "Product Factory dropdown option"
    And I fill the "Product Factory Course Page Session Date Additional Filter From Field" field with "[DATEFORMAT(EC_SECOND_CHANGE_SESSION_TIMINGS_SECOND_TIMINGS_SESSION_DATE,yyyy-MM-dd,dd/MM/yyyy)]"
    And I fill the "Product Factory Course Page Session Date Additional Filter To Field" field with "[DATEFORMAT(EC_CHANGE_SESSION_TIMINGS_TIMINGS_SESSION_DATE,yyyy-MM-dd,dd/MM/yyyy)]"
    And I click on the "Done" "Product Factory button"
    Then I should see "EC_BODY_SHORT_NAME" "Product Factory edit button" in quantity of "2"
    And I click on the "Clear Additional Filters" "element by title"

    # Check Session Date Additional Filter 1 and 3
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "[EC_BODY_SHORT_NAME] - [EC_BODY_NAME]" "Product Factory dropdown option"
    And I fill the "Product Factory Course Page Session Date Additional Filter From Field" field with "[DATEFORMAT(EC_CHANGE_SESSION_TIMINGS_TIMINGS_SESSION_DATE,yyyy-MM-dd,dd/MM/yyyy)]"
    And I fill the "Product Factory Course Page Session Date Additional Filter To Field" field with "[DATEFORMAT(EC_THIRD_CHANGE_SESSION_TIMINGS_THIRD_TIMINGS_SESSION_DATE,yyyy-MM-dd,dd/MM/yyyy)]"
    And I click on the "Done" "Product Factory button"
    Then I should see "EC_BODY_SHORT_NAME" "Product Factory edit button" in quantity of "2"
    And I click on the "Clear Additional Filters" "element by title"

    # Check Session Date Additional Filter only 1
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "[EC_BODY_SHORT_NAME] - [EC_BODY_NAME]" "Product Factory dropdown option"
    And I fill the "Product Factory Course Page Session Date Additional Filter From Field" field with "[DATEFORMAT(EC_CHANGE_SESSION_TIMINGS_TIMINGS_SESSION_DATE,yyyy-MM-dd,dd/MM/yyyy)]"
    And I fill the "Product Factory Course Page Session Date Additional Filter To Field" field with "[DATEFORMAT(EC_CHANGE_SESSION_TIMINGS_TIMINGS_SESSION_DATE,yyyy-MM-dd,dd/MM/yyyy)]"
    And I click on the "Done" "Product Factory button"
    Then I should see "EC_BODY_SHORT_NAME" "Product Factory edit button" in quantity of "1"
    And I click on the "Clear Additional Filters" "element by title"