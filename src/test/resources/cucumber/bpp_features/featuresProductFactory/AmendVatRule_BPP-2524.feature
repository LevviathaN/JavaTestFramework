@ProductFactory @VatRules @Amend
Feature: Reference Data - Vat Rules - Update Record - BPP-2524
  As a Senior Product Setter
  I want to be able to amend any existing VAT Rules records
  so that I can correct any errors and make any required changes to the VAT Rules.

  Background:
    Given I execute "Log In" reusable step
    And I execute "Create VAT Rule" reusable step

  @Positive @Regression @P1
  Scenario: Amend a VAT Rule Using a Modal
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "VAT Rules" "Product Factory navigation sub item"
    When I click on the "EC_VAT_RULE_CODE" "Product Factory edit button"
    And I set "VatRuleCode[####]" text to the "Code" "Product Factory text field"
    And I set "VatRuleDescription[####]" text to the "Description" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_VAT_RULE_CODE" element

  @Negative @P2
  Scenario: Submitting Unchanged VAT Rule Fields
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "VAT Rules" "Product Factory navigation sub item"
    When I click on the "EC_VAT_RULE_CODE" "Product Factory edit button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"