@ProductFactory @Courses @Amend
Feature: Course - Update Instances for non draft Courses - BPP-4968
  As a Product Setter
  I want to be able to update a Course Instance for a non draft Course
  So that the Course published AWS notification is published for consumption by the middleware.

  Background:
    Given I execute "Generate ISBN" reusable step
    Given I execute "Log In" reusable step

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
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Digital Content" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Location" API step with parameters saving as "TWO_"
      |name        |LocationNameTwo[######]   |
      |addressLine1|LocationAddressTwo[######]|
    And I execute "Create Location" API step with parameters saving as "THREE_"
      |name        |LocationNameThree[######]   |
      |addressLine1|LocationAddressThree[######]|
    And I execute "Create Session Duration" API step
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Stream" API step


    And I execute "Remember Variables Two" reusable step


  @Positive @P1 @HappyPath #TC-2406
  Scenario: Amend Non Draft Course Instance
    And I execute "Create Course" API step
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

    Given I execute "Edit Course" reusable step

    #Verify edit buttons presence
    When I click on the "EC_LOCATION_NAME" "Product Factory course instance sessions dropdown button"
    Then I should see the "Default Location" "Product Factory edit button"
    And I should see the "Capacity" "Product Factory edit button"
    And I should see the "Stream" "Product Factory edit button"
    And I should see the "EC_LOCATION_NAME" "Product Factory edit button"
    And I should see the "EC_LOCATION_NAME" "Product Factory Session Dates button"
    And I shouldn't see the "Default Session Duration" "Product Factory edit button"
    And I shouldn't see the "EC_SESSION_DURATION_DESCRIPTION" "Product Factory edit button"

    When I click on the "Default Location" "Product Factory edit button"
    And I click on the "EC_TWO_LOCATION_NAME" "Product Factory select button"
    And I click on the "No" "Product Factory button"

    #Edit Capacity and publish changes
    When I click on the "Capacity" "Product Factory edit button"
    And I set "2" text to the "Capacity" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    And Attribute "tabindex" of "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button" should have value "0"
    And I click on the "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    Then Attribute "tabindex" of "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button" should have value "-1"

    #Edit Stream and publish changes
    When I click on the "Stream" "Product Factory edit button"
    And I click on the "EC_STREAM_NAME_TWO" "Product Factory select button"
    And Attribute "tabindex" of "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button" should have value "0"
    And I click on the "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    Then Attribute "tabindex" of "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button" should have value "-1"

    #Edit Location and publish changes
    When I click on the "EC_LOCATION_NAME" "Product Factory edit button"
    And I click on the "EC_TWO_LOCATION_NAME" "Product Factory select button"
    And Attribute "tabindex" of "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button" should have value "0"
    And I click on the "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    Then Attribute "tabindex" of "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button" should have value "-1"

    #Edit Session Dates and publish changes
    When I click on the "EC_TWO_LOCATION_NAME" "Product Factory Session Dates button"
    And I fill the "Product Factory Session Dates Popup Start Time Input Field" field with "AM"
    And I fill the "Product Factory Session Dates Popup End Time Input Field" field with "AM"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"
    And I click on the "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    Then Attribute "tabindex" of "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button" should have value "-1"


  @Positive @P2 #TC-2407
  Scenario: Amend Non Draft Course Instance Additional Scenario
    And I execute "Create Course" reusable step replacing some steps
      |14|I set "2" text to the "Number of Sessions" "Product Factory text field"|
    Then I execute "Create Course Instance" reusable step

    #Create second instance
    Then I click on the "Create" "Product Factory button"
    And I click on the "Default Session Duration" "Product Factory dropdown"
    And I click on the "EC_TWO_DATES_SESSION_DURATION_DESCRIPTION_TWO" "Product Factory dropdown option"
    And I click on the "Default Location" "Product Factory dropdown"
    And I click on the "EC_THREE_LOCATION_NAME" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"

    #Set session dates for both sessions of first instance
    When I click on the "EC_LOCATION_NAME" "Product Factory course instance sessions dropdown button"
    And I click on the "EC_LOCATION_NAME" "Product Factory Session Dates button"
    And I set "EC_SITTING_START_DATE" text to the "1" "Product Factory Session Dates Popup Date Input Field"
    And I set "03:00AM" text to the "1" "Product Factory Session Dates Popup Start Time Input Field"
    And I set "04:00AM" text to the "1" "Product Factory Session Dates Popup End Time Input Field"
    And I click on the "Next" "Product Factory button"
    And I set "EC_SITTING_START_DATE" text to the "1" "Product Factory Session Two Dates Popup Date Input Field"
    And I set "03:00AM" text to the "1" "Product Factory Session Two Dates Popup Start Time Input Field"
    And I set "04:00AM" text to the "1" "Product Factory Session Two Dates Popup End Time Input Field"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"

    And I click on the "1" "Product Factory Change Course Step Due Date button"
    And I set "[TODAY]" text to the "Due Date" "Product Factory text field"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"
    Then I click on the "EC_LOCATION_NAME" "Product Factory course instance sessions dropdown button"

    #Set session dates for both sessions of second instance
    When I click on the "EC_LOCATION_NAME_THREE" "Product Factory course instance sessions dropdown button"
    And I click on the "EC_LOCATION_NAME_THREE" "Product Factory Session Dates button"
    And I set "EC_SITTING_START_DATE" text to the "1" "Product Factory Session Dates Popup Date Input Field"
    And I set "03:00AM" text to the "1" "Product Factory Session Dates Popup Start Time Input Field"
    And I set "04:00AM" text to the "1" "Product Factory Session Dates Popup End Time Input Field"
    And I set "EC_SITTING_START_DATE" text to the "2" "Product Factory Session Dates Popup Date Input Field"
    And I set "03:00AM" text to the "2" "Product Factory Session Dates Popup Start Time Input Field"
    And I set "04:00AM" text to the "2" "Product Factory Session Dates Popup End Time Input Field"
    And I click on the "Next" "Product Factory button"
    And I set "EC_SITTING_START_DATE" text to the "1" "Product Factory Session Two Dates Popup Date Input Field"
    And I set "03:00AM" text to the "1" "Product Factory Session Two Dates Popup Start Time Input Field"
    And I set "04:00AM" text to the "1" "Product Factory Session Two Dates Popup End Time Input Field"
    And I set "EC_SITTING_START_DATE" text to the "2" "Product Factory Session Two Dates Popup Date Input Field"
    And I set "03:00AM" text to the "2" "Product Factory Session Two Dates Popup Start Time Input Field"
    And I set "04:00AM" text to the "2" "Product Factory Session Two Dates Popup End Time Input Field"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"

    And I click on the "2" "Product Factory Change Course Step Due Date button"
    And I set "[TODAY]" text to the "Due Date" "Product Factory text field"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"

    #Activate course and instances
    Then I click on the "Activate" "Product Factory button"
    And I should see the "Deactivate" "Product Factory button"
    And I click on the "EC_LOCATION_NAME" "Product Factory course instance Activate button"
    And I shouldn't see the "EC_LOCATION_NAME" "Product Factory course instance Delete button"
    And I click on the "EC_LOCATION_NAME_THREE" "Product Factory course instance Activate button"
    And I shouldn't see the "EC_LOCATION_NAME_THREE" "Product Factory course instance Delete button"

    #Verify absence of Course edit buttons
#    When I click on the "Products" "Product Factory navigation item"
#    When I click on the "Courses" "Product Factory navigation sub item"
#    And I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
#    And I click on the "submit" "element by type"
#    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    Then I should see the "Default Location" "Product Factory edit button"
    And I should see the "Capacity" "Product Factory edit button"
    And I should see the "Stream" "Product Factory edit button"

    #Verify absence of first instance edit buttons
    When I click on the "EC_LOCATION_NAME" "Product Factory course instance sessions dropdown button"
    And I should see the "EC_LOCATION_NAME" "Product Factory edit button"
    And I should see the "EC_LOCATION_NAME" "Product Factory Session Dates button"
    And I shouldn't see the "Default Session Duration" "Product Factory edit button"
    And I shouldn't see the "EC_SESSION_DURATION_DESCRIPTION" "Product Factory edit button"
    Then I click on the "EC_LOCATION_NAME" "Product Factory course instance sessions dropdown button"

    #Verify absence of second instance edit buttons
#    When I click on the "EC_LOCATION_NAME_THREE" "Product Factory course instance sessions dropdown button"
    And I should see the "EC_LOCATION_NAME_THREE" "Product Factory edit button"
    And I should see the "EC_LOCATION_NAME_THREE" "Product Factory Session Dates button"
    And I shouldn't see the "Default Session Duration" "Product Factory edit button"
    And I shouldn't see the "EC_SESSION_DURATION_DESCRIPTION" "Product Factory edit button"
    Then I click on the "EC_LOCATION_NAME_THREE" "Product Factory course instance sessions dropdown button"

    #Edit default location of first instance
    And Attribute "tabindex" of "EC_LOCATION_NAME" "Product Factory course instance Publish button" should have value "-1"
    When I click on the "Default Location" "Product Factory edit button"
    And I click on the "EC_TWO_LOCATION_NAME" "Product Factory select button"
    And I click on the "No" "Product Factory button"

    #Edit capacity of first instance
    When I click on the "Capacity" "Product Factory edit button"
    And I set "2" text to the "Capacity" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    And Attribute "tabindex" of "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button" should have value "0"
    And I click on the "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    Then Attribute "tabindex" of "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button" should have value "-1"

    #Edit stream of first instance
    When I click on the "Stream" "Product Factory edit button"
    And I click on the "EC_STREAM_NAME" "Product Factory select button"
    And Attribute "tabindex" of "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button" should have value "0"
    And I click on the "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    Then Attribute "tabindex" of "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button" should have value "-1"

    #Edit location name of first instance
    Then I click on the "EC_TWO_LOCATION_NAME" "Product Factory course instance sessions dropdown button"
    When I click on the "EC_LOCATION_NAME" "Product Factory edit button"
    And I click on the "EC_TWO_LOCATION_NAME" "Product Factory select button"
    And I wait for "5" seconds
    And Attribute "tabindex" of "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button" should have value "0"
    And I click on the "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    And I wait for "5" seconds
    #todo potential bug button dont become inactive
    Then Attribute "tabindex" of "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button" should have value "-1"

    #Edit session dates of first instance
    When I click on the "EC_TWO_LOCATION_NAME" "Product Factory Session Dates button"
    And I set "PM" text to the "1" "Product Factory Session Dates Popup Start Time Input Field"
    And I set "PM" text to the "1" "Product Factory Session Dates Popup End Time Input Field"
    And I click on the "Next" "Product Factory button"
    And I set "PM" text to the "1" "Product Factory Session Two Dates Popup Start Time Input Field"
    And I set "PM" text to the "1" "Product Factory Session Two Dates Popup End Time Input Field"
    And I click on the "Next" "Product Factory button"
    Then I should see the "15:00:00" "element"
    Then I should see the "16:00:00" "element"
    And I click on the "Finish" "Product Factory button"
    And I click on the "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    And I wait for "5" seconds
    Then Attribute "tabindex" of "EC_TWO_LOCATION_NAME" "Product Factory course instance Publish button" should have value "-1"
