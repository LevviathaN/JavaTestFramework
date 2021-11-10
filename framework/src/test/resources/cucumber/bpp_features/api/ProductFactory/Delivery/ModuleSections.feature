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

  @ModuleSection #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of Module Section record changes
    Given I execute "Create Programme" API step
    And I execute "Create Class Category" API step
    Then I execute "Create Cohort" API step
    Then I execute "Create Cohort" API step saving as "SECOND_"
    And I execute "Create Module" API step
    And I verify that "[TIMENOW-OHB-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_MODULE_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_MODULE_CREATED_BY" element
    And I verify that "EC_MODULE_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_MODULE_UPDATED_BY" element "equal" to "null" element
    And I execute "Update Module" API step with parameters
      |cohortReferences|EC_SECOND_COHORT_REFERENCE|
    And I verify that "~Second[TIMENOW-OHB-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_UPDATE_MODULE_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_UPDATE_MODULE_UPDATED_BY" element