@ProductFactory @Levels
Feature: Reference Data - Level - BPP-371
  As a Senior Product Setter
  I need to be able to create different Levels under a body
  So that I can assign a paper to a level where a level is required and student understands the complexity
  of the paper they are studying/applying for.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 @CoveredWithApi #TC-746
  Scenario: Add a New Level Using a Modal
    Given I execute "Create Level" reusable step

  @Negative @P2 #TC-745
  Scenario: Submitting Incomplete Level Fields
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Levels" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

  @Negative @P2 #TC-748
  Scenario: Add a Level Where Short Name Already Exists
    And I remember "AutoLevelShortName" text as "EC_LEVEL_SHORT_NAME" variable
    When I execute modified "Create Level" reusable step
      |4|Replace|I set "EC_LEVEL_SHORT_NAME" text to the "Short Name" "Product Factory text field"|
      |7|Replace|I should see the "Short Name must be unique" "message"                           |