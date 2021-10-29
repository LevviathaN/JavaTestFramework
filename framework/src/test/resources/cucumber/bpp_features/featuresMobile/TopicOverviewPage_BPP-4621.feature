@Mobile @TopicOverview
Feature: Topic Overview Page
  The completion status key is below the Learning Material heading
  Labels, sub labels and learning activities appear across only one column
  As a Hub user, viewing the Topic Overview page, expect to see a new "completion status" indicator on labels that are not indented,
  that indicates how many sub-labels / unindented activities under this label have been completed

  @Positive @iPad @iPhone @Samsung #TC-2232
  Scenario: Topic Overview Page_Mobile
    Given I execute "Log In to Hub as Student VPE Mobile" reusable step replacing some steps
      | 2 | I set "automaureenmerritt7112@guerrillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"                      |
    And I wait for "10" seconds
    And I click on the "Hub VPE Mobile Hamburger Menu" button if "Hub VPE Mobile Hamburger Menu" "element is present"
    Then I click on the "Hub Mobile My Learning Link Hamburger Menu" element
    And I click on the "Hub Mobile My Learning Course Card" element
    And I wait for "2" seconds
    And I click on the "Direct App Scorm Topic" element
    And I wait for "2" seconds
    And I validate text "CONTAINS=You haven't attempted this assessment yet" to be displayed for "Direct App Topic Assessment Status Results" element
    And I should see the "Direct App Topic Learning Material Legend One" element
    And I validate text "CONTAINS=You can mark these as complete" to be displayed for "Direct App Topic Learning Material Legend One" element
    And I should see the "Direct App Topic Learning Material Legend Two" element
    And I validate text "CONTAINS=Require an action to complete" to be displayed for "Direct App Topic Learning Material Legend Two" element
    And I should see the "Direct App Topic Learning Material Subtopic One" element