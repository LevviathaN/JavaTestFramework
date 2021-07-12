@Mobile
Feature: BPP Digital Course and Insight Card Style Changes

  Background:
    Given I am on "MD_COMMON_LINKS_BPPDIGITALINDEXURL" URL

  @Positive @iPad @iPhone @Samsung #TC-1971
  Scenario: Course and Insight Card Style Changes
    And I click on the "Digital Site Mobile Hamburger Menu" element by JS
    And I wait for "2" seconds
    And I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "2" seconds
    And I click on the "Law" "BPP Digital Student Applications Menu link"
    And I wait for "2" seconds
    Then I validate text "Law" to be displayed for "BPP Digital Course Card Profession text field" element
    Then I validate text "Postgraduate" to be displayed for "BPP Digital Course Card Type text field" element
    Then Attribute "class" of "BPP Digital Course Card Title Header text field" should have value "CONTAINS=post-card-title"
    Then Attribute "class" of "BPP Digital Course Card Content Summary text field" should have value "CONTAINS=post-card-summary"
    Then Attribute "class" of "BPP Digital Course Card Content More Information link" should have value "CONTAINS=more-information"