@ProductFactory @Papers @Amend
Feature: Amend Reference Data - Paper - BPP-660
  As a Senior Product Setter
  I need to be able to Amend Papers,
  so that I can use the Paper as part of a course template construction and shared between templates and instances.

  Background:
    Given I execute "Log In" reusable step
    And I remember "EditPprSN" text as "EC_PPR_SN_EDIT" variable
    And I remember "AutoPaperNameEdit" text as "EC_PAPER_NAME_EDIT" variable
    And I remember "AutoPaperDescriptionEdit" text as "EC_PAPER_DESCRIPTION_EDIT" variable
    And I remember "AutoPprSN" text as "EC_PPR_SN" variable
    And I remember "AutoPaperName" text as "EC_PAPER_NAME" variable
    And I remember "AutoPaperDescription" text as "EC_PAPER_DESCRIPTION" variable
    And I remember "AutoVerticalName" text as "EC_VERTICAL_NAME" variable

  @Positive @Regression @P1 #TC-828
  Scenario: Amend a Paper Using a Modal
    Given I execute modified "Create Paper" reusable step
      |3|Add|I set "EC_PAPER_DESCRIPTION_EDIT" text to the "Search" "Product Factory text field" from keyboard|
      |4|Add|I click on the "submit" "element by type"|
      |5|Replace|I click on the "EC_PAPER_NAME_EDIT" "Product Factory edit button"|
      |6|Replace|I set "PprSNTwo[##]" text to the "Short Name" "Product Factory text field"|
      |7|Replace|I set "PaperNameTwo[#####]" text to the "Name" "Product Factory text field"|
      |8|Replace|I set "PaperDescriptionTwo[######]" text to the "Description" "Product Factory text field"|
      |14|Replace|I set "EC_PAPER_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
      |16|Replace|I should see the "EC_PAPER_NAME_TWO" element|
    #Cleanup, to return paper to initial state, to avoid problems in future scenarios require it
    Given I execute modified "Create Paper" reusable step
      |3|Add|I set "EC_PAPER_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
      |4|Add|I click on the "submit" "element by type"|
      |5|Replace|I click on the "EC_PAPER_NAME_TWO" "Product Factory edit button"|
      |6|Replace|I set "EC_PPR_SN_EDIT" text to the "Short Name" "Product Factory text field"|
      |7|Replace|I set "EC_PAPER_NAME_EDIT" text to the "Name" "Product Factory text field"|
      |8|Replace|I set "EC_PAPER_DESCRIPTION_EDIT" text to the "Description" "Product Factory text field"|
      |14|Replace|I set "EC_PAPER_DESCRIPTION_EDIT" text to the "Search" "Product Factory text field" from keyboard|
      |16|Replace|I should see the "EC_PAPER_NAME_EDIT" element|

  @Negative @P2 @BlockedByIssue #TC-827
  Scenario: Submitting Unchanged Paper Fields
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Papers" "Product Factory navigation sub item"
    Then I set "EC_PAPER_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    When I click on the "EC_PAPER_NAME" "Product Factory edit button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

#    todo to be replaced by Amend a Paper Where Name Already Exists
  @Negative @P2 @DoNotRun #TC-831 not actual
  Scenario: Amend a Paper Where Description Already Exists
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Papers" "Product Factory navigation sub item"
    Then I set "EC_PAPER_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    When I click on the "EC_PAPER_NAME" "Product Factory edit button"
    And I set "AutoPaperDescriptionTwo" text to the "Description" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "Description must be unique" "message"

  @Negative @P2 #TC-831
  Scenario: Amend a Paper Where Name Already Exists
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Papers" "Product Factory navigation sub item"
    Then I set "EC_PAPER_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    When I click on the "EC_PAPER_NAME" "Product Factory edit button"
    And I set "AutoPaperNameTwo" text to the "Name" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "Name must be unique" "message"

  @Positive @Regression @P1 #TC-1552
  Scenario: Amend a Paper Changing Body And Level
    Given I execute "Create Paper" reusable step
    When I execute "Create Body Financial Dimension" reusable step
    When I execute "Create Body" reusable step
    When I execute "Create Body" reusable step replacing some steps
      |4|I set "BodyShortNameNew[######]" text to the "Short Name" "Product Factory text field"|
      |5|I set "BodyNameNew[######]" text to the "Name" "Product Factory text field"           |
    When I execute "Create Level" reusable step
    When I execute "Create Level" reusable step replacing some steps
      |4|I set "LevelShortNameNew[######]" text to the "Short Name" "Product Factory text field"|
      |5|I set "LevelNameNew[######]" text to the "Name" "Product Factory text field"           |
    When I execute "Link Body To Level" reusable step
    When I execute "Link Body To Paper" reusable step
    When I execute "Link Paper To Level" reusable step
    When I execute "Link Body To Level" reusable step replacing some steps
      |3|I click on the "EC_BODY_NAME_NEW" "Product Factory Link Levels button"  |
      |4|I click on the "EC_LEVEL_NAME_NEW" "Product Factory dialog checkbox"|
    When I execute "Link Body To Paper" reusable step replacing some steps
      |6|I click on the "EC_BODY_NAME_NEW" "Product Factory select button"|
    When I execute "Link Paper To Level" reusable step replacing some steps
      |6|I "check" "EC_LEVEL_NAME_NEW" "Product Factory dialog checkbox"|