@ProductFactory @FinancialDimensions @Locations
Feature: Financial Dimension - Select Location Codes - BPP-2495
  As a Senior Product Setter
  I want to be able to select 2 Financial Dimensions on an individual Location
  so that I can track both the "AX Division" and "AX Location" codes for accounting purposes.

  Background:
    Given I execute "Generate ISBN" reusable step
    Given I execute "Log In" reusable step
    And I execute "Remember Variables For Creation " reusable step
    And I execute "Remember Variables Two" reusable step

  @Negative @Regression @P1 @CoveredWithApi #TC-1771, TC-1718
  Scenario: Edit Financial Dimension for the Location that is in use
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Locations" "Product Factory navigation sub item"
    When I click on the "EC_LOCATION_NAME" "Product Factory edit button"
    And I click on the "Financial Dimension" "Product Factory dropdown"
    And I click on the "EC_LOCATION_FD_DESCRIPTION_TWO" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "The Location is already linked to one or more Sessions, so you cannot change the Financial Dimension" element