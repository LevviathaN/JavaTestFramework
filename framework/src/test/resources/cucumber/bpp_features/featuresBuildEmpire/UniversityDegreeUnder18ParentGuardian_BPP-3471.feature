@BuildEmpire @DirectApps @UniversityDegreeApprenticeships @Under18
Feature: As a student who, is under 18, I expect to provide more information about my Parent/Legal Guardian

  @ParentGuardian #TC-1734, TC-1757, TC-1759
  Scenario: As a student who, is under 18, I expect to provide more information about my Legal Guardian
    Given I register new "Standard" Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    And I wait for "2" seconds
    When I execute "Create University Degree Apprenticeships Application" reusable step
    And I execute "Complete University Degree Apprenticeships Application Chartered Manager Parent Guardian" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    #Pre approve
    And I execute "Pre Approve Apprenticeships Application As Admin" reusable step
    Then I validate text "CONTAINS=Pre approved" to be displayed for "Direct App Admin Status Changed for Apprenticeships" element
    And I validate text "EC_GUARDIAN_EMAIL" to be displayed for "Direct App Admin Parent Guardian Email" element
    And I validate text "+441234567890" to be displayed for "Direct App Admin Parent Guardian Phone" element
    And I execute "Attach Automation Line Manager Apprenticeships" reusable step replacing some steps
      | 4 | I fill the "Direct App Admin Attach Line Manger Text Field" field with "automationlinemanager9@harakirimail.com" |
      | 5 | I click on the "Automation9 Linemanager9 " "Build Empire line manager option"                                    |
    And I execute "Log Out from Hub Admin" reusable step
    Given I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And I set "automationlinemanager9@harakirimail.com" text to the "Email" "Build Empire text field"
    And I set "Line Manager009!" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button
    Given I click on the "Direct App My Approvals Tab" link by JS
    And I click on the "Direct App Line Manager Review Application" button
    And I click on the "Personal details" "Build Empire application section"
    Then I validate text "EC_GUARDIAN_EMAIL" to be displayed for "Direct App Line Manager Parent Guardian Email" element