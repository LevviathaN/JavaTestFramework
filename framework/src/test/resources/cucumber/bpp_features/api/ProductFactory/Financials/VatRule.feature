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

  @Prices #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of VAT Rule record changes
    Given I execute "Create Vat Rule" API step
    And I verify that "[TIMENOW-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_VAT_RULE_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_VAT_RULE_CREATED_BY" element
    And I verify that "EC_VAT_RULE_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_VAT_RULE_UPDATED_BY" element "equal" to "null" element
    Then I execute "Update Vat Rule" API step
    And I verify that "~Second[TIMENOW-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_VAT_RULE_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_VAT_RULE_UPDATED_BY" element