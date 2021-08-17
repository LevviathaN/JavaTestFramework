@ProductFactory @ExamPreparations @HappyPath
Feature: Additional Product Information - Exam Preparation Name - Ref Data - BPP-10219
  As a member of course setup
  I expect to be able to manage the 'Exam Prep names' that are available for Course Type within Product Factory.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 @CoveredWithApi #TC-4692
  Scenario: Add a New Exam Preparation Using a Modal
    Given I execute "Create Exam Preparation" reusable step
    Then I should see the "EC_EXAM_PREPARATION_NAME" element

  @Negative @P2 @NoQTest
  Scenario: Submitting Incomplete Exam Preparation Fields
    When I click on the "Types" "Product Factory navigation item"
    When I click on the "Exam Preparations" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

  @Negative @P2 #TC-4694
  Scenario: Add a Exam Preparation Where Name Already Exists
    When I execute "Create Exam Preparation" reusable step
    When I execute "Create Exam Preparation" reusable step replacing some steps
      |4|I set "EC_EXAM_PREPARATION_NAME" text to the "Name" "Product Factory text field"|
    Then I should see the "Name must be unique" message

  @Negative @P2 #TC-4695
  Scenario: Amend a Exam Preparation Where Name Already Exists
    When I execute "Create Exam Preparation" reusable step
    When I execute "Create Exam Preparation" reusable step replacing some steps
      |4|I set "ExamPreparationNameTwo[######]" text to the "Name" "Product Factory text field"|
    When I execute "Create Exam Preparation" reusable step replacing some steps
      |3|I click on the "EC_EXAM_PREPARATION_NAME" "Product Factory edit button"|
      |4|I set "EC_EXAM_PREPARATION_NAME_TWO" text to the "Name" "Product Factory text field"|
    Then I should see the "Name must be unique" message

  @Positive @Regression @P1 @Amend @CoveredWithApi #TC-4693
  Scenario: Amend a Exam Preparation Using a Modal
    Given I execute "Create Exam Preparation" reusable step
    When I execute modified "Create Exam Preparation" reusable step
      |3|Replace|I click on the "EC_EXAM_PREPARATION_NAME" "Product Factory edit button"|
    Then I should see the "EC_EXAM_PREPARATION_NAME" element