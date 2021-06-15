@BuildEmpire @DirectApps @UniversityDegreeApprenticeships
Feature: BPP University Degree Line Manager Pop up confirmation for application without completed actions

  @Positive @Popup #TC-1574
  Scenario: BPP University Degree Line Manager Pop up confirmation for application without completed actions
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "AutoAhmadBarrett4462@harakirimail.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    Then I remember "AutoAtkinson" text as "EC_AUTO_LASTNAME" variable
    And I wait for "5" seconds
    And I click on the "Direct App My Applications Left Menu Link" link by JS
    When I execute "Create University Degree Apprenticeships Application" reusable step replacing some steps
      | 1 | I click on the "Direct App Start New Application Button" button |
    And I execute "Complete University Degree Apprenticeships Application With Existing Student" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Pre Approve Apprenticeships Application As Admin" reusable step replacing some steps
      | 4 | I fill the "Direct App Admin Filter By User" field with "AutoAhmadBarrett4462@harakirimail.com" |
    And I execute "Attach Automation Line Manager Apprenticeships" reusable step replacing some steps
      |4|I fill the "Direct App Admin Attach Line Manger Text Field" field with "automationLinemanager8@harakirimail.com"|
      |5|I click on the "Automation8 Linemanager8" "Build Empire line manager option"|
    And I execute "Log Out from Hub Admin" reusable step
    And I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And I set "automationLinemanager8@harakirimail.com" text to the "Email" "Build Empire text field"
    And I set "Line Manager008!" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button
    Given I click on the "Direct App My Approvals Tab" link by JS
    And I click on the "Direct App Line Manager Review Application" button
    And I click on the "Line Manager Review" "Build Empire application section"
    Then I fill the "Direct App Details Text Area  Line Manager" field with "Automation"
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Agree To Support Amount" element
    And I click on the "Direct App Line Manager New Role" button
    Then I click on the "I confirm that my organisation employs fewer than 50 people" "Build Empire checkbox"
    Then I click on the "I confirm that I understand it is my requirement to reserve" "Build Empire checkbox"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I wait for "1" seconds
    And Browser performs "Refresh" command
    And I wait for "3" seconds
    And I click on the "Direct App My Approvals Tab" link by JS
    And I wait for "3" seconds
    Then I validate text "Are you sure you want to exit without 'signing/uploading' the application documents?" to be displayed for "Direct Apps Incomplete Actions Pop up message" element
    Then I should see the "Exit Application" "BPP Digital Search Label Button"
    Then I should see the "Continue to Application Documents" "BPP Digital Search Label Button"
    And I click on the "Exit Application" "BPP Digital Search Label Button"
    And I should see the "Application Review" element
    And I wait for "2" seconds
    When I click on the "Direct App My Approvals Tab" link by JS
    And I click on the "Direct App Line Manager Review Application" button
    And I click on the "Direct App My Approvals Tab" link by JS
    And I click on the "Continue to Application Documents" "BPP Digital Search Label Button"
    And I should see the "Application documents" element
    And I wait for "2" seconds
    #Part with uploaded documents
    Then I upload "application_pack_document.pdf" file to "Direct App Apprenticeships Upload Documents" element
    Then I upload "application_pack_document.pdf" file to "Direct App Upload Job Role Documents" element
    And I wait for "2" seconds
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I wait for "3" seconds
    And I click on the "Direct App My Approvals Tab" link by JS
    Then I validate text "Are you sure you want to exit without 'approving/not approving' this application?" to be displayed for "Direct Apps Incomplete Actions Pop up message" element
    Then I should see the "Exit Application" "BPP Digital Search Label Button"
    Then I should see the "Continue" "BPP Digital Search Label Button"
    And I click on the "Exit Application" "BPP Digital Search Label Button"
    And I should see the "Application Review" element
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Review Application" button
    When I click on the "Direct App My Approvals Tab" link by JS
    And I click on the "Continue" "BPP Digital Search Label Button"
    And I should see the "Submit Approval" element