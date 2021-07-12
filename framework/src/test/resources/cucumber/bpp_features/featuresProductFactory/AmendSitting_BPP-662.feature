@ProductFactory @Sittings @Amend
Feature: Amend Reference Data - Sitting - BPP-662
  As a Senior Product Setter
  I need to be able to amend the Sittings associated to a Body
  so that I can identify when course materials are available and exam sittings are planned for

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoBodyShortName" text as "EC_BODY_SHORT_NAME" variable
    And I remember "AutoBodyName" text as "EC_BODY_NAME" variable
    And I remember "AutoSittingName" text as "EC_SITTING_NAME" variable

  @Positive @Regression @P1 #TC-1547
  Scenario: Amend a Sitting Using a Modal
    Given I execute "Create Sitting" reusable step

  @Negative @P2 @NoQTest
  Scenario: Submitting Unchanged Sitting Fields
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Sittings" "Product Factory navigation sub item"
    When I click on the "EC_SITTING_NAME" "Product Factory edit button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

  @Negative @P2 @NoQTest
  Scenario: Amend a Sitting Where Name Already Exists
    Given I execute "Create Sitting" reusable step replacing some steps
      |4|I set "AutoSittingNameTwo" text to the "Name" "Product Factory text field"|
      |11|I should see the "The combination of Name and Dates must be unique" "message"|