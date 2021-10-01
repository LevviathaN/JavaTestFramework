@BuildEmpire @Assignment @Totara
Feature: Verify Assignment Key Activity Completion Appearance In HUB - BPP-4488
  As a user in the Hub, when an Assignment has been set as Key Activity on my Topic Overview page,
  I expect it to appear the same as Assignment Assessment Block

  #TC-2716 Is not completed until issue with BrowserStack will be resolved
  Scenario: Assignment On Topic Overview Page Validation
    When I register new "Standard" Hub account using API
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
    And I click on the "Assignment Topic" "Build Empire Course Topic"
    And I validate text "CONTAINS=You haven't attempted this assessment yet" to be displayed for "Direct App Topic Assessment Status Results" element
    And I click on the "Submit your assignment" "Build Empire button"
    And I wait for "10" seconds
    Then I execute "window.stop()" JS code
    Then I switch to window with index "2"
    #Add Assignment
    And I click on the "Totara Add Submission Button" element by JS
    #Then I execute "window.stop()" JS code
    And I wait for "40" seconds
    Then I execute "window.stop()" JS code
    And I click on the "BPP Digital Upload File Button" element by JS
    Then I upload "fileToUpload.txt" file to "Direct App Upload File" element
    And I wait for "5" seconds
    #And I click on the "Totara Upload This File" element by JS
    And I click on the "Totara Save" button by JS
    And I should see the "Submitted" "element"
    #Go back to HUB
    When I switch to window with index "1"
    And Browser performs "REFRESH" command
    And I execute "Log Out from Hub Student" reusable step

    #And I click on the "Mini Course for Volodymyr" "Build Empire Homepage My Learning Course" if "Take the test" "element is absent"
    #And I click on the "Assignment Topic" "Build Empire Course Topic" if "Take the test" "element is absent"
    #Then I should see the "Failed" message
    #And I validate text "CONTAINS=54" to be displayed for "Direct App Topic Assessment Percentage Results" element
