@ProductFactory @DigitalContent
Feature: Digital Content Id - Create - BPP-5605
  As a Senior Product Setter
  I want to create a Digital Content Id
  so that Course(s) can be given a Digital Content Id.

  Background:
    Given I execute "Log In" reusable step
    And I execute "Remember Variables " reusable step

  #todo can create only one instance
  @Positive @P1 @HappyPath @PartiallyCoveredWithApi @NeedToBeUI #TC-3148, TC-3567, TC-5444
  Scenario: Create Digital Content
    Given I execute modified "Create Digital Content" reusable step
      |5|Add|Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"|
      |22|Add|I set "NameSuffix[###]" text to the "Name Suffix" "Product Factory text field"|
      |23|Add|I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_NAME] - [EC_SITTING_NAME] - [EC_NAME_SUFFIX]" element|
      |24|Add|I set "CourseReferenceID[###]" text to the "Course Reference ID" "Product Factory text field"|
      |25|Add|I should see the "EC_COURSE_REFERENCE_ID" "element by title"                                 |
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"

    And I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I click on the "Clear the search text" "element by title"

    And I set "EC_LEVEL_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I click on the "Clear the search text" "element by title"

    And I set "EC_PAPER_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I click on the "Clear the search text" "element by title"

    And I set "EC_SITTING_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I click on the "Clear the search text" "element by title"

    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_BODY_SHORT_NAME" element
    And I click on the "Clear the search text" "element by title"

  @Negative @P1 @HappyPath @CoveredWithApi #TC-3149
  Scenario: Create Digital Content Prevent Duplicate
    Given I execute "Create Digital Content" reusable step
    Then I should see the "Digital Content already exists" "text contained in element"

    #todo scenario is not complete
  @Negative @P1 @DoNotRun #TC-3194
  Scenario: Create Digital Content Additional Scenarios
    And I remember "AutoLevelNameTwo" text as "EC_LEVEL_NAME_TWO" variable
    And I remember "AutoLevelShortNameTwo" text as "EC_LEVEL_SHORT_NAME_TWO" variable
    And I remember "AtPprSNTwo" text as "EC_PPR_SN_TWO" variable
    And I remember "AutoPaperNameTwo" text as "EC_PAPER_NAME_TWO" variable
    And I remember "AutoPaperDescriptionTwo" text as "EC_PAPER_DESCRIPTION_TWO" variable
    And I remember "AutoSittingNameTwo" text as "EC_SITTING_NAME_TWO" variable

#    And I execute "Create Level" reusable step replacing some steps
#      |4|I set "LevelShortNameTwo[######]" text to the "Short Name" "Product Factory text field"|
#      |5|I set "LevelNameTwo[######]" text to the "Name" "Product Factory text field"|
#    And I execute "Create Paper" reusable step replacing some steps
#      |5|I set "PaperNameTwo[#####]" text to the "Name" "Product Factory text field"|
#      |6|I set "PaperDescriptionTwo[######]" text to the "Description" "Product Factory text field"|
#    And I execute "Link Paper To Level" reusable step replacing some steps
#      |3|I set "EC_PAPER_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
#      |5|I click on the "EC_PAPER_NAME_TWO" "Product Factory Link Levels button"|
#      |6|I "check" "EC_LEVEL_NAME_TWO" "Product Factory dialog checkbox"|
#    And I execute "Link Body To Level" reusable step replacing some steps
#      |4|I "check" "EC_LEVEL_NAME_TWO" "Product Factory dialog checkbox"|
#    And I execute "Link Body To Paper" reusable step replacing some steps
#      |3|I set "EC_PAPER_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
#      |5|I click on the "EC_PAPER_NAME_TWO" "Product Factory Change Body button"|
    Given I execute modified "Create Digital Content" reusable step
      |20|Add|I set "NameSuffix[###]" text to the "Name Suffix" "Product Factory text field"|
      |21|Add|I should see the "[EC_BODY_SHORT_NAME] - [EC_LEVEL_SHORT_NAME] - [EC_PAPER_NAME] - [EC_SITTING_NAME] - [EC_NAME_SUFFIX]" element|
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    Then I click on the "Cancel" "Product Factory button"
    Then I should see the "EC_BODY_SHORT_NAME" element