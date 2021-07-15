@BuildEmpire @QuizAssesment @Totara
Feature: Moodle Quiz Key Activity On Topic Overview Page With No Submit
  As a user in the Hub,
  when a MOODLE QUIZ has been set as the Key Activity on my Topic Overview page
  when I attempt the Moodle Quiz, but do not submit it
  I do not expect to see it as failed on a Hub

  @Negative #Do not run until BPP-6792 will be resolved
  Scenario: Moodle Quiz Key Activity On Topic Overview Page With No Submit
    When I register new Hub account using API
    Then I execute "Harakirimail Verify Email" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    Then I shouldn't see the "My Learning" "Build Empire Navigation Menu elements"
    When I execute "Log Out from Hub Student" reusable step
    And I should see the "Already registered? Log in" message
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    Then I execute "Login as Admin Totara" reusable step
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
    And I execute "Log In to Hub as Student" reusable step
    And I click on the "Mini Course for Volodymyr" "Build Empire Homepage My Learning Course"
    And I click on the "Moodle Quiz" "Build Empire Course Topic"
    And I validate text "CONTAINS=You haven't attempted this assessment yet" to be displayed for "Direct App Topic Assessment Status Results" element
    And I click on the "Submit" "BPP Digital Student Applications Menu link"
    And I wait for "10" seconds
    Then I execute "window.stop()" JS code
    Then I switch to window with index "2"
    And I click on the "Attempt quiz now" "BPP Digital Admin Value attribute button"
    And I click on the "Start attempt" "BPP Digital Admin Value attribute button"
    # Quiz 1
    And I click on the "True" "Build Empire RFI Label text item"
    And I click on the "Next page" "BPP Digital Admin Value attribute button"
    When I switch to window with index "1"
    When Browser performs "Refresh" command
    Then I click on the "Mini Course for Volodymyr" "Build Empire Breadcrumb Tab"
    And I click on the "Moodle Quiz" "Build Empire Course Topic"
    And I wait for "1" seconds
    And I validate text "CONTAINS=You haven't attempted this assessment yet" to be displayed for "Direct App Topic Assessment Status Results" element
