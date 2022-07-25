@Reusable
Feature: Clean Origin

  Scenario: Log In To Clean Origin
    Given I am on "https://www.cleanorigin.com" URL
    And I click on the "Sign In" "link"
    And I click on the "Accept Cookies" "text in span" if present
    And I set "ruslan.levytskyi@fortegrp.com" text to the "email" "element by id"
    And I set "TkjU8Ynr@" text to the "pass" "element by id"
    And I click on the "Sign In" "span"
    And I click on the "Clean Origin Go To Homepage" element
