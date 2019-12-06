@Reusable
Feature: Product Factory
  As a product setter
  I want to be able to log into Product Factory
  In order to (just cause)

  Scenario: Log In
    Given I am on "http://qa-products.bpp.com" URL
    When I click on the "Sign in with Auth0" button
    And I fill the "email" field with "samuelslade@bpp.com"
    And I fill the "password" field with "Password1"
    And I click on the "Login" button which is "2"
    When I wait for "4" seconds
    Then I should be redirected to the "Product Factory" page

  Scenario: Create Body Financial Dimension
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Financial Dimensions" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "FDCode[####]" text to the "Code" "Product Factory text field"
    And I set "FDDescription[####]" text to the "Description" "Product Factory text field"
    And I click on the "Applies To" "Product Factory dropdown"
    And I click on the "Body" option
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_FD_CODE" element

  Scenario: Create Body
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Bodies" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "BodyShortName[####]" text to the "Short Name" "Product Factory text field"
    And I set "BodyName[####]" text to the "Name" "Product Factory text field"
    And I click on the "Change" "button"
    And I click on the "EC_FD_CODE" "Product Factory change modal option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_BODY_SHORT_NAME" element

  Scenario: Create Sitting
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Sittings" "Product Factory navigation sub item"
    Then I click on the "Product Factory create button"
    And I set "SittingName[####]" text to the "Name" "Product Factory text field"
    And I remember "KW_AUTO_TODAY|DD/MM/YYYY" text as "EC_SITTING_START_DATE" variable
    And I set "EC_SITTING_START_DATE" text to the "Start Date" "Product Factory text field"
    And I remember "10/10/2020" text as "EC_SITTING_END_DATE" variable
    And I set "EC_SITTING_END_DATE" text to the "End Date" "Product Factory text field"
    And I "check" "EC_BODY_NAME" PF checkbox
    And I click on the "Save" "button"
    Then I should see the "EC_SITTING_NAME" element

  Scenario: Create Pricing Matrix
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Prices" "Product Factory navigation sub item"
    Then I click on the "Product Factory create button"
    And I click on the "Body" "Product Factory change modal option"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory select button"
    And I click on the "Sitting" "Product Factory change modal option"
    And I click on the "EC_SITTING_NAME" "Product Factory select button"
    And I click on the "Save" button
    Then I should see the "EC_SITTING_NAME" element