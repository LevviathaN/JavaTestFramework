@ProductFactory @CBA @HappyPath
Feature: CBA - Create Courses and Instances - BPP-3206
  As a Product Setter
  I want to be able to amend create Courses with a single Instance for a CBA record

  Background:
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Given I execute "Remember Variables For Creation " reusable step

  @Positive @Regression @P1 @CoveredWithAPI #TC-3000
  Scenario: Create New CBA Record
    Given I execute "Create CBA Record" reusable step
    And I wait for "2" seconds
    When I click on the "Clients" "Product Factory button"
    And I click on the "Edit" "Product Factory button"
    And I "check" "EC_CLIENT_NAME" "Product Factory checkbox"
    And I click on the "Save" "Product Factory button"
    Then I wait for "7" seconds
    When I click on the "Activate" "Product Factory button"
    Then I should see the "(Active)" element
    And I should see the "Deactivate" "Product Factory button"


