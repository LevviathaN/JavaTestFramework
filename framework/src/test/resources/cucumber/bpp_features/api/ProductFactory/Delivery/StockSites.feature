@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @StockSite #TC-4928
  Scenario: Add a New Stock Site Using a Modal
    Given I execute "Create Stock Site" API step

  @StockSite @Update #TC-4929
  Scenario: Amend Stock Site Using a Modal
    Given I execute "Create Stock Site" API step
    And I execute "Update Stock Site" API step

  @StockSite @Duplicate #TC-4942
  Scenario: Add a Stock Site Where Name Already Exists
    Given I execute "Create Stock Site" API step
    And I execute negative "Create Stock Site" API step with error name "Name must be unique" and parameters
      |name|EC_API_STOCK_SITE_NAME|

  @StockSite #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of Stock Site record changes
    Given I execute "Create Stock Site" API step
    And I transform "[TIMENOW-PLUS-0HOURS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd'T'HH:mm" pattern saving value as "EC_TIME_NOW_ONE"
    And I verify that "EC_TIME_NOW_ONE" element "contains" to "EC_STOCK_SITE_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_STOCK_SITE_CREATED_BY" element
    And I verify that "EC_STOCK_SITE_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_STOCK_SITE_UPDATED_BY" element "equal" to "null" element
    And I execute "Update Stock Site" API step
    And I transform "[TIMENOW-PLUS-0HOURS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd'T'HH:mm" pattern saving value as "EC_TIME_NOW_TWO"
    And I verify that "EC_TIME_NOW_TWO" element "contains" to "EC_STOCK_SITE_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_STOCK_SITE_UPDATED_BY" element