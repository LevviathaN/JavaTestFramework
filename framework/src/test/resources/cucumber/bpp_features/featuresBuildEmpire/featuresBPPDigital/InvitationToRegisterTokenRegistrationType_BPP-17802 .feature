@BuildEmpire @DigitalSite
Feature: Invitation to register token registration type
  
  @Positive @RegistrationInvitation #TC-7156
  Scenario: Invitation to Register Token Registration Type
    Given I execute "Log In to Hub as Admin" reusable step
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/registration_types/72" URL
    When I click on the "BPP Digital Invite Button" button
    And I set "[EMAIL-HARAKIRI]" text to the "email" "element by type"
    Then I click on the "submit" "element by type"
    Then I should see the "Invitation was successfully sent." "BPP Digital Admin Alert Message"
    And I wait for "2" seconds
    Given I am on "https://harakirimail.com/" URL
    And I fill the "Harakirimail Inbox Name" field with "EC_EMAIL"
    Then I click on the "Harakirimail Get Inbox" button
    Then I click on the "Harakirimail First Email" element by JS
    And Browser performs "REFRESH" command
    Then I click on the "Harakirimail First Email" element if "Harakirimail First Email" "element is present"
    And I validate text "CONTAINS=This is an invitation to register for your account with BPP as part of your application process." to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=Please follow this link" to be displayed for "Harakirimail Validate Letter Body" element
