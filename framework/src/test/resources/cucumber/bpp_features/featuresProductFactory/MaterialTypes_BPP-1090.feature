@ProductFactory @MaterialTypes
Feature: Materials - Create Material Type - BPP-1090
  As a Senior Product Setter
  I want to be able to Create Material Types
  so that I create Material of this type.

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoMaterialTypeFDCode" text as "EC_MATERIAL_TYPE_FD_CODE" variable
    And I remember "AutoMaterialTypeFDDescription" text as "EC_MATERIAL_TYPE_FD_DESCRIPTION" variable

  @Positive @Regression @P1 @CoveredWithApi #TC-1435
  Scenario: Add a New Material Type Using a Modal
    Given I execute "Create Material Type" reusable step

  @Negative @P2 @CoveredWithApi #TC-1436
  Scenario: Add a Material Type Where Name Already Exists
    And I remember "AutoMaterialTypeName" text as "EC_MATERIAL_TYPE_NAME" variable
    When I execute "Create Material Type" reusable step replacing some steps
      |4|I set "EC_MATERIAL_TYPE_NAME" text to the "Name" "Product Factory text field"|
      |9|I should see the "Name must be unique" "message"                             |