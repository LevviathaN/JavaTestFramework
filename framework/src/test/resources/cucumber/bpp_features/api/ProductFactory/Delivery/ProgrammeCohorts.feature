@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @ProgrammeCohorts #TC-5391
  Scenario: Add a New Programme Cohort Using a Modal
    Given I execute "Create Programme" API step
    And I execute "Create Class Category" API step
    Then I execute "Create Cohort" API step

  @ProgrammeCohorts @Update #TC-5392
  Scenario: Amend a Programme Cohort Using a Modal
    Given I execute "Create Programme" API step
    And I execute "Create Class Category" API step
    Then I execute "Create Cohort" API step
    And I execute "Update Cohort" API step

  @ProgrammeCohortsDuplicate #TC-5401
  Scenario: Create Duplicate of Existing Programme Cohort
    Given I execute "Create Programme" API step
    And I execute "Create Class Category" API step
    And I execute "Create Cohort" API step
    Then I execute negative "Create Cohort" API step with error name "Name must be unique" and parameters
      |name|EC_COHORT_NAME|