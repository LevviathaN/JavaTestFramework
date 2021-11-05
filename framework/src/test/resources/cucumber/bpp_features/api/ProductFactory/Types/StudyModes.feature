@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @StudyMode #TC-4793
  Scenario: Add a New Study Mode Using a Modal
    Given I execute "Create Study Mode" API step

  @StudyMode @Update #TC-4795
  Scenario: Amend a Study Mode Using a Modal
    Given I execute "Create Study Mode" API step
    And I execute "Update Study Mode" API step

  @StudyMode @Duplicate #TC-4797
  Scenario: Add a Study Mode Where Name Already Exists
    Given I execute "Create Study Mode" API step
    And I execute negative "Create Study Mode" API step with error name "Name must be unique" and parameters
      |name|EC_API_STUDY_MODE_NAME|

  @StudyMode @Duplicate #TC-4798
  Scenario: Amend a Study Mode With the Name That Already Exists
    Given I execute "Create Study Mode" API step
    Given I execute "Create Study Mode" API step saving as "SECOND_"
    And I execute negative "Update Study Mode" API step with error name "Name must be unique" and parameters
      |name|EC_SECOND_STUDY_MODE_NAME|

  @StudyMode #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of Study Mode record changes
    Given I execute "Create Study Mode" API step
    And I verify that "[TIMENOW-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_STUDY_MODE_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_STUDY_MODE_CREATED_BY" element
    And I verify that "EC_STUDY_MODE_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_STUDY_MODE_UPDATED_BY" element "equal" to "null" element
    And I execute "Update Study Mode" API step
    And I verify that "~Second[TIMENOW-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_STUDY_MODE_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_STUDY_MODE_UPDATED_BY" element