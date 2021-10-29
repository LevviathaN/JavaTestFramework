@Google @Search
Feature: Google Search
  As Google user
  I want to see all elements of the search page
  In order to be able to find some interesting thing

  @Runn
  Scenario: Verify presence of Google Search page elements
    Given I execute "Log In" reusable step
    When I click on the "Financials" "Product Factory navigation item"
    And I click on the "Financial Dimensions" "Product Factory navigation sub item" if "Financial Dimensions,Product Factory navigation sub item" "special element is present"
    Then I click on the "Create" "Product Factory button"