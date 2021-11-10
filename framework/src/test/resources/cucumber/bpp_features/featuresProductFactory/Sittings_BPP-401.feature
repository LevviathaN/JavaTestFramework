@ProductFactory @Sittings
Feature: Reference Data - Sitting - BPP-401
  As a Senior Product Setter
  I need to be able to create Sittings associated to a Body
  I can identify when course materials are available and exam sittings are planned for

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoBodyShortName" text as "EC_BODY_SHORT_NAME" variable
    And I remember "AutoBodyName" text as "EC_BODY_NAME" variable

  @Positive @Regression @P1 @CoveredWithApi #TC-835
  Scenario: Add a New Sitting Using a Modal (Link to One Body)
    Given I execute "Create Sitting" reusable step

  @Positive @Regression @P2 @CoveredWithApi #TC-836
  Scenario: Add a New Sitting Using a Modal (Link to Multiple Bodies)
    And I remember "AutoBodyShortNameTwo" text as "EC_BODY_SHORT_NAME_TWO" variable
    And I remember "AutoBodyNameTwo" text as "EC_BODY_NAME_TWO" variable
    Given I execute modified "Create Sitting" reusable step
      |9|Add|I "check" "EC_BODY_NAME_TWO" "Product Factory dialog checkbox"|

  @Negative @P2 @CoveredWithApi #TC-837
  Scenario: Submitting Incomplete Sitting Fields
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Sittings" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

  @Negative @P2 @NoQTest @CoveredWithApi
  Scenario: Add a Sitting Where Name Already Exists
#    When I execute "Create Sitting" reusable step
    And I remember "AutoSittingName" text as "EC_AUTO_SITTING_NAME" variable
    Given I execute modified "Create Sitting" reusable step
      |4|Replace|I set "EC_AUTO_SITTING_NAME" text to the "Name" "Product Factory text field"|
      |11|Replace|I should see the "A Sitting with the same name has already been attached to Body" "text contained in element"|