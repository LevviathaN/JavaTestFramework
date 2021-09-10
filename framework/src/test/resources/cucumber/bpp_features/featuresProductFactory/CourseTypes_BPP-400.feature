@ProductFactory @CourseTypes @HappyPath
Feature: Reference Data - Course Type - BPP-400
  As a Senior Product Setter
  I need to be able to specify a Course Type
  So that I can identify the type of tuition on a Course

  Background:
    Given I execute "Log In" reusable step
    When I execute "Create Course Type Financial Dimension" reusable step
    Then I execute "Create VAT Rule" reusable step

  @Positive @Regression @P1 @CoveredWithApi #TC-701, TC-1720
  Scenario: Add a New Course Type Using a Modal
    Given I execute "Create Course Type" reusable step

  @Negative @P2 @CoveredWithApi #TC-700
  Scenario: Submitting Incomplete Course Type Fields
    When I click on the "Types" "Product Factory navigation item"
    When I click on the "Course Types" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

  @Negative @P2 #TC-702
  Scenario: Add a Course Type Where Description Already Exists
    And I remember "AutoCourseTypeDescription" text as "EC_COURSE_TYPE_DESCRIPTION" variable
    When I execute modified "Create Course Type" reusable step
      |4|Replace|I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Description" "Product Factory text field"|
      |12|Replace|I should see the "Description must be unique" "message"                                 |
      |13|Delete |                                                                                        |
      |14|Delete |                                                                                        |
      |15|Delete |                                                                                        |
      |16|Delete |                                                                                        |