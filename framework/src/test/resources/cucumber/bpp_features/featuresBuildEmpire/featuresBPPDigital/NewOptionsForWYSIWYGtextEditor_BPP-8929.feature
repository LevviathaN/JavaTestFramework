@BuildEmpire @DigitalSite
Feature: BPP Digital New options inside the WYSIWYG text editor
  As a developer
  I would like to add a number of new options to the WYSIWYG text editor in the admin panel

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive @Smoke #TC-3874 TC-3927
  Scenario: New options inside the WYSIWYG text editor
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Create CMS Page" reusable step
    #Add Full Width Text Block Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Full Width Text Block" "BPP Digital Admin Sub Menu Item links"
    And I fill the "BPP Digital Component Description field" field with "FullWidthTextBlockContent[####]"
    #Option 1
    And I click on the "BPP Digital Full Width Text Block Content Font Dropdown" element
    And I validate text "FFMoreWebProBook" to be displayed for "BPP Digital Full Width Text Block Content Font Element One" element
    And I click on the "BPP Digital Full Width Text Block Content Font Element One" option
    #Option 2
    And I click on the "BPP Digital Full Width Text Block Content Font Dropdown" element
    And I validate text "FFMoreWebProBold" to be displayed for "BPP Digital Full Width Text Block Content Font Element Two" element
    And I click on the "BPP Digital Full Width Text Block Content Font Element Two" option
    #Option 3
    And I click on the "BPP Digital Full Width Text Block Content Font Dropdown" element
    And I validate text "GTWalsheimLight" to be displayed for "BPP Digital Full Width Text Block Content Font Element Three" element
    And I click on the "BPP Digital Full Width Text Block Content Font Element Three" option
    #Option 4
    And I click on the "BPP Digital Full Width Text Block Content Font Dropdown" element
    And I validate text "GTWalsheimMedium" to be displayed for "BPP Digital Full Width Text Block Content Font Element Four" element
    And I click on the "BPP Digital Full Width Text Block Content Font Element Four" option
    #Option 5
    And I click on the "BPP Digital Full Width Text Block Content Font Dropdown" element
    And I validate text "GTWalsheimRegular" to be displayed for "BPP Digital Full Width Text Block Content Font Element Five" element
    And I click on the "BPP Digital Full Width Text Block Content Font Element Five" option
    #Option 6
    And I click on the "BPP Digital Full Width Text Block Content Font Dropdown" element
    And I validate text "GTWalsheimBold" to be displayed for "BPP Digital Full Width Text Block Content Font Element Six" element
    And I click on the "BPP Digital Full Width Text Block Content Font Element Six" option
    #Verify Sourse and Styles
    Then I should see the "Source" "Build Empire RFI Span dropdown item"
    And I click on the "BPP Digital Full Width Text Block Content Styles Dropdown" element
    And I click on the "BPP Digital Full Width Text Block Content Lozenge Style" element
    And Attribute "class" of "BPP Digital Full Width Text Block Content Lozenge Style text" should have value "lozenge"
    And I set "CMS Full Width Text Block" text to the "Html" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    #Add Clean Up Component
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"