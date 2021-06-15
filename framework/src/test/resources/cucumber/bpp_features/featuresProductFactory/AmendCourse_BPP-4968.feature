@ProductFactory @Courses @Amend
Feature: Course - Update Instances for non draft Courses - BPP-4968
  As a Product Setter
  I want to be able to update a Course Instance for a non draft Course
  So that the Course published AWS notification is published for consumption by the middleware.

  Background:
    Given I execute "Generate ISBN" reusable step
    Given I execute "Log In" reusable step
    And I execute "Remember Variables For Creation " reusable step

    And I execute "Create Location" reusable step replacing some steps
      |4|I set "LocationNameTwo[######]" text to the "Name" "Product Factory text field"|
      |5|I set "LocationAddressTwo[######]" text to the "Address Line 1" "Product Factory text field"|
      |11|I should see the "EC_LOCATION_NAME_TWO" element|
    And I execute "Create Location" reusable step replacing some steps
      |4|I set "LocationNameThree[######]" text to the "Name" "Product Factory text field"|
      |5|I set "LocationAddressThree[######]" text to the "Address Line 1" "Product Factory text field"|
      |11|I should see the "EC_LOCATION_NAME_THREE" element|


  @Positive @P1 #TC-2406
  Scenario: Amend Non Draft Course Instance
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    Then I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory edit button"


#    # delete all instances
#    When For each "EC_SESSION_DURATION_DESCRIPTION" "Product Factory Course Instance Delete button":
#      |I click on the "EC_SESSION_DURATION_DESCRIPTION" "Product Factory Course Instance Delete button"|
#      |I click on the "Yes" "Product Factory button"|
#      |I wait for "3" seconds                       |

    # delete all materials
    Given I click on the "Materials" element
    When For each "Product Factory Delete Course Material button" element:
      |I click on the "Product Factory Delete Course Material button" element|
      |I click on the "Yes" "Product Factory button"|
      |I wait for "3" seconds                       |
    And I shouldn't see the "Product Factory Delete Course Material button" element
    Then I click on the "Instances" element

    Then I execute "Create Course Instance" reusable step if "EC_LOCATION_NAME" ""
    And I execute "Populate Course Instance Session Dates" reusable step
    And I execute "Populate Course Instance Step Due Dates" reusable step

    Then I execute "Keep the Course Activated" reusable step
    And I should see the "Deactivate" "Product Factory button"
    Then I execute "Keep the Course Instance Activated" reusable step
    And I shouldn't see the "EC_LOCATION_NAME" "Product Factory course instance Delete button"

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory edit button"
    When I click on the "EC_LOCATION_NAME" "Product Factory course instance sessions dropdown button"
    Then I should see the "Default Location" "Product Factory edit button"
    And I should see the "Capacity" "Product Factory edit button"
    And I should see the "Stream" "Product Factory edit button"
    And I should see the "EC_LOCATION_NAME" "Product Factory edit button"
    And I should see the "EC_LOCATION_NAME" "Product Factory Session Dates button"
    And I shouldn't see the "Default Session Duration" "Product Factory edit button"
    And I shouldn't see the "EC_SESSION_DURATION_DESCRIPTION" "Product Factory edit button"

