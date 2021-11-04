@ProductFactory @Courses @Streams
Feature: Edit Instance - Streams - BPP-6518
  As a Product Setter
  I want the ability to specify the Stream on an Instance
  so that the relationship is made.

  Background:
    Given I execute "Generate ISBN" reusable step
    Given I execute "Log In" reusable step
    And I execute "Remember Variables For Creation Draft Course" reusable step
    And I remember "AutoStreamNameTwo" text as "EC_STREAM_NAME_TWO" variable

  @Positive @P1 @NotFinished @DoNotRun @CoveredWithAPI @NeedToBeUI #TC-2951, TC-2968
  Scenario: Add a Stream to Course Instance
    Given I execute "Create Course" reusable step
    Given I execute "Create Course Instance" reusable step
    Given I execute "Keep the Course Activated" reusable step
    Given I execute "Keep the Course Instance Activated" reusable step
    And I execute "Populate Course Instance Session Dates" reusable step
    And I execute "Populate Course Instance Step Due Dates" reusable step
    And I click on the "Stream" "Product Factory edit button"
    And I click on the "EC_STREAM_NAME" "Product Factory select button" if "EC_STREAM_NAME,Product Factory deselect button" "special element is absent"
    And I should see the "EC_STREAM_NAME" element
    Then I click on the "Delete" "Product Factory button title"
    And I click on the "Yes" "Product Factory button"

    Then I click on the "Create" "Product Factory button"
    And I click on the "Default Session Duration" "Product Factory dropdown"
    And I click on the "EC_SESSION_DURATION_DESCRIPTION" "Product Factory dropdown option"
    And I click on the "Default Location" "Product Factory dropdown"
    And I click on the "EC_LOCATION_NAME" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    And I execute "Populate Course Instance Session Dates" reusable step
    And I execute "Populate Course Instance Step Due Dates" reusable step
    And I click on the "Activate" "Product Factory button"

    And I click on the "Stream" "Product Factory edit button"
    And I click on the "EC_STREAM_NAME" "Product Factory select button"
    And I should see the "EC_STREAM_NAME" element
    And I click on the "Stream" "Product Factory edit button"
    And I click on the "EC_STREAM_NAME_TWO" "Product Factory select button" if "EC_STREAM_NAME_TWO,Product Factory deselect button" "special element is absent"
    And I should see the "EC_STREAM_NAME_TWO" element
    And I click on the "Stream" "Product Factory edit button"
    And I click on the "Deselect" "Product Factory button"
    And I shouldn't see the "EC_STREAM_NAME_TWO" "element"
    And I click on the "Stream" "Product Factory edit button"
    And I click on the "EC_STREAM_NAME" "Product Factory select button"
    And I should see the "EC_STREAM_NAME" element

    And I click on the "Publish" "Product Factory active button"
    And I click on the "Yes" "Product Factory button"
    When Browser performs "REFRESH" command
    And I should see the "EC_STREAM_NAME" element