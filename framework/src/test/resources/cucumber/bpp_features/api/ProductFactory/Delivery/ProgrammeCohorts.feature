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

  @ProgrammeCohorts #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of Programme Cohort record changes
    Given I execute "Create Programme" API step
    And I execute "Create Class Category" API step
    Then I execute "Create Cohort" API step
    And I transform "[TIMENOW-PLUS-0HOURS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd'T'HH:mm" pattern saving value as "EC_TIME_NOW_ONE"
    And I verify that "EC_TIME_NOW_ONE" element "contains" to "EC_PROGRAMME_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_PROGRAMME_CREATED_BY" element
    And I verify that "EC_PROGRAMME_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_PROGRAMME_UPDATED_BY" element "equal" to "null" element
    And I execute "Update Cohort" API step
    And I transform "[TIMENOW-PLUS-0HOURS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd'T'HH:mm" pattern saving value as "EC_TIME_NOW_TWO"
    And I verify that "EC_TIME_NOW_TWO" element "contains" to "EC_COHORT_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_COHORT_UPDATED_BY" element