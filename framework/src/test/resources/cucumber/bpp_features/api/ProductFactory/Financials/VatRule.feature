@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @VatRule #TC-1340
  Scenario: Add a New VAT Rule Using a Modal
    Given I execute "Create Vat Rule" API step

  @VatRule @Update #TC-1348
  Scenario: Amend a VAT Rule Using a Modal
    Given I execute "Create Vat Rule" API step
    Then I execute "Update Vat Rule" API step