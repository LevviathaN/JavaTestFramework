@ProductFactory @CBA @Courses @Amend
Feature: CBA - Disable Course Edit Page - BPP-3214
  As a Product Setter
  I want the Course Edit page to be disabled when the course is a part of a CBA
  so the Course can not be changed.

  Background:
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Given I execute "Remember Variables For Creation " reusable step

  @Positive @Regression @P1 @DoNotRun #TC-2587 Outdated. CBA courses no longer display on courses page
  Scenario: Disable Course Edit Page
    And I execute "Create CBA Record" reusable step
    When I click on the "Create" "Product Factory button"
    Then I "check" "EC_BODY_SHORT_NAME" "Product Factory checkbox"
    And I click on the "Next" "Product Factory button"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"
    And I wait for "3" seconds