@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @MaterialType #TC-1435
  Scenario: Add a New Material Type Using a Modal
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    Then I execute "Create Material Type" API step

  @MaterialType @Duplicate #TC-1436
  Scenario: Add a Material Type Where Name Already Exists
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    Then I execute "Create Material Type" API step
    Then I execute negative "Create Material Type" API step with error name "Name must be unique" and parameters
      |name|EC_MATERIAL_TYPE_NAME|

  @MaterialType #TC-
  Scenario: Amend Material Type
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    Then I execute "Create Material Type" API step
    Then I execute "Update Material Type" API step

  @MaterialType #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of Material Type record changes
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    Then I execute "Create Material Type" API step
    And I verify that "[TIMENOW-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_MATERIAL_TYPE_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_MATERIAL_TYPE_CREATED_BY" element
    And I verify that "EC_MATERIAL_TYPE_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_MATERIAL_TYPE_UPDATED_BY" element "equal" to "null" element
    Then I execute "Update Material Type" API step
    And I verify that "~Second[TIMENOW-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_MATERIAL_TYPE_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_MATERIAL_TYPE_UPDATED_BY" element