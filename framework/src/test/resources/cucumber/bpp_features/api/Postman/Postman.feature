@Postman @API
Feature: Postman collections
  This feature is used to run Postman collections via API, using Newman.

  @PostmanCBA
  Scenario: CBA Collection
    Given I execute postman "cbaCollection.json" collection using "cbaEnv.json" environment
