@ProductFactory @FinancialDimensions @CourseTypes
Feature: Financial Dimension - Select Course Type Codes - BPP-2496
  As a Senior Product Setter
  I want to be able to select 2 Financial Dimensions on an individual Course Type
  so that I can track both the "AX Cost Centre" and "AX Project" codes for accounting purposes.

  Background:
    Given I execute "Generate ISBN" reusable step
    Given I execute "Log In" reusable step
    And I execute "Remember Variables For Creation " reusable step
    And I remember "AutoCourseTypeFDCodeTwo" text as "EC_COURSE_TYPE_FD_CODE_TWO" variable
    And I remember "AutoCourseTypeFDDescriptionTwo" text as "EC_COURSE_TYPE_FD_DESCRIPTION_TWO" variable
    And I execute "Create Course Type Financial Dimension" reusable step replacing some steps
    |4|I set "CourseTypeFDCodeThree[######]" text to the "Code" "Product Factory text field"|
    |5|I set "CourseTypeFDDescriptionThree[######]" text to the "Description" "Product Factory text field"|

  @Negative @Regression @P1 #TC-1772
  Scenario: Edit Financial Dimension for the Course Type that is in use
    When I click on the "Types" "Product Factory navigation item"
    When I click on the "Course Types" "Product Factory navigation sub item"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    When I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory edit button"
    And I wait for "4" seconds
    And I click on the "Cost Centre Financial Dimension" "Product Factory dropdown"
    And I click on the "EC_COURSE_TYPE_FD_CODE_TWO" "Product Factory dropdown option"
    And I click on the "Project Financial Dimension" "Product Factory dropdown"
    And I click on the "EC_COURSE_TYPE_FD_CODE_THREE" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "The Course Type is already linked to one or more Prices, so you cannot change the Course Type Financial Dimensions" element