@ProductFactory @Papers
Feature: Reference Data - Paper - BPP-372
  As a Senior Product Setter
  I need to be able to create Papers
  So that I can use the Paper as part of a course template construction and shared between templates and instances.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression #TC-772
  Scenario: Add a New Paper Using a Modal
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Papers" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "PaperSN[###]" text to the "Short Name" "Product Factory text field"
    And I set "PaperDescription[######]" text to the "Description" "Product Factory text field two"
    And I click on the "Save" "Product Factory button"
    And I wait for "3" seconds
    And I set "EC_PAPER_DESCRIPTION" text to the "Description" "Product Factory text field"
    And I click on the "Search" "Product Factory button"
    Then I should see the "EC_PAPER_DESCRIPTION" element

  @Negative @P2 #TC-771
  Scenario: Submitting Incomplete Paper Fields
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Papers" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

  @Negative @P2 #TC-773
  Scenario: Add a Paper Where Description Already Exists
    When I execute "Create Paper" reusable step
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Papers" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "EC_PAPER_SN" text to the "Short Name" "Product Factory text field"
    And I set "EC_PAPER_DESCRIPTION" text to the "Description" "Product Factory text field two"
    And I click on the "Save" "Product Factory button"
    Then I should see the "Description must be unique" "message"

  @Negative @P2 #TC-4285
  Scenario: Ability to Search Instance by Paper Short Name
    When I execute "Create Paper" reusable step
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Papers" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "EC_PAPER_DESCRIPTION" text to the "Description" "Product Factory text field two"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"
    When I set "PaperLongSN[####]" text to the "Short Name" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "ShortName has a maximum length of 10 characters" message
    When I set "EC_PAPER_SN" text to the "Short Name" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "Short Name must be unique" "message"