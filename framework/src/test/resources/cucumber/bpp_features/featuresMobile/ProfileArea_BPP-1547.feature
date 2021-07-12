@Mobile
Feature: BPP University Hub Profile Area
  As a user
  I expect to see an updated link to access my profile

  @Positive @iPad @iPhone @Samsung #TC-1170
  Scenario: Hub Profile Area_Mobile
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "vpecourse@guerillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I wait for "10" seconds
    #Profile Area validation
    And I click on the "Hub VPE Mobile Hamburger Menu" button if "Hub VPE Mobile Hamburger Menu" "element is present"
    And I should see the "Hub VPE Mobile User Avatar Icon" element
    Then Attribute "style" of "Hub VPE Mobile User Avatar Icon" should have value "CONTAINS=/assets/icons/avatar-icon.svg"
    And I click on the "Hub Mobile Account Link Hamburger Menu" element
    And I wait for "2" seconds
    Then I should see the "Hub Mobile Account Email" element