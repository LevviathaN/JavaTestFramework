@BuildEmpire @DirectApps @ChannelIslands
Feature: Reject Channel Islands Application

  @Negative @RejectChannelIslands #TC-1270
  Scenario: Reject Channel Islands Application as Training Manager
    Given I register new "Channel" Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    And I wait for "2" seconds
    When I execute "Create Channel Islands Mk2 Application" reusable step
    And I execute "Complete Channel Islands Mk2 Application" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    Given I am on "https://www.guerrillamail.com/" URL
    And I wait for "2" seconds
    And I select "guerrillamail.com" from "Guerilla Mail Select Domain" element
    Then I click on the "Guerilla Edit" button
    And I fill the "Guerilla Email Input" field with "EC_LINEMANAGER_EMAIL"
    Then I click on the "Guerilla Email Set" button
    And I wait for "10" seconds
    And Browser performs "Refresh" command
    And I wait for "2" seconds
    Then I click on the "Guerilla BPP Email" element
    Then I capture a part of "Guerilla New Line Manager Email" element text by "https:\/\/bpp-stage.eu.auth0.com\/lo\/reset.+[aA-zZ0-9]\#" regex and save as "EC_RESET_PASSWORD" variable
    And I validate text "CONTAINS=We have received a booking from an employee at your organisation, who has named you as their training manager." to be displayed for "Guerilla New Line Manager Email" element
    Then I execute "Reset Line Manager Password" reusable step
    Given I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And I set "EC_LINEMANAGER_EMAIL" text to the "Email" "Build Empire text field"
    And I set "Welcome2@#!Welc" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button
    And I should see the "Direct App My Approvals Tab" element
    Then I execute "Reject Channel Isalnds Application as Training Manager" reusable step
    And I click on the "Direct App Channel Islands Training Manager OK" button
    And I wait for "5" seconds
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Harakirimail Verify Email for Channel Islands" reusable step replacing some steps
    |8|I validate text "CONTAINS=Thank you very much for submitting a booking form for approval." to be displayed for "Harakirimail Validate Letter Body" element|
    |9|I validate text "CONTAINS=has not been accepted by your training manager." to be displayed for "Harakirimail Validate Letter Body" element|