@ProductFactory @Programme
Feature: Onboarding - Programme - Reference Data - BPP-14453
  As a member of the PS team,
  I want to be able to configure a University Programme Cohort into PF,
  So that I can create the master record of University Programme Cohort and configure them with their educational content and associate with a Programme.

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoProgrammeName" text as "EC_PROGRAMME_NAME" variable
    And I remember "AutoProgrammeCode" text as "EC_PROGRAMME_CODE" variable

  @Positive @Regression @P1 #TC-5391
  Scenario: Add a New Programme Cohort Using a Modal
    Given I execute "Create Programme Cohort" reusable step

  @Negative @P2 #TC-5401
  Scenario: Create Duplicate of Existing Programme Cohort
    Given I execute "Create Programme Cohort" reusable step
    When I execute "Create Programme Cohort" reusable step replacing some steps
      |7|I set "EC_COHORT_NAME" text to the "Name" "Product Factory text field"|
      |9|I should see the "Name must be unique" message                           |

  @Positive @Regression @P1 @Amend #TC-5392
  Scenario: Amend a Programme Cohort Using a Modal
    When I execute "Create Programme Cohort" reusable step
    When I execute modified "Create Programme Cohort" reusable step
      |3|Replace|I click on the "EC_COHORT_NAME" "Product Factory edit button"|
      |4|Replace|Attribute "tabindex" of "University Programme" "Product Factory change button" should have value "-1"|
      |5|Delete |                                                                                                     |
      |6|Replace|I set "~CohortStartDateNew[12/12/2020]" text to the "Start Teaching Date" "Product Factory text field"  |
      |7|Replace|I press "MD_COMMON_KEYBOARD_ENTER" for "Start Teaching Date" "Product Factory text field"|
      |8|Delete |                                                                                         |