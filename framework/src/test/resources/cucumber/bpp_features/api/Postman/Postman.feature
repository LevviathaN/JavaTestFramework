Feature: Postman collections to run via Newman

  @BET
  Scenario: CBA Collection
    Given I execute postman "cbaCollection.json" collection using "cbaEnv.json" environment
