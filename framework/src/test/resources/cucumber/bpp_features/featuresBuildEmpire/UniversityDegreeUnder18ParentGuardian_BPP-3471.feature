@BuildEmpire @DirectApps @UniversityDegreeApprenticeships @Under18
Feature: As a student who, is under 18, I expect to provide more information about my Parent/Legal Guardian

  @ParentGuardian #TC-1734, TC-1757, TC-1759
  Scenario: As a student who, is under 18, I expect to provide more information about my Legal Guardian
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "AutoLemuelCampbell3567@harakirimail.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    Then I remember "AutoDiaz" text as "EC_AUTO_LASTNAME" variable
    And I click on the "Direct App My Applications Left Menu Link" link by JS
    And I wait for "3" seconds
    When I execute "Create University Degree Apprenticeships Application" reusable step replacing some steps
      | 1 | I click on the "Direct App Start New Application Button" button |
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Are you aged over 15" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you have a husband, wife, civil partner and child of any of the above?" "Build Empire bespoke Scotland eligibility"
    And I click on the "Direct App Right To Work in England?" element
    And I click on the "Direct App Do You Spend 50 Percent" element
    And I click on the "Direct App Bespoke Enrolled On Another Apprenticeship No" element
    And I click on the "Direct App Are You In Employment" element
    And I click on the "Direct App Are You Working At Least 16 Hours" element
    And I click on the "Are you applying for a programme" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you confirm that your job is a new job role relevant to the career development" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you confirm that you have discussed" "Build Empire bespoke Scotland eligibility"
    And I wait for "1" seconds
    And I click on the "Direct App Next" button
    #Parent/Legal Guardian Information
    And I validate text "CONTAINS=If you are under 18 years of age at the point you are accepted" to be displayed for "Direct App If You Are Under 18 Note" element
    And I set "Autotest" text to the "Name of Parent/Legal" "Build Empire text field by title"
    Then I remember "email11@mail.com" text as "EC_GUARDIAN_EMAIL" variable
    And I set "EC_GUARDIAN_EMAIL" text to the "Email Address of Parent/Legal" "Build Empire text field by title"
    And I set "1234567890" text to the "Phone Number of Parent/Legal" "Build Empire text field by title"
    And I set "JustTest" text to the "What is your relationship with this person?" "Build Empire text field by title"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Additional Info Aged 19" element
    And I click on the "employment status?:" "Build Empire nationality dropdown"
    And I click on the "I have work experience in this sector of up to 2 years" "Build Empire nationality option"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "1" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Do you have any criminal" "Build Empire radiobutton no"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Privacy Notice By Email" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save And Return" button
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    #Pre approve
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Given I click on the "Direct App Admin Apprenticeships Tab" link by JS
    And I fill the "Direct App Admin Filter By User" field with "AutoLemuelCampbell3567@harakirimail.com"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I click on the "Begin review" "Build Empire admin applications tab"
    Then I click on the "Direct App Admin Submit Apprenticeships" button
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