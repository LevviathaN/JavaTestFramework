@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @DeactivationReason #TC-975
  Scenario: Add a New Deactivation Reason Using a Modal
    Given I execute "Create Deactivation Reason" API step

  @DeactivationReason @Update #TC-978
  Scenario: Amend a Deactivation Reason Using a Modal
    Given I execute "Create Deactivation Reason" API step
    Then I execute "Update Deactivation Reason" API step

  @DeactivationReason @Duplicate #TC-977
  Scenario: Add a Deactivation Reason Where Description Already Exists
    Given I execute "Create Deactivation Reason" API step
    Then I execute negative "Create Deactivation Reason" API step with error name "Description must be unique" and parameters
      |description|EC_DEACTIVATION_REASON_DESCRIPTION|

  @DeactivationReason #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of Deactivation Reason record changes
    Given I execute "Create Deactivation Reason" API step
    And I transform "[TIMENOW-PLUS-0HOURS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd'T'HH:mm" pattern saving value as "EC_TIME_NOW_ONE"
    And I verify that "EC_TIME_NOW_ONE" element "contains" to "EC_DEACTIVATION_REASON_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_DEACTIVATION_REASON_CREATED_BY" element
    And I verify that "EC_DEACTIVATION_REASON_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_DEACTIVATION_REASON_UPDATED_BY" element "equal" to "null" element
    Then I execute "Update Deactivation Reason" API step with parameters
      |preventReactivation|false|
    And I transform "[TIMENOW-PLUS-0HOURS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd'T'HH:mm" pattern saving value as "EC_TIME_NOW_TWO"
    And I verify that "EC_TIME_NOW_TWO" element "contains" to "EC_UPDATE_DEACTIVATION_REASON_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_UPDATE_DEACTIVATION_REASON_CREATED_BY" element