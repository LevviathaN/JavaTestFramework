@Mobile
Feature: The Hub - VPE to HUB back functionality
  As a user,
  when accessing the VPE in mobile
  I expect to be able to navigate back to the Hub

  @Positive @iPad @iPhone @Samsung #TC-4340
  Scenario: The Hub - VPE to HUB back functionality_Mobile
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 1 | I am on "https://totara-stage-bppdigital.bppuniversity.com/course/view.php?id=227" URL|
      | 2 | I set "vpecourse@guerillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    Then I should see the "This is a VPE course set on 21st of April for testing purposes" message
    And I click on the "Totara VPE Header Lion Logo Mobile" element
    And I execute "setTimeout(5000)" JS code
    Given I execute "Log In to Hub as Student VPE Mobile" reusable step if "Already registered? Log in" "element is present"
    Then I should see the "Welcome, VPE" message
    And I click on the "Hub VPE Mobile Hamburger Menu" button
    And I click on the "Direct App Mobile Logout" element
    And I execute "setTimeout(5000)" JS code
