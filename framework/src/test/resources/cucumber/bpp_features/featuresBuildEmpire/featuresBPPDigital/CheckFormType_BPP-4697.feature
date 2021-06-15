@BuildEmpire @DigitalSite @Form
Feature: As a user, viewing a "employer (basic)" form,
  I expect to see a form with the same fields as the current RFI form,
  but without the "employer / student" toggle

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive #TC-2455
  Scenario: Create and Validate Form Types
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Create CMS Page" reusable step
    #Add Form Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Form" "BPP Digital Admin Sub Menu Item links"
    And I set "CMS Form" text to the "Html" "BPP Digital Mandatory input field"
    And I select "KW_AUTO_SELECT" from "Display type" "BPP Digital Mandatory select field"
    And I select "Learner (basic)" from "Form type" "BPP Digital Mandatory select field"
    And I set "FormThankYouTitle[####]" text to the "Thank you title" "BPP Digital Mandatory input field"
    And I set "FormThankYouMessage[####]" text to the "Thank you message" "BPP Digital Mandatory input field"
    And I set "FormTitle[####]" text to the "Title" "BPP Digital Mandatory input field"
    And I set "FormDescription[####]" text to the "Description" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    When I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
    And I wait for "2" seconds
    When I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/<EC_AUTO_CMS_URL>" URL
    Then I should see the "CMS Form" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_FORM_TITLE" element
    And I should see the "EC_FORM_DESCRIPTION" element
    And I should see the "BPP Digital Web Site RFI Completion form" element
    And I should see the "Enter your first name" "Build Empire text field"
    And I should see the "Enter your last name" "Build Empire text field"
    And I should see the "Enter your email address" "Build Empire text field"
    And I should see the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I should see the "Direct App I Am Happy To Receive Information" element
    When I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages" URL
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    And I click on the "BPP Digital Edit Form Button" element
    And I select "Learner (advanced)" from "Form type" "BPP Digital Mandatory select field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    And I wait for "2" seconds
    When I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/<EC_AUTO_CMS_URL>" URL
    Then I should see the "CMS Form" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_FORM_TITLE" element
    And I should see the "EC_FORM_DESCRIPTION" element
    And I should see the "BPP Digital Web Site RFI Completion form" element
    And I should see the "Enter your first name" "Build Empire text field"
    And I should see the "Enter your last name" "Build Empire text field"
    And I should see the "Enter your email address" "Build Empire text field"
    And I should see the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I should see the "Direct App I Am Happy To Receive Information" element
    And I should see the "BPP Digital Form Area Of Interest" element
    When I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages" URL
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    And I click on the "BPP Digital Edit Form Button" element
    And I select "Employer (basic)" from "Form type" "BPP Digital Mandatory select field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    And I wait for "2" seconds
    When I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/<EC_AUTO_CMS_URL>" URL
    Then I should see the "CMS Form" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_FORM_TITLE" element
    And I should see the "EC_FORM_DESCRIPTION" element
    And I should see the "BPP Digital Web Site RFI Completion form" element
    And I should see the "Enter your first name" "Build Empire text field"
    And I should see the "Enter your last name" "Build Empire text field"
    And I should see the "Enter your email address" "Build Empire text field"
    And I should see the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I should see the "Direct App I Am Happy To Receive Information" element
    And I should see the "Enter your company" "Build Empire text field"
    And I should see the "Enter your job title" "Build Empire text field"
    When I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages" URL
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    And I click on the "BPP Digital Edit Form Button" element
    And I select "Employer (advanced)" from "Form type" "BPP Digital Mandatory select field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    And I wait for "2" seconds
    When I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/<EC_AUTO_CMS_URL>" URL
    Then I should see the "CMS Form" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_FORM_TITLE" element
    And I should see the "EC_FORM_DESCRIPTION" element
    And I should see the "BPP Digital Web Site RFI Completion form" element
    And I should see the "Enter your first name" "Build Empire text field"
    And I should see the "Enter your last name" "Build Empire text field"
    And I should see the "Enter your email address" "Build Empire text field"
    And I should see the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I should see the "Direct App I Am Happy To Receive Information" element
    And I should see the "Enter your company" "Build Empire text field"
    And I should see the "Enter your job title" "Build Empire text field"
    And I should see the "BPP Digital RFI Form Apprenticeship Levy" element
    And I should see the "BPP Digital Form Area Of Interest" element
    When I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages" URL
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    And I click on the "BPP Digital Edit Form Button" element
    And I select "Learner / Employer Dual" from "Form type" "BPP Digital Mandatory select field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    And I wait for "2" seconds
    When I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/<EC_AUTO_CMS_URL>" URL
    Then I should see the "CMS Form" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_FORM_TITLE" element
    And I should see the "EC_FORM_DESCRIPTION" element
    And I should see the "BPP Digital Web Site RFI Completion form" element
    And I should see the "Enter your first name" "Build Empire text field"
    And I should see the "Enter your last name" "Build Empire text field"
    And I should see the "Enter your email address" "Build Empire text field"
    And I should see the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I should see the "Direct App I Am Happy To Receive Information" element
    Then I click on the "BPP Digital Form I Am Employer Tab" element
    And I should see the "Enter your first name" "Build Empire text field"
    And I should see the "Enter your last name" "Build Empire text field"
    And I should see the "Enter your email address" "Build Empire text field"
    And I should see the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I should see the "Direct App I Am Happy To Receive Information" element
    And I should see the "Enter your company" "Build Empire text field"
    And I should see the "Enter your job title" "Build Empire text field"
    When I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages" URL
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    And I click on the "BPP Digital Edit Form Button" element
    And I select "Dual (advanced)" from "Form type" "BPP Digital Mandatory select field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    And I wait for "2" seconds
    When I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/<EC_AUTO_CMS_URL>" URL
    Then I should see the "CMS Form" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_FORM_TITLE" element
    And I should see the "EC_FORM_DESCRIPTION" element
    And I should see the "BPP Digital Web Site RFI Completion form" element
    And I should see the "Enter your first name" "Build Empire text field"
    And I should see the "Enter your last name" "Build Empire text field"
    And I should see the "Enter your email address" "Build Empire text field"
    And I should see the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I should see the "Direct App I Am Happy To Receive Information" element
    And I should see the "BPP Digital Form Area Of Interest" element
    Then I click on the "BPP Digital Form I Am Employer Tab" element
    And I should see the "Enter your first name" "Build Empire text field"
    And I should see the "Enter your last name" "Build Empire text field"
    And I should see the "Enter your email address" "Build Empire text field"
    And I should see the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I should see the "Direct App I Am Happy To Receive Information" element
    And I should see the "Enter your company" "Build Empire text field"
    And I should see the "Enter your job title" "Build Empire text field"
    And I should see the "BPP Digital RFI Form Apprenticeship Levy" element
    And I should see the "BPP Digital Form Area Of Interest" element
    When I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages" URL
    #Add Clean Up Component
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"

  @Grid #TC-2461
  Scenario: Validate Form Title Is Not Displayed For Grid Component
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
     #Add Grid Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Grid" "BPP Digital Admin Sub Menu Item links"
    And I select "1 column, full width" from "Layout *" "BPP Digital Mandatory select field"
    And I select "Colour" from "Background type" "BPP Digital Mandatory select field"
    And I select "Box" from "Container style *" "BPP Digital Mandatory select field"
    And I select "Red" from "Background colour" "BPP Digital Mandatory select field"
    And I wait for "3" seconds
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Grid was successfully created." "BPP Digital Admin Alert Message"
    Then I click on the "Back" "button"
    When I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
    And I wait for "2" seconds
    And I execute "Log Out from Hub Admin" reusable step
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "AutoAdonisDuarte6846@guerrillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"                    |
    When I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/<EC_AUTO_CMS_URL>" URL
    And I shouldn't see the "EC_TITLE" "element"
    And I shouldn't see the "EC_SUMMARY" "element"
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
