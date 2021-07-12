@BuildEmpire @DigitalSite
Feature: BPP Digital Edit New Course page to see School and Qualification type and Intro
  As an admin
  when editing a 'New Course' type CMS page
  I expect to see the field "school", "qualification type" and "intro"
  Which should work in the same way as the options seen under "programmes"

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive @Smoke #TC-2520
  Scenario: Edit New Course page to see School and Qualification type and Intro
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
    And I execute "Admin Hub Navigate to CMS Pages" reusable step
    When I fill the "BPP Digital Filter by name search field" field with "EC_NEW_COURSE_NAME"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by name search field"
    Then I should see the "EC_NEW_COURSE_NAME" element
    When I click on the "EC_NEW_COURSE_NAME" "BPP Digital Admin Edit Button for Specific name"
    #Verify School, Qualification type and Intro parameters
    Then I should see the "Courses (new) - params" message
    Then I should see the "Intro" message
    Then I should see the "Intro" "BPP Digital Mandatory text area field"
    Then I should see the "Programme type" message
    Then I should see the "Programme type" "BPP Digital Mandatory select field"
    Then I should see the "Schools" message
    Then I should see the "Schools" "BPP Digital Mandatory select field"
    #Add Intro, School and Application Type
    And I set "Intro[#####]" text to the "Intro" "BPP Digital Mandatory text area field"
    And I select "Undergraduate" from "Programme type" "BPP Digital Mandatory select field"
    And I select "Law" from "Schools" "BPP Digital Mandatory select field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    #Admin Logout
    And I execute "Log Out from Hub Admin" reusable step
    #Verify on site
    #Navigate to Staging website
    And I am on "MD_COMMON_LINKS_BPPDIGITALINDEXURL" URL
    When I fill the "BPP Digital Find a Course Search Field" field with "EC_NEW_COURSE_NAME"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Find a Course Search Field"
    And I validate text "EC_NEW_COURSE_NAME" to be displayed for "BPP Digital Search Result Under Courses Block" element
    #Verify course card
    And I should scroll to the "bottom" of the page
    And I click on the "Law" "BPP Digital Footer Course"
    And I click on the "Qualification Type" "BPP Digital Profile button"
    And I click on the "Undergraduate" "BPP Digital Search Courses label"
    #Check for all Information
    Then I should see the "EC_NEW_COURSE_NAME" element
    Then I should see the "EC_INTRO" element
    Then I should see the "Law" element
    Then I should see the "Undergraduate" element
    #Login to Admin
    And I execute "Log In to Hub as Admin" reusable step
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