@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Region item
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |

  @FinancialDimension @Duplicate #TC-1542
  Scenario: Create Financial Dimension record Region item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT |
      |target       |REGION|
    Then I execute negative "Create Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Region'" and parameters
      |code         |EC_REGION_FINANCIAL_DIMENSION_CODE|
      |dimensionType|PRODUCT |
      |target       |REGION|

  @FinancialDimension @Duplicate @BET #TC-1544
  Scenario: Update created Financial Dimension record Region item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_TWO_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    Then I execute negative "Update Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Region'" and parameters
      |reference|EC_REGION_FINANCIAL_DIMENSION_REFERENCE|
      |code|EC_REGION_TWO_FINANCIAL_DIMENSION_CODE|

