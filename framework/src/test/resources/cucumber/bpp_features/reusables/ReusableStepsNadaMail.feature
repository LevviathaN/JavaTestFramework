@Reusable
Feature: Nada

  Scenario: Nada Mitigating Circustances Reject Validation
    Given I am on "https://getnada.com/" URL
    And I wait for "1" seconds
    And I click on the "Nada Add Inbox" button by JS
    And I wait for "5" seconds
    And I fill the "Nada User Name Field" field with "[SUBSTRING(EC_AUTO_EMAIL,0,-12)]"
    Then I select "@getnada.com" from "Nada Domain Select" element
    And I wait for "10" seconds
    And I click on the "Add now!" "exact element"
    And I wait for "2" seconds
    And I click on the "Your Mitigating Circumstances applic ..." element by JS
    And I validate text "CONTAINS=Your application has been rejected" to be displayed for "Nada Email Body" element

  Scenario: Nada Mitigating Circustances Incomplete Validation
    Given I am on "https://getnada.com/" URL
    And I wait for "1" seconds
    And I click on the "Nada Add Inbox" button by JS
    And I wait for "5" seconds
    And I fill the "Nada User Name Field" field with "[SUBSTRING(EC_AUTO_EMAIL,0,-12)]"
    Then I select "@getnada.com" from "Nada Domain Select" element
    And I wait for "10" seconds
    And I click on the "Add now!" "exact element"
    And I wait for "2" seconds
    And I click on the "Information needed to" "text contained in element" by JS
    And I validate text "CONTAINS=Unfortunately your application for UAT" to be displayed for "Nada Email Body" element

  Scenario: Nada Mitigating Circustances Status Validations
    Given I am on "https://getnada.com/" URL
    And I wait for "1" seconds
    And I click on the "Nada Add Inbox" button by JS
    And I wait for "5" seconds
    And I fill the "Nada User Name Field" field with "[SUBSTRING(EC_AUTO_EMAIL,0,-12)]"
    Then I select "@getnada.com" from "Nada Domain Select" element
    And I wait for "10" seconds
    And I click on the "Add now!" "exact element"
    And I wait for "2" seconds
    And I should see the "Your Mitigating Circumstances applic ..." element
    And I wait for "2" seconds
    And I should see the "Your Mitigating Circumstances has be ..." element
    And I wait for "2" seconds
    And I should see the "Your Mitigating Circumstances are no ..." element
    And I wait for "2" seconds
    And I should see the "Your Mitigating Circumstances applic ..." element
    And I wait for "2" seconds
    And I should see the "Your Mitigating Circumstances is pro ..." element
    And I wait for "2" seconds

  Scenario: Nada Reset Line Manager Password
    Given I am on "https://getnada.com/" URL
    And I wait for "5" seconds
    And I click on the "Nada Add Inbox" button by JS
    And I wait for "5" seconds
    And I fill the "Nada User Name Field" field with "[SUBSTRING(EC_LINEMANAGER_EMAIL,0,-12)]"
    Then I select "@getnada.com" from "Nada Domain Select" element
    And I wait for "10" seconds
    And I click on the "Add now!" "exact element"
    And I wait for "2" seconds
    Then I click on the "Nada BPP Email" element by JS
    Then I capture a part of "Nada Email Body" element text by "https:\/\/bpp-stage.eu.auth0.com\/lo\/reset.+[aA-zZ0-9]\#" regex and save as "EC_RESET_PASSWORD" variable

  Scenario: Nada Validate Accepted Application Email
    Given I am on "https://getnada.com/" URL
    And I wait for "1" seconds
    And I click on the "Nada Add Inbox" button by JS
    And I wait for "5" seconds
    And I fill the "Nada User Name Field" field with "[SUBSTRING(EC_AUTO_EMAIL,0,-12)]"
    Then I select "@getnada.com" from "Nada Domain Select" element
    And I wait for "10" seconds
    And I click on the "Add now!" "exact element"
    And I wait for "2" seconds
    And I should see the "Your application has been appr" "text contained in element"

  Scenario: Nada Student Email Verification
    Given I am on "https://getnada.com/" URL
    And I wait for "1" seconds
    And I click on the "Nada Add Inbox" button by JS
    And I wait for "5" seconds
    And I fill the "Nada User Name Field" field with "[SUBSTRING(EC_AUTO_EMAIL,0,-12)]"
    Then I select "@getnada.com" from "Nada Domain Select" element
    And I wait for "7" seconds
    And I click on the "Add now!" "exact element"
    And I wait for "2" seconds
    Then I click on the "Please verify your email" "message" by JS
    And I wait for "1" seconds
    Then I click on the "Nada Verify Email" button
    And I switch to window with index "2"
    And I wait for "2" seconds
    And I should see the "Email address verified! Please log in." "message"