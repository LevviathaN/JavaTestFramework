@ProductFactory @Programme
Feature: Onboarding - Programme - Reference Data - BPP-14453
  As a member of the PS team,
  I want to be able to configure a University Programme into PF,
  So that I can create the master record of University Programme and configure them against the Programme Cohort nodes.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 #TC-5387
  Scenario: Add a New Programme Using a Modal
    Given I execute "Create Programme" reusable step

  @Negative @P2 #TC-5390
  Scenario: Amend Programme With Duplicate Values
    When I execute "Create Programme" reusable step
    When I execute modified "Create Programme" reusable step
      |3|Replace|I click on the "EC_PROGRAMME_NAME" "Product Factory edit button"|
      |4|Replace|I set "AutoProgrammeCode" text to the "Code" "Product Factory text field"|
      |5|Replace|I set "AutoProgrammeName" text to the "Name" "Product Factory text field"|
      |7|Replace|I should see the "Name must be unique" message                           |
    And I should see the "Code must be unique" message

  @Negative @P2 #TC-5389
  Scenario: Create Duplicate of Existing Programme
    Given I execute "Create Programme" reusable step
    When I execute "Create Programme" reusable step replacing some steps
      |4|I set "EC_PROGRAMME_CODE" text to the "Code" "Product Factory text field"|
      |5|I set "EC_PROGRAMME_NAME" text to the "Name" "Product Factory text field"|
      |7|I should see the "Name must be unique" message                           |
    And I should see the "Code must be unique" message

  @Positive @Regression @P1 @Amend #TC-5388
  Scenario: Amend a Programme Using a Modal
    When I execute "Create Programme" reusable step
    When I execute modified "Create Programme" reusable step
      |3|Replace|I click on the "EC_PROGRAMME_NAME" "Product Factory edit button"|