@Mobile
Feature: As an admin, when I create a grid component with a "STANDARD" style,
  I expect to have the option to enter the padding for the top and bottom of the grid background,
  with separate inputs for desktop, mobile and tablet

  Background:
    Given I execute "Log In to Hub as Admin" reusable step replacing some steps
      |4|I click on the "Direct App Login Button" button by JS|
      |5|I wait for "20" seconds|

  @Positive @iPad @iPhone @Samsung #TC-1977, TC-2045, TC-2046
  Scenario: Create and Validate Grid Styling_Mobile
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages" URL
    And I execute "Create CMS Page" reusable step
    #Add Grid Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Grid" "BPP Digital Admin Sub Menu Item links"
    And I select "2 columns, 70%, 30%" from "Layout *" "BPP Digital Mandatory select field"
    And I select "Colour" from "Background type" "BPP Digital Mandatory select field"
    And I select "Standard" from "Container style *" "BPP Digital Mandatory select field"
    And I select "Red" from "Background colour" "BPP Digital Mandatory select field"
    Then I set "35" text to the "Tablet" "BPP Digital Admin Grid Component Padding Top"
    Then I set "35" text to the "Mobile" "BPP Digital Admin Grid Component Padding Top"
    Then I set "25" text to the "Tablet" "BPP Digital Admin Grid Component Padding Bottom"
    Then I set "25" text to the "Mobile" "BPP Digital Admin Grid Component Padding Bottom"
    Then I set "45" text to the "Mobile" "BPP Digital Admin Grid Bottom Margin"
    Then I set "45" text to the "Tablet" "BPP Digital Admin Grid Bottom Margin"
    And I wait for "3" seconds
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Grid was successfully created." "BPP Digital Admin Alert Message"
    Then I click on the "Back" "button"
    #Publish CMS Page
    When I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
    #Validate CMS Page was published and validate it's components
    When I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/<EC_AUTO_CMS_URL>" URL
    #Validate Grid:
    Then I should see the "BPP Digital Web Site Grid Component Red block" element
    Then Сss "padding-top" of "BPP Digital Web Site Grid Component Red block" should have value "35px"
    Then Сss "padding-bottom" of "BPP Digital Web Site Grid Component Red block" should have value "25px"
    Then Сss "margin-bottom" of "BPP Digital Web Site Grid Component Red block" should have value "45px"
    #Add Clean Up Component
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages" URL
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"
