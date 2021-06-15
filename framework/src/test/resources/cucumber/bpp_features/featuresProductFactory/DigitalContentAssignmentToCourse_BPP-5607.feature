@ProductFactory @DigitalContent
Feature: Digital Content Id - Assignment to Course - BPP-5607
  As a Product Setter
  I want a Digital Content Id assigned to a Course automatically but not created if there is no match
  so that only Digital Content Id that have been manually created are used.

  Background:
    Given I execute "Generate ISBN" reusable step
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

  @Negative @P1 @DoNotRun #TC-3183 todo temporary hard to implement
  Scenario: Create Course With No Matching Digital Content
    And I execute "Create Sitting" reusable step
    And I execute "Create Pricing Matrix" reusable step
    And I execute "Create Pricing Matrix Full" reusable step
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

  @Negative @P1 @DoNotRun #TC-3185 todo: temporary hard to implement
  Scenario: Change Sitting In The Active Course to One Without Digital Content
    And I execute "Create Sitting" reusable step replacing some steps
      |4|I set "SittingNameTwo[######]" text to the "Name" "Product Factory text field"|
    And I execute "Create Sitting" reusable step replacing some steps
      |4|I set "SittingNameThree[######]" text to the "Name" "Product Factory text field"|
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
    When I click on the "Activate" "Product Factory button"
    And I should see the "Deactivate" "Product Factory button"
    And I click on the "EC_LOCATION_NAME" "Product Factory course instance Activate button"
    And I shouldn't see the "EC_LOCATION_NAME" "Product Factory course instance Delete button"
    When I click on the "EC_SITTING_NAME" "Product Factory edit button"
    And I click on the "EC_SITTING_NAME_THREE" "Product Factory select button"
    Then I should see the "Could not find Digital Content for the Course" message