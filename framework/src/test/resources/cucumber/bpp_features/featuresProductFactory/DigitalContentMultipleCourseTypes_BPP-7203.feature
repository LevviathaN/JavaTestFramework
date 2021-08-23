@ProductFactory @DigitalContent
Feature: Digital Content Id - Multiple Course Types - BPP-7203
  As a Senior Product Setter
  I want to create Digital Content
  so that Course(s) can be given a Digital Content Id.

  Background:
    Given I execute "Log In" reusable step
    And I execute "Remember Variables For Creation " reusable step

#    When I execute "Create Body Financial Dimension" reusable step
#    And I execute "Create Body" reusable step
#    And I execute "Create VAT Rule" reusable step
#    And I execute "Create Course Type Financial Dimension" reusable step
#    And I execute "Create Course Type" reusable step
    And I execute "Create Course Type" reusable step replacing some steps
      |4|I set "CourseTypeDescriptionTwo[######]" text to the "Description" "Product Factory text field"|
      |13|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
      |15|I should see the "EC_COURSE_TYPE_DESCRIPTION_TWO" element                                         |
#    And I execute "Create Location Financial Dimension" reusable step
#    And I execute "Create Region Financial Dimension" reusable step
#    And I execute "Create Region" reusable step
#    And I execute "Create Location" reusable step
#    And I execute "Create Level" reusable step
#    And I execute "Create Paper" reusable step
#    And I execute "Link Body To Level" reusable step
#    And I execute "Link Body To Paper" reusable step
#    And I execute "Link Paper To Level" reusable step
#    And I execute "Create Sitting" reusable step
    And I execute "Create Sitting" reusable step replacing some steps
      |4|I set "SittingNameTwo[######]" text to the "Name" "Product Factory text field"|

  @Positive @P1 #TC-3203
  Scenario: Create Digital Content Multiple Course Types
    Given I execute "Create Digital Content" reusable step with some additional steps
      |21|I set "Suffix[###]" text to the "Name Suffix" "Product Factory text field"|
      |22|I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_NAME] - [EC_SITTING_NAME] - [EC_SUFFIX]" element|
    Given I execute modified "Create Digital Content" reusable step
      |22|Add|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Description" "Product Factory text field"|
      |23|Add|I click on the "Search" "Product Factory button two"|
      |24|Add|I "check" "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory dialog checkbox"|

  @Negative @P1 #TC-3204
  Scenario: Create Digital Content Multiple Course Types Duplicate
    Given I execute modified "Create Digital Content" reusable step
      |21|Add|I set "Suffix[###]" text to the "Name Suffix" "Product Factory text field"|
      |22|Add|I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_NAME] - [EC_SITTING_NAME] - [EC_SUFFIX]" element|
      |24|Add|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Description" "Product Factory text field"|
      |25|Add|I click on the "Search" "Product Factory button two"|
      |26|Add|I "check" "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory dialog checkbox"|
    Given I execute modified "Create Digital Content" reusable step
      |21|Add|I set "EC_SUFFIX" text to the "Name Suffix" "Product Factory text field"|
      |22|Add|I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_NAME] - [EC_SITTING_NAME] - [EC_SUFFIX]" element|
      |24|Add|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Description" "Product Factory text field"|
      |25|Add|I click on the "Search" "Product Factory button two"|
      |26|Add|I "check" "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory dialog checkbox"|
    Then I should see the "Digital Content already exists" "text contained in element"

  @Positive @P1 @DoNotRun @NotFinished #TC-3205, TC-3206
  Scenario: Create Digital Content Multiple Course Types Remove
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Given I execute "Create Digital Content" reusable step with some additional steps
      |15|I "check" "EC_SITTING_NAME_TWO" "Product Factory dialog checkbox"|
      |21|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
      |22|I click on the "submit" "element by type"|
      |23|I "check" "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory dialog checkbox"|
#    Then I should see the "EC_BODY_SHORT_NAME" element
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"
    And  I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    And I click on the "Course Types" "Product Factory edit button"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type two"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory checkbox"
    And I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type two"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory checkbox"
    And I click on the "Save" "Product Factory active button"
    And I click on the "Save" "Product Factory active button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"
    And I click on the "Course Types" "Product Factory edit button"
    And I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type two"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory checkbox"
    And I click on the "Save" "Product Factory active button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "0"