@BuildEmpire @DirectApps @Negative
Feature: Negative Scenarios Apprenticeship Application

  Background:
    Given I register new Hub account using API
    Then I execute "Log In to Hub as Student" reusable step

  @NegativeScenarios
  Scenario: Negative Scenarios Apprenticeship Application
    When I execute "Create Professional Apprenticeships Application UAT Accounting Option Two" reusable step
    And I execute "Negative Scenarios - Validate User Cannot Proceed" reusable step