@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Material Type item
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|

  @FinancialDimension @Duplicate #TC-1542
  Scenario: Create Financial Dimension record Material Type item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    Then I execute negative "Create Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'MaterialType'" and parameters
      |code         |EC_MATERIAL_TYPE_FINANCIAL_DIMENSION_CODE|
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|

  @FinancialDimension @Duplicate #TC-1543
  Scenario: Update created Financial Dimension record Material Type item
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    Then I execute "Update Financial Dimension" API step with parameters
    |reference|EC_MATERIAL_TYPE_FINANCIAL_DIMENSION_REFERENCE|

  @FinancialDimension @Duplicate #TC-1544
  Scenario: Update created Financial Dimension record Material Type item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT      |
      |target       |MATERIALTYPE |
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_TWO_"
      |dimensionType|PRODUCT      |
      |target       |MATERIALTYPE |
    Then I execute negative "Update Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'MaterialType'" and parameters
      |reference|EC_MATERIAL_TYPE_FINANCIAL_DIMENSION_REFERENCE|
      |code|EC_MATERIAL_TYPE_TWO_FINANCIAL_DIMENSION_CODE|