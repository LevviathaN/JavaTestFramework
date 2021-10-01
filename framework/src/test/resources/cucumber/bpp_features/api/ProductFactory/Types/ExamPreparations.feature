@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @ExamPreparation #TC-4692
  Scenario: Add a New Exam Preparation Using a Modal
    Given I execute "Create Exam Preparation" API step

  @ExamPreparation @Update @NeedToBeUi #TC-4693
  Scenario: Amend a Exam Preparation Using a Modal
    Given I execute "Create Exam Preparation" API step
    Then I execute "Update Exam Preparation" API step

  @ExamPreparation @Duplicate #TC-
  Scenario: Add a Exam Preparation Where Name Already Exists
    Given I execute "Create Exam Preparation" API step
    Then I execute negative "Create Exam Preparation" API step with error name "Name must be unique" and parameters
      |name|EC_EXAM_PREPARATION_NAME|

  @ExamPreparation @Duplicate #TC-
  Scenario: Amend a Exam Preparation Where Name Already Exists
    Given I execute "Create Exam Preparation" API step
    And I execute "Create Exam Preparation" API step saving as "TWO_"
    Then I execute negative "Update Exam Preparation" API step with error name "Name must be unique" and parameters
      |name|EC_TWO_EXAM_PREPARATION_NAME|

  @ExamPreparation @Incomplete #TC-
  Scenario: Submitting Incomplete Exam Preparation Fields
    Given I execute negative "Create Exam Preparation" API step with error name "The Name field is required." and parameters
      |name       ||
    Given I execute negative "Create Exam Preparation" API step with error name "The Description field is required." and parameters
      |description||