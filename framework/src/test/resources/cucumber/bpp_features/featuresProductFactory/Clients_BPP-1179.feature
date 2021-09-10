@ProductFactory @Clients @HappyPath
Feature: Reference Data - Client - BPP-1179
  As a Senior Product Setter
  I want to be able to create, view and amend Client records
  So that they can be associated to Courses.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 @CoveredWithApi #TC-919
  Scenario: Add a New Client Using a Modal
    Given I execute "Create Client" reusable step

  @Negative @P2 @CoveredWithApi #TC-920
  Scenario: Submitting Incomplete Client Fields
    When I click on the "Miscellaneous" "Product Factory navigation item"
    When I click on the "Clients" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

  @Negative @P2 @CoveredWithApi #TC-921
  Scenario: Add a Client Where Name Already Exists
    When I execute "Create Client" reusable step replacing some steps
      |4|I set "EC_CLIENT_NAME" text to the "Name" "Product Factory text field"|

  @Positive @Regression @P1 @Amend @CoveredWithApi #TC-1548
  Scenario: Amend a Client Using a Modal
    When I execute "Create Client" reusable step
    When I execute modified "Create Client" reusable step
      |3|Replace|I click on the "EC_CLIENT_NAME" "Product Factory edit button"|