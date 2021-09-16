@PF-FD-SETUP
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @ChangeMaterialFinancialDimension #Only once. If Material is created will cause an error: Material have already created, so you cannot change the Course Financial Dimensions
  Scenario: Attach Financial Dimension to Material
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_LEGAL_ENTITY_"
      |dimensionType|LEGALENTITY|
      |target       |MATERIAL   |
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |MATERIAL  |
    Then I execute "Change Material Financial Dimensions" API step

  @ChangeMaterialFinancialDimension #Only once
  Scenario: Edit FD Code on Materials Page
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_LEGAL_ENTITY_EDIT_"
      |dimensionType|LEGALENTITY|
      |target       |MATERIAL   |
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_COST_CENTRE_EDIT_"
      |dimensionType|COSTCENTRE|
      |target       |MATERIAL  |
    Then I execute "Change Material Financial Dimensions" API step with parameters
      |entityFinancialDimensionReference|EC_MATERIAL_LEGAL_ENTITY_EDIT_FINANCIAL_DIMENSION_REFERENCE|
      |revenueFinancialDimensionReference|EC_MATERIAL_COST_CENTRE_EDIT_FINANCIAL_DIMENSION_REFERENCE|

  @ChangeCourseFinancialDimension #Only once. If Course is created will cause an error: Courses have already created, so you cannot change the Course Financial Dimensions
  Scenario: Attach Financial Dimension to Course
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_LEGAL_ENTITY_"
      |dimensionType|LEGALENTITY|
      |target       |COURSE     |
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSE    |
    Then I execute "Change Course Financial Dimensions" API step

  @ChangeMaterialFinancialDimension @BET #Only once
  Scenario: Edit FD Code on Courses Page
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_LEGAL_ENTITY_EDIT_"
      |dimensionType|LEGALENTITY|
      |target       |COURSE     |
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_COST_CENTRE_EDIT_"
      |dimensionType|COSTCENTRE|
      |target       |COURSE    |
    Then I execute "Change Material Financial Dimensions" API step with parameters
      |entityFinancialDimensionReference|EC_COURSE_LEGAL_ENTITY_EDIT_FINANCIAL_DIMENSION_REFERENCE|
      |revenueFinancialDimensionReference|EC_COURSE_COST_CENTRE_EDIT_FINANCIAL_DIMENSION_REFERENCE|