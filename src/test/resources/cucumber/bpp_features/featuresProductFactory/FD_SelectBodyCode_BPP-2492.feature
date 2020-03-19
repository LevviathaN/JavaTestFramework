@ProductFactory @FinancialDimensions @Bodies
Feature: Financial Dimension - Select Body Code - BPP-2492
  As a Senior Product Setter
  I want to be able to select a Financial Dimension on an individual Body
  so that I can track this for accounting purposes.

  Background:
    Given I execute "Log In" reusable step

  @Negative @Regression @P1 #TC-1756
  Scenario: Edit Financial Dimension for the Body that is in use
    When I execute "Create Body Financial Dimension" reusable step
    And I execute "Create Body" reusable step
    When I execute "Create Body Financial Dimension" reusable step replacing some steps
      |4|I set "BodyFDCodeTwo[######]" text to the "Code" "Product Factory text field"|
    And I execute "Create Paper" reusable step
    And I execute "Link Body To Paper" reusable step

    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Bodies" "Product Factory navigation sub item"
    When I click on the "EC_BODY_NAME" "Product Factory edit button"
    And I click on the "Financial Dimension" "Product Factory change button"
    And I click on the "EC_BODY_FD_CODE_TWO" "Product Factory select button"
    And I click on the "Save" "Product Factory button"
    Then I should see the "This Body is already linked to one or more Papers, so you cannot change the Financial Dimension" element

    And I execute "Create Sitting" reusable step

    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Bodies" "Product Factory navigation sub item"
    When I click on the "EC_BODY_NAME" "Product Factory edit button"
    And I click on the "Financial Dimension" "Product Factory change button"
    And I click on the "EC_BODY_FD_CODE_TWO" "Product Factory select button"
    And I click on the "Save" "Product Factory button"
    Then I should see the "This Body is already linked to one or more Sittings, so you cannot change the Financial Dimension" element

    And I execute "Create Pricing Matrix" reusable step

    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Bodies" "Product Factory navigation sub item"
    When I click on the "EC_BODY_NAME" "Product Factory edit button"
    And I click on the "Financial Dimension" "Product Factory change button"
    And I click on the "EC_BODY_FD_CODE_TWO" "Product Factory select button"
    And I click on the "Save" "Product Factory button"
    Then I should see the "This Body is already linked to one or more Pricing Matrices, so you cannot change the Financial Dimension" element

    And I execute "Create VAT Rule" reusable step
    And I execute "Create Course Type Financial Dimension" reusable step
    And I execute "Create Course Type" reusable step
    And I execute "Create Location Financial Dimension" reusable step
    And I execute "Create Region Financial Dimension" reusable step
    And I execute "Create Region" reusable step
    And I execute "Create Location" reusable step
    And I execute "Create Level" reusable step
    And I execute "Link Body To Level" reusable step
    And I execute "Link Paper To Level" reusable step

    And I execute "Create Pricing Matrix Full" reusable step
    And I execute "Create Material Type Financial Dimension" reusable step
    And I execute "Create Material Type" reusable step
    And I execute "Create Session Duration" reusable step
    And I execute "Create Client" reusable step
    And I execute "Create Material" reusable step

    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Bodies" "Product Factory navigation sub item"
    When I click on the "EC_BODY_NAME" "Product Factory edit button"
    And I click on the "Financial Dimension" "Product Factory change button"
    And I click on the "EC_BODY_FD_CODE_TWO" "Product Factory select button"
    And I click on the "Save" "Product Factory button"
    Then I should see the "This Body is already linked to one or more Materials, so you cannot change the Financial Dimension" element