@Google @Search
Feature: Google Search
  As Google user
  I want to see all elements of the search page
  In order to be able to find some interesting thing

  Scenario: Verify presence of Google Search page elements
    Given I launch Chrome browser
    When I open Google Homepage
    Then I verify that the page displays search text box
    Then I verify that the page displays Google Search button
    Then I verify that the page displays Im Feeling Lucky button