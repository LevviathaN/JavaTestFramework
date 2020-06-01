@ProductFactory @DigitalContent
Feature: Digital Content Id - Multiple Course Types - BPP-7203
  As a Senior Product Setter
  I want to create Digital Content
  so that Course(s) can be given a Digital Content Id.

  Background:
    Given I execute "Log In" reusable step
    When I execute "Create Body Financial Dimension" reusable step
    And I execute "Create Body" reusable step
    And I execute "Create VAT Rule" reusable step
    And I execute "Create Course Type Financial Dimension" reusable step
    And I execute "Create Course Type" reusable step
    And I execute "Create Course Type" reusable step replacing some steps
      |4|I set "CourseTypeDescriptionTwo[######]" text to the "Description" "Product Factory text field"|
    And I execute "Create Location Financial Dimension" reusable step
    And I execute "Create Region Financial Dimension" reusable step
    And I execute "Create Region" reusable step
    And I execute "Create Location" reusable step
    And I execute "Create Level" reusable step
    And I execute "Create Paper" reusable step
    And I execute "Link Body To Level" reusable step
    And I execute "Link Body To Paper" reusable step
    And I execute "Link Paper To Level" reusable step
    And I execute "Create Sitting" reusable step
    And I execute "Create Sitting" reusable step replacing some steps
      |4|I set "SittingNameTwo[######]" text to the "Name" "Product Factory text field"|

  @Positive @P1 #TC-3203
  Scenario: Create Digital Content Multiple Course Types
    Given I execute "Create Digital Content" reusable step with some additional steps
      |14|I "check" "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory dialog checkbox"|
    Then I should see the "EC_BODY_SHORT_NAME" element

  @Negative @P1 #TC-3204
  Scenario: Create Digital Content Multiple Course Types Duplicate
    Given I execute "Create Digital Content" reusable step with some additional steps
      |14|I "check" "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory dialog checkbox"|
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I execute "Create Digital Content" reusable step with some additional steps
      |14|I "check" "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory dialog checkbox"|
    Then I should see the "Digital Content already exists" "text contained in element"

  @Positive @P1 #TC-3205, TC-3206
  Scenario: Create Digital Content Multiple Course Types Remove
    Given I execute "Create Digital Content" reusable step with some additional steps
      |11|I "check" "EC_SITTING_NAME_TWO" "Product Factory dialog checkbox"|
      |15|I "check" "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory dialog checkbox"|
    Then I should see the "EC_BODY_SHORT_NAME" element
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    And I click on the "Course Types" "Product Factory edit button"
    And I "check" "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory dialog checkbox"
    And I "check" "EC_COURSE_TYPE_DESCRIPTION" "Product Factory dialog checkbox"
    And I click on the "Save" "Product Factory active button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"
    And I click on the "Course Types" "Product Factory edit button"
    And I "check" "EC_COURSE_TYPE_DESCRIPTION" "Product Factory dialog checkbox"
    And I click on the "Save" "Product Factory active button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "0"