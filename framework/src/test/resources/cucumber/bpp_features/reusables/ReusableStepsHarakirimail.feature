@Reusable
Feature: Harakirimail, Guerrillamail

  Scenario: Guerrillamail Mitigating Circustances Reject Validation
    Given I am on "https://www.guerrillamail.com/" URL
    Then I click on the "Guerilla Edit" button
    And I fill the "Guerilla Email Input" field with "EC_AUTO_EMAIL"
    Then I click on the "Guerilla Email Set" button
    And I wait for "10" seconds
    Given I am on "https://www.guerrillamail.com/" URL
    Then I click on the "Guerilla Edit" button
    And I fill the "Guerilla Email Input" field with "EC_AUTO_EMAIL"
    Then I click on the "Guerilla Email Set" button
    Then I click on the "Guerilla Your MC Outcome" link
    And I validate text "CONTAINS=Your Mitigating Circumstances application outcome" to be displayed for "Guerilla Email Header" element
    And I validate text "CONTAINS=Your application has been rejected" to be displayed for "Guerilla Email Body" element

  Scenario: Guerillamail Mitigating Circustances Status Validations
    Given I am on "https://www.guerrillamail.com/" URL
    Then I click on the "Guerilla Edit" button
    And I fill the "Guerilla Email Input" field with "EC_AUTO_EMAIL"
    Then I click on the "Guerilla Email Set" button
    And I wait for "10" seconds
    Given I am on "https://www.guerrillamail.com/" URL
    Then I click on the "Guerilla Edit" button
    And I fill the "Guerilla Email Input" field with "EC_AUTO_EMAIL"
    Then I click on the "Guerilla Email Set" button
    Then I click on the "Guerilla Validate Mitigating Circustances Submitted Link" link
    And I validate text "CONTAINS=Your Mitigating Circumstances has been submitted" to be displayed for "Guerilla Email Header" element
    Then I click on the "Guerilla Back To Inbox" button
    Then I click on the "Guerilla Your MC Are Now Reviewed" link
    And I validate text "CONTAINS=Your Mitigating Circumstances are now being reviewed" to be displayed for "Guerilla Email Header" element
    Then I click on the "Guerilla Back To Inbox" button
    Then I click on the "Guerilla Your MC Referred" link
    And I validate text "CONTAINS=Your Mitigating Circumstances application has been referred" to be displayed for "Guerilla Email Header" element
    Then I click on the "Guerilla Back To Inbox" button
    Then I click on the "Guerilla Your MC Progressing" link
    And I validate text "CONTAINS=Your Mitigating Circumstances is progressing" to be displayed for "Guerilla Email Header" element
    Then I click on the "Guerilla Back To Inbox" button
    Then I click on the "Guerilla Your MC Outcome" link
    And I validate text "CONTAINS=Your Mitigating Circumstances application outcome" to be displayed for "Guerilla Email Header" element
    Then I click on the "Guerilla Back To Inbox" button
    Then I click on the "Guerilla Your MC Accepted" link
    And I validate text "CONTAINS=Mitigating Circumstances application has been accepted" to be displayed for "Guerilla Email Header" element
    Then I click on the "Guerilla Back To Inbox" button

  Scenario: Guerillamail Reset Line Manager Password
    Given I am on "https://www.guerrillamail.com/" URL
    Then I click on the "Guerilla Edit" button
    And I fill the "Guerilla Email Input" field with "EC_LINEMANAGER_EMAIL"
    Then I click on the "Guerilla Email Set" button
    And I wait for "10" seconds
    Given I am on "https://www.guerrillamail.com/" URL
    Then I click on the "Guerilla Edit" button
    And I fill the "Guerilla Email Input" field with "EC_LINEMANAGER_EMAIL"
    Then I click on the "Guerilla Email Set" button
    And I wait for "10" seconds
    And Browser performs "Refresh" command
    And I wait for "2" seconds
    Then I click on the "Guerilla BPP Email" element
    Then I capture a part of "Guerilla New Line Manager Email" element text by "https:\/\/bpp-stage.eu.auth0.com\/lo\/reset.+[aA-zZ0-9]\#" regex and save as "EC_RESET_PASSWORD" variable

  Scenario: Harakirimail Validate Accepted Application Email
    Given I am on "https://www.guerrillamail.com/" URL
    Then I click on the "Guerilla Edit" button
    And I fill the "Guerilla Email Input" field with "EC_AUTO_EMAIL"
    Then I click on the "Guerilla Email Set" button
    And I wait for "10" seconds
    Given I am on "https://www.guerrillamail.com/" URL
    Then I click on the "Guerilla Edit" button
    And I fill the "Guerilla Email Input" field with "EC_AUTO_EMAIL"
    Then I click on the "Guerilla Email Set" button
    Then I click on the "Guerilla BPP Email" element
    And I validate text "Your application has been approved" to be displayed for "Guerilla Email Header" element

  Scenario: Harakirimail Mitigating Circustances Reject Validation
    Given I am on "https://harakirimail.com/" URL
    And I fill the "Harakirimail Inbox Name" field with "EC_AUTO_EMAIL"
    Then I click on the "Harakirimail Get Inbox" button
    Then I click on the "Harakirimail Application Outcome Letter" button
    And I validate text "CONTAINS=Your application has been rejected" to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button

  Scenario: Harakirimail Mitigating Circustances Status Validations
    Given I am on "https://harakirimail.com/" URL
    And I fill the "Harakirimail Inbox Name" field with "EC_AUTO_EMAIL"
    Then I click on the "Harakirimail Get Inbox" button
    And I click on the "Harakirimail Validate Mitigating Circumstances Submitted Link" button
    And I validate text "Your Mitigating Circumstances has been submitted" to be displayed for "Harakirimail Validate Mitigating Header" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Harakirimail Your MC Are Now Reviewed" element
    And I validate text "Your Mitigating Circumstances are now being reviewed" to be displayed for "Harakirimail Validate Mitigating Header" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Harakirimail Your MC Referred" element
    And I validate text "Your Mitigating Circumstances application has been referred" to be displayed for "Harakirimail Validate Mitigating Header" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Harakirimail Your MC Progressing" element
    And I validate text "Your Mitigating Circumstances is progressing" to be displayed for "Harakirimail Validate Mitigating Header" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Harakirimail Your MC Outcome" element
    And I validate text "CONTAINS=Reason Part Accept" to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Harakirimail Your MC Accepted" element
    And I validate text "CONTAINS=Your application has been granted" to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=Reason Accept" to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Harakirimail Your MC Outcome Second" element
    And I validate text "CONTAINS=Your application has been rejected" to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=Reason Reject" to be displayed for "Harakirimail Validate Letter Body" element

  Scenario: Harakirimail Reset Line Manager Password
    Given I am on "https://harakirimail.com/" URL
    Then I fill the "Harakirimail Inbox Name" field with "EC_LINEMANAGER_EMAIL"
    Then I click on the "Harakirimail Get Inbox" element
    Then I click on the "Harakirimail First Email" element
