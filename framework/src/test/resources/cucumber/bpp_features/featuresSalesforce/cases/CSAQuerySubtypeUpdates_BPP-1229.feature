@Salesforce @CSA @Cases
Feature: Create and Validate Cases
  As a Salesforce user/Customer Service Team member
  I want to add Query/subquery types as per the table below
  so I can have the updated Query/subquery types for all cases.

  @Positive @CSAQuery #TC-679 TC-760
  Scenario: Verify New CSA Query Type and Query Subtypes
    Given I execute "Log In To Salesforce" reusable step
    And I execute "Create And Validate CSA Cases Query Types and Subtypes" reusable step