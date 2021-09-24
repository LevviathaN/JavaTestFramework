@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Location item
    Given I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|

  @FinancialDimension @Duplicate #TC-1542
  Scenario: Create Financial Dimension record Location item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    Then I execute negative "Create Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Location'" and parameters
      |code         |EC_LOCATION_FINANCIAL_DIMENSION_CODE|
      |dimensionType|PRODUCT |
      |target       |LOCATION|

  @FinancialDimension @Duplicate #TC-1543
  Scenario: Update created Financial Dimension record Location item
    Given I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    Then I execute "Update Financial Dimension" API step with parameters
      |reference|EC_LOCATION_FINANCIAL_DIMENSION_REFERENCE|

  @FinancialDimension @Duplicate #TC-1544
  Scenario: Update created Financial Dimension record Location item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    Given I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_TWO_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    Then I execute negative "Update Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Location'" and parameters
      |reference|EC_LOCATION_FINANCIAL_DIMENSION_REFERENCE|
      |code|EC_LOCATION_TWO_FINANCIAL_DIMENSION_CODE|