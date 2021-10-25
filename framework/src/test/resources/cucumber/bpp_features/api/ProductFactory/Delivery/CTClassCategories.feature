@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @CTClassCategory
  Scenario: Add a New Class Category Using a Modal
    Given I execute "Create Class Category" API step

  @CTClassCategory #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of Class Category record changes
    Given I execute "Create Class Category" API step
    And I verify that "[TIMENOW-OHB-yyyy-MM-dd'T'HH:mm]" element is "contains" to "EC_CLASS_CATEGORY_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element is "equal" to "EC_CLASS_CATEGORY_CREATED_BY" element
    And I verify that "EC_CLASS_CATEGORY_UPDATED_ON" element is "equal" to "null" element
    And I verify that "EC_CLASS_CATEGORY_UPDATED_BY" element is "equal" to "null" element
    Given I execute "Update Class Category" API step
    And I verify that "~Second[TIMENOW-OHB-yyyy-MM-dd'T'HH:mm]" element is "contains" to "EC_CLASS_CATEGORY_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element is "equal" to "EC_CLASS_CATEGORY_UPDATED_BY" element