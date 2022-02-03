@BuildEmpire @DirectApps @ProfessionalApprenticeships
Feature: Professional Apprenticeship Applications

  @Positive @P1 @FullApplicationIncomplete
  Scenario: Create Professional Apprenticeship Applications Full Application Incomplete
    Given I register new "Standard" Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    When I execute "Create Professional Apprenticeships Application UAT Accounting Option Two" reusable step
    Given I execute "Complete Professional Apprenticeships UAT Accounting Assistant" reusable step replacing some steps
    |90|I set "automationLinemanager8@harakirimail.com" text to the "Manager Email" "Build Empire employment element"|
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
    Then I execute "Line Manager Review Apprenticeships" reusable step
    And I execute "Log Out from Hub Student" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    And I execute "Complete Professional Apprenticeships Application After Review" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Given I click on the "Direct App Admin Apprenticeships Tab" link by JS
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I click on the "Begin full application review" "Build Empire application section"
    And I select "Full Application Incomplete - Line Manager" from "Direct App Admin New Status Dropdown" element
    And I fill the "Direct App Admin Reason" field with "Reason Incomplete"
    Then I click on the "Submit" "button"
    Then I validate text "Full application incomplete line manager" to be displayed for "Direct App Admin Status Changed for Apprenticeships" element
    Given I am on "https://harakirimail.com/" URL
    And I fill the "Harakirimail Inbox Name" field with "automationLinemanager8@harakirimail.com"
    Then I click on the "Harakirimail Get Inbox" button
    Then I click on the "Harakirimail First Email" element by JS
    And Browser performs "REFRESH" command
    Then I click on the "Harakirimail First Email" element if "Harakirimail First Email" "element is present"
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Information needed to complete your " "Harakirimail BPP Specific Email First"
    And I validate text "CONTAINS=Unfortunately, their application is incomplete and requires action from yourself." to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=If you have any queries, please contact our Onboarding Team at apprenticeshiponboarding@bpp.com or by calling 0161 244 6440" to be displayed for "Harakirimail Validate Letter Body" element