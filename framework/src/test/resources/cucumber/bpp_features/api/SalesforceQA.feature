@API
Feature: Salesforce API Data Creation
  As an Admin I should be able to create Faculty and Student account using Salesforce API

  @FacultyAPI
  Scenario: Create and Submit Faculty
    When I create new faculty record
    Then I should submit faculty API

  @StudentAPI
  Scenario: Create and Submit Student Account
    When I create new student account API