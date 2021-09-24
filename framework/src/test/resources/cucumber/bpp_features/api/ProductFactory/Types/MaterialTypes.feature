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