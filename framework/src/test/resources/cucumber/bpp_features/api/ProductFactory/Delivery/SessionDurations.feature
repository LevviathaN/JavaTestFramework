@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @SessionDuration #TC-811
  Scenario: Add a New Session Duration Using a Modal
    Given I execute "Create Session Duration" API step

  @SessionDuration @Update #TC-813
  Scenario: Amend a Session Duration Using a Modal
    Given I execute "Create Session Duration" API step
    And I execute "Update Session Duration" API step

  @SessionDuration @Duplicate #TC-812
  Scenario: Add Session Duration where Description Already Exists
    Given I execute "Create Session Duration" API step
    Then I execute negative "Create Session Duration" API step with error name "Description must be unique" and parameters
      |description|EC_SESSION_DURATION_DESCRIPTION|

  @SessionDuration #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of Session Duration record changes
    Given I execute "Create Session Duration" API step
    And I transform "[TIMENOW-PLUS-0HOURS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd'T'HH:mm" pattern saving value as "EC_TIME_NOW_ONE"
    And I verify that "EC_TIME_NOW_ONE" element "contains" to "EC_SESSION_DURATION_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_SESSION_DURATION_CREATED_BY" element
    And I verify that "EC_SESSION_DURATION_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_SESSION_DURATION_UPDATED_BY" element "equal" to "null" element
    And I execute "Update Session Duration" API step
    And I transform "[TIMENOW-PLUS-0HOURS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd'T'HH:mm" pattern saving value as "EC_TIME_NOW_TWO"
    And I verify that "EC_TIME_NOW_TWO" element "contains" to "EC_SESSION_DURATION_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_SESSION_DURATION_UPDATED_BY" element