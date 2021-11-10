@ProductFactory @CourseTypes @Amend
Feature: Amend Reference Data - Course Type - BPP-661
  As a Senior Product Setter
  I need to search for and Amend a Course Type
  so that I can modify the type of tuition on a Course

  Background:
    Given I execute "Log In" reusable step
    When I execute "Create Course Type Financial Dimension" reusable step
    And I execute "Create VAT Rule" reusable step
    Then I execute "Create Course Type" reusable step

  @Positive @Regression @P1 @PartiallyCoveredWithApi #TC-1546, TC-3616
  Scenario: Amend a Course Type Using a Modal
    When I click on the "Types" "Product Factory navigation item"
    When I click on the "Course Types" "Product Factory navigation sub item"
    When I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory edit button"
    And I set "CourseTypeDescriptionTwo[######]" text to the "Description" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    And I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_COURSE_TYPE_DESCRIPTION_TWO" element

  @Negative @P2 #TC-792
  Scenario: Submitting Unchanged Course Type Fields
    When I click on the "Types" "Product Factory navigation item"
    When I click on the "Course Types" "Product Factory navigation sub item"
    Then I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    When I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory edit button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

  @Negative @P2 #TC-794
  Scenario: Amend a Course Type Where Short Name Already Exists
    Given I execute "Create Course Type" reusable step replacing some steps
      |4|I set "CourseTypeDescriptionTwo[######]" text to the "Description" "Product Factory text field"|
      |13|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
      |15|I should see the "EC_COURSE_TYPE_DESCRIPTION_TWO" element                                         |
    When I click on the "Types" "Product Factory navigation item"
    When I click on the "Course Types" "Product Factory navigation sub item"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    When I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory edit button"
    And I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Description" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "Description must be unique" "message"