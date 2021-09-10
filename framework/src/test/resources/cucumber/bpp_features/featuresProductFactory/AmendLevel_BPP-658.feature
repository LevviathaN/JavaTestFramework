@ProductFactory @Levels @Amend
Feature: Amend Reference Data - Level - BPP-658
  As a Senior Product Setter
  I need to be able to amend the different Levels under a body
  so that I can assign a paper to a level where a level is required and student understands the complexity of the paper they are studying/applying for.

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoLevelNameEdit" text as "EC_LEVEL_NAME" variable
    And I remember "AutoLevelShortNameEdit" text as "EC_LEVEL_SHORT_NAME" variable

  @Positive @Regression @P1 @CoveredWithApi #TC-823
  Scenario: Amend a Level Using a Modal
    And I remember "AutoLevelNameEdit" text as "EC_LEVEL_NAME" variable
    And I remember "AutoLevelShortNameEdit" text as "EC_LEVEL_SHORT_NAME" variable
    Given I execute "Create Level" reusable step replacing some steps
      |3|I click on the "EC_LEVEL_NAME" "Product Factory edit button"|
      |4|I set "LevelShortName[######]" text to the "Short Name" "Product Factory text field"|
      |5|I set "LevelName[######]" text to the "Name" "Product Factory text field"|
      |7|I should see the "EC_LEVEL_SHORT_NAME" element                           |

  @Negative @P2 @CoveredWithApi #TC-822
  Scenario: Amend Submitting Incomplete Level Fields
    And I remember "AutoLevelName" text as "EC_LEVEL_NAME" variable
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Levels" "Product Factory navigation sub item"
    When I click on the "EC_LEVEL_NAME" "Product Factory edit button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

  @Negative @P2 @CoveredWithApi #TC-824
  Scenario: Amend a Level Where Short Name Already Exists
    And I remember "AutoLevelName" text as "EC_LEVEL_NAME" variable
    Given I execute "Create Level" reusable step replacing some steps
      |3|I click on the "EC_LEVEL_NAME" "Product Factory edit button"|
      |4|I set "AutoLevelShortNameTwo" text to the "Short Name" "Product Factory text field"|
      |5|I set "AutoLevelNameTwo" text to the "Name" "Product Factory text field"|
      |7|I should see the "Short Name must be unique" "message"                           |