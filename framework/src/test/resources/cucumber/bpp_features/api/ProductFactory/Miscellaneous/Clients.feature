@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @Clients #TC-919
  Scenario: Add a New Client Using a Modal
    Given I execute "Create Client" API step

  @Clients @Duplicate #TC-919
  Scenario: Add a Client Where Name Already Exists
    Given I execute "Create Client" API step
    Then I execute negative "Create Client" API step with error name "Name must be unique" and parameters
      |name|EC_CLIENT_NAME|

  @Clients @Update @Negative #TC-921
  Scenario: Amend a Client Using a Modal
    Given I execute "Create Client" API step
    Then I execute "Update Client" API step

  @Clients @Incomplete #TC-920
  Scenario: Submitting Incomplete Client Fields
    And I execute negative "Create Client" API step with error name "The Name field is required." and parameters
      |name||