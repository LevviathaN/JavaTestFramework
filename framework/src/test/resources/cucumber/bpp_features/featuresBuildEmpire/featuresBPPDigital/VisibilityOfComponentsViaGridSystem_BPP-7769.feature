@BuildEmpire @DigitalSite
Feature: BPP Digital Visibility of Components via Grid System
  As an admin
  I'd like more visibility of the components used within the grid system
  So that I can build pages more effectively

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive @Smoke #TC-3786
  Scenario: Visibility of Components via Grid System
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Create CMS Page" reusable step
    #Add Components:
    #Add Grid Component 1:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Grid" "BPP Digital Admin Sub Menu Item links"
    And I select "1 column, full width" from "Layout *" "BPP Digital Mandatory select field"
    And I select "Colour" from "Background type" "BPP Digital Mandatory select field"
    And I select "Box" from "Container style *" "BPP Digital Mandatory select field"
    And I select "Red" from "Background colour" "BPP Digital Mandatory select field"
    And I wait for "3" seconds
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Grid was successfully created." "BPP Digital Admin Alert Message"
    Then I click on the "Back" "button"
    #Add Grid Component 2:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Grid" "BPP Digital Admin Sub Menu Item links"
    And I select "1 column, full width" from "Layout *" "BPP Digital Mandatory select field"
    And I select "Colour" from "Background type" "BPP Digital Mandatory select field"
    And I select "Box" from "Container style *" "BPP Digital Mandatory select field"
    And I select "Red" from "Background colour" "BPP Digital Mandatory select field"
    And I wait for "3" seconds
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Grid was successfully created." "BPP Digital Admin Alert Message"
    Then I click on the "Back" "button"
    #Add Grid Component 3:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Grid" "BPP Digital Admin Sub Menu Item links"
    And I select "1 column, full width" from "Layout *" "BPP Digital Mandatory select field"
    And I select "Colour" from "Background type" "BPP Digital Mandatory select field"
    And I select "Box" from "Container style *" "BPP Digital Mandatory select field"
    And I select "Red" from "Background colour" "BPP Digital Mandatory select field"
    And I wait for "3" seconds
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Grid was successfully created." "BPP Digital Admin Alert Message"
    Then I click on the "Back" "button"
    #Edit Grid Component 1:
    And I click on the "1" "BPP Digital Admin Pages Edit Button for Grid Component with number"
    And I set "GridOne[########]" text to the "Html" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Grid was successfully updated." "BPP Digital Admin Alert Message"
    Then I click on the "Back" "BPP Digital Student Applications Menu link"
    Then I validate text "EC_GRID_ONE" to be displayed for "BPP Digital Admin Pages HTML Anchor information of the First Grid Component" element
    #Edit Grid Component 2:
    And I click on the "2" "BPP Digital Admin Pages Edit Button for Grid Component with number"
    And I set "GridTwo[########]" text to the "Html" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Grid was successfully updated." "BPP Digital Admin Alert Message"
    Then I click on the "Back" "BPP Digital Student Applications Menu link"
    Then I validate text "EC_GRID_TWO" to be displayed for "BPP Digital Admin Pages HTML Anchor information of the Second Grid Component" element
    #Edit Grid Component 3:
    And I click on the "3" "BPP Digital Admin Pages Edit Button for Grid Component with number"
    And I set "GridThree[########]" text to the "Html" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Grid was successfully updated." "BPP Digital Admin Alert Message"
    Then I click on the "Back" "BPP Digital Student Applications Menu link"
    Then I validate text "EC_GRID_THREE" to be displayed for "BPP Digital Admin Pages HTML Anchor information of the Third Grid Component" element
    #Add Clean Up Component
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"