@ProductFactory @Courses @NumberOfSteps @HappyPath
Feature: Ability to add Step Due Dates in Product Factory Course Instance - BPP-12620
  As a member of course setup, when creating a PQ (achievement ladder) course in Product Factory,
  I expect to be able to set due dates to any steps that have been added to the course.

  Background:
    Given I execute "Generate ISBN" reusable step
    Given I execute "Log In" reusable step
    And I execute "Remember Variables For Creation " reusable step

  @Positive @P1 #TC-5354
  Scenario: Set Course Step Due Dates
    Given I execute "Create Course" reusable step
    And I execute "Create Course Instance" reusable step
    And I execute "Populate Course Instance Session Dates" reusable step
    And I click on the "Product Factory Change Course Step Due Date" button
    And I set "[TODAY]" text to the "Due Date" "Product Factory text field"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"
    Then I click on the "Activate" "Product Factory button"
    And I execute "Keep the Course Instance Activated" reusable step
    Then I should see the "Deactivate" button

  @Positive @P1 #TC-5355
  Scenario: Set Course Step Due Dates Additional Scenarios
    Given I execute modified "Create Course" reusable step
      |17|Replace|I set "3" text to the "Number of Steps" "Product Factory text field"|
    And I execute "Create Course Instance" reusable step
    And I execute "Populate Course Instance Session Dates" reusable step
    Then I click on the "Activate" "Product Factory button"
    And I click on the "Activate" "Product Factory button"
    Then I should see the "has incomplete Step due dates" "text contained in element"
    And I click on the "Product Factory Change Course Step Due Date" button
    Then For each "Due Date" "Product Factory text field":
      |I fill the "FOR_ITEM" field with "[TODAY]"|
      |I click on the "Next" "Product Factory button"          |
    And I click on the "Finish" "Product Factory button"
    And I execute "Keep the Course Instance Activated" reusable step
    Then I should see the "Deactivate" button