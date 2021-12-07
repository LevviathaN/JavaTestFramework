@ProductFactory @FinancialDimensions @Materials
Feature: Financial Dimension - Select Material Code - Initial Selection - BPP-2491
  As a Senior Product Setter
  I want to be able to select a Financial Dimension for all Materials
  so that I can track this for accounting purposes.

  Background:
    Given I execute "Generate ISBN" reusable step
    Given I execute "Log In" reusable step
    And I execute "Remember Variables " reusable step

  @Positive @P1 #TC-1667
  Scenario: Material Page Filters Validation
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Materials" "Product Factory navigation sub item"

    Then I set "EC_MATERIAL_TYPE_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_MATERIAL_TYPE_NAME" element
    And I store "Product Factory Materials Page Entry" elements number in "EC_TOTAL_MATERIALS_ENTRIES" variable
    And I store "EC_MATERIAL_TYPE_NAME" elements number in "EC_SELECTED_MATERIALS_ENTRIES" variable
    And I verify that "<EC_TOTAL_MATERIALS_ENTRIES,EC_SELECTED_MATERIALS_ENTRIES>" "values are equal"
    And I click on the "Clear the search text" "element by title"
    Then Attribute "value" of "Search" "Product Factory text field" should have value ""

    Then I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I store "Product Factory Materials Page Entry" elements number in "EC_TOTAL_MATERIALS_ENTRIES" variable
    And I store "EC_BODY_SHORT_NAME" elements number in "EC_SELECTED_MATERIALS_ENTRIES" variable
    And I verify that "<EC_TOTAL_MATERIALS_ENTRIES,EC_SELECTED_MATERIALS_ENTRIES>" "values are equal"
    And I click on the "Clear the search text" "element by title"
    Then Attribute "value" of "Search" "Product Factory text field" should have value ""

    Then I set "EC_LEVEL_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And For each "1 Levels" element:
      |Attribute "title" of "1 Levels" "element" should have value "EC_LEVEL_SHORT_NAME"|
    And I click on the "Clear the search text" "element by title"
    Then Attribute "value" of "Search" "Product Factory text field" should have value ""

    Then I set "EC_SITTING_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And For each "1 Sittings" element:
      |Attribute "title" of "1 Sittings" "element" should have value "EC_SITTING_NAME"|
    And I click on the "Clear the search text" "element by title"
    Then Attribute "value" of "Search" "Product Factory text field" should have value ""

    When I click on the "Generate Material Report" "button"
    And I click on the "Click here to download the report" "button"
    Then I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_MATERIAL_TYPE_NAME" "Product Factory edit button"
    Then I should see the "Edit Material" element