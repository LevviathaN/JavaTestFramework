@ProductFactory @FinancialDimensions @Bodies
Feature: Financial Dimension - Select Body Code - BPP-2494
  As a Senior Product Setter
  I want to be able to select a Financial Dimension on an individual Material Type
  so that I can track this for accounting purposes.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 #TC-1680, TC-1713
  Scenario: Verify that only FD applied to Material Type is displayed on Material Types page
    When I execute "Create Material Type Financial Dimension" reusable step
    And I execute "Create Material Type Financial Dimension" reusable step replacing some steps
      |4|I set "MaterialTypeFDCodeTwo[######]" text to the "Code" "Product Factory text field"|
      |5|I set "MaterialTypeFDDescriptionTwo[######]" text to the "Description" "Product Factory text field"|
    And I execute "Create Material Type Financial Dimension" reusable step replacing some steps
      |4|I set "MaterialTypeFDCodeThree[######]" text to the "Code" "Product Factory text field"|
      |5|I set "MaterialTypeFDDescriptionThree[######]" text to the "Description" "Product Factory text field"|
    And I execute "Create Material Type" reusable step
    And I execute "Create Material Type" reusable step with some additional steps
      |7|I should see the "EC_MATERIAL_TYPE_FD_CODE_TWO" element|
      |8|I should see the "EC_MATERIAL_TYPE_FD_CODE_THREE" element|