@BuildEmpire @DigitalSite
Feature: BPP Digital Validate CMS Page Accordion Component

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive @Smoke #TC-2024 TC-2025 TC-2026
  Scenario: Validate CMS Page Accordion Component
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Create CMS Page" reusable step
  #Add Accordion Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Accordion" "BPP Digital Admin Sub Menu Item links"
    And I set "CMS Accordion" text to the "Html" "BPP Digital Mandatory input field"
    And I click on the "Add" "BPP Digital Search Label Button"
    And I set "AccordionTitle[####]" text to the "Title" "BPP Digital Mandatory input field"
    And I fill the "BPP Digital Component Description field" field with "AccordionDescription[####]"
  #Add second Accordion Component:
    And I click on the "Add" "BPP Digital Search Label Button"
    And I set "AccordionTitleTwo[####]" text to the "Title" "BPP Digital Mandatory second input field"
    And I fill the "BPP Digital Component Second Description field" field with "AccordionDescriptionTwo[####]"
    And I "check" "Opened" "BPP Digital Admin Mandatory Second checkbox"
    And I set "CMS Accordion 2" text to the "Html" "BPP Digital Mandatory second input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I wait for "2" seconds
  #Publish
    When I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
  #Navigate to CMS page
    Then I execute "Log Out from Hub Admin" reusable step
    When I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/EC_AUTO_CMS_URL" URL
  #Validate Component
    Then I should see the "CMS Accordion 2" "BPP Digital Web Site CMS Anchors ID"
    Then I should see the "EC_ACCORDION_TITLE_TWO" element
    Then I should see the "EC_ACCORDION_DESCRIPTION_TWO" element
    Then I shouldn't see the "EC_ACCORDION_DESCRIPTION" element
    Then I should see the "CMS Accordion" "BPP Digital Web Site CMS Anchors ID"
    Then I wait for "3" seconds
    Then Attribute "aria-expanded" of "BPP Digital Web Site Accordion Item" should have value "false"
    Then I click on the "BPP Digital Web Site Accordion Item" element
    Then I wait for "3" seconds
    Then Attribute "aria-expanded" of "BPP Digital Web Site Accordion Item" should have value "true"
    Then I validate text "EC_ACCORDION_DESCRIPTION" to be displayed for "BPP Digital Accordion Component Description Block" element
    Then I shouldn't see the "EC_ACCORDION_DESCRIPTION_TWO" element
    Then Browser performs "Refresh" command
    Then I should see the "CMS Accordion" "BPP Digital Web Site CMS Anchors ID"
    Then I wait for "3" seconds
    Then Attribute "aria-expanded" of "BPP Digital Web Site Accordion Item" should have value "false"
    Then I click on the "BPP Digital Web Site Accordion Item" element
    Then I wait for "3" seconds
    Then Attribute "aria-expanded" of "BPP Digital Web Site Accordion Item" should have value "true"
    Then I validate text "EC_ACCORDION_DESCRIPTION" to be displayed for "BPP Digital Accordion Component Description Block" element
    Then I shouldn't see the "EC_ACCORDION_DESCRIPTION_TWO" element
  #Add Clean Up Component
    When I execute "Log In to Hub as Admin" reusable step
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"
