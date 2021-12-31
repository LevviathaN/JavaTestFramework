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
    And I execute negative "Update Region" API step with error name "The Region is already linked to one or more Locations, so you cannot change the Financial Dimension" and parameters
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

  @Region #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of Region record changes
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_TWO_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Region" API step
    And I verify that "[TIMENOW-OHB-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_REGION_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_REGION_CREATED_BY" element
    And I verify that "EC_REGION_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_REGION_UPDATED_BY" element "equal" to "null" element
    And I execute "Update Region" API step with parameters
      |financialDimensionReference|EC_REGION_TWO_FINANCIAL_DIMENSION_REFERENCE|
    And I verify that "~Second[TIMENOW-OHB-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_UPDATE_REGION_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_UPDATE_REGION_UPDATED_BY" element