#    And Attribute "tabindex" of "EC_LOCATION_NAME" "Product Factory course instance Publish button" should have value "-1"
    When I click on the "Default Location" "Product Factory edit button"
    And I click on the "EC_LOCATION_NAME_TWO" "Product Factory select button"
    And I click on the "No" "Product Factory button"

    When I click on the "Capacity" "Product Factory edit button"
    And I set "2" text to the "Capacity" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    And Attribute "tabindex" of "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button" should have value "0"
    And I click on the "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    Then Attribute "tabindex" of "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button" should have value "-1"

    When I click on the "Stream" "Product Factory edit button"
    And I click on the "EC_STREAM_NAME" "Product Factory select button"
    And Attribute "tabindex" of "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button" should have value "0"
    And I click on the "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    Then Attribute "tabindex" of "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button" should have value "-1"

    When I click on the "EC_LOCATION_NAME" "Product Factory edit button"
    And I click on the "EC_LOCATION_NAME_TWO" "Product Factory select button"
    And Attribute "tabindex" of "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button" should have value "0"
    And I click on the "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    Then Attribute "tabindex" of "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button" should have value "-1"

    When I click on the "EC_LOCATION_NAME_TWO" "Product Factory Session Dates button"
    And I fill the "Product Factory Session Dates Popup Start Time Input Field" field with "PM"
    And I fill the "Product Factory Session Dates Popup End Time Input Field" field with "PM"
    And I click on the "Next" "Product Factory button"
    Then I should see the "15:00:00" "element"
    Then I should see the "16:00:00" "element"
    And I click on the "Finish" "Product Factory button"
    And I click on the "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    Then Attribute "tabindex" of "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button" should have value "-1"

  @Positive @P2 #TC-2407
  Scenario: Amend Non Draft Course Instance Additional Scenario
    And I execute "Create Course" reusable step replacing some steps
      |14|I set "2" text to the "Number of Sessions" "Product Factory text field"|
    Then I execute "Create Course Instance" reusable step

    #Create second instance
    Then I click on the "Create" "Product Factory button"
    And I click on the "Default Session Duration" "Product Factory dropdown"
    And I click on the "EC_SESSION_DURATION_DESCRIPTION_TWO_DATES" "Product Factory dropdown option"
    And I click on the "Default Location" "Product Factory dropdown"
    And I click on the "EC_LOCATION_NAME_THREE" "Product Factory dropdown option"
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
    And I click on the "EC_LOCATION_NAME_TWO" "Product Factory select button"
    And I click on the "No" "Product Factory button"

    #Edit capacity of first instance
    When I click on the "Capacity" "Product Factory edit button"
    And I set "2" text to the "Capacity" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    And Attribute "tabindex" of "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button" should have value "0"
    And I click on the "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    Then Attribute "tabindex" of "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button" should have value "-1"

    #Edit stream of first instance
    When I click on the "Stream" "Product Factory edit button"
    And I click on the "EC_STREAM_NAME" "Product Factory select button"
    And Attribute "tabindex" of "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button" should have value "0"
    And I click on the "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    Then Attribute "tabindex" of "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button" should have value "-1"

    #Edit location name of first instance
    Then I click on the "EC_LOCATION_NAME_TWO" "Product Factory course instance sessions dropdown button"
    When I click on the "EC_LOCATION_NAME" "Product Factory edit button"
    And I click on the "EC_LOCATION_NAME_TWO" "Product Factory select button"
    And I wait for "5" seconds
    And Attribute "tabindex" of "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button" should have value "0"
    And I click on the "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    And I wait for "5" seconds
    #todo potential bug button dont become inactive
    Then Attribute "tabindex" of "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button" should have value "-1"

    #Edit session dates of first instance
    When I click on the "EC_LOCATION_NAME_TWO" "Product Factory Session Dates button"
    And I set "PM" text to the "1" "Product Factory Session Dates Popup Start Time Input Field"
    And I set "PM" text to the "1" "Product Factory Session Dates Popup End Time Input Field"
    And I click on the "Next" "Product Factory button"
    And I set "PM" text to the "1" "Product Factory Session Two Dates Popup Start Time Input Field"
    And I set "PM" text to the "1" "Product Factory Session Two Dates Popup End Time Input Field"
    And I click on the "Next" "Product Factory button"
    Then I should see the "15:00:00" "element"
    Then I should see the "16:00:00" "element"
    And I click on the "Finish" "Product Factory button"
    And I click on the "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    And I wait for "5" seconds
    Then Attribute "tabindex" of "EC_LOCATION_NAME_TWO" "Product Factory course instance Publish button" should have value "-1"
