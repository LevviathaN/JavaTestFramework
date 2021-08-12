@BuildEmpire @Hub @ScormAssesment
Feature: SCORM Asessment Not Submit
  As a user, if I start but do not submit a scorm attempt,
  I do not expect this to be recorded as an attempt in my 'assessment block' as these attempts are not relevant

  @Negative #TC-1829
  Scenario: Scorm Assessment Start But Not Submit
    Given I register new Hub account using API
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
    And Browser deletes cookies
    And I execute "Log In to Hub as Student" reusable step
    And I click on the "Mini Course for Volodymyr" "Build Empire Homepage My Learning Course"
    And I click on the "SCORM Topic" "Build Empire Course Topic"
    And I validate text "CONTAINS=You haven't attempted this assessment yet" to be displayed for "Direct App Topic Assessment Status Results" element
    And I click on the "Hub Submit Button For Activity" button
    And I wait for "3" seconds
    Then I execute "window.stop()" JS code
    Then I switch to window with index "2"
    # Question 1
    When I click on the "Totara Assessment Next Button" button
    And I select "Yes" from "IAASB" "Totara Assessment select"
    And I select "Yes" from "the FRC" "Totara Assessment select"
    And I select "No" from "IFRSs" "Totara Assessment select"
    And I select "No" from "companies" "Totara Assessment select"
    Then I click on the "Totara Assessment Next Button" button
    When I switch to window with index "1"
    Then I click on the "Mini Course for Volodymyr" "Build Empire Breadcrumb Tab"
    And I click on the "SCORM Topic" "Build Empire Course Topic"
    And I wait for "1" seconds
    And I validate text "CONTAINS=You haven't attempted this assessment yet" to be displayed for "Direct App Topic Assessment Status Results" element
