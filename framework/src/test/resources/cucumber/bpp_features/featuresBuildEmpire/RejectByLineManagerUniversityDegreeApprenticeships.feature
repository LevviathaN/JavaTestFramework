@BuildEmpire @DirectApps @UniversityDegreeApprenticeships @Smoke
Feature: University Degree Apprenticeships

  @Negative @P1 @RejectByLineManager
  Scenario: Reject University Degree Apprenticeships Application By Line Manager
    Given I register new "Standard" Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    And I wait for "2" seconds
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
    And I execute "Line Manager Review And Reject University Degree Apprenticeships Scotland" reusable step replacing some steps
    |17| I switch to window with index "1"|
    And I execute "Log Out from Hub Student" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    And I click on the "Direct App My Applications Left Menu Link" link by JS
    Then I validate text "" to be displayed for "Direct App Validate As Student Application Accepted" element
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Application Rejected by Line Manager Validation" reusable step