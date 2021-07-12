@BuildEmpire @DigitalSite
Feature: BPP Digital Profession Related Content on an Appropriate URL Structure

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive #TC-1683 TC-1684 TC-1685 TC-1686
  Scenario: Profession Related Content on an Appropriate URL Structure
  #Validate Courses and Profession block under Website
    When I execute "Admin Hub Navigate to new Courses Pages" reusable step
    And I execute "Admin Hub Navigate to new Professions Pages" reusable step
  #Create and Validate Old Profession Page
    When I click on the "Website" "BPP Digital Admin Menu Item links"
    And I click on the "Professions" "BPP Digital Admin Sub Menu Item links"
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "OldProfessionName[#####]" text to the "Name *" "BPP Digital Mandatory input field"
    And I set "AutoOldProfUrl[#####]" text to the "URL path *" "BPP Digital Mandatory input field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Profession was successfully created." "BPP Digital Admin Alert Message"
    And I wait for "2" seconds
    And I execute "Log Out from Hub Admin" reusable step
    And I am on "https://web-stage-bppdigital.bppuniversity.com/courses/<EC_AUTO_OLD_PROF_URL>" URL
    And I should see the "EC_OLD_PROFESSION_NAME" element
  #Validate New Profession page Type under CMS Pages
    When I execute "Log In to Hub as Admin" reusable step
    And I execute "Admin Hub Navigate to CMS Pages" reusable step
    When I click on the "Add" "BPP Digital Admin Page Button"
    Then I should see the "profession" "BPP Digital Drop Down Option value"
    Then I should see the "course" "BPP Digital Drop Down Option value"
    And I set "NewProfessionName[#####]" text to the "Name *" "BPP Digital Mandatory input field"
    And I select "Profession" from "Page type *" "BPP Digital Mandatory select field"
    And I set "EC_AUTO_OLD_PROF_URL" text to the "Path *" "BPP Digital Mandatory input field"
    And I "check" "Custom parent url" "BPP Digital Admin Mandatory checkbox"
    And I wait for "5" seconds
    And I set "Courses" text to the "Parent url" "BPP Digital Mandatory input field"
    And I set "Courses" text to the "Parent url breadcrumb" "BPP Digital Mandatory input field"
    And I set "LinkTitle[#####]" text to the "Link title *" "BPP Digital Mandatory input field"
    And I set "LinkDescription[#####]" text to the "Link description *" "BPP Digital Mandatory text area field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "CMS Page was successfully created." "BPP Digital Admin Alert Message"
    And I should scroll to the "top" of the page
    And I execute "Publish a CMS or Blog Post page" reusable step
    And I execute "Log Out from Hub Admin" reusable step
    And I am on "https://web-stage-bppdigital.bppuniversity.com/courses/<EC_AUTO_OLD_PROF_URL>" URL
    And I should see the "EC_NEW_PROFESSION_NAME" element
  #Delete Old Profession Page
    When I execute "Log In to Hub as Admin" reusable step
    And I click on the "Website" "BPP Digital Admin Menu Item links"
    And I click on the "Professions" "BPP Digital Admin Sub Menu Item links"
    When I click on the "EC_OLD_PROFESSION_NAME" "BPP Digital Admin Delete Button for Specific name"
    Then I should see the "Profession was successfully removed." "BPP Digital Admin Alert Message"
  #Delete New Profession
    And I execute "Admin Hub Navigate to CMS Pages" reusable step
    When I fill the "BPP Digital Filter by name search field" field with "EC_NEW_PROFESSION_NAME"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by name search field"
    Then I should see the "EC_NEW_PROFESSION_NAME" element
    When I click on the "EC_NEW_PROFESSION_NAME" "BPP Digital Admin Edit Button for Specific name"
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"