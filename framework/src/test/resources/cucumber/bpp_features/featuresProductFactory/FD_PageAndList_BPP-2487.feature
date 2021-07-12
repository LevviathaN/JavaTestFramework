@ProductFactory @FinancialDimensions
Feature: Financial Dimension - Reference Data Page and List - BPP-2487
 As a Senior Product Setter
 I want a new area for viewing and creating Financial Dimensions
 So that I can setup appropriate codes for accounting purposes.

 @Positive @Regression @P1 #TC-1530
 Scenario: Verify elements on Financial Dimension page
  Given I execute "Log In" reusable step
  When I click on the "Financials" "Product Factory navigation item"
  When I click on the "Financial Dimensions" "Product Factory navigation sub item"
  Then I should see the "Code" "text"
  Then I should see the "Description" "text"
  Then I should see the "Applies To" "text"
  Then I should see the "Create" "text"

 @Negative @P2 @HappyPath #TC-1529
 Scenario: Verify that Financial Dimensions is not available for Product Setup Assistant role
  Given I execute "Log In" reusable step replacing some steps
   |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
   |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
  When I click on the "Financials" "Product Factory navigation item"
  Then I shouldn't see the "Financial Dimensions" element