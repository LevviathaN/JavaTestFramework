@ProductFactory @FinancialDimensions @Courses
Feature: Financial Dimension - Select Course Code initial selection - BPP-2490
  As a Senior Product Setter
  I want to be able to select a Financial Dimension to be applied to all Courses
  I can track appropriate figures for accounting purposes.

  Background:
    Given I generate new ISBN code saving as "EC_ISBN"
    Given I execute "Log In" reusable step
    And I execute "Remember Variables For Creation Dont Touch" reusable step

  @Positive @P1 #TC-4411
  Scenario: Course Page Filters Validation
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"

    And I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I store "Product Factory Materials Page Entry" elements number in "EC_TOTAL_MATERIALS_ENTRIES" variable
    And I store "EC_BODY_SHORT_NAME" elements number in "EC_SELECTED_MATERIALS_ENTRIES" variable
    And I verify that "<EC_TOTAL_MATERIALS_ENTRIES,EC_SELECTED_MATERIALS_ENTRIES>" "values are equal"
    When I click on the "Clear the search text" "element by title"
    Then Attribute "value" of "Search" "Product Factory text field" should have value ""

    And I set "EC_LEVEL_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I store "Product Factory Materials Page Entry" elements number in "EC_TOTAL_MATERIALS_ENTRIES" variable
    And I store "EC_LEVEL_NAME" elements number in "EC_SELECTED_MATERIALS_ENTRIES" variable
    And I verify that "<EC_TOTAL_MATERIALS_ENTRIES,EC_SELECTED_MATERIALS_ENTRIES>" "values are equal"
    When I click on the "Clear the search text" "element by title"
    Then Attribute "value" of "Search" "Product Factory text field" should have value ""

    And I set "EC_PAPER_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I store "Product Factory Materials Page Entry" elements number in "EC_TOTAL_MATERIALS_ENTRIES" variable
    And I store "EC_PAPER_NAME" elements number in "EC_SELECTED_MATERIALS_ENTRIES" variable
    And I verify that "<EC_TOTAL_MATERIALS_ENTRIES,EC_SELECTED_MATERIALS_ENTRIES>" "values are equal"
    When I click on the "Clear the search text" "element by title"
    Then Attribute "value" of "Search" "Product Factory text field" should have value ""

    And I set "EC_PAPER_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I store "Product Factory Materials Page Entry" elements number in "EC_TOTAL_MATERIALS_ENTRIES" variable
    And I store "EC_PAPER_NAME" elements number in "EC_SELECTED_MATERIALS_ENTRIES" variable
    And I verify that "<EC_TOTAL_MATERIALS_ENTRIES,EC_SELECTED_MATERIALS_ENTRIES>" "values are equal"
    When I click on the "Clear the search text" "element by title"
    Then Attribute "value" of "Search" "Product Factory text field" should have value ""

    And I set "EC_SITTING_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I store "Product Factory Materials Page Entry" elements number in "EC_TOTAL_MATERIALS_ENTRIES" variable
    And I store "EC_SITTING_NAME" elements number in "EC_SELECTED_MATERIALS_ENTRIES" variable
    And I verify that "<EC_TOTAL_MATERIALS_ENTRIES,EC_SELECTED_MATERIALS_ENTRIES>" "values are equal"
    When I click on the "Clear the search text" "element by title"
    Then Attribute "value" of "Search" "Product Factory text field" should have value ""

    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I store "Product Factory Materials Page Entry" elements number in "EC_TOTAL_MATERIALS_ENTRIES" variable
    And I store "EC_COURSE_TYPE_DESCRIPTION" elements number in "EC_SELECTED_MATERIALS_ENTRIES" variable
    And I verify that "<EC_TOTAL_MATERIALS_ENTRIES,EC_SELECTED_MATERIALS_ENTRIES>" "values are equal"
    When I click on the "Clear the search text" "element by title"
    Then Attribute "value" of "Search" "Product Factory text field" should have value ""

    And I set "EC_REGION_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I store "Product Factory Materials Page Entry" elements number in "EC_TOTAL_MATERIALS_ENTRIES" variable
    And I store "EC_REGION_NAME" elements number in "EC_SELECTED_MATERIALS_ENTRIES" variable
    And I verify that "<EC_TOTAL_MATERIALS_ENTRIES,EC_SELECTED_MATERIALS_ENTRIES>" "values are equal"
    When I click on the "Clear the search text" "element by title"
    Then Attribute "value" of "Search" "Product Factory text field" should have value ""