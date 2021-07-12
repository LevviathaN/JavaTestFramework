@BuildEmpire @LogoutValidation
Feature: As a user, if I logout of the Hub, I expect to be logged out of Moodle/Totara - BPP-4488

  @NoRun @Positive @Smoke #TC-2499
  Scenario: If I Logout of the Hub I Expect to be Logged out of Moodle Totara
    #Register New Student
    When I execute "Register New Student Account" reusable step replacing some steps
      |3|I set "AutoOne[FIRSTNAME]" text to the "First name" "Build Empire text field"|
      |4|I set "AutoOne[LASTNAME]" text to the "Surname" "Build Empire text field"    |
      |5|I set "AutoOne[EMAIL-HARAKIRI]" text to the "Email" "Build Empire text field"|
    #Verify Left panel
    Then I execute "Harakirimail Verify Email" reusable step replacing some steps
    |2|I fill the "Harakirimail Inbox Name" field with "EC_AUTO_ONE_EMAIL"|
    Then I execute "Log In to Hub as Student" reusable step replacing some steps
    |2|I set "EC_AUTO_ONE_EMAIL" text to the "Email" "Build Empire text field"|
    Then I shouldn't see the "My Learning" "Build Empire Navigation Menu elements"
    #Student Log out
    When I execute "Log Out from Hub Student" reusable step
    #Admin Login With Walkaround
    And I execute "Logout Totara Workaround" reusable step
    Then I execute "Login as Admin Totara" reusable step
    #Enrol to a course
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Enrol User button" button by JS
    And I set "EC_AUTO_ONE_EMAIL" text to the element with ID "enrolusersearch" using JS
    And I click on the "Totara Enrol User Search button" button by JS
    And I click on the "Totara Enrol Button" button by JS
    And I click on the "Totara Finish Enroling Users button" button by JS
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    #Register New Student
    When I execute "Register New Student Account" reusable step replacing some steps
      |3|I set "AutoTwo[FIRSTNAME]" text to the "First name" "Build Empire text field"|
      |4|I set "AutoTwo[LASTNAME]" text to the "Surname" "Build Empire text field"    |
      |5|I set "AutoTwo[EMAIL-HARAKIRI]" text to the "Email" "Build Empire text field"|
    Then I execute "Harakirimail Verify Email" reusable step replacing some steps
      |2|I fill the "Harakirimail Inbox Name" field with "EC_AUTO_TWO_EMAIL"|
    Then I execute "Log In to Hub as Student" reusable step replacing some steps
      |2|I set "EC_AUTO_TWO_EMAIL" text to the "Email" "Build Empire text field"|
    #Verify Left panel
    Then I shouldn't see the "My Learning" "Build Empire Navigation Menu elements"
    #Student Log out
    When I execute "Log Out from Hub Student" reusable step
    #Admin Login With Walkaround
    And I execute "Logout Totara Workaround" reusable step
    Then I execute "Login as Admin Totara" reusable step
    #Enrol to a course
    When I click on the "Totara Volodymyr Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Enrol User button" button by JS
    And I set "EC_AUTO_TWO_EMAIL" text to the element with ID "enrolusersearch" using JS
    And I click on the "Totara Enrol User Search button" button by JS
    And I click on the "Totara Enrol Button" button by JS
    And I click on the "Totara Finish Enroling Users button" button by JS
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    When I execute "Log In to Hub as Student" reusable step replacing some steps
      |2|I set "EC_AUTO_ONE_EMAIL" text to the "Email" "Build Empire text field"|
    And I wait for "3" seconds
    And I click on the "ICAEW Accounting Full" "Build Empire Homepage My Learning Course"
    And I click on the "Course Expires" "Build Empire Course Topic"
    And I click on the "TEST BUTTON" "button"
    Then I switch to window with index "2"
    Then I execute "window.stop()" JS code
    #And I validate text "CONTAINS=EC_AUTO_ONE_FIRSTNAME" to be displayed for "Totara User Text" element
    And I am on "https://web-stage-bppdigital.bppuniversity.com/my/learning/" URL
    And I wait for "3" seconds
    Then I execute "Log Out from Hub Student" reusable step
    When I execute "Log In to Hub as Student" reusable step replacing some steps
      |2|I set "EC_AUTO_TWO_EMAIL" text to the "Email" "Build Empire text field"|
    And I wait for "3" seconds
    And I click on the "Mini Course for Volodymyr" "Build Empire Homepage My Learning Course"
    And I click on the "Assignment Topic" "Build Empire Course Topic"
    And I wait for "2" seconds
    #And I click on the "TEST SUBMIT" button
    And I click on the "Submit your assignment" "button" by JS
    And I wait for "5" seconds
    Then I execute "window.stop()" JS code