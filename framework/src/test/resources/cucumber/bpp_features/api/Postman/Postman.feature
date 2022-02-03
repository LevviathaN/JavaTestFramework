@Postman @API
Feature: Postman collections
  This feature is used to run Postman collections via API, using Newman.

  @PostmanCPQCourseAndInstance
  Scenario:
    Given I execute postman "CPQCourseAndInstanceApiTests.json" collection using "e2eCPQ_UAT.json" environment

  @PostmanCPQStudentJourney
  Scenario:
    Given I execute postman "CPQStudentJourney.json" collection using "e2eCPQ_UAT.json" environment

  @PostmanE2E
  Scenario:
    Given I execute postman "end-2-endCPQ.json" collection using "e2eCPQ_UAT.json" environment

  @PostmanCBA
  Scenario: CBA Collection
    Given I execute postman "cbaCollection.json" collection using "cbaEnv.json" environment
