@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @Streams #TC-2929
  Scenario: Add a New Stream Using a Modal
    Given I execute "Create Stream" API step

  @Streams @Update #TC-2931
  Scenario: Amend a Stream Using a Modal
    Given I execute "Create Stream" API step
    Then I execute "Update Stream" API step

  @Streams @Duplicate #TC-
  Scenario: Add a Stream Where Name Already Exists
    Given I execute "Create Stream" API step
    Then I execute negative "Create Stream" API step with error name "Name must be unique" and parameters
      |name|EC_STREAM_NAME|

  @Streams @Duplicate #TC-2932
  Scenario: Amend a Stream With Name That Already Exists
    Given I execute "Create Stream" API step
    And I execute "Create Stream" API step saving as "TWO_"
    Then I execute negative "Update Stream" API step with error name "Name must be unique" and parameters
      |name|EC_TWO_STREAM_NAME|

  @Streams #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of Stream record changes
    Given I execute "Create Stream" API step
    And I verify that "[TIMENOW-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_STREAM_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_STREAM_CREATED_BY" element
    And I verify that "EC_STREAM_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_STREAM_UPDATED_BY" element "equal" to "null" element
    Then I execute "Update Stream" API step
    And I verify that "~Second[TIMENOW-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_STREAM_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_STREAM_UPDATED_BY" element