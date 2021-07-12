@ProductFactory @DigitalContent
Feature: Digital Content List - add Search Filter - BPP-8380
  As a Senior Product Setter
  I want to create a Digital Content Id
  so that Course(s) can be given a Digital Content Id.

  Background:
    Given I execute "Log In" reusable step
    And I execute "Remember Variables " reusable step
    And I execute "Remember Variables Two" reusable step

  @Positive @P1 @HappyPath #TC-3568
  Scenario: Digital Content Page Filters Validation
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"
    # Check Body filters
    And I set "EC_BODY_SHORT_NAME_TWO" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I shouldn't see the "EC_BODY_SHORT_NAME" element
    And I click on the "Clear the search text" "element by title"
    # Check Level filters
    And I set "EC_LEVEL_SHORT_NAME_TWO" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I shouldn't see the "EC_BODY_SHORT_NAME" element
    And I click on the "Clear the search text" "element by title"
    # Check Paper filters
    And I set "EC_PAPER_NAME_TWO" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I shouldn't see the "EC_BODY_SHORT_NAME" element
    And I click on the "Clear the search text" "element by title"
    # Check Sitting filters
    And I set "EC_SITTING_NAME_TWO" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I shouldn't see the "EC_BODY_SHORT_NAME" element
    And I click on the "Clear the search text" "element by title"
    # Check Course Type filters
    And I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I shouldn't see the "EC_BODY_SHORT_NAME" element
    And I click on the "Clear the search text" "element by title"

  @Positive #TC-4592
  Scenario: Digital Content Search - Additional Filters
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"
    # Check Body Additional Filter
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "[EC_BODY_SHORT_NAME] - [EC_BODY_NAME]" "Product Factory dropdown option"
    And I click on the "Done" "Product Factory button"
    Then I should see the "EC_BODY_SHORT_NAME" "button"
    And I shouldn't see the "EC_BODY_SHORT_NAME_TWO" element
    And I click on the "Product Factory Clear Body Additional Filter" button
    # Check Level Additional Filter
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Level" "Product Factory dropdown"
    And I click on the "[EC_LEVEL_SHORT_NAME] - [EC_LEVEL_NAME]" "Product Factory dropdown option"
    And I click on the "Done" "Product Factory button"
    Then I should see the "EC_LEVEL_SHORT_NAME" "button"
    And I shouldn't see the "EC_LEVEL_SHORT_NAME_TWO" element
    And I click on the "Product Factory Clear Level Additional Filter" button
    # Check Course Type Additional Filter
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "CourseType" "Product Factory dropdown"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory dropdown option"
    And I click on the "Done" "Product Factory button"
    Then I should see the "EC_COURSE_TYPE_DESCRIPTION" "button"
    And I shouldn't see the "EC_COURSE_TYPE_DESCRIPTION_TWO" element
    And I click on the "Product Factory Clear Course Type Additional Filter" button
    # Check Sitting Additional Filter
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Sitting" "Product Factory dropdown"
    And I click on the "[EC_SITTING_NAME] ([EC_SITTING_START_DATE] - [EC_SITTING_END_DATE])" "Product Factory dropdown option"
    And I click on the "Done" "Product Factory button"
    Then I should see the "EC_SITTING_NAME" "button"
    And I shouldn't see the "EC_SITTING_SHORT_NAME_TWO" element
    And I click on the "Product Factory Clear Sitting Additional Filter" button
    # Check Paper Additional Filter
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Paper" "Product Factory dropdown"
    And I click on the "Equals" "Product Factory dropdown option"
    And I set "EC_PAPER_NAME" text to the "Paper" "Product Factory text field"
    And I click on the "Done" "Product Factory button"
    Then I should see the "EC_PAPER_NAME" "button"
    And I shouldn't see the "EC_PAPER_NAME_TWO" element
    And I click on the "Product Factory Clear Paper Additional Filter" button
    # Check all Additional Filters at once
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "[EC_BODY_SHORT_NAME] - [EC_BODY_NAME]" "Product Factory dropdown option"
    And I click on the "Level" "Product Factory dropdown"
    And I click on the "[EC_LEVEL_SHORT_NAME] - [EC_LEVEL_NAME]" "Product Factory dropdown option"
    And I click on the "CourseType" "Product Factory dropdown"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory dropdown option"
    And I click on the "Sitting" "Product Factory dropdown"
    And I click on the "[EC_SITTING_NAME] ([EC_SITTING_START_DATE] - [EC_SITTING_END_DATE])" "Product Factory dropdown option"
    And I click on the "Paper" "Product Factory dropdown"
    And I click on the "Equals" "Product Factory dropdown option"
    And I set "EC_PAPER_NAME" text to the "Paper" "Product Factory text field"
    And I click on the "Done" "Product Factory button"
    Then I should see the "EC_PAPER_NAME" "button"
    And I shouldn't see the "EC_PAPER_NAME_TWO" element
    And I click on the "Product Factory Clear Paper Additional Filter" button