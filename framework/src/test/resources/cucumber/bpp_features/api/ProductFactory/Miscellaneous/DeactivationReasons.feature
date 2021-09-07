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