@Mobile @Tablet
Feature: The Hub - Web Pages - CMS pages with parent/child relationships
  As an admin, when creating a CMS page,
  I expect to be able to add a CMS page as a CHILD of another CMS page and have that reflected in the Hub
  as this will allow me to create webpage sections within the Hub.

  Background:
    Given I execute "Log In to Hub as Admin" reusable step replacing some steps
      |1|I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages" URL|
      |4|I should scroll to the "bottom" of the page                                   |
      |5|I click on the "Direct App Login Button" button by JS                         |

  @Positive @iPad @iPhone @Samsung #TC-1318
  Scenario: Validate Web Pages Parent Child Relationships_Mobile
    #Create Parent CMS Page
    And I wait for "15" seconds
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages" URL
    And I wait for "5" seconds
    When I execute "Admin Hub Navigate to CMS Pages" reusable step if "BPP Digital Website Main Menu link" "element is present"
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "AutoParentCMSPage[#####]" text to the "Name *" "BPP Digital Mandatory input field"
    And I select "CMS page" from "Page type *" "BPP Digital Mandatory select field"
    And I set "AutoParentCMSUrl[#####]" text to the "Path *" "BPP Digital Mandatory input field"
    And I set "ParentTitle[####]" text to the "Title" "BPP Digital Mandatory input field"
    And I set "ParentSummary[####]" text to the "Summary" "BPP Digital Mandatory text area field"
    And I set "ParentMetaDescription[####]" text to the "Meta description" "BPP Digital Mandatory text area field"
    And I set "ParentLinkTitle[####]" text to the "Link title *" "BPP Digital Mandatory input field"
    And I set "ParentLinkDescription[####]" text to the "Link description *" "BPP Digital Mandatory text area field"
    And I select "student" from "Roles" "BPP Digital Mandatory select field"
    And I select "BPP University" from "Visibility groups" "BPP Digital Mandatory select field"
    And I "check" "Show in hub" "BPP Digital Admin Mandatory checkbox"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "CMS Page was successfully created." "BPP Digital Admin Alert Message"
    #Publish Parent CMS Page
    When I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step

    #Create Child CMS Page
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages" URL
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "AutoChildCMSPage[#####]" text to the "Name *" "BPP Digital Mandatory input field"
    And I select "CMS page" from "Page type *" "BPP Digital Mandatory select field"
    And I set "AutoChildCMSUrl[#####]" text to the "Path *" "BPP Digital Mandatory input field"
    And I select "EC_AUTO_PARENT_CMS_PAGE" from "Parent" "BPP Digital Mandatory select field"
    And I set "ChildTitle[####]" text to the "Title" "BPP Digital Mandatory input field"
    And I set "ChildSummary[####]" text to the "Summary" "BPP Digital Mandatory text area field"
    And I set "ChildMetaDescription[####]" text to the "Meta description" "BPP Digital Mandatory text area field"
    And I set "ChildLinkTitle[####]" text to the "Link title *" "BPP Digital Mandatory input field"
    And I set "ChildLinkDescription[####]" text to the "Link description *" "BPP Digital Mandatory text area field"
    And I select "student" from "Roles" "BPP Digital Mandatory select field"
    And I select "BPP University" from "Visibility groups" "BPP Digital Mandatory select field"
    And I "check" "Show in hub" "BPP Digital Admin Mandatory checkbox"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "CMS Page was successfully created." "BPP Digital Admin Alert Message"
    #Publish Child CMS Page
    When I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
    And I execute "Log Out from Hub Admin" reusable step
    And Browser deletes cookies
    And I wait for "6" seconds
    #Validate in HUB
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      |2|I set "AutoLeanneTrujillo4140@guerrillamail.info" text to the "Email" "Build Empire text field"|
      |3|I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"|
    And I wait for "6" seconds
    And I click on the "Hub VPE Mobile Hamburger Menu" element
    And I should see the "EC_AUTO_PARENT_CMS_PAGE" element
    And I shouldn't see the "EC_AUTO_CHILD_CMS_PAGE" "element"
    Then I click on the "EC_AUTO_PARENT_CMS_PAGE" element
    And I wait for "6" seconds
    And I click on the "Hub VPE Mobile Hamburger Menu" element
    And I should see the "EC_AUTO_CHILD_CMS_PAGE" element
    Then I click on the "Direct App Mobile Logout" element
    And Browser deletes cookies
    #Delete created CMS pages
    Given I execute "Log In to Hub as Admin" reusable step replacing some steps
      |1|I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages" URL|
      |4|I should scroll to the "bottom" of the page                                   |
      |5|I click on the "Direct App Login Button" button by JS                         |
    And I wait for "15" seconds
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages" URL
    And I wait for "7" seconds
    When I execute "Admin Hub Navigate to CMS Pages" reusable step if "BPP Digital Website Main Menu link" "element is present"
    And I wait for "3" seconds
    When I fill the "BPP Digital Filter by name search field" field with "EC_AUTO_CHILD_CMS_PAGE"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by name search field"
    Then I should see the "EC_AUTO_CHILD_CMS_PAGE" element
    And I click on the "Edit" button by JS
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"

    When I fill the "BPP Digital Filter by name search field" field with "EC_AUTO_PARENT_CMS_PAGE"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by name search field"
    Then I should see the "EC_AUTO_PARENT_CMS_PAGE" element
    And I click on the "Edit" button by JS
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"