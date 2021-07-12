@Mobile
Feature: The Hub - My Learning - Course Overview Page - Topics
  As a learner, at a glance, I'd like to be able to see all topics within my course,
  and my current progress on each topic,
  so that I can easily see where I am up to within a course and navigate to each topic

  @Samsung @iPhone @iPad #TC-724
  Scenario: The Hub Course Overview Page - Topics_Mobile
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "autoselinarichard2247@guerrillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I wait for "10" seconds
    And I click on the "Hub VPE Mobile Hamburger Menu" button if "Hub VPE Mobile Hamburger Menu" "element is present"
    Then I click on the "Hub Mobile My Learning Link Hamburger Menu" element
    And I click on the "Hub Mobile My Learning Course Card" element
    And I validate text "BPP Admin" to be displayed for "Hub Course Page Course Tutor" element if "Hub Course Page Course Tutor" "element is present"
    And I validate text "BPP Admin" to be displayed for "Hub Course Page Course Tutor Mobile" element if "Hub Course Page Course Tutor Mobile" "element is present"
    And I validate text "Automation Test Course" to be displayed for "Hub Course Page Course Name" element
    And I validate text "CONTAINS=%" to be displayed for "Hub Course Page Progress Percentage" element
    And Сss "background-color" of "Build Empire Course SCORM Topic Status Section" should have value "rgba(250, 202, 143, 1)"
    And I validate text "CONTAINS=Failed" to be displayed for "Build Empire Course Topic Section Message" element
    And I validate text "CONTAINS=Overdue by" to be displayed for "Build Empire Course Topic Section Overdue Message" element
    And Сss "background-color" of "Build Empire Course Moodle Topic Status Section" should have value "rgba(170, 213, 171, 1)"
    And I click on the "September 29" "Build Empire Course Topic"
    And I should see the "Direct App Topic Read More" element
    Then I click on the "Direct App Topic Read More" option
    And I should see the "The END" "text contained in element"
