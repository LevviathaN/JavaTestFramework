@BuildEmpire @ScormAssessment @DoNotRun @Totara
Feature: Verify SCORM Key Activity Complition Appearance In HUB - BPP-4488
  As a user in the Hub
  when a SCORM Assignment Bridge activity has been set as Key Activity
  then I expect this to be reflected in the Topic Overview page within the Hub

  @Positive @Smoke #TC-2715
  Scenario: Scorm Key Activity On Topic Overview Page Validation
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
    And I click on the "SCORM Topic" "Build Empire Course Topic"
    And I validate text "CONTAINS=You haven't attempted this assessment yet" to be displayed for "Direct App Topic Assessment Status Results" element
    And I click on the "Take the test" "Build Empire button"
    And I wait for "10" seconds
    Then I execute "window.stop()" JS code
    Then I switch to window with index "1"
    # Question 1
    When I click on the "Totara Assessment Next Button" button
    And I select "Yes" from "IAASB" "Totara Assessment select"
    And I select "Yes" from "the FRC" "Totara Assessment select"
    And I select "No" from "IFRSs" "Totara Assessment select"
    And I select "No" from "companies" "Totara Assessment select"
    Then I click on the "Totara Assessment Next Button" button
    # Question 2
    And I click on the "Auditors report" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 3
    And I click on the "Auditors must prepare" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 4
    And I select "Yes" from "Auditors must" "Totara Assessment select"
    And I select "Yes" from "The loss" "Totara Assessment select"
    And I select "Yes" from "It must be" "Totara Assessment select"
    And I select "Yes" from "The persons" "Totara Assessment select"
    And I select "No" from "There must" "Totara Assessment select"
    Then I click on the "Totara Assessment Next Button" button
    # Question 5
    And I click on the "auditor assesses" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 6
    And I click on the "To examine" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 7
    And I click on the "Money" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 8
    And I click on the "1, 2, 3 and 4" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 9
    And I click on the "Receiving" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 10
    And I click on the "may disclose matters" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 11
    And I select "Yes" from "A -" "Totara Assessment select"
    And I select "No" from "B -" "Totara Assessment select"
    And I select "Yes" from "C-" "Totara Assessment select"
    And I select "No" from "D -" "Totara Assessment select"
    Then I click on the "Totara Assessment Next Button" button
    # Question 12
    And I select "Yes" from "Long" "Totara Assessment select"
    And I select "No" from "Incentive" "Totara Assessment select"
    And I select "Yes" from "Concern" "Totara Assessment select"
    And I select "No" from "Acceptance" "Totara Assessment select"
    Then I click on the "Totara Assessment Next Button" button
    # Question 13
    And I select "Yes" from "The auditor" "Totara Assessment select"
    And I select "No" from "A junior" "Totara Assessment select"
    And I select "Yes" from "A senior" "Totara Assessment select"
    And I select "No" from "The financial" "Totara Assessment select"
    And I select "No" from "The audit partner" "Totara Assessment select"
    Then I click on the "Totara Assessment Next Button" button
    # Question 14
    And I click on the "Professional competence" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 15
    And I click on the "advance the" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Submit Button" button
    When I switch to window with index "0"
    And Browser performs "REFRESH" command
    Then I execute "Log In to Hub as Student" reusable step if "Already registered? Log in" "element is present"
    And I click on the "Mini Course for Volodymyr" "Build Empire Homepage My Learning Course" if "Take the test" "element is absent"
    And I click on the "SCORM Topic" "Build Empire Course Topic" if "Take the test" "element is absent"
    Then I should see the "Passed" message
    And I validate text "CONTAINS=73" to be displayed for "Direct App Topic Assessment Percentage Results" element
    And I click on the "Take the test" "Build Empire button"
    And I wait for "10" seconds
    Then I execute "window.stop()" JS code
    Then I switch to window with index "1"
    # Question 1
    When I click on the "Totara Assessment Next Button" button
    And I select "No" from "IAASB" "Totara Assessment select"
    And I select "No" from "the FRC" "Totara Assessment select"
    And I select "Yes" from "IFRSs" "Totara Assessment select"
    And I select "Yes" from "companies" "Totara Assessment select"
    Then I click on the "Totara Assessment Next Button" button
    # Question 2
    And I click on the "Directors are" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 3
    And I click on the "Auditors owe" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 4
    And I select "No" from "Auditors must" "Totara Assessment select"
    And I select "No" from "The loss" "Totara Assessment select"
    And I select "No" from "It must be" "Totara Assessment select"
    And I select "No" from "The persons" "Totara Assessment select"
    And I select "Yes" from "There must" "Totara Assessment select"
    Then I click on the "Totara Assessment Next Button" button
    # Question 5
    And I click on the "audit report" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 6
    And I click on the "To assist" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 7
    And I click on the "Audit Committee" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 8
    And I click on the "1 and 2 only" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 9
    And I click on the "Holding" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 10
    And I click on the "may only disclose matters" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 11
    And I select "No" from "A -" "Totara Assessment select"
    And I select "Yes" from "B -" "Totara Assessment select"
    And I select "No" from "C-" "Totara Assessment select"
    And I select "Yes" from "D -" "Totara Assessment select"
    Then I click on the "Totara Assessment Next Button" button
    # Question 12
    And I select "No" from "Long" "Totara Assessment select"
    And I select "Yes" from "Incentive" "Totara Assessment select"
    And I select "No" from "Concern" "Totara Assessment select"
    And I select "Yes" from "Acceptance" "Totara Assessment select"
    Then I click on the "Totara Assessment Next Button" button
    # Question 13
    And I select "Yes" from "The auditor" "Totara Assessment select"
    And I select "No" from "A junior" "Totara Assessment select"
    And I select "Yes" from "A senior" "Totara Assessment select"
    And I select "No" from "The financial" "Totara Assessment select"
    And I select "No" from "The audit partner" "Totara Assessment select"
    Then I click on the "Totara Assessment Next Button" button
    # Question 14
    And I click on the "Integrity" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Next Button" button
    # Question 15
    And I click on the "duty or right" "Totara Assessment radiobutton"
    And I click on the "Totara Assessment Submit Button" button
    When I switch to window with index "0"
    And Browser performs "REFRESH" command
    Then I execute "Log In to Hub as Student" reusable step if "Already registered? Log in" "element is present"
    And I click on the "Mini Course for Volodymyr" "Build Empire Homepage My Learning Course" if "Take the test" "element is absent"
    And I click on the "SCORM Topic" "Build Empire Course Topic" if "Take the test" "element is absent"
    Then I should see the "Failed" message