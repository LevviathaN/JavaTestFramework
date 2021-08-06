@BuildEmpire @Hub @Totara
Feature: BPP University Hub Course Forum
  As a learner within the hub
  If there is a course specific forum
  I expect an easy way to navigate to this forum

  Background:
    Given I register new Hub account using API
    Then I execute "Log In to Hub as Student" reusable step

  @Positive @CourseForum #TC-722 TC-723
  Scenario: Hub Course Forum
    #Logout as a User
    Then I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    And I wait for "5" seconds
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
    And I click on the "Totara Finish Enroling Users button" button by JS
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And I wait for "4" seconds
    And Browser deletes cookies
    #Login As student
    When I execute "Log In to Hub as Student" reusable step
    And I wait for "3" seconds
    #Navigate to Course
    When I click on the "Direct App My Learning Left Menu Link" link by JS
    When I click on the "Direct App First Course link" link
    Then I should see the "Book Exam" button
    And I click on the "Book Exam" "exact element"
    And I switch to window with index "2"
    And I wait for "1" seconds
    And I validate text "https://web-stage-bppdigital.bppuniversity.com" to be displayed for "CHECK_URL" element
    #And I am on "https://totara.staging.bppdigital.buildempire.app/mod/url/view.php?id=2899" URL
    And I switch to window with index "1"
    #Navigate to Course Forum
    When I click on the "Totara Course Select Forum link" link
    And I click on the "Totara Course Forum option" link by JS
    And I wait for "3" seconds
    And I switch to window with index "2"
    Then I validate text "Automation Forum" to be displayed for "Totara Forum Header name" element
    Then I validate text "Are we happy with the Hub?" to be displayed for "Totara First Forum Question item" element
