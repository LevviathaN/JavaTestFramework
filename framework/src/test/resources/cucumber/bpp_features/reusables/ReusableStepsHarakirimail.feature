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
    And I wait for "2" seconds
    And I select "guerrillamail.com" from "Guerilla Mail Select Domain" element
    Then I click on the "Guerilla Edit" button
    And I fill the "Guerilla Email Input" field with "EC_LINEMANAGER_EMAIL"
    Then I click on the "Guerilla Email Set" button
    And I wait for "11" seconds
    And Browser performs "Refresh" command
    And I wait for "11" seconds
    And I select "guerrillamail.com" from "Guerilla Mail Select Domain" element
    And I wait for "1" seconds
    Then I click on the "Guerilla BPP Email" element by JS
    Then I capture a part of "Guerilla New Line Manager Email" element text by "https:\/\/bpp-stage.eu.auth0.com\/lo\/reset.+[aA-zZ0-9]\#" regex and save as "EC_RESET_PASSWORD" variable
    And I validate text "CONTAINS=We have received a booking from an employee at your organisation, who has named you as their training manager." to be displayed for "Guerilla New Line Manager Email" element

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
    Then I click on the "Harakirimail Application Outcome Letter" element by JS
    Then I execute "document.getElementsByClassName('adsbygoogle adsbygoogle-noablate')[2].remove();" JS code if "Harakirimail Adds Banner" "element is present"
    And I wait for "3" seconds
    And Browser performs "REFRESH" command
    And I wait for "3" seconds
    Then I click on the "Harakirimail Application Outcome Letter" element if "Harakirimail Application Outcome Letter" "element is present"
    And I validate text "CONTAINS=Your application has been rejected" to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button

  Scenario: Harakirimail Mitigating Circumstances Status Validations
    Given I am on "https://harakirimail.com/" URL
    And I fill the "Harakirimail Inbox Name" field with "EC_AUTO_EMAIL"
    Then I click on the "Harakirimail Get Inbox" button
    And I click on the "Harakirimail Validate Mitigating Circumstances Submitted Link" button by JS
    Then Browser performs "REFRESH" command
    And I wait for "1" seconds
    Then I click on the "Harakirimail Validate Mitigating Circumstances Submitted Link" button by JS
    And I validate text "Your Mitigating Circumstances has been submitted" to be displayed for "Harakirimail Validate Mitigating Header" element
    And I validate text "CONTAINS=You will be informed by email normally within 10 clear working days whether your application has met the threshold conditions for further consideration." to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Harakirimail Your MC Are Now Reviewed" element by JS
    And I validate text "Your Mitigating Circumstances are now being reviewed" to be displayed for "Harakirimail Validate Mitigating Header" element
    And I validate text "CONTAINS=I am writing to inform you that your Mitigating Circumstances application has now been allocated to a Regulation and Compliance Officer" to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Harakirimail Your MC Referred" element by JS
    And I validate text "Your Mitigating Circumstances application has been referred" to be displayed for "Harakirimail Validate Mitigating Header" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Harakirimail Your MC Progressing" element by JS
    And I validate text "Your Mitigating Circumstances is progressing" to be displayed for "Harakirimail Validate Mitigating Header" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Harakirimail Your MC Outcome" element by JS
    And I validate text "CONTAINS=Reason Part Accept" to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Harakirimail Your MC Accepted" element by JS
    And I validate text "CONTAINS=Your application has been granted" to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=Reason Accept" to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Harakirimail Your MC Outcome Second" element by JS
    And I validate text "CONTAINS=Your application has been rejected" to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=Reason Reject" to be displayed for "Harakirimail Validate Letter Body" element

  Scenario: Harakirimail Academic Appeals Status Validations
    Given I am on "https://harakirimail.com/" URL
    And I fill the "Harakirimail Inbox Name" field with "EC_AUTO_EMAIL"
    Then I click on the "Harakirimail Get Inbox" button
    And I click on the "Your Appeals application has been submitted" "Harakirimail BPP Specific Email First" by JS
    Then Browser performs "REFRESH" command
    And I wait for "1" seconds
    Then I click on the "Your Appeals application has been submitted" "Harakirimail BPP Specific Email First" by JS
    Then I click on the "Harakirimail Back To Inbox" button
    Then I click on the "Your Appeals application is now being reviewed" "Harakirimail BPP Specific Email First" by JS
    And I validate text "CONTAINS=I am writing to inform you that your academic appeal application has now been allocated to a Regulation and Compliance Officer." to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button
    Then I click on the "Your Appeals application has been referred" "Harakirimail BPP Specific Email First" by JS
    And I validate text "CONTAINS=will be referred to the next available Academic Appeals Board (date to be confirmed)" to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button
    Then I click on the "Your Appeals application has been accepted" "Harakirimail BPP Specific Email First" by JS
    And I validate text "CONTAINS=Your application has been granted and the reasoning behind this decision is as follows:" to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=Office of Regulation and Compliance" to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button
    Then I click on the "Your Appeals application outcome" "Harakirimail BPP Specific Email First" by JS
    And I validate text "CONTAINS=Reason Reject" to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=Your application has been rejected and the reasoning behind this decision is as follows:" to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button
    Then I click on the "Your Appeals application outcome" "Harakirimail BPP Specific Email Second" by JS
    And I validate text "CONTAINS=Reason Part Accept" to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=Your application has been part granted and the reasoning behind this decision is as follows:" to be displayed for "Harakirimail Validate Letter Body" element

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
    And Browser performs "REFRESH" command
    #And I click on the "document.getElementsByClassName('adsbygoogle adsbygoogle-noablate')[2].remove();" button with JS if "Harakirimail Adds Banner" "element is present"
    #Then I execute "document.getElementsByClassName('adsbygoogle adsbygoogle-noablate')[2].remove();" JS code if "Harakirimail Adds Banner" "element is present"
    And I wait for "1" seconds
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
    Then I execute "document.getElementsByClassName('adsbygoogle adsbygoogle-noablate')[2].remove();" JS code if "Harakirimail Adds Banner" "element is present"
    And I wait for "6" seconds
    And I click on the "Information needed to" "text contained in element" by JS
    Then I wait for "2" seconds
    And I validate text "CONTAINS=Unfortunately your application for UAT Accounting Assistant is incomplete" to be displayed for "Harakirimail Validate Letter Body" element

  Scenario: Harakirimail Verify Emails Apprenticeships
    Given I am on "https://harakirimail.com/" URL
    And I fill the "Harakirimail Inbox Name" field with "EC_AUTO_EMAIL"
    Then I click on the "Harakirimail Get Inbox" button
    Then I click on the "Harakirimail First Email" element by JS
    And Browser performs "REFRESH" command
    Then I click on the "Harakirimail First Email" element if "Harakirimail First Email" "element is present"
    And I validate text "CONTAINS=We are delighted to welcome you to your Chartered Manager Degree Apprenticeship programme" to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=Welcome to BPP. We can’t wait to get started." to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Please continue with your application" "Harakirimail BPP Specific Email First"
    And I validate text "CONTAINS=Thank you for submitting an application to BPP University Degree Apprenticeships." to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=Your line manager has confirmed that you are eligible for this role and would like to proceed with your application." to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Thank you for submitting your application" "Harakirimail BPP Specific Email First"
    And I validate text "CONTAINS=This email is to confirm that we have received your full application for the Chartered Manager Degree Apprenticeship." to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=Our admissions team will now make a final assessment and contact you regarding entry to onto this programme." to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "Thank you for submitting your application" "Harakirimail BPP Specific Email Second"
    And I validate text "CONTAINS=This email is to confirm that we have received your application and will now review the information provided." to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=Our Apprenticeships Team will make an assessment on your eligibility for the programme and contact your line manager to confirm they are also happy to proceed with your application" to be displayed for "Harakirimail Validate Letter Body" element

  Scenario: Harakirimail Verify Line Manager Emails for Apprenticeships
    Given I am on "https://harakirimail.com/" URL
    And I fill the "Harakirimail Inbox Name" field with "automationLinemanager8@harakirimail.com"
    Then I click on the "Harakirimail Get Inbox" button
    Then I click on the "Harakirimail First Email" element by JS
    And Browser performs "REFRESH" command
    Then I click on the "Harakirimail First Email" element if "Harakirimail First Email" "element is present"
    And I validate text "CONTAINS=We are pleased to confirm that following the successful completion of our onboarding process" to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=Please find attached a copy of the Commitment Statement and Apprenticeship Agreement signed by learner, employer and BPP." to be displayed for "Harakirimail Validate Letter Body" element
    Then I click on the "Harakirimail Back To Inbox" button
    And I click on the "You have a new apprenticeship application to review" "Harakirimail BPP Specific Email First"
    And I validate text "CONTAINS=who has named you as their line manager." to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=We can confirm that this application has been pre-approved by BPP and that we believe the applicant is eligible for an apprenticeship." to be displayed for "Harakirimail Validate Letter Body" element

  Scenario: Harakirimail Verify Email for Channel Islands
    Given I am on "https://harakirimail.com/" URL
    And I fill the "Harakirimail Inbox Name" field with "EC_AUTO_EMAIL"
    Then I click on the "Harakirimail Get Inbox" button
    Then I click on the "Harakirimail First Email" element by JS
    And Browser performs "REFRESH" command
    Then I click on the "Harakirimail First Email" element if "Harakirimail First Email" "element is present"
    And I validate text "CONTAINS=Thank you for submitting a booking for approval." to be displayed for "Harakirimail Validate Letter Body" element
    And I validate text "CONTAINS=We are pleased to confirm that your booking for programme on Test Channel Islands at location has been approved by your training manager." to be displayed for "Harakirimail Validate Letter Body" element