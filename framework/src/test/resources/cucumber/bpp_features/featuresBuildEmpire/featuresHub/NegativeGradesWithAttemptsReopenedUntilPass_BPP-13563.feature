@BuildEmpire @Hub  @Totara
Feature: Negative grade when Attempts reopened is set to Automatically until pass
If we set an Assignment Activity
(Add an activity or resource then select Assignment activity module) where the Submission types is File submissions
there is an option under Submission settings to reopen attempts automatically until pass.
We've seen cases that the percentage in the front-end appears as minus one (-1%) when this option is enabled -
and then appears corrects as soon we change it back to the default "Never"

  @AttemptReopened
  Scenario: Negative Grade When Attempt Reopened Is Set to Automatically Until Pass
    #Register New Student
    And I register new "Standard" Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    #Validate Timeline block
    Then I should see the "Timeline" message
    When I execute "Log Out from Hub Student" reusable step
    And I should see the "Already registered? Log in" message
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    Then I wait for "2" seconds
    And I click on the "Totara Automation Only Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Enrol User button" button by JS
    And I set "EC_AUTO_EMAIL" text to the element with ID "enrolusersearch" using JS
    And I click on the "Totara Enrol User Search button" button by JS
    And I click on the "Totara Enrol Button" button by JS
    And I click on the "Totara Finish Enroling Users button" button by JS
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "1" seconds
    And I execute "Log In to Hub as Student" reusable step
    When I click on the "Only for Automation " "Build Empire My Learning Right Block Course name"
    And I click on the "TOPIC BPP-13563" "Build Empire Course Topic"
    And I click on the "Hub Submit Button For Activity" button
    And I wait for "2" seconds
    Then I switch to window with index "2"
    And I wait for "2" seconds
    Then I click on the "Totara Add Submission Button" button by JS
    And I wait for "2" seconds
    Then I click on the "Add..." "element by title"
    And I click on the "Upload a file" "element" by JS
    Then I upload "directApp.pdf" file to "Direct App Upload File" element
    And I wait for "2" seconds
    Then I click on the "Upload this file" "element" by JS
    And I click on the "Totara Save" button
    And I wait for "3" seconds
    When I switch to window with index "1"
    And Browser performs "REFRESH" command
    And I wait for "5" seconds
    Then I should see the "Submitted" "text contained in element"
    When I execute "Log Out from Hub Student" reusable step
    And Browser deletes cookies
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    Then I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    Then I wait for "2" seconds
    #Grade student with negative mark
    Then I execute "Release Grade for Assignment in Totara" reusable step replacing some steps
    |5|I set "50" text to the "grade" "VLE Login Fields"|
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    Then I execute "Logout as Admin Totara" reusable step
    And I wait for "1" seconds
    And Browser deletes cookies
    And I execute "Log In to Hub as Student" reusable step
    When I click on the "Only for Automation " "Build Empire My Learning Right Block Course name"
    And I click on the "TOPIC BPP-13563" "Build Empire Course Topic"
    Then I should see the "Failed" "text"
    Then I execute "Log Out from Hub Student" reusable step
    And I wait for "1" seconds
    And Browser deletes cookies
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    Then I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    Then I wait for "2" seconds
    #Grade student with passed mark
    Then I execute "Release Grade for Assignment in Totara" reusable step
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I execute "Log In to Hub as Student" reusable step
    When I click on the "Only for Automation " "Build Empire My Learning Right Block Course name"
    And I click on the "TOPIC BPP-13563" "Build Empire Course Topic"
    Then I should see the "Passed" "text"