@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Course item
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_"
      |dimensionType|PRODUCT|
      |target       |COURSE |

  @FinancialDimension @Duplicate #TC-1542
  Scenario: Create Financial Dimension record Course item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_LEGAL_ENTITY_"
      |dimensionType|LEGALENTITY|
      |target       |COURSE     |
    Then I execute negative "Create Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Course'" and parameters
      |code         |EC_COURSE_LEGAL_ENTITY_FINANCIAL_DIMENSION_CODE|
      |dimensionType|LEGALENTITY|
      |target       |COURSE     |

  @FinancialDimension @Duplicate #TC-1543
  Scenario: Update created Financial Dimension record Course item
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_LEGAL_ENTITY_"
      |dimensionType|PRODUCT |
      |target       |MATERIAL|
    Then I execute "Update Financial Dimension" API step with parameters
      |reference|EC_COURSE_LEGAL_ENTITY_FINANCIAL_DIMENSION_REFERENCE|

  @FinancialDimension @Duplicate #TC-1544
  Scenario: Update created Financial Dimension record Course item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_LEGAL_ENTITY_"
      |dimensionType|LEGALENTITY|
      |target       |COURSE     |
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_LEGAL_ENTITY_TWO_"
      |dimensionType|LEGALENTITY|
      |target       |COURSE     |
    Then I execute negative "Update Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Course'" and parameters
      |reference|EC_COURSE_LEGAL_ENTITY_FINANCIAL_DIMENSION_REFERENCE|
      |code|EC_COURSE_LEGAL_ENTITY_TWO_FINANCIAL_DIMENSION_CODE|

  @ChangeCourseFinancialDimension #TC-1807
  Scenario: Verify that Financial Dimensions for Material or Course can not be changed after at least one item is created
    Given I generate new ISBN code saving as "EC_ISBN"
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      | dimensionType | PROJECT    |
      | target        | COURSETYPE |
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      | dimensionType | COSTCENTRE |
      | target        | COURSETYPE |
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      | dimensionType | PRODUCT |
      | target        | BODY    |
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      | dimensionType | PRODUCT |
      | target        | REGION  |
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      | dimensionType | PRODUCT  |
      | target        | LOCATION |
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      | dimensionType | PRODUCT      |
      | target        | MATERIALTYPE |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Vat Rule" API step saving as "SECOND_"
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
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_LE_NEW_"
      | dimensionType | LEGALENTITY |
      | target        | COURSE      |
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_CC_NEW_"
      | dimensionType | COSTCENTRE |
      | target        | COURSE     |
    Then I execute negative "Change Course Financial Dimensions" API step with error name "Courses have already created, so you cannot change the Course Financial Dimensions" and parameters
      | entityFinancialDimensionReference  | EC_COURSE_LE_NEW_FINANCIAL_DIMENSION_REFERENCE |
      | revenueFinancialDimensionReference | EC_COURSE_CC_NEW_FINANCIAL_DIMENSION_REFERENCE |
    And I execute "Create Stock Site" API step
    And I execute "Create Material Type" API step
    And I execute "Create Material" API step
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_LE_NEW_"
      | dimensionType | LEGALENTITY |
      | target        | MATERIAL    |
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_CC_NEW_"
      | dimensionType | COSTCENTRE |
      | target        | MATERIAL   |
    Then I execute negative "Change Material Financial Dimensions" API step with error name "Materials have already been created, so you cannot change the Material Financial Dimensions" and parameters
      | entityFinancialDimensionReference  | EC_MATERIAL_LE_NEW_FINANCIAL_DIMENSION_REFERENCE |
      | revenueFinancialDimensionReference | EC_MATERIAL_CC_NEW_FINANCIAL_DIMENSION_REFERENCE |



