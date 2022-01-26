@ProductFactory @Courses @Search @InfiniteScrolling
Feature: Course Search - Infinite Scrolling - BPP-10787
  As a Product Setter
  I want to traverse multiple pages of results
  so that the set of Courses is limited and load times are significantly reduced.

  @Positive #TC-4415
  Scenario: Course Search - Infinite Scrolling
    Given I execute "Log In" reusable step
    When I click on the "Products" "Product Factory navigation item"
    Then I click on the "Courses" "Product Factory navigation sub item"
    And I execute steps until "There are no more Courses to be loaded" "element is present"
    |I should scroll to the "bottom" of the page       |
    |I should see the "Loading more Courses..." message|
