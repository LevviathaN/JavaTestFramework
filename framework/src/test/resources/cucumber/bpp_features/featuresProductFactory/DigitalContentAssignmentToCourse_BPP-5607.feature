@ProductFactory @DigitalContent
Feature: Digital Content Id - Assignment to Course - BPP-5607
  As a Product Setter
  I want a Digital Content Id assigned to a Course automatically but not created if there is no match
  so that only Digital Content Id that have been manually created are used.

  Background:
    Given I generate new ISBN code saving as "EC_ISBN"
    Given I execute "Log In" reusable step
    And I execute "Remember Variables For Creation " reusable step

  @Positive @P1 #TC-3181
  Scenario: Create Course With Matching Digital Content
    Given I execute "Create Digital Content" reusable step with some additional steps
      |21|I set "Suffix[###]" text to the "Name Suffix" "Product Factory text field"|
      |22|I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_NAME] - [EC_SITTING_NAME] - [EC_SUFFIX]" element|
    Then I execute "Create Course" reusable step
    Then I execute "Create Course Instance" reusable step
    When I click on the "EC_LOCATION_NAME" "Product Factory course instance sessions dropdown button"
    And I click on the "EC_LOCATION_NAME" "Product Factory Session Dates button"
    And I fill the "Product Factory Session Dates Popup Date Input Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Input Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Input Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"
    When I click on the "Activate" "Product Factory button"
    Then I shouldn't see the "Could not find Digital Content for the Course" message

  @Negative @P1 #TC-3183
  Scenario: Create Course With No Matching Digital Content
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
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Client" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Change Instance Capacity" API step with parameters
      |capacity|15|
    And I execute "Get Instance Sessions" API step
    And I execute "Change Session Timings" API step
    And I execute "Get Instance Steps" API step
    And I execute "Change Step Due Date" API step
    And I execute "Calculate Course Price" API step

    Given I execute "Edit Course" reusable step
    When I click on the "Activate" "Product Factory button"
    Then I should see the "Could not find Digital Content for the Course" message

  @Positive @P1 #TC-3184
  Scenario: Change Sitting In The Active Course to One That Has Digital Content
    And I execute "Create Sitting" reusable step replacing some steps
      |4|I set "SittingNameTwo[######]" text to the "Name" "Product Factory text field"|
    And I execute "Create Pricing Matrix" reusable step replacing some steps
      |8|I click on the "EC_SITTING_NAME_TWO" "Product Factory change modal option"|
    And I execute "Create Pricing Matrix Full" reusable step replacing some steps
      |3|I click on the "EC_SITTING_NAME_TWO" "Product Factory edit button"|
    Given I execute "Create Digital Content" reusable step replacing some steps
      |15|I "check" "EC_SITTING_NAME_TWO" "Product Factory dialog checkbox"|
    Then I execute "Create Course" reusable step
    Then I execute "Create Course Instance" reusable step
    When I click on the "EC_LOCATION_NAME" "Product Factory course instance sessions dropdown button"
    And I click on the "EC_LOCATION_NAME" "Product Factory Session Dates button"
    And I fill the "Product Factory Session Dates Popup Date Input Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Input Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Input Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"
    And I click on the "Product Factory Change Course Step Due Date" button
    And I set "[TODAY]" text to the "Due Date" "Product Factory text field"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"
    When I click on the "Activate" "Product Factory button"
    And I should see the "Deactivate" "Product Factory button"
    And I click on the "EC_LOCATION_NAME" "Product Factory course instance Activate button"
    And I shouldn't see the "EC_LOCATION_NAME" "Product Factory course instance Delete button"
    When I click on the "EC_SITTING_NAME" "Product Factory edit button"
    And I click on the "EC_SITTING_NAME_TWO" "Product Factory select button"
    Then I shouldn't see the "Could not find Digital Content for the Course" message

  @Negative @P1 #TC-3185
  Scenario: Change Sitting In The Active Course to One Without Digital Content
    And I execute "Remember Variables Two" reusable step

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
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Client" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Digital Content" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Change Instance Capacity" API step with parameters
      |capacity|15|
    And I execute "Get Instance Sessions" API step
    And I execute "Change Session Timings" API step
    And I execute "Get Instance Steps" API step
    And I execute "Change Step Due Date" API step
    And I execute "Calculate Course Price" API step
    Then I execute "Activate Course" API step
    And I execute "Activate Instance" API step

    Given I execute "Edit Course" reusable step replacing some steps
      |3|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
      |5|I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory edit button"                             |
    Then I execute "Keep the Course Activated" reusable step
    When I click on the "EC_SITTING_NAME_TWO" "Product Factory edit button"
    And I click on the "EC_SITTING_NAME" "Product Factory select button"
    Then I should see the "Could not find Digital Content for the Course" message