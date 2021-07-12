@BuildEmpire @DigitalSite
Feature: BPP Digital Professions and Courses CMS pages Under Courses
  As an admin
  I expect "Professions (New) and Courses (new)" CMS pages to appear under "courses" in search
  Instead of under "Other pages"

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive @Smoke #TC-2579
  Scenario: Professions and Courses CMS pages Under Courses
    #Navigate and Create Courses(new) item
    Then I execute "Admin Hub Navigate to new Courses Pages" reusable step
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "NewCourseName[#####]" text to the "Name *" "BPP Digital Mandatory input field"
    And I select "Course" from "Page type *" "BPP Digital Mandatory select field"
    And I set "NewCoursePath[#####]" text to the "Path *" "BPP Digital Mandatory input field"
    And I set "LinkTitle[#####]" text to the "Link title *" "BPP Digital Mandatory input field"
    And I set "LinkDescription[#####]" text to the "Link description *" "BPP Digital Mandatory text area field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "CMS Page was successfully created." "BPP Digital Admin Alert Message"
    And I should scroll to the "top" of the page
    And I execute "Publish a CMS or Blog Post page" reusable step
    #Admin Logout
    And I execute "Log Out from Hub Admin" reusable step
    #Navigate to Staging website
    And I am on "MD_COMMON_LINKS_BPPDIGITALINDEXURL" URL
    When I fill the "BPP Digital Find a Course Search Field" field with "EC_NEW_COURSE_NAME"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Find a Course Search Field"
    And I validate text "EC_NEW_COURSE_NAME" to be displayed for "BPP Digital Search Result Under Courses Block" element
    #Login
    Given I execute "Log In to Hub as Admin" reusable step
    #Delete New Profession
    And I execute "Admin Hub Navigate to CMS Pages" reusable step
    When I fill the "BPP Digital Filter by name search field" field with "EC_NEW_COURSE_NAME"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by name search field"
    Then I should see the "EC_NEW_COURSE_NAME" element
    When I click on the "EC_NEW_COURSE_NAME" "BPP Digital Admin Edit Button for Specific name"
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"