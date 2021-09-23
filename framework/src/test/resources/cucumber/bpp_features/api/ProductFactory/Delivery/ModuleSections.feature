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

  @ModuleSection @Edit #TC-5409
  Scenario: Amend a Programme Module Section a Modal
    Given I execute "Create Programme" API step
    And I execute "Create Class Category" API step
    Then I execute "Create Cohort" API step
    Then I execute "Create Cohort" API step saving as "SECOND_"
    And I execute "Create Module" API step
    And I execute "Update Module" API step with parameters
      |cohortReferences|EC_SECOND_COHORT_REFERENCE|

  @ModuleSection @Duplicate #TC-5412
  Scenario: Amend Module Section With Duplicate Values
    Given I execute "Create Programme" API step
    And I execute "Create Class Category" API step
    Then I execute "Create Cohort" API step
    And I execute "Create Module" API step
    Given I execute "Create Programme" API step saving as "SECOND_"
    And I execute "Create Class Category" API step saving as "SECOND_"
    Then I execute "Create Cohort" API step with parameters saving as "SECOND_"
      |programmeReference|EC_SECOND_PROGRAMME_REFERENCE|
    And I execute "Create Module" API step with parameters saving as "SECOND_"
      |cohortReferences|EC_SECOND_COHORT_REFERENCE|
    And I execute negative "Update Module" API step with error name "SIS Code, Term Code & CRN must be unique" and parameters
      |sisCode|EC_SECOND_MODULE_SIS_CODE|
      |termCode|EC_SECOND_MODULE_TERM_CODE|
      |referenceNumber|EC_SECOND_MODULE_REFERENCE_NUMBER|