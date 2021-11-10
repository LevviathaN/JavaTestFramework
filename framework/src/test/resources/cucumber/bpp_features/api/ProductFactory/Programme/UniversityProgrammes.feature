@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @UniversityProgrammes #TC-5387
  Scenario: Add a New Programme Using a Modal
    Given I execute "Create Programme" API step

  @UniversityProgrammes @Update #TC-5388
  Scenario: Amend a Programme Using a Modal
    Given I execute "Create Programme" API step
    Then I execute "Update Programme" API step

  @UniversityProgrammes @UpdateDuplicate #TC-5390
  Scenario: Amend Programme With Duplicate Values
    Given I execute "Create Programme" API step
    And I execute "Create Programme" API step saving as "SECOND_"
    Then I execute negative "Update Programme" API step with error name "Code must be unique" and parameters
      |reference|EC_SECOND_PROGRAMME_REFERENCE|
      |code|EC_PROGRAMME_CODE|

  @UniversityProgrammesDuplicate #TC-5389
  Scenario: Create Duplicate of Existing Programme
    Given I execute "Create Programme" API step
    Then I execute negative "Create Programme" API step with error name "Code must be unique" and parameters
      |code|EC_PROGRAMME_CODE|

  @UniversityProgrammes #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of University Programmes record changes
    Given I execute "Create Programme" API step
    And I verify that "[TIMENOW-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_PROGRAMME_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_PROGRAMME_CREATED_BY" element
    And I verify that "EC_PROGRAMME_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_PROGRAMME_UPDATED_BY" element "equal" to "null" element
    Then I execute "Update Programme" API step
    And I verify that "~Second[TIMENOW-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_PROGRAMME_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_PROGRAMME_UPDATED_BY" element