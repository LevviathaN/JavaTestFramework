@ProductFactory @VatRules @Amend
Feature: Reference Data - Vat Rules - Update Record - BPP-2524
  As a Senior Product Setter
  I want to be able to amend any existing VAT Rules records
  so that I can correct any errors and make any required changes to the VAT Rules.

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoVatRuleCodeEdit" text as "EC_VAT_RULE_CODE" variable
    And I remember "AutoVatRuleDescriptionEdit" text as "EC_VAT_RULE_DESCRIPTION" variable

  @Positive @Regression @P1 #TC-1348
  Scenario: Amend a VAT Rule Using a Modal
    Given I execute modified "Create VAT Rule" reusable step
      |3|Replace|I click on the "EC_VAT_RULE_CODE" "Product Factory edit button"|

  @Negative @P2 @NoQTest
  Scenario: Submitting Unchanged VAT Rule Fields
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "VAT Rules" "Product Factory navigation sub item"
    When I click on the "AutoVatRuleCode" "Product Factory edit button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"