@Reusable
Feature: Maildrop

  Scenario: Maildrop Mitigating Circustances Reject Validation
    Given I am on "https://maildrop.cc/" URL
    And I fill the "Maildrop Email Field" field with "[SUBSTRING(EC_AUTO_EMAIL,0,-12)]"
    And I wait for "10" seconds
    Then I click on the "Maildrop View Inbox Button" button
    And I wait for "50" seconds
    And I click on the "Reload" button
    And I wait for "40" seconds
    And I click on the "Reload" button
    And I wait for "10" seconds
    And I click on the "Your Mitigating Circumstances application outcome" element
    And I click on the "Show Raw Source" button
    And I wait for "2" seconds
    Then I validate text "CONTAINS=Your application has been rejected" to be displayed for "Maildrop Email Body" element

  Scenario: Maildrop Mitigating Circustances Status Validations
    Given I am on "https://maildrop.cc/" URL
    And I fill the "Maildrop Email Field" field with "[SUBSTRING(EC_AUTO_EMAIL,0,-12)]"
    And I wait for "10" seconds
    Then I click on the "Maildrop View Inbox Button" button
    And I wait for "50" seconds
    And I click on the "Reload" button
    And I wait for "40" seconds
    And I click on the "Reload" button
    And I wait for "10" seconds
    And I should see the "Your Mitigating Circumstances application outcome" "Maildrop Specific BPP Email"
    And I wait for "2" seconds
    And I should see the "Your Mitigating Circumstances has been submitted" "Maildrop Specific BPP Email"
    And I wait for "2" seconds
    And I should see the "Your Mitigating Circumstances are now being reviewed" "Maildrop Specific BPP Email"
    And I wait for "2" seconds
    And I should see the "Your Mitigating Circumstances application has been referred" "Maildrop Specific BPP Email"
    And I wait for "2" seconds
    And I should see the "Your Mitigating Circumstances is progressing" "Maildrop Specific BPP Email"
    And I wait for "2" seconds
    And I should see the "Mitigating Circumstances application has been accepted" "Maildrop Specific BPP Email"

  Scenario: Maildrop Reset Line Manager Password
    Given I am on "https://maildrop.cc/" URL
    And I fill the "Maildrop Email Field" field with "[SUBSTRING(EC_LINEMANAGER_EMAIL,0,-12)]"
    And I wait for "10" seconds
    Then I click on the "Maildrop View Inbox Button" button
    And I wait for "50" seconds
    And I click on the "Reload" button
    And I wait for "40" seconds
    And Browser performs "REFRESH" command
    And I wait for "60" seconds
    And I click on the "Reload" button
    And I wait for "10" seconds
    And I click on the "BPP <no-reply@staging.bppdigital.buildempire.co.uk>" element
    And I wait for "2" seconds
    Then I capture a part of "Maildrop Email Body Framed" element text by "https:\/\/bpp-stage.eu.auth0.com\/lo\/reset.+[aA-zZ0-9]\#" regex and save as "EC_RESET_PASSWORD" variable

  Scenario: Maildrop Validate Accepted Application Email
    Given I am on "https://maildrop.cc/" URL
    And I fill the "Maildrop Email Field" field with "[SUBSTRING(EC_AUTO_EMAIL,0,-12)]"
    And I wait for "10" seconds
    Then I click on the "Maildrop View Inbox Button" button
    And I wait for "50" seconds
    And I click on the "Reload" button
    And I wait for "40" seconds
    And I click on the "Reload" button
    And I wait for "10" seconds
    And I should see the "Your application has been approved" element