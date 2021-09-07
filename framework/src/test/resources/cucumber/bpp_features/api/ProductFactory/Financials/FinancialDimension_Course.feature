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