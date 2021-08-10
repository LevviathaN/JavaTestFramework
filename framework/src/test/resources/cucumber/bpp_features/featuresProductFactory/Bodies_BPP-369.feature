@ProductFactory @Bodies
Feature: Reference Data - Body - BPP-369
  As a Senior Product Setter
  I need to create a new Body (Professional Body / Awarding Body)
  So that I can associate new Courses to that Body

  Background:
    Given I execute "Log In" reusable step replacing some steps
    |3|I fill the "Product Factory Email" field with "samuelslade@bpp.com"|
    |4|I fill the "Product Factory Password" field with "Password1"|
    And I remember "AutoBodyFDCode" text as "EC_BODY_FD_CODE" variable
    And I remember "AutoBodyFDDescription" text as "EC_BODY_FD_DESCRIPTION" variable
    And I remember "AutoVerticalName" text as "EC_VERTICAL_NAME" variable

  @Positive @Regression @P1 @CoveredWithApi #TC-743
  Scenario: Add a New Body Using a Modal
    Given I execute "Create Body" reusable step

  @Negative @P2 #TC-740
  Scenario: Submitting Incomplete Body Fields
    Given I execute modified "Create Body" reusable step
      |4|Delete||
      |5|Delete||
      |10|Delete||
      |11|Replace|Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"|

  @Negative @P2 #TC-744
  Scenario: Add a Body Where Short Name Already Exists
    Given I execute modified "Create Body" reusable step
      |4|Replace|I set "AutoBodyShortNameTwo" text to the "Short Name" "Product Factory text field"|
      |11|Replace|I should see the "Short Name must be unique" "message"                            |