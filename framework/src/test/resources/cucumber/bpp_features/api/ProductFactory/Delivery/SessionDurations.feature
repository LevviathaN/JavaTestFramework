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