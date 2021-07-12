@Mobile
Feature: The Hub - Dashboard / Timeline - Info & News
  As a Hub Admin,
  I would like to be able to provide my learners with general information and news and for it to be available via their Dashboard
  so that I have a means of direct communication to my learners

  @Positive @iPad @iPhone @Samsung #TC-1315 TC-1317
  Scenario: Hub Timeline - Info and News_Mobile
    #Create News
    Given I execute "Log In to Hub as Admin" reusable step replacing some steps
      |4|I click on the "Direct App Login Button" element by JS|
      |5|I wait for "5" seconds|
    When I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/news" URL
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I fill the "BPP Digital News Title Field" field with "AutomationNews[####]"
    And I fill the "BPP Digital News URL Field" field with "www.bpp.com"
    And I fill the "BPP Digital News Author Field" field with "Automation Team"
    And I select "BPP University" from "Visibility groups" "BPP Digital Mandatory select field"
    And I fill the "BPP Digital Component Description field" field with "Summary[####]"
    And I execute "document.getElementsByClassName('cke_editable cke_editable_themed cke_contents_ltr cke_show_borders')[0].innerText = 'Summary';" JS code for "BPP Digital Component Description field" element
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "News was successfully created." "BPP Digital Admin Alert Message"
    And I wait for "1" seconds
    Then I execute "Log Out from Hub Admin" reusable step
    And Browser deletes cookies
    And I wait for "3" seconds
    #Validate News displayed
    Then I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "AutoFrancisMcKnight2507@getnada.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    And I wait for "1" seconds
    And I wait for "5" seconds
    And I validate text "CONTAINS=EC_AUTOMATION_NEWS" to be displayed for "Direct Apps Home News Title" element
    And I validate text "CONTAINS=Automation Team" to be displayed for "Direct Apps Home News Author" element
    And I validate text "CONTAINS=Summary" to be displayed for "Direct Apps Home News Content" element
    And Attribute "href" of "Direct Apps Home News URL" should have value "CONTAINS=www.bpp.com"
    And I click on the "Hub VPE Mobile Hamburger Menu" element
    Then I click on the "Direct App Mobile Logout" element
    And I wait for "2" seconds
    #Edit visbility Groups
    Given I execute "Log In to Hub as Admin" reusable step replacing some steps
      |4|I click on the "Direct App Login Button" element by JS|
      |5|I wait for "5" seconds|
    When I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/news" URL
    And I click on the "BPP Digital Edit News" button
    And I click on the "BPP Digital Remove Visibility Group" element
    And I select "Companies > #34 Automation" from "Visibility groups" "BPP Digital Mandatory select field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    And I wait for "1" seconds
    Then I execute "Log Out from Hub Admin" reusable step
    And Browser deletes cookies
    Then I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "AutoFrancisMcKnight2507@getnada.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    And I wait for "1" seconds
    And I shouldn't see the "News&Information" "text contained in element"
    And I click on the "Hub VPE Mobile Hamburger Menu" element
    And I wait for "5" seconds
    Then I click on the "Direct App Mobile Logout" element by JS
    And I wait for "5" seconds
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "AutoAdonisDuarte6846@guerrillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"                    |
    And I wait for "10" seconds
    And I validate text "CONTAINS=EC_AUTOMATION_NEWS" to be displayed for "Direct Apps Home News Title" element
    And I validate text "CONTAINS=Automation Team" to be displayed for "Direct Apps Home News Author" element
    And I validate text "CONTAINS=Summary" to be displayed for "Direct Apps Home News Content" element
    And Attribute "href" of "Direct Apps Home News URL" should have value "CONTAINS=www.bpp.com"
    And I click on the "Hub VPE Mobile Hamburger Menu" element
    Then I click on the "Direct App Mobile Logout" element
    And I wait for "2" seconds
    Given I execute "Log In to Hub as Admin" reusable step replacing some steps
      |4|I click on the "Direct App Login Button" element by JS|
      |5|I wait for "5" seconds|
    When I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/news" URL
    And I click on the "BPP Digital Delete News" button
    Then I should see the "News was successfully removed." "BPP Digital Admin Alert Message"