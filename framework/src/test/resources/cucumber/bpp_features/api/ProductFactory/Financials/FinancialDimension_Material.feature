@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Material item
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_"
      |dimensionType|PRODUCT  |
      |target       |MATERIAL |

  @FinancialDimension @Duplicate #TC-1542
  Scenario: Create Financial Dimension record Material item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_LEGAL_ENTITY_"
      |dimensionType|LEGALENTITY|
      |target       |MATERIAL   |
    Then I execute negative "Create Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Material'" and parameters
      |code         |EC_MATERIAL_LEGAL_ENTITY_FINANCIAL_DIMENSION_CODE|
      |dimensionType|LEGALENTITY|
      |target       |MATERIAL   |

  @FinancialDimension @Duplicate #TC-1543
  Scenario: Update created Financial Dimension record Material item
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_LEGAL_ENTITY_"
      |dimensionType|PRODUCT |
      |target       |MATERIAL|
    Then I execute "Update Financial Dimension" API step with parameters
      |reference|EC_MATERIAL_LEGAL_ENTITY_FINANCIAL_DIMENSION_REFERENCE|

  @FinancialDimension @Duplicate #TC-1544
  Scenario: Update created Financial Dimension record Material item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_LEGAL_ENTITY_"
      |dimensionType|LEGALENTITY|
      |target       |MATERIAL   |
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_LEGAL_ENTITY_TWO_"
      |dimensionType|LEGALENTITY|
      |target       |MATERIAL   |
    Then I execute negative "Update Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Material'" and parameters
      |reference|EC_MATERIAL_LEGAL_ENTITY_FINANCIAL_DIMENSION_REFERENCE|
      |code|EC_MATERIAL_LEGAL_ENTITY_TWO_FINANCIAL_DIMENSION_CODE|