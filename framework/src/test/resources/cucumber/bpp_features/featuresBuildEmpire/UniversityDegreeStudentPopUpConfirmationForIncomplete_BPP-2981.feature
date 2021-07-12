@BuildEmpire @DirectApps @UniversityDegreeApprenticeships
Feature: University Degree Apprenticeships

  @PopUpStudent @Popup @Positive #TC-1572
  Scenario: As a student, I expect to be told if I try to navigate out of an application without completing my actions
    Given I execute "Register New Student Account" reusable step
    Then I execute "Harakirimail Verify Email" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    When I execute "Create University Degree Apprenticeships Application" reusable step
    And I execute "Complete University Degree Apprenticeships Application Chartered Manager" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Pre Approve Apprenticeships Application As Admin" reusable step
    And I execute "Attach Automation Line Manager Apprenticeships" reusable step replacing some steps
      | 4 | I fill the "Direct App Admin Attach Line Manger Text Field" field with "automationLinemanager8@harakirimail.com" |
      | 5 | I click on the "Automation8 Linemanager8" "Build Empire line manager option"                                     |
    And I execute "Log Out from Hub Admin" reusable step
    Given I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And I set "automationLinemanager8@harakirimail.com" text to the "Email" "Build Empire text field"
    And I set "Line Manager008!" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button
    Then I execute "Line Manager Review University Degree Apprenticeships Scotland" reusable step
    And I execute "Log Out from Hub Student" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    And I execute "Complete Professional Apprenticeships Application After Review" reusable step
    And I wait for "2" seconds
    Given I click on the "Direct App My Applications Left Menu Link" button
    Then I validate text "CONTAINS=Are you sure you want to exit without submitting your application?" to be displayed for "Direct App PopUp Header For Incomplete Documents" element
    Then I validate text "Exit Application" to be displayed for "Direct App PopUp Exit Button Presence For Incomplete Documents" element
    Then I validate text "Continue" to be displayed for "Direct App PopUp Continue Button For Incomplete Documents" element
    Given I click on the "Direct App PopUp Continue Button For Incomplete Documents" button by JS
    Given I click on the "Direct App My Applications Left Menu Link" button
    Then I click on the "Direct App PopUp Exit Button Presence For Incomplete Documents" element
