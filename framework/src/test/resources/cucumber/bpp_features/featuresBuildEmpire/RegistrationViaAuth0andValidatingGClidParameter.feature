@RFI
Feature: Registration via Auth0 and Capturing GClid Parameter BPP-2632
  As a developer
  I will capture a user's GClid whenever they register via Auth0 on Staging
  As this is important marketing information

  @Positive @NoRun #TC-1515
  Scenario: Registration via Auth Zero and Validating GClid parameter
    #Student Registration with gClid Parameter
    Given I am on "https://web-stage-bppdigital.bppuniversity.com/?gclid=test3" URL
    When I hover over the "BPP Digital Login link" element
    Then I should see the "Student Applications" "BPP Digital Student Applications Menu link"
    When I click on the "Student Applications" "BPP Digital Student Applications Menu link"
    Then I click on the "Direct App Register Link on Login Page" button
    And I set "Auto[FIRSTNAME]" text to the "First name" "Build Empire text field"
    And I set "Auto[LASTNAME]" text to the "Surname" "Build Empire text field"
    And I set "Auto[EMAIL-HARAKIRI]" text to the "Email" "Build Empire text field"
    And I set "[PHONE-0913]" text to the "Telephone number" "Build Empire text field"
    Then I remember "A@polloGlobal2018" text as "EC_PASSWORD" variable
    And I set "EC_PASSWORD" text to the "Password" "Build Empire text field"
    And I click on the "Direct App I Am Happy To Receive Information" button
    Then I click on the "Direct App Register" button
    Then I remember "[TIMENOW]" text as "EC_DATE_TIME" variable
    And I wait for "2" seconds
    And I should see the "Direct App My Applications Left Menu Link" button
    #Student Log out
    And I execute "Log Out from Hub Student" reusable step
    #Login Admin
    When I execute "Log In to Hub as Admin" reusable step
    #Navigate to Marketing Cloud Logs
    And I execute "Admin Hub Navigate to Marketing Cloud Logs" reusable step
    #Find Log
    And I click on the "BPP Digital Marketing Cloud Log Show button" element
    Then I validate text "CONTAINS=EC_AUTO_EMAIL" to be displayed for "BPP Digital Admin Logs Response Body text" element
    Then I validate text "CONTAINS=''gA Gclid'': ''test3''" to be displayed for "BPP Digital Admin Logs Response Body text" element
    Then I should see the "Success" message
    #Logout Admin
    And I execute "Log Out from Hub Admin" reusable step
