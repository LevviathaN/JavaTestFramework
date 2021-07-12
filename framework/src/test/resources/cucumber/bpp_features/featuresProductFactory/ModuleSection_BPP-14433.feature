@ProductFactory @ModuleSections
Feature: Onboarding - Module Section - Reference Data - BPP-14433
  As a member of the PS team,
  I want to be able to configure a Module Section (Module Node) into PF,
  So that I can create a mapping of Module references against Hub Content.

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoProgrammeName" text as "EC_PROGRAMME_NAME" variable
    And I remember "AutoProgrammeCode" text as "EC_PROGRAMME_CODE" variable
    And I remember "AutoCohortName" text as "EC_COHORT_NAME" variable

  @Positive @Regression @P1 @HappyPath #TC-5407
  Scenario: Add a New Module Section Using a Modal
    Given I execute "Create Module Section" reusable step

  @Negative @P2 @HappyPath #TC-5410
  Scenario: Create Duplicate of Existing Module Section
    Given I execute "Create Module Section" reusable step
    When I execute "Create Module Section" reusable step replacing some steps
      |6|I set "EC_MODULE_SECTION_NAME" text to the "Name" "Product Factory text field"|
      |7|I set "EC_SIS_TERM_CODE" text to the "SIS Term Code" "Product Factory text field"|
      |9|I should see the "SIS Term Code must be unique" message                           |

  @Positive @Regression @P1 @Amend #TC-5409
  Scenario: Amend a Programme Module Section a Modal
    Given I execute modified "Create Programme Cohort" reusable step
        |7|Replace|I set "CohortNameTwo[######]" text to the "Name" "Product Factory text field"|
    When I execute "Create Module Section" reusable step
    When I execute modified "Create Module Section" reusable step
      |3|Replace|I click on the "EC_MODULE_SECTION_NAME" "Product Factory edit button"|
      |5|Replace|I click on the "EC_COHORT_NAME_TWO" "Product Factory select button"|

  @Negative @P2 @Amend #TC-5412
  Scenario: Amend Module Section With Duplicate Values
    When I execute modified "Create Module Section" reusable step
      |7|Replace|I set "~SISTermCodeTwo[######]" text to the "SIS Term Code" "Product Factory text field"|
    When I execute "Create Module Section" reusable step
    When I execute modified "Create Module Section" reusable step
      |3|Replace|I click on the "EC_MODULE_SECTION_NAME" "Product Factory edit button"|
      |4|Delete |                                                                     |
      |5|Delete ||
      |6|Replace|I set "AutoModuleSectionName" text to the "Name" "Product Factory text field"|
      |7|Replace|I set "EC_SIS_TERM_CODE_TWO" text to the "SIS Term Code" "Product Factory text field"|
      |9|Replace|I should see the "SIS Term Code must be unique" message                           |