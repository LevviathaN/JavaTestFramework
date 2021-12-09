@ProductFactory @BuildEmpire @DigitalSite
Feature: Test

  @BET
  Scenario: Test
    Given I execute "Log In" reusable step
    And I wait for "7" seconds
    And I execute "return localStorage.getItem('product-factory-react-token')" JS code and saving value as "EC_AUTH_TOKEN_PF_UAT"
    And I execute "Change Vat Rule" API step with parameters
      |Update Vat Rule|8c31785e-0d5a-4840-90e8-6bfdb9ce0a92|