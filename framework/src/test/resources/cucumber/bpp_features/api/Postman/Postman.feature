Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @BET
  Scenario: CBA Collection
    Given I execute postman "cbaCollection.json" collection using "cbaEnv.json" environment
