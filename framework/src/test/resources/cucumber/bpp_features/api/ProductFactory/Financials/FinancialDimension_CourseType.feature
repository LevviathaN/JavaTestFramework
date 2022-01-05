@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Course Type item
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|

  @FinancialDimension @Duplicate #TC-1542
  Scenario: Create Financial Dimension record Course Type item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    Then I execute negative "Create Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'CourseType'" and parameters
      |code         |EC_COURSE_TYPE_PROJECT_FINANCIAL_DIMENSION_CODE|
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|

  @FinancialDimension #TC-1543
  Scenario: Update created Financial Dimension record Course Type item
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    Then I execute "Update Financial Dimension" API step with parameters
      |reference|EC_COURSE_TYPE_PROJECT_FINANCIAL_DIMENSION_REFERENCE|

  @FinancialDimension @Duplicate #TC-1544
  Scenario: Update created Financial Dimension record Course Type item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT    |
      |target       |COURSETYPE |
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_TWO_"
      |dimensionType|PROJECT    |
      |target       |COURSETYPE |
    Then I execute negative "Update Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'CourseType'" and parameters
      |reference|EC_COURSE_TYPE_PROJECT_FINANCIAL_DIMENSION_REFERENCE|
      |code|EC_COURSE_TYPE_PROJECT_TWO_FINANCIAL_DIMENSION_CODE|