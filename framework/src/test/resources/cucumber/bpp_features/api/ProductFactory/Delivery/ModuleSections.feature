@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @ModuleSection #TC-5407
  Scenario: Add a New Module Section Using a Modal
    Given I execute "Create Programme" API step
    And I execute "Create Class Category" API step
    Then I execute "Create Cohort" API step
    And I execute "Create Module" API step

  @ModuleSection @Duplicate #TC-5410
  Scenario: Create Duplicate of Existing Module Section
    Given I execute "Create Programme" API step
    And I execute "Create Class Category" API step
    Then I execute "Create Cohort" API step
    And I execute "Create Module" API step
    And I execute negative "Create Module" API step with error name "SIS Code, Term Code & CRN must be unique" and parameters
      |sisCode|EC_SIS_CODE|
      |termCode|EC_TERM_CODE|
      |referenceNumber|EC_CRN_CODE|
