@BuildEmpire @DigitalSite
Feature: Invitation to register token registration type
  
  @Positive @RegistrationInvitation #TC-7156
  Scenario: Invitation to Register Token Registration Type
    Given I execute "Log In to Hub as Admin" reusable step
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/registration_types/72" URL
    When I click on the "BPP Digital Invite Button" button
    And I set "[EMAIL-YOPMAIL]" text to the "email" "element by type"
    Then I click on the "submit" "element by type"
    Then I should see the "Invitation was successfully sent." "BPP Digital Admin Alert Message"
    Given I am on "https://yopmail.com/" URL
    And I wait for "2" seconds
    Then I click on the "Continue with Recommended Cookies" "button"
    And I set "EC_EMAIL" text to the "login" "element by name"
    Then I press "MD_COMMON_KEYBOARD_ENTER" for "login" "element by name"
    And I validate text "CONTAINS=This is an invitation to register for your account with BPP as part of your application process." to be displayed for "Yopmail Letter" element
    And I validate text "CONTAINS=Please follow this link" to be displayed for "Yopmail Letter" element