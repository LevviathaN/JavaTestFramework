@BuildEmpire @DirectApps @ProfessionalApprenticeships
Feature: Professional Apprenticeships

  @Positive @Smoke @AddExistingLineManagerToExistingStudent
  Scenario: Create Professional Apprenticeships Add Existing Line Manager To Existing Student
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "autoquentinwinfred5424@harakirimail.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    Then I remember "AutoGuthrie" text as "EC_AUTO_LASTNAME" variable
    Then I wait for "5" seconds
    And I click on the "Direct App My Applications Left Menu Link" link by JS
    When I execute "Create University Degree Apprenticeships Application" reusable step replacing some steps
      | 1 | I click on the "Direct App Start New Application Button" button |
    And I execute "Complete University Degree Apprenticeships Application With Existing Student" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Pre Approve Apprenticeships Application As Admin" reusable step replacing some steps
      | 4 | I fill the "Direct App Admin Filter By User" field with "autoquentinwinfred5424@harakirimail.com" |
    And I execute "Attach Automation Line Manager Apprenticeships" reusable step replacing some steps
      | 4 | I fill the "Direct App Admin Attach Line Manger Text Field" field with "automationLinemanager7@harakirimail.com" |
      | 5 | I click on the "Automation7 Linemanager7" "Build Empire line manager option"                                     |
    And I execute "Log Out from Hub Admin" reusable step
    Given I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And I set "automationLinemanager7@harakirimail.com" text to the "Email" "Build Empire text field"
    And I set "Line Manager007!" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button
    Then I execute "Line Manager Review University Degree Apprenticeships Scotland" reusable step replacing some steps
      | 17 | I switch to window with index "0" |
    And I execute "Log Out from Hub Student" reusable step
    Then I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "autoquentinwinfred5424@harakirimail.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    And I execute "Complete Professional Apprenticeships Application After Review" reusable step replacing some steps
      | 6 | I switch to window with index "0" |
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Accept Application As Admin" reusable step replacing some steps
      | 4 | I fill the "Direct App Admin Filter By User" field with "autoquentinwinfred5424@harakirimail.com" |
    And I execute "Log Out from Hub Admin" reusable step
    And I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "autoquentinwinfred5424@harakirimail.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    And I execute "Validate Successful Application As Student" reusable step
    And I execute "Log Out from Hub Student" reusable step