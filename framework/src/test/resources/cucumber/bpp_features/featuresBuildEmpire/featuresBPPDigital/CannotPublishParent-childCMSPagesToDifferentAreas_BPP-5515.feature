@DigitalSite @CMS @BuildEmpire
Feature: As an admin, if I try to update a CMS page's "published to" setting and this page has children pages,
  I expect to see a message telling me that these pages will also be updated,
  and ask me to confirm that I wish to do this

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @ParentChild @Smoke #TC-2549
  Scenario: Can not publish parent or child CMS pages to different areas
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    #Create Parent page
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "AutoCMSPage[###]" text to the "Name *" "BPP Digital Mandatory input field"
    And I select "CMS page" from "Page type *" "BPP Digital Mandatory select field"
    And I set "AutoCMSUrl[###]" text to the "Path *" "BPP Digital Mandatory input field"
    And I set "Title[###]" text to the "Title" "BPP Digital Mandatory input field"
    And I set "Summary[###]" text to the "Summary" "BPP Digital Mandatory text area field"
    And I set "MetaDescription[###]" text to the "Meta description" "BPP Digital Mandatory text area field"
    And I set "LinkTitle[###]" text to the "Link title *" "BPP Digital Mandatory input field"
    And I set "LinkDescription[###]" text to the "Link description *" "BPP Digital Mandatory text area field"
    And I "check" "Show in navigation" "BPP Digital Admin Mandatory checkbox"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "CMS Page was successfully created." "BPP Digital Admin Alert Message"
    And I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
    Then I execute "Admin Hub Navigate to CMS Pages" reusable step
    #Add first child page
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "BChildPage[###]" text to the "Name *" "BPP Digital Mandatory input field"
    And I select "CMS page" from "Page type *" "BPP Digital Mandatory select field"
    And I set "B-Url[###]" text to the "Path *" "BPP Digital Mandatory input field"
    And I click on the "BPP Digital Parent CMS Clickable Field" element
    Then I fill the "BPP Digital Parent CMS Text Field" field with "EC_AUTO_CMS_PAGE"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Parent CMS Text Field"
    And I set "BTitle[###]" text to the "Title" "BPP Digital Mandatory input field"
    And I set "BSummary[###]" text to the "Summary" "BPP Digital Mandatory text area field"
    And I set "MetaDescription[###]" text to the "Meta description" "BPP Digital Mandatory text area field"
    And I set "BLinkTitle[###]" text to the "Link title *" "BPP Digital Mandatory input field"
    And I set "BLinkDescription[###]" text to the "Link description *" "BPP Digital Mandatory text area field"
    And I "check" "Show in navigation" "BPP Digital Admin Mandatory checkbox"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "CMS Page was successfully created." "BPP Digital Admin Alert Message"
    And I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
    Then I execute "Admin Hub Navigate to CMS Pages" reusable step
    #Add second child page
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "CChildPage[###]" text to the "Name *" "BPP Digital Mandatory input field"
    And I select "CMS page" from "Page type *" "BPP Digital Mandatory select field"
    And I set "C-Url[###]" text to the "Path *" "BPP Digital Mandatory input field"
    And I click on the "BPP Digital Parent CMS Clickable Field" element
    Then I fill the "BPP Digital Parent CMS Text Field" field with "EC_AUTO_CMS_PAGE"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Parent CMS Text Field"
    And I set "CTitle[###]" text to the "Title" "BPP Digital Mandatory input field"
    And I set "BSummary[###]" text to the "Summary" "BPP Digital Mandatory text area field"
    And I set "CMetaDescription[###]" text to the "Meta description" "BPP Digital Mandatory text area field"
    And I set "CLinkTitle[###]" text to the "Link title *" "BPP Digital Mandatory input field"
    And I set "CLinkDescription[###]" text to the "Link description *" "BPP Digital Mandatory text area field"
    And I "uncheck" "Show in website" "BPP Digital Admin Mandatory checkbox"
    And I "uncheck" "Show in sitemap" "BPP Digital Admin Mandatory checkbox"
    And I "check" "Show in hub" "BPP Digital Admin Mandatory checkbox"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "CMS Page was successfully created." "BPP Digital Admin Alert Message"
    And I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
    #Check Child page location changed
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    When I fill the "BPP Digital Filter by name search field" field with "EC_C_CHILD_PAGE"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by name search field"
    Then I should see the "EC_C_CHILD_PAGE" element
    And I validate text "Website" to be displayed for "BPP Digital CMS Page Published Location" element
    #Check popup appers after trying to edit parent page location
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    When I fill the "BPP Digital Filter by name search field" field with "EC_AUTO_CMS_PAGE"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by name search field"
    Then I should see the "EC_AUTO_CMS_PAGE" element
    And I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    Then I click on the "Show in hub" "BPP Digital Admin Mandatory checkbox"
    Then I wait for "2" seconds
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    #Check updated child pages
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    When I fill the "BPP Digital Filter by name search field" field with "EC_C_CHILD_PAGE"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by name search field"
    Then I should see the "EC_C_CHILD_PAGE" element
    And I validate text "Hub" to be displayed for "BPP Digital CMS Page Published Location" element
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    When I fill the "BPP Digital Filter by name search field" field with "EC_B_CHILD_PAGE"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by name search field"
    Then I should see the "EC_B_CHILD_PAGE" element
    And I validate text "Hub" to be displayed for "BPP Digital CMS Page Published Location" element
     #Add Clean Up Component
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"