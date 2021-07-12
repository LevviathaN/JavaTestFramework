@Salesforce @SubmitApplication
Feature: Create Student Account
  Description

  @Positive #TC-253 TC-254 TC-294 TC-76
  Scenario: Create Student Account and Submit Application
    Given I execute "Log In To Salesforce" reusable step
    Given I execute "Create Student Account" reusable step
    And I execute "Create Address" reusable step
    And I execute "Get Profile ID" reusable step
    And I execute "Create Opportunity" reusable step
    And I click on the "EC_OPPORTUNITY_NAME" "Salesforce link"
    And I click on the "Salesforce Product Catalog Item Dropdown" button
    And I click on the "Salesforce New Product Catalog Item" button
    And I fill the "Salesforce Offering Text Field" field with "MD_COMMON_VALIDDATA_SFOFFERING"
    And I click on the "Salesforce Search" button
    And I "check" "Salesforce Offering Checkbox" checkbox
    And I click on the "Salesforce Add Products" button
    Given I execute "Submit Application" reusable step