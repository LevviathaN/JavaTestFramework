@ProductFactory @Courses @NumberOfSteps
Feature: Ability to add Steps in Product Factory Course - BPP-12616
  As a member of course setup, when creating a PQ (achievement ladder) course in Product Factory,
  I expect to be able to outline how many 'steps' are included in the course
  as this will allow me to add due dates to those steps.

  Background:
    Given I execute "Generate ISBN" reusable step
    Given I execute "Log In" reusable step
    And I execute "Remember Variables " reusable step

  @Positive @P1 #TC-5332
  Scenario: Create Course Without Number of Steps
    Given I execute modified "Create Course" reusable step
      |16|Delete||
      |17|Delete||
      |18|Delete||
    Then I should see the "Edit Course" element

  @Positive @P1 #TC-5332
  Scenario: Create Course With Number of Steps
    Given I execute "Create Course" reusable step
    Then I should see the "Edit Course" element

  @Positive @P1 #TC-5333
  Scenario: Edit Course Number of Steps
    Given I execute "Edit Course" reusable step
    And I click on the "Number of Steps" "Product Factory edit button"
    And I set "1" text to the "Number of Steps" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "Edit Course" element