@BuildEmpire @Hub @Totara
Feature: BPP University Hub My Learning Course Tutor

  Background:
    Given I register new Hub account using API
    Then I execute "Harakirimail Verify Email" reusable step
    Then I execute "Log In to Hub as Student" reusable step

  @Positive @CourseTutor #TC-721
  Scenario: Hub My Learning Course Tutor
    #Validate No Course Attributes
    Then Attribute "href" of "Direct App Student Left Hand Nav Second Item" should have value "https://web-stage-bppdigital.bppuniversity.com/my/applications"
    Then I validate text "CONTAINS=When you enrol on a course your progress will appear here" to be displayed for "Direct App My Learning No Course Placeholder" element
    #Then I execute "Log Out from Hub Student" reusable step
    And I wait for "10" seconds
    And I execute "Logout Totara Workaround" reusable step
    Then I execute "Login as Admin Totara" reusable step
    #Enrol To course for ICAEW Course
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Enrol User button" button by JS
    And I set "EC_AUTO_EMAIL" text to the element with ID "enrolusersearch" using JS
    And I click on the "Totara Enrol User Search button" button by JS
    And I click on the "Totara Enrol Button" button by JS
    And I wait for "2" seconds
    And I click on the "Totara Finish Enroling Users button" button by JS
    #Totara Assign Tutor Role
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Course Assign Roles Link" link by JS
    And I click on the "Totara Course Bpp Lead Tutor Button" button by JS
    And I capture text data "Totara Course Current Tutor Name" as "EC_CURRENT_TUTOR" variable
    #Admin Logout
    And I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    #Login As student
    And I execute "Log In to Hub as Student Fixed" reusable step
    #Validate My Learning Course Tutor Name
    And I wait for "5" seconds
    And I click on the "Direct App Student Left Hand Nav Second Item" link by JS
    And I validate text "CONTAINS=test ---" to be displayed for "Direct App My Learning First Course Tutor Name" element
    #Student Logout
    And I execute "Logout Totara Workaround" reusable step
    #Then I execute "Log Out from Hub Student" reusable step
    #And I wait for "10" seconds
    #Admin Login With Walkaround
    #When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    #And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    #Totara UnAssign Tutor Role
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Course Remove Bpp Lead Tutor Button" button by JS
    And I click on the "Totara Course Confirm Remove Bpp Lead Tutor Button" button by JS
    #Admin Logout
    And I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "7" seconds
    #Login As student
    And I execute "Log In to Hub as Student Fixed" reusable step
    #Validate My Learning Course Tutor Name
    And I wait for "3" seconds
    And I click on the "Direct App Student Left Hand Nav Second Item" link by JS
    And I validate text "NOT_CONTAINS=EC_CURRENT_TUTOR" to be displayed for "Direct App My Learning First Course Tutor Name" element