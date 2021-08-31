@ProductFactory @ClassCategory @HappyPath @Run
Feature: Onboarding - CT Class Category reference data - BPP-15740
  As a product setup team member
  I want to be able to add and edit CT Class Category reference data

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 #TC-5902
  Scenario: Add a New CT Class Category Using a Modal
    Given I execute "Create CT Class Category" reusable step

  @Negative @P2
  Scenario: Submitting Incomplete CT Class Category Fields
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "CT Class Categories" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

  @Positive @Regression @P1 @Amend #TC-5903
  Scenario: Amend CT Class Category Using Modal
    Given I execute "Create Class Category" API step
    When I execute modified "Create CT Class Category" reusable step
      |3|Replace|I click on the "EC_API_CLASS_CATEGORY_NAME" "Product Factory edit button"|

  @Positive @Regression @Duplicate @Amend #TC-5904
  Scenario: CT Class Category Additional Scenarios
    Given I execute "Create Class Category" API step
    When I execute "Create CT Class Category" reusable step replacing some steps
      |4|I set "EC_API_CLASS_CATEGORY_NAME" text to the "Name" "Product Factory text field"|
      |6|I should see the "Name must be unique" message                                    |
    Given I execute "Create Class Category" API step with parameters
      |name|ApiClassCategoryNameTwo[####]|
    When I execute "Create CT Class Category" reusable step
    When I execute modified "Create CT Class Category" reusable step
      |3|Replace|I click on the "EC_API_CLASS_CATEGORY_NAME" "Product Factory edit button"|
      |4|Replace|I set "EC_API_CLASS_CATEGORY_NAME_TWO" text to the "Name" "Product Factory text field"|
      |6|Replace|I should see the "Name must be unique" message                           |