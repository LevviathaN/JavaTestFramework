@BuildEmpire @DigitalSite @WebPages
Feature: Web Pages - Ability to publish CMS pages into Hub and View webpages in Hub
  As an admin, when creating a CMS page,
  I expect the option to select that a CMS page is published into the Hub
  as this will allow me to create webpages within the Hub.

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive #TC-1314
  Scenario: Web Pages - Ability to publish CMS pages into Hub and View webpages in Hub
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "AutoCMSPage[#####]" text to the "Name *" "BPP Digital Mandatory input field"
    And I select "CMS page" from "Page type *" "BPP Digital Mandatory select field"
    And I set "AutoCMSUrl[#####]" text to the "Path *" "BPP Digital Mandatory input field"
    And I set "Title[####]" text to the "Title" "BPP Digital Mandatory input field"
    And I set "Summary[####]" text to the "Summary" "BPP Digital Mandatory text area field"
    And I set "MetaDescription[####]" text to the "Meta description" "BPP Digital Mandatory text area field"
    And I set "LinkTitle[####]" text to the "Link title *" "BPP Digital Mandatory input field"
    And I set "LinkDescription[####]" text to the "Link description *" "BPP Digital Mandatory text area field"
    And I select "student" from "Roles" "BPP Digital Mandatory select field"
    And I select "BPP University" from "Visibility groups" "BPP Digital Mandatory select field"
    And I "check" "Show in hub" "BPP Digital Admin Mandatory checkbox"
    And I "uncheck" "Show in website" "BPP Digital Admin Mandatory checkbox"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "CMS Page was successfully created." "BPP Digital Admin Alert Message"
    #Add Blockquote With Caption Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Blockquote With Caption" "BPP Digital Admin Sub Menu Item links"
    And I set "CMS Blockquote" text to the "Html" "BPP Digital Mandatory input field"
    And I fill the "BPP Digital Component Description field" field with "Blockquote[####]"
    And I set "Caption[####]" text to the "Caption" "BPP Digital Mandatory input field"
    And I click on the "Image" "BPP Digital Admin Choose Image button"
    And I switch to window with index "2"
    And I wait for "3" seconds
    And I set "santander.png" text to the "Search..." "Build Empire text field"
    And I click on the "Search" "button"
    And I capture text data "BPP Digital First Image name from Image Uploader Popup" as "EC_IMAGE_NAME" variable
    And I click on the "BPP Digital First CMS Component First Select button" button by JS
    And I switch to window with index "1"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    #Publish CMS Page
    When I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
    #Admin Log out
    Then I execute "Log Out from Hub Admin" reusable step
    #Validate CMS Page is not published and validate it's components
    When I am on "https://web-stage-bppdigital.bppuniversity.com/EC_AUTO_CMS_URL" URL
    Then I should see the "Please check the URL and try again" "text contained in element"
    Then I should see the "Sorry, we " "text contained in element"
    #Validate in HUB
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      |2|I set "AutoLeanneTrujillo4140@guerrillamail.info" text to the "Email" "Build Empire text field"|
      |3|I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"|
    And I wait for "1" seconds
    And I click on the "Direct App CMS Page Left Hand Menu" element by JS
    And Attribute "class" of "BPP Digital Web Square Quotes Image" should have value "component-square-quotation"
    And I should see the "EC_BLOCKQUOTE" element
    And I execute "Log Out from Hub Student" reusable step
    #Edit CMS page to appear for line manager
    Given I execute "Log In to Hub as Admin" reusable step
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    When I set "EC_AUTO_CMS_PAGE" text to the "Filter by name" "Build Empire text field"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by name search field"
    Then I should see the "EC_AUTO_CMS_PAGE" element
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    And I should scroll to the "bottom" of the page
    And I click on the "BPP Digital Remove Student Role X Button" element
    And I wait for "1" seconds
    And I select "line_manager" from "Roles" "BPP Digital Mandatory select field"
    And I click on the "Show in navigation" "BPP Digital Admin Mandatory checkbox"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I execute "Log Out from Hub Admin" reusable step
    #Validate in HUB as Line Manger
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      |2|I set "02917uk7sr@harakirimail.com" text to the "Email" "Build Empire text field"|
      |3|I set "qwerty azerty1!" text to the "Password" "Build Empire text field"|
    And I wait for "1" seconds
    And I click on the "Direct App CMS Page Left Hand Menu" element by JS
    And Attribute "class" of "BPP Digital Web Square Quotes Image" should have value "component-square-quotation"
    And I should see the "EC_BLOCKQUOTE" element
    And I execute "Log Out from Hub Student" reusable step
    #Vlaidate CMS page to be displayed on website
    Given I execute "Log In to Hub as Admin" reusable step
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    When I set "EC_AUTO_CMS_PAGE" text to the "Filter by name" "Build Empire text field"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by name search field"
    Then I should see the "EC_AUTO_CMS_PAGE" element
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    And I select "About Us" from "Parent" "BPP Digital Mandatory select field"
    And I should scroll to the "bottom" of the page
    And I click on the "Show in website" "BPP Digital Admin Mandatory checkbox"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I execute "Log Out from Hub Admin" reusable step
    #Validate CMS is displayed on Website
    When I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/EC_AUTO_CMS_URL" URL
    Then I should see the "CMS Blockquote" "BPP Digital Web Site CMS Anchors ID"
    And Attribute "alt" of "BPP Digital Web Blockquote Image" should have value "santander"
    And Attribute "class" of "BPP Digital Web Square Quotes Image" should have value "component-square-quotation"
    And I should see the "EC_BLOCKQUOTE" element
    And I should see the "EC_CAPTION" element
    #Add Clean Up Component
    When I execute "Log In to Hub as Admin" reusable step
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I wait for "1" seconds
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    #Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"