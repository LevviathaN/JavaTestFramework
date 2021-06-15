@BuildEmpire @Hub @KeyActivities @Smoke
Feature: As an admin, setting up a course in Totara, I expect to see new controls associated with each topic
  that allows me to set the 'Key Activities' for each Topic

  @AddActivities #TC-2633 TC-2634 TC-2635 TC-2713
  Scenario: Add and validate Key Activities for Topic
    And I execute "Login as Admin Totara" reusable step
    Then I click on the "Totara Automation Course" button by JS
    And I click on the "Totara Key Activities Administration Link" link by JS
    And I click on the "Topic to test adding activities" link by JS
    Then I click on the "Totara Add Activity Top Key" button by JS
    Then I wait for "2" seconds
    And I select "KW_AUTO_SELECT" from "Totara Activities Dropdown" element
    Then I execute "window.stop()" JS code
    And I fill the "Totara Main Box Text Field" field with "MainTopAutomation"
    And I fill the "Totara Submit Button Text Field" field with "SubmitTopAutomation"
    Then I click on the "Totara Save" button by JS
    And I click on the "Totara Continue" button by JS
    And I click on the "Topic to test adding activities" link by JS
    Then I click on the "Totara Add Activity Bottom Key" button by JS
    Then I execute "window.stop()" JS code
    #And I select "[url] Testing Activities" from "Totara Activities Dropdown" element
    And I fill the "Totara Main Box Text Field" field with "MainBottomAutomation"
    And I fill the "Totara Submit Button Text Field" field with "SubmitBottomAutomation"
    Then I click on the "Totara Save" button by JS
    And I click on the "Totara Continue" button by JS
    And I click on the "Topic to test adding activities" link by JS
    And I validate text "Testing Activities" to be displayed for "Totara Top Key Activity Name" element
    And I validate text "Testing Activities" to be displayed for "Totara Bottom Key Activity Name" element
    And I execute "Logout as Admin Totara" reusable step
    And I wait for "2" seconds
    And Browser deletes cookies
    Then I execute "Log In to Hub as Student" reusable step replacing some steps
      |2|I set "automationregression@yopmail.com" text to the "Email" "Build Empire text field"|
      |3|I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"|
    And I wait for "2" seconds
    And I click on the "Direct App My Learning Left Menu Link" link by JS
    And I wait for "3" seconds
    And I click on the "Direct App My Learning Automation Course Name" element
    Then I should scroll to the "bottom" of the page
    Then I hover over the "Direct App Topic Key Activities" element
    And I click on the "Direct App Topic Key Activities" element
    And I wait for "3" seconds
    Then I validate text "Topic to test adding activities" to be displayed for "Direct App Topic Name" element
    Then I validate text "CONTAINS=This topic is used to test Key Activities" to be displayed for "Direct App Topic Description" element
    And I should see the "Direct App Topic Read More" button
    Then I click on the "Direct App Topic Read More" button by JS
    Then I validate text "MainTopAutomation" to be displayed for "Direct App Top Key Activity Body" element
    Then I validate text "SubmitTopAutomation" to be displayed for "Direct App Top Key Activity Submit Button" element
    Then I validate text "MainBottomAutomation" to be displayed for "Direct App App Bottom Key Activity Body" element
    Then I validate text "SubmitBottomAutomation" to be displayed for "Direct App Bottom Key Activity Submit Button" element
    And I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    Then I click on the "Totara Automation Course" button by JS
    And I click on the "Totara Key Activities Administration Link" link by JS
    And I click on the "Topic to test adding activities" link by JS
    Then I click on the "Totara Top Key Activity Remove" button by JS
    And I click on the "Totara Continue" button by JS
    #Then I click on the "Totara Bottom Key Activity Remove" button by JS
    #And I click on the "Totara Continue" button by JS
    And I execute "Logout as Admin Totara" reusable step