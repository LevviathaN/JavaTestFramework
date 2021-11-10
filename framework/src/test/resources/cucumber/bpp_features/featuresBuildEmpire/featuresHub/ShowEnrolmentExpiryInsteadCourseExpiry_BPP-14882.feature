@BuildEmpire @Hub @Totara
Feature: To show the Enrolment Expiry instead of the Course Expiry on the Hub
  To show the Enrolment Expiry instead of the Course Expiry on the Hub

  @EnrolmentExpiry #TC-6016, 6078, 6079
  Scenario: To Show the Enrolment Expiry Instead of the Course Expiry on the Hub
    #Register New Student
    And I register new "Standard" Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    #Validate Timeline block
    Then I should see the "Timeline" message
    Then I should see the "Welcome to your new logged in area." message
    When I execute "Log Out from Hub Student" reusable step
    And I should see the "Already registered? Log in" message
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    #Enrol to a course
    When I click on the "Totara Automation Second Course" link by JS
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
    And I wait for "2" seconds
    #Login As Student and Check Course Expiry
    When I execute "Log In to Hub as Student" reusable step
    When I click on the "Automation Test Course" "Build Empire My Learning Right Block Course name"
    And I validate text "CONTAINS=November 2030" to be displayed for "Direct App Expiry Date status field" element
    When I execute "Log Out from Hub Student" reusable step
    And I should see the "Already registered? Log in" message
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    #Change Course Expiry
    When I click on the "Totara Automation Second Course" link by JS
    And I click on the "Totara Edit Course Setting link Mobile" element by JS
    Then I "uncheck" "Course end date" "Totara Settings Checkbox"
    And I click on the "Save and display" "element by value" by JS
    And I wait for "2" seconds
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "1" seconds
    #Login As Student and Check No Expiry
    When I execute "Log In to Hub as Student" reusable step
    When I click on the "Automation Test Course" "Build Empire My Learning Right Block Course name"
    Then I shouldn't see the "Direct App Expiry Date status field" element
    When I execute "Log Out from Hub Student" reusable step
    And I should see the "Already registered? Log in" message
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    #Change Course Expiry and Enrolment
    When I click on the "Totara Automation Second Course" link by JS
    And I click on the "Totara Edit Course Setting link Mobile" element by JS
    Then I "check" "Course end date" "Totara Settings Checkbox"
    And I select "2030" from "Totara expiry Course Date Year dropdown" element
    And I select "November" from "Totara expiry Course Date Month dropdown" element
    And I click on the "Save and display" "element by value" by JS
    And I wait for "2" seconds
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "2" seconds
    Then I set "EC_AUTO_EMAIL" text to the "id_search" "element by id"
    And I wait for "1" seconds
    And I click on the "Filter" "element by value" by JS
    And I wait for "1" seconds
    And I click on the "Edit enrolment" "element by title two" by JS
    Then I "check" "Enrolment ends" "Totara Settings Checkbox"
    And I select "2024" from "Totara Enrolment Expiry Year" element
    Then I click on the "Totara Save" element by JS
    And I wait for "1" seconds
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "2" seconds
    #Login As Student and Check Enrolment Expiry
    When I execute "Log In to Hub as Student" reusable step
    When I click on the "Automation Test Course" "Build Empire My Learning Right Block Course name"
    And I validate text "CONTAINS=2024" to be displayed for "Direct App Expiry Date status field" element
    When I execute "Log Out from Hub Student" reusable step
    #Clean Up
   # And I should see the "Already registered? Log in" message
    #When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    #And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    #Then I execute "Login as Admin Totara" reusable step
    #When I click on the "Totara Automation Second Course" link by JS
    #And I click on the "Totara Edit Course Setting link Mobile" element by JS
    #And I select "2030" from "Totara expiry Course Date Year dropdown" element
    #And I select "November" from "Totara expiry Course Date Month dropdown" element
    #And I click on the "Save and display" "element by value" by JS
    #And I wait for "2" seconds
    #And I click on the "Totara Left Menu Users link" link by JS
    #And I click on the "Totara Enrolled Users button" button by JS
    #And I wait for "2" seconds
    #Then I set "EC_AUTO_EMAIL" text to the "id_search" "element by id"
    #And I wait for "1" seconds
    #And I click on the "Filter" "element by value" by JS
    #And I wait for "1" seconds
   # And I click on the "Edit enrolment" "element by title two" by JS
   # Then I "uncheck" "Enrolment ends" "Totara Settings Checkbox"
   # Then I click on the "Totara Save" element by JS
    #And I wait for "3" seconds
