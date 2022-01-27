@BuildEmpire @DigitalSite @RFI
Feature: As a user, viewing a "content download RFI",
  I expect to see an RFI form that I can download a file from

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive #TC-2454 TC-2459
  Scenario: Create and validate Content Download RFI
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Create CMS Page" reusable step
    #Add Form Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Form" "BPP Digital Admin Sub Menu Item links"
    And I set "CMS Form" text to the "Html" "BPP Digital Mandatory input field"
    And I select "KW_AUTO_SELECT" from "Display type" "BPP Digital Mandatory select field"
    And I select "Content Download RFI" from "Form type" "BPP Digital Mandatory select field"
    And I set "FormThankYouTitle[####]" text to the "Thank you title" "BPP Digital Mandatory input field"
    And I set "FormThankYouMessage[####]" text to the "Thank you message" "BPP Digital Mandatory input field"
    And I set "FormTitle[####]" text to the "Title" "BPP Digital Mandatory input field"
    And I set "FormDescription[####]" text to the "Description" "BPP Digital Mandatory input field"
    And I click on the "Rfi content url" "BPP Digital Admin Choose Image button"
    And I switch to window with index "2"
    And I click on the "Governance" "BPP Digital Admin Media Popup Block Name link"
    And I set "2012-QAA-Report.pdf" text to the "Search..." "Build Empire text field"
    And I click on the "Search" "button"
    And I capture text data "BPP Digital First Image name from Image Uploader Popup" as "EC_DOCUMENT_TWO_NAME" variable
    And I click on the "BPP Digital First CMS Component First Select button" button by JS
    And I switch to window with index "1"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    When I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
    Then I execute "Log Out from Hub Admin" reusable step
    When I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/EC_AUTO_CMS_URL" URL
    Then I should see the "CMS Form" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_FORM_TITLE" element
    And I should see the "EC_FORM_DESCRIPTION" element
    And I should see the "BPP Digital Web Site RFI Completion form" element
    When I execute "Submit RFI Form" reusable step

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