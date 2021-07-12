@Mobile
Feature: The Hub - Law School - Documents (Files/Labels activity type)
  Webpages within a Topic should appear as clickable webpages within Topic within VPE

  @Positive @iPad @iPhone @Samsung #TC-2451, TC-2452
  Scenario: The Hub - Law School - Documents_Mobile
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "vpecourse@guerillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I wait for "10" seconds
    And I am on "https://totara-stage-bppdigital.bppuniversity.com/course/view.php?id=227" URL
    And I click on the "Hub VPE Documents Header" element if "Hub VPE Documents Header" "element is present"
    And I click on the "Hub VPE Course Mobile Hamburger Menu" button if "Hub VPE Course Mobile Hamburger Menu" "element is present"
    And I click on the "Hub VPE Mobile Documents Header" button if "Hub VPE Mobile Documents Header" "element is present"
    And I validate text "TEST LABEL'S 1.*" to be displayed for "Hub VPE Documents Folder Name" element
    And I click on the "Hub VPE Documents Folder Name" element
    Then I should see the "Hub VPE Documents Folder" element
    Then I should see the "File 1" "text contained in A element"
    Then I should see the "File Two With Long Naaaaaame" "text contained in A element"
    And I click on the "File Two With Long Naaaaaame" "text contained in A element"
    And I click on the "File 1" "text contained in A element"