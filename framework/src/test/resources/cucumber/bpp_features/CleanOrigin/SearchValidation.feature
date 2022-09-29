@CleanOrigin @SearchValidation
Feature: Search Validation
  As an user
  I want to be able to search items on the website

  @Positive @Regression @P1
  Scenario: Search Validation
    Given I am on "https://reskin.cleanorigin.com/" URL
    And I click on the "Accept Cookies" "text in span" if present
    And For each "SearchValidation" csv entry:
      |I click on the "Search Button" element                     |
      |I set "<searchRequest>" text to the "search" "element by id"|
      |I press "ENTER" for "search" "element by id"                |
      |I wait for "3" seconds                                      |
      |I should see the "xpath=<elementToValidate>" element        |
      |I click on the "Clean Origin Go To Homepage" element        |