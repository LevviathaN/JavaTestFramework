@CleanOrigin @SearchValidation
Feature: Search Validation
  As an user
  I want to be able to search items on the website

  @Positive @Regression @P1 @Run
  Scenario: Search Validation
    Given I execute "Log In To Clean Origin" reusable step
    And For each "SearchValidation" csv entry:
      |I click on the "search" "element by id"                     |
      |I set "<searchRequest>" text to the "search" "element by id"|
      |I press "ENTER" for "search" "element by id"                |
      |I wait for "3" seconds                                      |
      |I should see the "xpath=<elementToValidate>" element        |
      |I click on the "Clean Origin Go To Homepage" element        |