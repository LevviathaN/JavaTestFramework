@BuildEmpire @Hub @Smoke
Feature: BPP University Hub My Learning
  As a learner
  I need an easy way to access the My Learning page from the navigation of The Hub

  @Positive @MyLearning #TC-1119 TC-1121
  Scenario: HUB - My Learning
    #Register New Student
    When II register new Hub account using API
    Then I execute "Harakirimail Verify Email" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    #Verify Left panel
    Then I should see the "Home" "Build Empire Navigation Menu elements"
    Then I should see the "My Applications" "Build Empire Navigation Menu elements"
    Then I should see the "Help & Support" "Build Empire Navigation Menu elements"
    Then Attribute "alt" of "Direct App Left Navigation Panel menu logo image" should have value "BPP University"
    Then I shouldn't see the "My Learning" "Build Empire Navigation Menu elements"
    #Student Log out
    Given I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    Then I execute "Logout as Admin Totara" reusable step
    And I wait for "3" seconds
    Then Browser deletes cookies
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And I wait for "2" seconds
    Then I execute "Login as Admin Totara" reusable step
    #Enrol to a course
    When I click on the "Automation CTA Button Course" "element by title" by JS
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
    #Login As student
    When I execute "Log In to Hub as Student" reusable step
    And I wait for "3" seconds
    #My Learning Validation and SCORM Check for BPP-12097
    Then I should see the "My Learning" "Build Empire Navigation Menu elements"
    And I click on the "Automation CTA Button Course" "Build Empire My Learning Right Block Course name"
    Then I click on the "SCORM TOPIC BPP-12097" "Build Empire Course Topic"
    And I click on the "TEST BUTTON" "button"
    And I wait for "5" seconds
    Then I execute "window.stop()" JS code
    Then I switch to window with index "3"
    Then I should see the "Totara Assessment Title" element
    Then I should see the "Totara Assessment Next Button" element
    Then I switch to window with index "2"
    Then I click on the "Home" "Build Empire Navigation Menu elements"
    And I click on the "Automation CTA Button Course" "Build Empire My Learning Right Block Course name"
    Then I click on the "SECOND SCORM GROUP OVERRIDE" "Build Empire Course Topic"
    And I click on the "TEST BUTTON" "button"
    Then I switch to window with index "4"
    Then I should see the "Totara Assessment Column Description" element
    Then I switch to window with index "2"
    #Student Log out
    When I execute "Log Out from Hub Student" reusable step
    And Browser deletes cookies
    #Login As Training Manager
    When I execute "Log In to Hub as Student" reusable step replacing some steps
      |2|I set "02917uk7sr@harakirimail.com" text to the "Email" "Build Empire text field"|
      |3|I set "qwerty azerty1!" text to the "Password" "Build Empire text field"|
    #My Approval Validation
    Then I should see the "My Approvals" "Build Empire Navigation Menu elements"