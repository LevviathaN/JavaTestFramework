@ProductFactory @Courses @BulkOperations @HappyPath
Feature: Bulk Operation -Course List Page - multiple selection for Bulk Publish/Deactivation - BPP-9729
  As a Product Setter
  I want to be able to be able make a multiple selection of the Course list
  so that a bulk operation can be applied to them.

  Background:
    Given I execute "Log In" reusable step

  @Positive @P1 @NeedToBeUI #TC-4013
  Scenario: Multiple Selection For Course Bulk Operations
    Given I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"

    #Verify 'Perform Bulk Operation' button is disabled if there is no selected Courses
    Then Attribute "tabindex" of "Perform Bulk Operation" "Product Factory button" should have value "-1"

    #Verify 'Perform Bulk Operation' button is disabled if there is no Courses on the page
    And I set "NoCourse" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I wait for "5" seconds
    Then Attribute "tabindex" of "Perform Bulk Operation" "Product Factory button" should have value "-1"
    Then I click on the "Clear the search text" "element by title"

    #Verify 'Perform Bulk Operation' button is active if there is one or more courses selected
    And I set "AutoBodyShortName" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I wait for "5" seconds
    When I click on the "AutoBodyShortName" "Product Factory Course Page checkbox"
    And I set "AutoBodyShortNameTwo" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I wait for "5" seconds
    When I click on the "AutoBodyShortNameTwo" "Product Factory Course Page checkbox"
    Then Attribute "tabindex" of "Perform Bulk Operation" "Product Factory button" should have value "0"