@BuildEmpire @Hub @Announcements
Feature: BPP University Hub Announcements
    As a Hub Admin
    I would like to be able to provide my learners with important announcements in The Hub
    So that I can get important information out quickly

  Background:
    Given I register new "Standard" Hub account using API
    Then I execute "Log In to Hub as Student" reusable step

  @Positive #TC-1105 TC-1109 TC-1107
  Scenario: Hub Announcements
    Then I should see the "Direct App Announcement Megaphone icon" element
    And I capture text data "Direct App Announcement Text" as "EC_ANNOUNCEMENT_TEXT" variable
    When I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Admin Hub Navigate to Announcements" reusable step
    Then I validate text "EC_ANNOUNCEMENT_TEXT" to be displayed for "Direct App Announcement First Item name" element
    And I click on the "Add" "BPP Digital Admin Page Button"
    And I fill the "BPP Digital Component Description field" field with "AutoAnnouncementContent[####]"
    And I "check" "Live" "BPP Digital Admin Mandatory checkbox"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Announcement was successfully created." "BPP Digital Admin Alert Message"
    Then I validate text "EC_AUTO_ANNOUNCEMENT_CONTENT" to be displayed for "Direct App Announcement First Item name" element
    Then I validate text "Yes" to be displayed for "Direct App Announcement First Item status" element
    Then I validate text "less than a minute ago" to be displayed for "Direct App Announcement First Item created" element
    When I execute "Log Out from Hub Admin" reusable step
    And I wait for "2" seconds
    And I execute "Log In to Hub as Student" reusable step
    Then I wait for "5" seconds
    Then I validate text "EC_AUTO_ANNOUNCEMENT_CONTENT" to be displayed for "Direct App Announcement Text" element
    Then I click on the "Close" "BPP Digital Search Label Button"
    Then I shouldn't see the "EC_AUTO_ANNOUNCEMENT_CONTENT" message
    When I execute "Log Out from Hub Student" reusable step
    And Browser deletes cookies
    When I execute "Log In to Hub as Admin" reusable step
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/announcements" URL
    Then I should see the "EC_AUTO_ANNOUNCEMENT_CONTENT" element
    And I click on the "EC_AUTO_ANNOUNCEMENT_CONTENT" "BPP Digital Admin Delete Button for Specific name"
    And I wait for "3" seconds
    Then I shouldn't see the "EC_AUTO_ANNOUNCEMENT_CONTENT" "element"