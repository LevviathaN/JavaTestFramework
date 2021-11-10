@ProductFactory @StudyMode @HappyPath
Feature: Study Mode - New Reference Data - BPP-12385
  As a member of course setup
  I expect to be able to manage the 'Study Modes' that are available for Course Type within Product Factory.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 @CoveredWithApi #TC-4793
  Scenario: Add a New Study Mode Using a Modal
    Given I execute "Create Study Mode" reusable step

  @Negative @Amend @P2 @CoveredWithApi #TC-4798
  Scenario: Amend a Study Mode With the Name That Already Exists
    When I execute "Create Study Mode" reusable step
    When I execute modified "Create Study Mode" reusable step
      |4|Replace|I set "SMForDuplicateEditingTest[####]" text to the "Name" "Product Factory text field"|
      |7|Replace|I should see the "EC_SM_FOR_DUPLICATE_EDITING_TEST" element                            |
    When I execute modified "Create Study Mode" reusable step
      |3|Replace|I click on the "EC_STUDY_MODE_NAME" "Product Factory edit button"|
      |4|Replace|I set "SMForDuplicateEditingTest" text to the "Name" "Product Factory text field"|
      |7|Replace|I should see the "Name must be unique" message                                   |

  @Negative @P2 @CoveredWithApi #TC-4797
  Scenario: Add a Study Mode Where Name Already Exists
    When I execute "Create Study Mode" reusable step replacing some steps
      |4|I set "EC_STUDY_MODE_NAME" text to the "Name" "Product Factory text field"|
      |7|I should see the "Name must be unique" message                            |

  @Positive @Regression @P1 @Amend @CoveredWithApi #TC-4795
  Scenario: Amend a Study Mode Using a Modal
    When I execute "Create Study Mode" reusable step
    When I execute modified "Create Study Mode" reusable step
      |3|Replace|I click on the "EC_STUDY_MODE_NAME" "Product Factory edit button"|