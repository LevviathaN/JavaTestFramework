@PF-FD-SETUP
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @ChangeMaterialFinancialDimension #Only once. If Material is created will cause an error: Material have already created, so you cannot change the Course Financial Dimensions
  Scenario: Attach Financial Dimension to Material
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_LEGAL_ENTITY"
      |dimensionType|LEGALENTITY|
      |target       |MATERIAL   |
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_COST_CENTRE"
      |dimensionType|COSTCENTRE|
      |target       |MATERIAL  |
    Then I execute "Change Material Financial Dimensions" API step

  @ChangeCourseFinancialDimension #Only once. If Course is created will cause an error: Courses have already created, so you cannot change the Course Financial Dimensions
  Scenario: Attach Financial Dimension to Course
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_LEGAL_ENTITY_"
      |dimensionType|LEGALENTITY|
      |target       |COURSE     |
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSE    |
    Then I execute "Change Course Financial Dimensions" API step