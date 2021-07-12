@BuildEmpire @Hub @SCORM @KeyActivities @Totara
Feature: Verify Moodle Quiz Key Activity Completion Appearance In HUB - BPP-6381
  As a user in the Hub,
  when a MOODLE QUIZ has been set as the Key Activity on my Topic Overview page,
  I expect to see a score and date for each attempt

  @Positive #TC-2826
  Scenario: Moodle Quiz Key Activity On Topic Overview Page Validation
    When I execute "Register New Student Account" reusable step
    Then I execute "Harakirimail Verify Email" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    Then I shouldn't see the "My Learning" "Build Empire Navigation Menu elements"
    Then I execute "Log Out from Hub Student" reusable step
    And I wait for "5" seconds
    And Browser deletes cookies
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    Then I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    Then I wait for "2" seconds
    When I click on the "Totara Volodymyr Course" link by JS
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
    And I execute "Log In to Hub as Student" reusable step
    And I click on the "Mini Course for Volodymyr" "Build Empire Homepage My Learning Course"
    And I click on the "Moodle Quiz" "Build Empire Course Topic"
    # Use following JS code if you want the WebPage, that is opened by clicking on specified element in new tab,
      # to be opened in current tab instead
#    Then I execute "arguments[0].setAttribute('target','')" JS code for "Submit" "Build Empire button"
    And I click on the "Hub Submit Button For Activity" button
    And I wait for "4" seconds
    Then I execute "window.stop()" JS code
    Then I switch to window with index "3"
    And I click on the "Attempt quiz now" "Totara button"
    Then I execute "window.stop()" JS code
    And I click on the "Start attempt" "Totara button"
    And I click on the "True" "Totara Moodle Quiz radiobutton"
    And I click on the "Next page" "Totara button"
    And I click on the "Gray" "Totara Moodle Quiz checkbox"
    And I click on the "Red" "Totara Moodle Quiz checkbox"
    And I click on the "Blue" "Totara Moodle Quiz checkbox"
    And I click on the "Orange" "Totara Moodle Quiz checkbox"
    And I click on the "Green" "Totara Moodle Quiz checkbox"
    And I click on the "Finish attempt" "Totara button"
    And I click on the "Submit all and finish" "Totara button"
    And I click on the "Totara Submit all and finish Button" button
    When I switch to window with index "2"
    And Browser performs "REFRESH" command
    Then I execute "Log In to Hub as Student" reusable step if "Already registered? Log in" "element is present"
    And I click on the "Mini Course for Volodymyr" "Build Empire Homepage My Learning Course" if "Submit" "element is absent"
    And I click on the "Moodle Quiz" "Build Empire Course Topic" if "Submit" "element is absent"
    Then I should see the "Passed" message
    And I click on the "Hub Submit Button For Activity" button
    And I wait for "4" seconds
    Then I execute "window.stop()" JS code
    Then I switch to window with index "4"
    And I click on the "Re-attempt quiz" "Totara button"
    And I click on the "Start attempt" "Totara button"
    And I click on the "False" "Totara Moodle Quiz radiobutton"
    And I click on the "Next page" "Totara button"
    And I click on the "Gray" "Totara Moodle Quiz checkbox"
    And I click on the "Finish attempt" "Totara button"
    And I click on the "Submit all and finish" "Totara button"
    And I click on the "Totara Submit all and finish Button" button
    When I switch to window with index "2"
    And Browser performs "REFRESH" command
    Then I execute "Log In to Hub as Student" reusable step if "Already registered? Log in" "element is present"
    And I click on the "Mini Course for Volodymyr" "Build Empire Homepage My Learning Course" if "Submit" "element is absent"
    And I click on the "Moodle Quiz" "Build Empire Course Topic" if "Submit" "element is absent"
    Then I should see the "Failed" message