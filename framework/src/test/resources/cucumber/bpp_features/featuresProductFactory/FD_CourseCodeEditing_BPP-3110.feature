@ProductFactory @FinancialDimensions @Courses
Feature: Financial Dimension - Course Code - Editing - BPP-3110
  As a Senior Product Setter
  I want to be able to select a Financial Dimension to be applied to all Courses
  so that I can track appropriate figures for accounting purposes.

  Background:
    Given I execute "Log In" reusable step
    And I execute "Create Course Financial Dimension" reusable step

  @Positive @P1 #TC-1674, TC-1676
  Scenario: Edit FD Code on Courses Page
    When I click on the "Products" "Product Factory navigation item"
    And I click on the "Courses" "Product Factory navigation sub item"
    Then I should see the "Financials" button
    When I click on the "Financials" button
    And I click on the "Entity Dimension" "Product Factory change button"
    And I click on the "EC_COURSE_FD_CODE" "Product Factory select button"
    And I click on the "Revenue Dimension" "Product Factory change button"
    And I click on the "EC_COURSE_FD_CODE" "Product Factory select button"
    And I click on the "Save" "Product Factory button"
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I click on the "Products" "Product Factory navigation item"
    And I click on the "Courses" "Product Factory navigation sub item"
    Then I shouldn't see the "Financials" "Product Factory button"
