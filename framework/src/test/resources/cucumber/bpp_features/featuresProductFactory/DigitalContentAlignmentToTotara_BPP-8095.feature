@ProductFactory @DigitalContent
Feature: Better alignment of Totara Course and Product Factory Digital Content (Terra Changes) - BPP-8095
  As a member of VLE Operations
  I would like the Course Name and Category in Totara to reflect the Digital Content that's setup in Product Factory
  So that I know what my Course represents
  Students aren't confused by a Course Name that doesn't reflect what they are studying

  Background:
    Given I execute "Log In" reusable step
    And I execute "Remember Variables " reusable step

  @Positive @P1 #TC-3453, TC-3455
  Scenario: Verify Digital Content Name Suffix Field
    Given I execute modified "Create Digital Content" reusable step
      |21|Add|I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_NAME] - [EC_SITTING_NAME]" element|
      |22|Add|I set "NameSuffix[###]" text to the "Name Suffix" "Product Factory text field"|
      |23|Add|I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_NAME] - [EC_SITTING_NAME] - [EC_NAME_SUFFIX]" element|
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element

  @Negative @P1 @CoveredWithApi #TC-3453
  Scenario: Digital Content Name Suffix Field Prevent Duplicate
    Given I execute "Create Digital Content" reusable step with some additional steps
      |21|I set "Suffix[###]" text to the "Name Suffix" "Product Factory text field"|
      |22|I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_NAME] - [EC_SITTING_NAME] - [EC_SUFFIX]" element|
    Given I execute "Create Digital Content" reusable step with some additional steps
      |21|I set "EC_SUFFIX" text to the "Name Suffix" "Product Factory text field"|
    Then I should see the "Digital Content already exists for the combination of Body, Level, Paper, Sitting ([EC_SITTING_NAME]) & Course Type ([EC_COURSE_TYPE_DESCRIPTION])" message