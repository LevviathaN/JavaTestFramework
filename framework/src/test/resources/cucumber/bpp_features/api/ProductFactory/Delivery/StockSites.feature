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