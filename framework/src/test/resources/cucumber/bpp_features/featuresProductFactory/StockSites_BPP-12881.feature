@ProductFactory @StockSites @HappyPath
Feature: Create/edit Stock Site - BPP-12881
  As a Senior Product Setter
  I want to be able to create and edit Stock Site records

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 @CoveredWithApi #TC-4928
  Scenario: Add a New Stock Site Using a Modal
    Given I execute "Create Stock Site" reusable step

  @Positive @Regression @P1 #TC-4929
  Scenario: Amend Stock Site Using a Modal
    Given I execute "Create Stock Site" reusable step
    Given I execute modified "Create Stock Site" reusable step
      |6|Add|I set "StockSiteAddressLineTwo[######]" text to the "Address Line 2" "Product Factory text field"|
      |7|Add|I set "StockSiteAddressLineThree[######]" text to the "Address Line 3" "Product Factory text field"|
      |8|Add|I set "StockSiteCity[###]" text to the "City" "Product Factory text field"                                 |
      |9|Add|I click on the "Country" "Product Factory dropdown"|
      |10|Add|I click on the "Argentina" "Product Factory dropdown option"|
      |11|Add|I set "~Postcode[######]" text to the "Postcode" "Product Factory text field"|

  @Negative @P2 #TC-4942
  Scenario: Add a Stock Site Where Name Already Exists
    Given I remember "AutoStockSiteName" text as "EC_STOCK_SITE_NAME" variable
    Given I execute modified "Create Stock Site" reusable step
      |4|Replace|I set "EC_STOCK_SITE_NAME" text to the "Name" "Product Factory text field"|
      |13|Replace|I should see the "Name must be unique" "message"                       |
