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

  @CourseType @Duplicate @Update #TC-
  Scenario: Amend a Course Type Where Description Already Exists
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
    And I execute "Create Course Type" API step saving as "SECOND_"
    Then I execute negative "Update Course Type" API step with error name "Description must be unique" and parameters
      |reference|EC_COURSE_TYPE_REFERENCE|
      |description|EC_SECOND_COURSE_TYPE_DESCRIPTION|

  @CourseType @CourseTypeInUse #TC-1772
  Scenario: Edit Financial Dimension for the Course Type that is in use
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_TWO_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
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
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Course" API step
    Then I execute negative "Update Course Type" API step with error name "The Course Type is already linked to one or more Courses, so you cannot change the VAT Rule or Financial Dimensions" and parameters
      |reference|EC_COURSE_TYPE_REFERENCE|
      |projectFinancialDimensionReference|EC_COURSE_TYPE_PROJECT_TWO_FINANCIAL_DIMENSION_REFERENCE|
