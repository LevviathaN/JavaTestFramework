@Mobile
Feature: BPP University Hub Course Forum
  As a learner within the hub
  If there is a course specific forum
  I expect an easy way to navigate to this forum

  @Positive @Samsung #TC-722 TC-723
  #Not to run on IOS devices as Book Exam button is not clickable on Safari
  Scenario: Hub Course Forum_Mobile
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "autolawandasalazar5614@guerrillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I click on the "Hub VPE Mobile Hamburger Menu" button if "Hub VPE Mobile Hamburger Menu" "element is present"
    Then I click on the "Hub Mobile My Learning Link Hamburger Menu" element
    And I click on the "Hub Mobile My Learning Course Card" element
    And I wait for "2" seconds
    And I wait for "1" seconds
    And I hover over the "Hub Mobile Book Exam" button
    And I click on the "Hub Mobile Book Exam" button if "Hub Mobile Book Exam" "element is present"
    And I wait for "1" seconds
    And I switch to window with index "2"
    Then I wait for "2" seconds
    And I validate text "https://web-stage-bppdigital.bppuniversity.com" to be displayed for "CHECK_URL" element
    And I wait for "3" seconds
    And I switch to window with index "1"
    #Navigate to Course Forum
    And I should scroll to the "bottom" of the page
    When I click on the "Totara Course Select Forum Mobile" button if "Totara Course Select Forum Mobile" "element is present"
    When I click on the "Totara Course Select Forum link" button if "Totara Course Select Forum link" "element is present"
    And I click on the "Totara Course Forum option" link by JS
    And I wait for "3" seconds
    And I switch to window with index "2"
    Then I validate text "Automation Forum" to be displayed for "Totara Forum Header name" element
    Then I validate text "Are we happy with the Hub?" to be displayed for "Totara First Forum Question item" element
