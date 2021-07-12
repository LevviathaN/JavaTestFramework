@Mobile
Feature: BPP University Hub Announcements
    As a Hub Admin
    I would like to be able to provide my learners with important announcements in The Hub
    So that I can get important information out quickly

  @Positive @Samsung #TC-1105 TC-1109 TC-1107
  Scenario: Hub Announcements_Mobile
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "autolawandasalazar5614@guerrillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I wait for "10" seconds
    Then I should see the "Direct App Announcement Megaphone icon" element
    And I capture text data "Direct App Announcement Text" as "EC_ANNOUNCEMENT_TEXT" variable
    And I click on the "Hub VPE Mobile Hamburger Menu" element
    Then I click on the "Direct App Mobile Logout" element
    And Browser deletes cookies
    When I execute "Log In to Hub as Admin" reusable step replacing some steps
      |5|I wait for "15" seconds|
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/announcements" URL
    Then I validate text "EC_ANNOUNCEMENT_TEXT" to be displayed for "Direct App Announcement First Item name" element
    And I click on the "Add" "BPP Digital Admin Page Button"
    And I execute "" JS code
    And I fill the "BPP Digital Component Description field" field with "AutoAnnouncementContent[####]"
    #And I execute "document.getElementByClassName('cke_editable cke_editable_themed cke_contents_ltr cke_show_borders').innerText = 'AutoAnnouncementContent[####]'" JS code for "BPP Digital Component Description field" element
    And I "check" "Live" "BPP Digital Admin Mandatory checkbox"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Announcement was successfully created." "BPP Digital Admin Alert Message"
    Then I validate text "EC_AUTO_ANNOUNCEMENT_CONTENT" to be displayed for "Direct App Announcement First Item name" element
    Then I validate text "Yes" to be displayed for "Direct App Announcement First Item status" element
    Then I validate text "less than a minute ago" to be displayed for "Direct App Announcement First Item created" element
    And I execute "Log Out from Hub Admin" reusable step
    And Browser deletes cookies
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "autolawandasalazar5614@guerrillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I wait for "5" seconds
    Then I validate text "EC_AUTO_ANNOUNCEMENT_CONTENT" to be displayed for "Direct App Announcement Text" element
    Then I click on the "Close" "BPP Digital Search Label Button"
    Then I shouldn't see the "EC_AUTO_ANNOUNCEMENT_CONTENT" message
    And I click on the "Hub VPE Mobile Hamburger Menu" element
    Then I click on the "Direct App Mobile Logout" element
    When I execute "Log In to Hub as Admin" reusable step replacing some steps
      |5|I wait for "15" seconds|
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/announcements" URL
    Then I should see the "EC_AUTO_ANNOUNCEMENT_CONTENT" element
    And I click on the "EC_AUTO_ANNOUNCEMENT_CONTENT" "BPP Digital Admin Delete Button for Specific name"
    And I wait for "3" seconds
    Then I shouldn't see the "EC_AUTO_ANNOUNCEMENT_CONTENT" "element"

  @iPad @iPhone
  Scenario: Hub Announcements_Mobile
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "autolawandasalazar5614@guerrillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I wait for "10" seconds
    Then I should see the "Direct App Announcement Megaphone icon" element
    And I capture text data "Direct App Announcement Text" as "EC_ANNOUNCEMENT_TEXT" variable
    And I click on the "Hub VPE Mobile Hamburger Menu" element
    Then I click on the "Direct App Mobile Logout" element
