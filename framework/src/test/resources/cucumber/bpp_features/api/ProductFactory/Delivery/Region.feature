@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @Region #TC-1875
  Scenario: Create new Region
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    Then I execute "Create Region" API step

  @Region @Duplicate #TC-1885
  Scenario: Create new Region with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    Then I execute "Create Region" API step
    Then I execute negative "Create Region" API step with error name "Name must be unique" and parameters
      |name|EC_REGION_NAME|

  @Region @Negative @Update #TC-1893
  Scenario: Edit Region that is in Use
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_TWO_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute negative "Update Region" API step with error name "The Region is already linked" and parameters
      |financialDimensionReference|EC_REGION_TWO_FINANCIAL_DIMENSION_REFERENCE|

  @Region @Negative @Update @Duplicate #TC-1902
  Scenario: Edit and save Region with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Region" API step
    And I execute "Create Region" API step saving as "TWO_"
    And I execute negative "Update Region" API step with error name "Name must be unique" and parameters
      |financialDimensionReference|EC_REGION_FINANCIAL_DIMENSION_REFERENCE|
      |name|EC_TWO_REGION_NAME|

  @Region @Negative @Update #TC-1901
  Scenario: Change Financial Dimension for created Region
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_NEW_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Region" API step
    And I execute "Update Region" API step with parameters
      |financialDimensionReference|EC_REGION_NEW_FINANCIAL_DIMENSION_REFERENCE|