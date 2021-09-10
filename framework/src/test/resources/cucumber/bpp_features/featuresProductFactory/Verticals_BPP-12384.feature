@ProductFactory @Verticals
Feature: Verticals on Products (Terra Changes) - New Reference Data - BPP-12384
  As a Salesforce that manages clients
  I want to to be able to see what verticals my clients is purchasing
  So that I can measure client growth against agreed strategic KPIs, Average Verticals per Client

  As a member of course setup, I expect to be able to manage the 'Verticals' that are available (for Body) within Product Factory.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 @HappyPath @CoveredWithApi #TC-4811
  Scenario: Add a New Vertical Using a Modal
    Given I execute "Create Vertical" reusable step
    Then I should see the "EC_VERTICAL_NAME" element

  @Negative @P2 @HappyPath @NoQTest @CoveredWithApi
  Scenario: Submitting Incomplete Vertical Fields
    When I click on the "Miscellaneous" "Product Factory navigation item"
    When I click on the "Verticals" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

  @Negative @P2 @HappyPath @CoveredWithApi #TC-4813
  Scenario: Add a Vertical Where Name Already Exists
    When I execute "Create Vertical" reusable step
    When I execute "Create Vertical" reusable step replacing some steps
      |4|I set "EC_VERTICAL_NAME" text to the "Name" "Product Factory text field"|
    Then I should see the "Name must be unique" message

  @Negative @CoveredWithApi @P2 #TC-4814
  Scenario: Amend a Vertical Where Name Already Exists
    When I execute "Create Vertical" reusable step
    When I execute "Create Vertical" reusable step replacing some steps
      |4|I set "VerticalNameTwo[######]" text to the "Name" "Product Factory text field"|
    When I execute "Create Vertical" reusable step replacing some steps
      |3|I click on the "EC_VERTICAL_NAME" "Product Factory edit button"|
      |4|I set "EC_VERTICAL_NAME_TWO" text to the "Name" "Product Factory text field"|
    Then I should see the "Name must be unique" message

  @Positive @Regression @P1 @Amend @CoveredWithApi #TC-4812
  Scenario: Amend a Vertical Using a Modal
    Given I execute "Create Vertical" reusable step
    When I execute modified "Create Vertical" reusable step
      |3|Replace|I click on the "EC_VERTICAL_NAME" "Product Factory edit button"|
    Then I should see the "EC_VERTICAL_NAME" element