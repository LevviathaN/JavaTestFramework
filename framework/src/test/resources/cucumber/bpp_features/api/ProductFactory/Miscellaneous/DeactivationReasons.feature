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