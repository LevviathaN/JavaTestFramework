@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @CourseType #TC-701
  Scenario: Add a New Course Type Using a Modal
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step

  @CourseType @Incomplete #TC-700
  Scenario: Submitting Incomplete Course Type Fields
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute negative "Create Course Type" API step with error name "The Description field is required." and parameters
      |description                          ||
    Then I execute negative "Create Course Type" API step with error name "Variable `$command` got invalid value." and parameters
      |vatRuleReference                     ||
    Then I execute negative "Create Course Type" API step with error name "Variable `$command` got invalid value." and parameters
      |costCentreFinancialDimensionReference||
    Then I execute negative "Create Course Type" API step with error name "Variable `$command` got invalid value." and parameters
      |projectFinancialDimensionReference   ||

  @CourseType @Update #TC-1546
  Scenario: Amend a Course Type Using a Modal
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    Then I execute "Create Course Type" API step
    And I execute "Update Course Type" API step

  @CourseType @Duplicate @Update #TC-1546
  Scenario: Amend a Course Type Where Short Name Already Exists
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Course Type" API step with parameters
      |description|ApiCourseTypeDescriptionTwo[####]|
    Then I execute negative "Update Course Type" API step with error name "qw" and parameters
      |description|EC_API_COURSE_TYPE_DESCRIPTION_TWO|