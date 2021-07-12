@RFI
Feature: Pre-Auth0 user submits RFI forms as a student/employer BPP-2521
  As a developer
  I will capture a user's GClid whenever they register/complete RFI form on Staging
  As this is important marketing information

  @Positive @NoRun #TC-1514
  Scenario: Submit RFI form for non logged Users as Learner
    #RFI Submitting Student
    When I am on "https://web-stage-bppdigital.bppuniversity.com/request-information?gclid=test1" URL
    When I click on the "I am a Learner" "Build Empire RFI Label text item"
    And I set "Auto[FIRSTNAME]" text to the "Enter your first name" "Build Empire text field"
    And I set "Auto[LASTNAME]" text to the "Enter your last name" "Build Empire text field"
    And I set "Auto[EMAIL-HARAKIRI]" text to the "Enter your email address" "Build Empire text field"
    And I set "[PHONE-0913]" text to the "Enter your phone number" "Build Empire text field"
    And I click on the "Select area of interest" "Build Empire RFI Span dropdown item"
    And I click on the "Accountancy and Tax" "Build Empire RFI dropdown option"
    And I set "SomeCommentLearner[####]" text to the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I click on the "I do not wish to receive information from BPP" "Build Empire RFI Span dropdown item"
    And I click on the "Submit" "Build Empire button"
    And I remember "[TIMENOW]" text as "EC_DATE_TIME" variable
    Then I should see the "Thank you for your interest" element
    Then I should see the "A member of our team will be with you shortly." element
    #Login Admin
    When I execute "Log In to Hub as Admin" reusable step
    #Navigate to Marketing Cloud Logs
    And I execute "Admin Hub Navigate to Marketing Cloud Logs" reusable step
    #Find Log
    And I click on the "BPP Digital Marketing Cloud Log Show button" element
    Then I validate text "CONTAINS=EC_AUTO_EMAIL" to be displayed for "BPP Digital Admin Logs Response Body text" element
    Then I validate text "CONTAINS=''gA Gclid'': ''test1''" to be displayed for "BPP Digital Admin Logs Response Body text" element
    Then I should see the "Success" message
    #Logout Admin
    And I execute "Log Out from Hub Admin" reusable step

  @Positive @NoRun #TC-1514
    Scenario: Submit RFI form for non logged Users as Learner URL Two
    #RFI Submitting Student Site 2
    When I am on "https://web-stage-bppdigital.bppuniversity.com/request-information?gclid=test2" URL
    When I click on the "I am a Learner" "Build Empire RFI Label text item"
    And I set "Auto[FIRSTNAME]" text to the "Enter your first name" "Build Empire text field"
    And I set "Auto[LASTNAME]" text to the "Enter your last name" "Build Empire text field"
    And I set "Auto[EMAIL-HARAKIRI]" text to the "Enter your email address" "Build Empire text field"
    And I set "[PHONE-0913]" text to the "Enter your phone number" "Build Empire text field"
    And I click on the "Select area of interest" "Build Empire RFI Span dropdown item"
    And I click on the "Accountancy and Tax" "Build Empire RFI dropdown option"
    And I set "SomeCommentLearner[####]" text to the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I click on the "I do not wish to receive information from BPP" "Build Empire RFI Span dropdown item"
    And I click on the "Submit" "Build Empire button"
    And I remember "[TIMENOW]" text as "EC_DATE_TIME" variable
    Then I should see the "Thank you for your interest" element
    Then I should see the "A member of our team will be with you shortly." element
    #Login Admin
    When I execute "Log In to Hub as Admin" reusable step
    #Navigate to Marketing Cloud Logs
    And I execute "Admin Hub Navigate to Marketing Cloud Logs" reusable step
    #Find Log
    And I click on the "BPP Digital Marketing Cloud Log Show button" element
    Then I validate text "CONTAINS=EC_AUTO_EMAIL" to be displayed for "BPP Digital Admin Logs Response Body text" element
    Then I validate text "CONTAINS=''gA Gclid'': ''test2''" to be displayed for "BPP Digital Admin Logs Response Body text" element
    Then I should see the "Success" message
    #Logout Admin
    And I execute "Log Out from Hub Admin" reusable step

  @Positive @NoRun #TC-1533
  Scenario: Submit RFI form for non logged Users as Employer
    #RFI Submitting Employer
    When I am on "https://web-stage-bppdigital.bppuniversity.com/request-information?gclid=test3" URL
    When I click on the "I am an Employer" "Build Empire RFI Label text item"
    And I set "Auto[FIRSTNAME]" text to the "Enter your first name" "Build Empire text field"
    And I set "Auto[LASTNAME]" text to the "Enter your last name" "Build Empire text field"
    And I set "Auto[EMAIL-HARAKIRI]" text to the "Enter your email address" "Build Empire text field"
    And I set "[PHONE-0913]" text to the "Enter your phone number" "Build Empire text field"
    And I set "AutoCompany[####]" text to the "Enter your company" "Build Empire text field"
    And I set "AutoJobTitle[####]" text to the "Enter your job title" "Build Empire text field"
    And I set "SomeCommentEmployer[####]" text to the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I click on the "I do not wish to receive information from BPP" "Build Empire RFI Span dropdown item"
    And I click on the "Submit" "Build Empire button"
    And I remember "[TIMENOW]" text as "EC_DATE_TIME" variable
    Then I should see the "Thank you for your interest" element
    Then I should see the "A member of our team will be with you shortly." element
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

  @Positive @NoRun #TC-1533
  Scenario: Submit RFI form for non logged Users as Employer URL Two
    #RFI Submitting Student Site 2
    When I am on "https://web-stage-bppdigital.bppuniversity.com/request-information?gclid=test4" URL
    When I click on the "I am an Employer" "Build Empire RFI Label text item"
    And I set "Auto[FIRSTNAME]" text to the "Enter your first name" "Build Empire text field"
    And I set "Auto[LASTNAME]" text to the "Enter your last name" "Build Empire text field"
    And I set "Auto[EMAIL-HARAKIRI]" text to the "Enter your email address" "Build Empire text field"
    And I set "[PHONE-0913]" text to the "Enter your phone number" "Build Empire text field"
    And I set "AutoCompany[####]" text to the "Enter your company" "Build Empire text field"
    And I set "AutoJobTitle[####]" text to the "Enter your job title" "Build Empire text field"
    And I set "SomeCommentEmployer[####]" text to the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I click on the "I do not wish to receive information from BPP" "Build Empire RFI Span dropdown item"
    And I click on the "Submit" "Build Empire button"
    And I remember "[TIMENOW]" text as "EC_DATE_TIME" variable
    Then I should see the "Thank you for your interest" element
    Then I should see the "A member of our team will be with you shortly." element
    #Login Admin
    When I execute "Log In to Hub as Admin" reusable step
    #Navigate to Marketing Cloud Logs
    And I execute "Admin Hub Navigate to Marketing Cloud Logs" reusable step
    #Find Log
    And I click on the "BPP Digital Marketing Cloud Log Show button" element
    Then I validate text "CONTAINS=EC_AUTO_EMAIL" to be displayed for "BPP Digital Admin Logs Response Body text" element
    Then I validate text "CONTAINS=''gA Gclid'': ''test4''" to be displayed for "BPP Digital Admin Logs Response Body text" element
    Then I should see the "Success" message
    #Logout Admin
    And I execute "Log Out from Hub Admin" reusable step

