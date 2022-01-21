@BuildEmpire @DirectApps @UniversityDegreeApprenticeships @Under18
Feature: As a student who, is under 18, I expect to provide more information about my Parent/Legal Guardian

  @ParentGuardian #TC-1734, TC-1757, TC-1759
  Scenario: As a student who, is under 18, I expect to provide more information about my Legal Guardian
    Given I register new "Standard" Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    And I wait for "2" seconds
    When I execute "Create Professional Apprenticeships Application UAT Accounting Option Two" reusable step
    And I execute "Complete Professional Apprenticeships UAT Accounting Assistant Parent Guardian" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Pre Approve Apprenticeships Application As Admin" reusable step
    And I validate text "EC_GUARDIAN_EMAIL" to be displayed for "Direct App Admin Parent Guardian Email" element
    And I validate text "+441234567890" to be displayed for "Direct App Admin Parent Guardian Phone" element
    Then I click on the "Confirm eligibility" "Build Empire admin applications tab"
    Then I validate text "Eligibility confirmed" to be displayed for "Direct App Admin Status Changed for Apprenticeships" element
    And I execute "Log Out from Hub Admin" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    And I execute "Complete Professional Apprenticeships Application After Review" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Accept Application As Admin" reusable step
    Given I am on "https://yopmail.com/" URL
    And I wait for "2" seconds
    Then I click on the "Continue with Recommended Cookies" "button"
    And I set "EC_GUARDIAN_EMAIL" text to the "login" "element by name"
    Then I press "MD_COMMON_KEYBOARD_ENTER" for "login" "element by name"
    And I validate text "CONTAINS=has identified you as their parent/guardian during their application to study an apprenticeship with BPP. We are pleased to confirm that they have been successful in their application and have now secured a place on the apprenticeship programme." to be displayed for "Yopmail Letter" element