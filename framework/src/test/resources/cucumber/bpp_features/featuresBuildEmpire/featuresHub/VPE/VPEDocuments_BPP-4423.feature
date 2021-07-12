@BuildEmpire @Hub @VPE
Feature: The Hub - Law School - Documents (Files/Labels activity type)
  Webpages within a Topic should appear as clickable webpages within Topic within VPE

  @Positive @Documents #TC-2449
  Scenario: The Hub - Law School - Documents
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "vpecourse@guerillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I wait for "1" seconds
    And I should see the "VPE Course Automation" "Build Empire My Learning Right Block Course name"
    Then I click on the "VPE Course Automation" "Build Empire My Learning Right Block Course name"
    And I switch to window with index "2"
    And I click on the "Hub VPE Documents Header" element
    And I validate text "TEST LABEL'S 1.*" to be displayed for "Hub VPE Documents Folder Name" element
    And I click on the "Hub VPE Documents Folder Name" element
    Then I should see the "Hub VPE Documents Folder" element
    Then I should see the "File 1" "text contained in A element"
    Then I should see the "File Two With Long Naaaaaame" "text contained in A element"
    And I click on the "File Two With Long Naaaaaame" "text contained in A element"
    And I click on the "File 1" "text contained in A element"