#    Then I capture special data "Harakirimail First Email Body" as "EC_RESET_PASSWORD" variable

  Scenario: Harakirimail Verify Email
    Given I am on "https://harakirimail.com/" URL
    And I fill the "Harakirimail Inbox Name" field with "EC_AUTO_EMAIL"
    Then I click on the "Harakirimail Get Inbox" button
    Then I click on the "Harakirimail First Email" element by JS
    And I wait for "2" seconds
    #And I click on the "document.getElementsByClassName('adsbygoogle adsbygoogle-noablate')[2].remove();" button with JS if "Harakirimail Adds Banner" "element is present"
    Then I execute "document.getElementsByClassName('adsbygoogle adsbygoogle-noablate')[2].remove();" JS code if "Harakirimail Adds Banner" "element is present"
    And I wait for "6" seconds
    Then I click on the "Harakirimail First Email" element if "Harakirimail First Email" "element is present"
    Then I click on the "Harakirimail Verify Email" button by JS
    And I switch to window with index "2"
    And I wait for "2" seconds
    And I should see the "Email address verified! Please log in." "message"

  Scenario: Harakirimail Verify Application Incomplete
    Given I am on "https://harakirimail.com/" URL
    And I fill the "Harakirimail Inbox Name" field with "EC_AUTO_EMAIL"
    Then I click on the "Harakirimail Get Inbox" button
    And I wait for "2" seconds
    And I click on the "Information needed to" "text contained in element" by JS
    And I validate text "CONTAINS=Unfortunately your application for UAT" to be displayed for "Harakirimail Validate Letter Body" element