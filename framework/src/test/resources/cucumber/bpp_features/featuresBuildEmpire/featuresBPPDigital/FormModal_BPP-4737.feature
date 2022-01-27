@BuildEmpire @DigitalSite @Form @Smoke
Feature: As an admin I can set a form display as Modal and can access it via link as user

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive @Modal #TC-2453
  Scenario: Validate Modal Form
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "AutoCMSPage[#####]" text to the "Name *" "BPP Digital Mandatory input field"
    And I select "CMS page" from "Page type *" "BPP Digital Mandatory select field"
    And I set "AutoCMSUrl[#####]" text to the "Path *" "BPP Digital Mandatory input field"
    And I select "About Us" from "Parent" "BPP Digital Mandatory select field"
    And I set "Title[####]" text to the "Title" "BPP Digital Mandatory input field"
    And I set "Summary[####]" text to the "Summary" "BPP Digital Mandatory text area field"
    And I set "MetaDescription[####]" text to the "Meta description" "BPP Digital Mandatory text area field"
    And I set "LinkTitle[####]" text to the "Link title *" "BPP Digital Mandatory input field"
    And I set "LinkDescription[####]" text to the "Link description *" "BPP Digital Mandatory text area field"
    And I "check" "Show in navigation" "BPP Digital Admin Mandatory checkbox"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "CMS Page was successfully created." "BPP Digital Admin Alert Message"
    #Add Form Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Form" "BPP Digital Admin Sub Menu Item links"
    And I set "cmsformmodal" text to the "Html" "BPP Digital Mandatory input field"
    And I select "Modal" from "Display type" "BPP Digital Mandatory select field"
    And I select "Learner (basic)" from "Form type" "BPP Digital Mandatory select field"
    And I set "ModalThankYouTitle[###]" text to the "Thank you title" "BPP Digital Mandatory input field"
    And I set "ModalThankYouMessage[###]" text to the "Thank you message" "BPP Digital Mandatory input field"
    And I set "ModalTitle[###]" text to the "Title" "BPP Digital Mandatory input field"
    And I set "ModalDescription[###]" text to the "Description" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    #Add Full Width Text Block Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Full Width Text Block" "BPP Digital Admin Sub Menu Item links"
    Then I click on the "BPP Digital Text Component Add Link" button
    And I wait for "2" seconds
    And I select "<other>" from "BPP Digital Text Component Protocol Type" element
    And I fill the "BPP Digital Text Component URL" field with "#cmsformmodal"
    And I click on the "Advanced" "text contained in A element"
    Then I fill the "BPP Digital Text Component Link Stylesheet Classes" field with "modal-link"
    And I click on the "OK" "text contained in element"
    And I set "CMS Full Width Text Block" text to the "Html" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    And I wait for "2" seconds
    #Publish CMS Page
    When I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
    And I wait for "2" seconds
    And I execute "Log Out from Hub Admin" reusable step
    When I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/EC_AUTO_CMS_URL" URL
    And I click on the "#cmsformmodal" "text contained in A element"
    And I should see the "EC_MODAL_TITLE" element
    And I should see the "EC_MODAL_DESCRIPTION" element

    #Add Clean Up Component
    And I execute "Log In to Hub as Admin" reusable step
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"

