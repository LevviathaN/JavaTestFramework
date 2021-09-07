@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @Vertical #TC-4811
  Scenario: Add a New Vertical Using a Modal
    Given I execute "Create Vertical" API step

  @Vertical @Update #TC-4812
  Scenario: Amend a Vertical Using a Modal
    Given I execute "Create Vertical" API step
    Then I execute "Update Vertical" API step

  @Vertical @Update @Duplicate #TC-
  Scenario: Amend a Vertical Where Name Already Exists
    Given I execute "Create Vertical" API step
    Then I execute "Create Vertical" API step saving as "TWO_"
    And I execute negative "Update Vertical" API step with error name "Name must be unique" and parameters
      |name|EC_TWO_VERTICAL_NAME|

  @Vertical @Duplicate #TC-
  Scenario: Add a Vertical Where Name Already Exists
    Given I execute "Create Vertical" API step
    And I execute negative "Create Vertical" API step with error name "Name must be unique" and parameters
      |name|EC_VERTICAL_NAME|

  @Vertical @Incomplete #TC-
  Scenario: Submitting Incomplete Vertical Fields
    Given I execute "Create Vertical" API step
    Given I execute negative "Create Vertical" API step with error name "The Name field is required." and parameters
      |name||