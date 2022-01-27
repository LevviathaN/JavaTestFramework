@BuildEmpire @DigitalSite
Feature: BPP Digital CMS Validation Amends
  As an admin
  I expect to be able to give a CMS page the same NAME as a page that already exists, provided that the it has a different parent (either "CMS Page Parent" OR "Custom parent URL")
  As this will allow BPP to create their preferred URL structure

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive @CMSAmends #TC-2581
  Scenario: CMS Validation Amends
    #Navigate to CMS Pages [1]
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    #Create CMS Page
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "AutoAmendCMSOne[#####]" text to the "Name *" "BPP Digital Mandatory input field"
    And I select "CMS page" from "Page type *" "BPP Digital Mandatory select field"
    And I set "AutoSamePATH[#####]" text to the "Path *" "BPP Digital Mandatory input field"
    And I "check" "Custom parent url" "BPP Digital Admin Mandatory checkbox"
    And I set "AutoParentURLOne[#####]" text to the "Parent url" "BPP Digital Mandatory input field"
    And I set "EC_AUTO_PARENT_URL_ONE" text to the "Parent url breadcrumb" "BPP Digital Mandatory input field"
    And I set "Title[####]" text to the "Title" "BPP Digital Mandatory input field"
    And I set "Summary[####]" text to the "Summary" "BPP Digital Mandatory text area field"
    And I set "MetaDescription[####]" text to the "Meta description" "BPP Digital Mandatory text area field"
    And I set "LinkTitle[####]" text to the "Link title *" "BPP Digital Mandatory input field"
    And I set "LinkDescription[####]" text to the "Link description *" "BPP Digital Mandatory text area field"
    And I "check" "Show in navigation" "BPP Digital Admin Mandatory checkbox"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "CMS Page was successfully created." "BPP Digital Admin Alert Message"
    #Publish CMS Page
    When I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
    #Navigate to CMS Pages [2]
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    #Create CMS Page
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "AutoAmendCMSTwo[#####]" text to the "Name *" "BPP Digital Mandatory input field"
    And I select "CMS page" from "Page type *" "BPP Digital Mandatory select field"
    And I set "EC_AUTO_SAME_PATH" text to the "Path *" "BPP Digital Mandatory input field"
    And I "check" "Custom parent url" "BPP Digital Admin Mandatory checkbox"
    And I set "AutoParentURLTwo[#####]" text to the "Parent url" "BPP Digital Mandatory input field"
    And I set "EC_AUTO_PARENT_URL_TWO" text to the "Parent url breadcrumb" "BPP Digital Mandatory input field"
    And I set "TitleTwo[####]" text to the "Title" "BPP Digital Mandatory input field"
    And I set "SummaryTwo[####]" text to the "Summary" "BPP Digital Mandatory text area field"
    And I set "MetaDescriptionTwo[####]" text to the "Meta description" "BPP Digital Mandatory text area field"
    And I set "LinkTitleTwo[####]" text to the "Link title *" "BPP Digital Mandatory input field"
    And I set "LinkDescriptionTwo[####]" text to the "Link description *" "BPP Digital Mandatory text area field"
    And I "check" "Show in navigation" "BPP Digital Admin Mandatory checkbox"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "CMS Page was successfully created." "BPP Digital Admin Alert Message"
    #Publish CMS Page
    When I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
    #Admin Logout
    And I execute "Log Out from Hub Admin" reusable step
    #Validate Created Page [1]
    And I am on "https://web-stage-bppdigital.bppuniversity.com/EC_AUTO_PARENT_URL_ONE/EC_AUTO_SAME_PATH" URL
    Then I validate text "EC_AUTO_PARENT_URL_ONE" to be displayed for "BPP Digital Breadcrumb Level Two" element
    Then I validate text "EC_AUTO_AMEND_CMS_ONE" to be displayed for "BPP Digital Breadcrumb Level Three" element
    #Validate Created Page [2]
    And I am on "https://web-stage-bppdigital.bppuniversity.com/EC_AUTO_PARENT_URL_TWO/EC_AUTO_SAME_PATH" URL
    Then I validate text "EC_AUTO_PARENT_URL_TWO" to be displayed for "BPP Digital Breadcrumb Level Two" element
    Then I validate text "EC_AUTO_AMEND_CMS_TWO" to be displayed for "BPP Digital Breadcrumb Level Three" element
    #Add Clean Up Component for first CMS page
    #When I execute "Log In to Hub as Admin" reusable step
    When I execute "Log In to Hub as Admin" reusable step
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    When I fill the "BPP Digital Filter by name search field" field with "EC_AUTO_AMEND_CMS_ONE"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by name search field"
    Then I should see the "EC_AUTO_AMEND_CMS_ONE" element
    When I click on the "EC_AUTO_AMEND_CMS_ONE" "BPP Digital Admin Edit Button for Specific name"
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"
    #Add Clean Up Component for second CMS page
    #When I execute "Log In to Hub as Admin" reusable step
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    When I fill the "BPP Digital Filter by name search field" field with "EC_AUTO_AMEND_CMS_TWO"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by name search field"
    Then I should see the "EC_AUTO_AMEND_CMS_TWO" element
    When I click on the "EC_AUTO_AMEND_CMS_TWO" "BPP Digital Admin Edit Button for Specific name"
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"