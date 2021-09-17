@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Body item
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |

  @FinancialDimensionBodyDuplicate #TC-1542
  Scenario: Create Financial Dimension record Body item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    Then I execute negative "Create Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Body'" and parameters
      |code         |EC_BODY_FINANCIAL_DIMENSION_CODE|
      |dimensionType|PRODUCT|
      |target       |BODY   |

  @FinancialDimension @Duplicate #TC-1543
  Scenario: Update created Financial Dimension record Body item
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    Then I execute "Update Financial Dimension" API step with parameters
      |reference|EC_BODY_FINANCIAL_DIMENSION_REFERENCE|

  @FinancialDimension @Duplicate #TC-1544
  Scenario: Update created Financial Dimension record Body item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_TWO_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    Then I execute negative "Update Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Body'" and parameters
      |reference|EC_BODY_FINANCIAL_DIMENSION_REFERENCE|
      |code|EC_BODY_TWO_FINANCIAL_DIMENSION_CODE|