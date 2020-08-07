@DigitalSite @Smoke
Feature: BPP Digital Create and Validate New Category

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive @Smoke #TC-3050
  Scenario: Create and Validate New Category
    #Navigate to Application Categories page
    When I execute "Admin Hub Navigate to Application Categories" reusable step
    #New Category form
    And I click on the "New Category" "BPP Digital Admin Page Button"
    And I set "AutoCategoryTitle[#####]" text to the "Title" "BPP Digital Mandatory input field"
    And I select "Apprenticeship" from "Type" "BPP Digital Mandatory select field"
    And I select "Financial Services Professional" from "Programmes" "BPP Digital Mandatory select field"
    And I select "BPP Automation" from "Visibility Groups" "BPP Digital Mandatory select field"
    And I "check" "Equality and Diversity" "BPP Digital Admin Mandatory checkbox"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    #Validation that Category was created
    And I fill the "BPP Digital Filter by title search field" field with "EC_AUTO_CATEGORY_TITLE"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by title search field"
    Then I should see the "EC_AUTO_CATEGORY_TITLE" "exact element"
    #Logout from Admin panel
    When I execute "Log Out from Hub Admin" reusable step
    #Create new User for Created Category
    And I execute "Register New Student Account" reusable step replacing some steps
    |1|I am on "https://staging.bppdigital.buildempire.app/account?registration_type=bpp-automation" URL|
    #Register to Created Category
    When I click on the "Direct App My Applications Left Menu Link" button by JS
    And I click on the "Direct App What Are You Applying For Dropdown" element
    And I click on the "EC_AUTO_CATEGORY_TITLE" "Build Empire application type"
    Then I click on the "Direct App Create Application" button
    #Complete Application
    When I click on the "I Understand" "button"
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Direct App Next" button
    And I click on the "Diret App Gender Dropdown" element
    And I click on the "Diret App Gender Not To Say" element
    And I click on the "Diret App Ethnicity Dropdown" element
    And I click on the "Diret App Ethnicity White And Black African" element
    And I click on the "Diret App Learning Disability No" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save And Return" button
    Then I execute "Submit Application Hub" reusable step
    #Logout from Student panel
    And I execute "Log Out from Hub Student" reusable step
    #Login to Admin panel
    When I execute "Log In to Hub as Admin" reusable step
    #Navigate to Application Categories page
    And I execute "Admin Hub Navigate to Application Categories" reusable step
    #Archieve Category
    And I fill the "BPP Digital Filter by title search field" field with "EC_AUTO_CATEGORY_TITLE"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by title search field"
    When I click on the "EC_AUTO_CATEGORY_TITLE" "BPP Digital Archive Category button"