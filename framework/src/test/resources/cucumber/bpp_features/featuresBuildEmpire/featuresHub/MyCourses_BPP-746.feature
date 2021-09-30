@BuildEmpire @Hub @Smoke @Totara
Feature: BPP University Hub My Courses
  As a learner
  I'd like to be able to see a summary of my most recently accessed Courses and my progression for each within the dashboard
  So that I can see where I am up to at a glance

  @MyCourses @Positive #TC-1106 TC-1107 TC-1111 TC-1122 TC-1125 TC-1126
  Scenario: HUB - My Courses
    #Register New Student
    And I register new "Standard" Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    #Validate Timeline block
    Then I should see the "Timeline" message
    Then I should see the "Welcome to your new logged in area." message
    When I execute "Log Out from Hub Student" reusable step
    And I execute "Logout Totara Workaround" reusable step
    Then I execute "Login as Admin Totara" reusable step
    #Enrol to a course
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Enrol User button" button by JS
    And I set "EC_AUTO_EMAIL" text to the element with ID "enrolusersearch" using JS
    And I click on the "Totara Enrol User Search button" button by JS
    And I click on the "Totara Enrol Button" button by JS
    And I click on the "Totara Finish Enroling Users button" button by JS
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "3" seconds
    #Login As student
    When I execute "Log In to Hub as Student" reusable step
    #My Learning Validation
    Then I should see the "You are now enrolled onto ICAEW Accounting Full" message
    Then I should see the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    Then Attribute "alt" of "Direct App Announcement Megaphone icon" should have value "megaphone-icon"
    #Click Most Recent Course
    When I click on the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    #Validate Recent Course Name and Percentage
    Then I should see the "ICAEW Accounting Full" message
    #Click My Learning
    When I click on the "My Learning" "Build Empire Navigation Menu elements"
    When I click on the "Direct App First Course link" link
    Then I validate text "ICAEW Accounting Full" to be displayed for "Direct App Course Section title" element
    Then I validate text "0%" to be displayed for "Direct App Course Progress Percentage value" element