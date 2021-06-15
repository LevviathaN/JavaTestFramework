@BuildEmpire @DigitalSite @Smoke
Feature: BPP Digital Create and Validate CMS Page Components

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @CMSComponents @Positive @Smoke #TC-3628 TC-3629 TC-2517
  Scenario: Create and Validate CMS Page Components
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Create CMS Page" reusable step
    #Add Components:
    #Add Accordion Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Accordion" "BPP Digital Admin Sub Menu Item links"
    And I set "CMS Accordion" text to the "Html" "BPP Digital Mandatory input field"
    And I click on the "Add" "BPP Digital Search Label Button"
    And I set "AccordionTitle[####]" text to the "Title" "BPP Digital Mandatory input field"
    And I fill the "BPP Digital Component Description field" field with "AccordionDescription[####]"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
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
    #Add Call Out Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Call Out" "BPP Digital Admin Sub Menu Item links"
    And I select "KW_AUTO_SELECT" from "Background type" "BPP Digital Mandatory select field"
    And I set "CallOutTitle[####]" text to the "Title" "BPP Digital Mandatory input field"
    And I select "KW_AUTO_SELECT" from "Title type" "BPP Digital Mandatory select field"
    And I upload "CallOut.png" file to "BPP Digital Upload File Button" element
    And I set "CallOutTitleImageAltText[####]" text to the "Title image alt text" "BPP Digital Mandatory input field"
    And I fill the "BPP Digital Component Description field" field with "CallOutContent[####]"
    And I select "KW_AUTO_SELECT" from "Content alignment" "BPP Digital Mandatory select field"
    And I set "CallOutButtonText[####]" text to the "Button text" "BPP Digital Mandatory input field"
    And I set "CallOutButtonHref[####]" text to the "Button href" "BPP Digital Mandatory input field"
    And I set "CMS Call Out" text to the "Html" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    #Add Circles Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Circles" "BPP Digital Admin Sub Menu Item links"
    And I set "CMS Circles" text to the "Html" "BPP Digital Mandatory input field"
    And I click on the "Add" "BPP Digital Search Label Button"
    And I select "KW_AUTO_SELECT" from "Style" "BPP Digital Mandatory select field"
    And I fill the "BPP Digital Component Description field" field with "CirclesContent[####]"
    And I set "CirclesLink[####]" text to the "Link" "BPP Digital Mandatory input field"
    And I set "CirclesCallToActionText[####]" text to the "Call to action text" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    #Add Courses Block Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Courses Block" "BPP Digital Admin Sub Menu Item links"
    And I "check" "Undergraduate" "BPP Digital Admin Mandatory checkbox"
    And I set "CMS Courses Block" text to the "Html" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    And I "check" "LLB (Hons)" "BPP Digital Admin Mandatory checkbox"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    #Add Download Cards Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Download Cards" "BPP Digital Admin Sub Menu Item links"
    And I set "CMS Download Cards" text to the "Html" "BPP Digital Mandatory input field"
    And I click on the "Add" "BPP Digital Search Label Button"
    And I set "DownloadCardsTitle[####]" text to the "Title" "BPP Digital Mandatory input field"
    And I click on the "Document" "BPP Digital Admin Choose Image button"
    And I switch to window with index "2"
    And I click on the "Governance" "BPP Digital Admin Media Popup Block Name link"
    And I set "2007-QAA-Report.pdf" text to the "Search..." "Build Empire text field"
    And I click on the "Search" "button"
    And I capture text data "BPP Digital First Image name from Image Uploader Popup" as "EC_DOCUMENT_ONE_NAME" variable
    And I click on the "BPP Digital First CMS Component First Select button" button by JS
    And I switch to window with index "1"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    #Add Form Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Form" "BPP Digital Admin Sub Menu Item links"
    And I set "CMS Form" text to the "Html" "BPP Digital Mandatory input field"
    And I select "KW_AUTO_SELECT" from "Display type" "BPP Digital Mandatory select field"
    And I select "KW_AUTO_SELECT" from "Form type" "BPP Digital Mandatory select field"
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
    #Add Full Width Text Block Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Full Width Text Block" "BPP Digital Admin Sub Menu Item links"
    And I fill the "BPP Digital Component Description field" field with "FullWidthTextBlockContent[####]"
    And I set "CMS Full Width Text Block" text to the "Html" "BPP Digital Mandatory input field"
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
    #Add Image Text Button Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Image Text Button" "BPP Digital Admin Sub Menu Item links"
    And I click on the "Image" "BPP Digital Admin Choose Image button"
    And I switch to window with index "2"
    And I wait for "3" seconds
    And I set "bdo.png" text to the "Search..." "Build Empire text field"
    And I click on the "Search" "button"
    And I capture text data "BPP Digital First Image name from Image Uploader Popup" as "EC_IMAGE_NAME_TWO" variable
    And I click on the "BPP Digital First CMS Component First Select button" button by JS
    And I switch to window with index "1"
    And I fill the "BPP Digital Component Description field" field with "ImageTextButtonContent[####]"
    And I select "KW_AUTO_SELECT" from "Content alignment" "BPP Digital Mandatory select field"
    And I set "ImageTextButtonText[####]" text to the "Button text" "BPP Digital Mandatory input field"
    And I set "ImageTextButtonHref[####]" text to the "Button href" "BPP Digital Mandatory input field"
    And I set "CMS Image Text Button" text to the "Html" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    #Add Images Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Images" "BPP Digital Admin Sub Menu Item links"
    And I set "CMS Images" text to the "Html" "BPP Digital Mandatory input field"
    And I click on the "Add" "BPP Digital Search Label Button"
    And I click on the "Image" "BPP Digital Admin Choose Image button"
    And I switch to window with index "2"
    And I set "tree.jpg" text to the "Search..." "Build Empire text field"
    And I click on the "Search" "button"
    And I capture text data "BPP Digital First Image name from Image Uploader Popup" as "EC_IMAGE_NAME_THREE" variable
    And I click on the "BPP Digital First CMS Component First Select button" button by JS
    And I switch to window with index "1"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I wait for "3" seconds
    #Add Logo Creds Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Logo Creds" "BPP Digital Admin Sub Menu Item links"
    And I set "CMS Logo Creds" text to the "Html" "BPP Digital Mandatory input field"
    And I click on the "Add" "BPP Digital Search Label Button"
    And I click on the "Logo" "BPP Digital Admin Choose Image button"
    And I switch to window with index "2"
    And I set "nhs.png" text to the "Search..." "Build Empire text field"
    And I click on the "Search" "button"
    And I capture text data "BPP Digital First Image name from Image Uploader Popup" as "EC_IMAGE_NAME_FOUR" variable
    And I click on the "BPP Digital First CMS Component First Select button" button by JS
    And I switch to window with index "1"
    And I set "LogoCredsAltText[####]" text to the "Alt text" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I wait for "3" seconds
    #Add People Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "People" "BPP Digital Admin Sub Menu Item links"
    And I set "CMS People" text to the "Html" "BPP Digital Mandatory input field"
    And I click on the "Add" "BPP Digital Search Label Button"
    And I click on the "Image" "BPP Digital Admin Choose Image button"
    And I switch to window with index "2"
    And I set "ey.png" text to the "Search..." "Build Empire text field"
    And I click on the "Search" "button"
    And I capture text data "BPP Digital First Image name from Image Uploader Popup" as "EC_IMAGE_NAME_FIVE" variable
    And I click on the "BPP Digital First CMS Component First Select button" button by JS
    And I switch to window with index "1"
    And I set "PeopleName[####]" text to the "Name" "BPP Digital Mandatory input field"
    And I set "PeopleJobTitle[####]" text to the "Job title" "BPP Digital Mandatory input field"
    And I fill the "BPP Digital Component Description field" field with "PeopleDescription[####]"
    And I set "PeopleLink[####]" text to the "Link" "BPP Digital Mandatory input field"
    And I select "Open in same tab" from "Link target" "BPP Digital Mandatory select field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I wait for "3" seconds
    #Add Quick Links Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Quick Links" "BPP Digital Admin Sub Menu Item links"
    And I set "LeftHandTitle[####]" text to the "Left hand title" "BPP Digital Mandatory input field"
    And I set "CMS Quick Links" text to the "Html" "BPP Digital Mandatory input field"
    And I click on the "Left hand links" "BPP Digital Admin Choose Image button"
    And I set "QuickLinksLeftTitle[####]" text to the "Title" "BPP Digital Mandatory input field"
    And I set "QuickLinksLeftLink[####]" text to the "Link" "BPP Digital Mandatory input field"
    And I set "QuickLinksRightHandTitle[####]" text to the "Right hand title" "BPP Digital Mandatory input field"
    And I click on the "Right hand links" "BPP Digital Admin Choose Image button"
    And I set "QuickLinksRightTitle[####]" text to the "Title" "BPP Digital Mandatory second input field"
    And I set "QuickLinksRightLink[####]" text to the "Link" "BPP Digital Mandatory second input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I wait for "3" seconds
    #Add Spotlight Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Spotlight" "BPP Digital Admin Sub Menu Item links"
    And I select "KW_AUTO_SELECT" from "Spotlight background" "BPP Digital Mandatory select field"
    And I fill the "BPP Digital Component Description field" field with "SpotlightContentOne[####]"
    And I fill the "BPP Digital Component Second Description field" field with "SpotlightContentTwo[####]"
    And I click on the "Image" "BPP Digital Admin Choose Image button"
    And I switch to window with index "2"
    And I set "Diagram.png" text to the "Search..." "Build Empire text field"
    And I click on the "Search" "button"
    And I capture text data "BPP Digital First Image name from Image Uploader Popup" as "EC_IMAGE_NAME_SIX" variable
    And I click on the "BPP Digital First CMS Component First Select button" button by JS
    And I switch to window with index "1"
    And I click on the "Video" "BPP Digital Admin Choose Image button"
    And I switch to window with index "2"
    And I capture text data "BPP Digital First Image name from Image Uploader Popup" as "EC_VIDEO_NAME" variable
    And I click on the "BPP Digital First CMS Component First Select button" button by JS
    And I switch to window with index "1"
    And I set "CMS Spotlight" text to the "Html" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I wait for "3" seconds
    #Add Video Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Video" "BPP Digital Admin Sub Menu Item links"
    And I click on the "Video" "BPP Digital Admin Choose Image button"
    And I switch to window with index "2"
    And I capture text data "BPP Digital First Image name from Image Uploader Popup" as "EC_VIDEO_NAME_TWO" variable
    And I click on the "BPP Digital First CMS Component First Select button" button by JS
    And I switch to window with index "1"
    And I set "VideoOverlayText[####]" text to the "Overlay text" "BPP Digital Mandatory input field"
    And I set "CMS Video" text to the "Html" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I wait for "3" seconds
    #Add Video Spotlight Component:
    When I should scroll to the "top" of the page
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Video Spotlight" "BPP Digital Admin Sub Menu Item links"
    And I click on the "Spotlight video" "BPP Digital Admin Choose Image button"
    And I switch to window with index "2"
    And I capture text data "BPP Digital First Image name from Image Uploader Popup" as "EC_VIDEO_NAME_TWO" variable
    And I click on the "BPP Digital First CMS Component First Select button" button by JS
    And I switch to window with index "1"
    And I set "SpotlightTitle[####]" text to the "Spotlight title" "BPP Digital Mandatory input field"
    And I "check" "Spotlight show play button" "BPP Digital Admin Mandatory checkbox"
    And I fill the "BPP Digital Component Description field" field with "VideoSpotlightContent[####]"
    And I set "CMS Spotlight Video" text to the "Html" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I wait for "3" seconds
    #Publish CMS Page
    When I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
    #Admin Log out
    Then I execute "Log Out from Hub Admin" reusable step
    #Validate CMS Page was published and validate it's components
    When I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/<EC_AUTO_CMS_URL>" URL
    #Validate components:
    #Accordion
    Then I should see the "CMS Accordion" "BPP Digital Web Site CMS Anchors ID"
    Then I wait for "3" seconds
    Then I click on the "BPP Digital Web Site Accordion Item" element
    Then I validate text "EC_ACCORDION_DESCRIPTION" to be displayed for "BPP Digital Accordion Component Description Block" element
    #Blockquote
    Then I should see the "CMS Blockquote" "BPP Digital Web Site CMS Anchors ID"
    And Attribute "alt" of "BPP Digital Web Blockquote Image" should have value "santander"
    And Attribute "class" of "BPP Digital Web Square Quotes Image" should have value "component-square-quotation"
    And I should see the "EC_BLOCKQUOTE" element
    And I should see the "EC_CAPTION" element
    #Call Out
    Then I should see the "CMS Call Out" "BPP Digital Web Site CMS Anchors ID"
    And I wait for "4" seconds
    And Attribute "alt" of "BPP Digital Web Call Out Image" should have value "EC_CALL_OUT_TITLE_IMAGE_ALT_TEXT"
    And I should see the "EC_CALL_OUT_CONTENT" element
    And I should see the "EC_CALL_OUT_BUTTON_TEXT" element
    #Circles
    Then I should see the "CMS Circles" "BPP Digital Web Site CMS Anchors ID"
    And I wait for "6" seconds
    And Attribute "href" of "BPP Digital Web Site Circles Call to Action link" should have value "CONTAINS=EC_CIRCLES_LINK"
    And I should see the "EC_CIRCLES_CONTENT" element
    And I should see the "EC_CIRCLES_CALL_TO_ACTION_TEXT" element
    #Courses Block
    Then I should see the "CMS Courses Block" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "undergraduate" element
    And I should see the "LLB (Hons)" element
    #Download Cards
    Then I should see the "CMS Download Cards" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_DOWNLOAD_CARDS_TITLE" element
    And Attribute "href" of "BPP Digital Web Site Download Cards download link" should have value "CONTAINS=EC_DOCUMENT_ONE_NAME"
    #Form
    Then I should see the "CMS Form" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_FORM_TITLE" element
    And I should see the "EC_FORM_DESCRIPTION" element
    And I should see the "BPP Digital Web Site RFI Completion form" element
    #Full Width Text Block
    Then I should see the "CMS Full Width Text Block" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_FULL_WIDTH_TEXT_BLOCK_CONTENT" element
    #Grid
     Then I should see the "BPP Digital Web Site Grid Component Red block" element
    #Image Text Button
    Then I should see the "CMS Image Text Button" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_IMAGE_TEXT_BUTTON_CONTENT" element
    And I should see the "EC_IMAGE_TEXT_BUTTON_TEXT" button
    And I wait for "6" seconds
    And Attribute "href" of "BPP Digital Web Site Image text button" should have value "CONTAINS=EC_IMAGE_TEXT_BUTTON_HREF"
    And Attribute "style" of "BPP Digital Web Site Image Button image" should have value "CONTAINS=EC_IMAGE_NAME_TWO"
    #Images
    Then I should see the "CMS Images" "BPP Digital Web Site CMS Anchors ID"
    Then Attribute "alt" of "BPP Digital Blog Post Image Content" should have value "tree"
    #Logo Creds
    Then I should see the "CMS Logo Creds" "BPP Digital Web Site CMS Anchors ID"
    And Attribute "style" of "BPP Digital Web Site Logo Creds image" should have value "CONTAINS=EC_IMAGE_NAME_FOUR"
    Then Attribute "alt" of "BPP Digital Web Site Logo Creds image" should have value "EC_LOGO_CREDS_ALT_TEXT"
    #People
    Then I should see the "CMS People" "BPP Digital Web Site CMS Anchors ID"
    Then Attribute "src" of "BPP Digital Web Site People Image" should have value "CONTAINS=EC_IMAGE_NAME_FIVE"
    And I should see the "EC_PEOPLE_NAME" element
    And I should see the "EC_PEOPLE_JOB_TITLE" element
    And I should see the "EC_PEOPLE_DESCRIPTION" element
    #Quick Links
    Then I should see the "CMS Quick Links" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_LEFT_HAND_TITLE" element
    And I should see the "EC_QUICK_LINKS_LEFT_TITLE" element
    And I should see the "EC_QUICK_LINKS_RIGHT_HAND_TITLE" element
    And I should see the "EC_QUICK_LINKS_RIGHT_TITLE" element
    #Spotlight
    Then I should see the "CMS Spotlight" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_SPOTLIGHT_CONTENT_ONE" element
    And Attribute "style" of "BPP Digital Web Site Spotlight Image" should have value "CONTAINS=EC_IMAGE_NAME_SIX"
    #Video
    Then I should see the "CMS Video" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_VIDEO_OVERLAY_TEXT" element
    And I should see the "BPP Digital Web Site Video element" element
    #Spotlight Video
    Then I should see the "CMS Spotlight Video" "BPP Digital Web Site CMS Anchors ID"
    And I should see the "EC_SPOTLIGHT_TITLE" element
    And I should see the "EC_VIDEO_SPOTLIGHT_CONTENT" element
    And I should see the "BPP Digital Web Site Spotlight Video element" element
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