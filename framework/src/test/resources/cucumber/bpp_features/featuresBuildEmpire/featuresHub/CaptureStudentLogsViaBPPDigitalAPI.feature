@RFI @DigitalSite
Feature: Student data API tracking
  As a marketing data user
  I want a record in marketing cloud of when a user successfully logs into the Hub
  As this trackable activity can be used to drive activity from Marketing Cloud Interaction Studio

  @Positive #TC-4708
  Scenario: Register Student and capture API data
    #Register Student
    When I execute "Register New Student Account" reusable step replacing some steps
    |10|I remember "[TIMENOW]" text as "EC_DATE_TIME" variable|
    |11|I click on the "Direct App Register" button           |
    |12|I wait for "3" seconds                                |
    And I should see the "Thanks for registering, please verify your email address." "message"
    Then I execute "Harakirimail Verify Email" reusable step
    #Login Admin
    When I execute "Log In to Hub as Admin" reusable step
    #Navigate to Marketing Cloud Logs
    And I execute "Admin Hub Navigate to Marketing Cloud Logs" reusable step
    #Find Log
    And I click on the "BPP Digital Marketing Cloud Log Show button" element if "BPP Digital Marketing Cloud Log Show button" "element is present"
    And I click on the "BPP Digital Marketing Cloud Log Show button two" element if "BPP Digital Marketing Cloud Log Show button" "element is present"
    Then I validate text "CONTAINS=EC_AUTO_EMAIL" to be displayed for "BPP Digital Admin Logs Response Body text" element
    Then I validate text "CONTAINS=''e_sub-source'': ''Registration page''" to be displayed for "BPP Digital Admin Logs Response Body text" element
    Then I should see the "Success" message
    #Logout Admin
    And I execute "Log Out from Hub Admin" reusable step

  @Positive #TC-4708
  Scenario: Log In with Student and capture API data
    #Login As Student
    And I remember "AutoLucianoWest3362@harakirimail.com" text as "EC_EMAIL" variable
    And I remember "A@polloGlobal2020" text as "EC_PASSWORD" variable
    When I execute "Log In to Hub as Student" reusable step replacing some steps
    |2|I set "EC_EMAIL" text to the "Email" "Build Empire text field"      |
    |3|I set "EC_PASSWORD" text to the "Password" "Build Empire text field"|
    |5|I remember "[TIMENOW]" text as "EC_DATE_TIME" variable              |
    |6|I wait "5" seconds                                                  |
    #Login Admin
    When I execute "Log In to Hub as Admin" reusable step
    #Navigate to Marketing Cloud Logs
    And I execute "Admin Hub Navigate to Marketing Cloud Logs" reusable step
    #Find Log
    And I click on the "BPP Digital Marketing Cloud Log Show button" element if "BPP Digital Marketing Cloud Log Show button" "element is present"
    And I click on the "BPP Digital Marketing Cloud Log Show button two" element if "BPP Digital Marketing Cloud Log Show button" "element is present"
    Then I validate text "CONTAINS=EC_EMAIL" to be displayed for "BPP Digital Admin Logs Response Body text" element
    Then I validate text "CONTAINS=''e_sub-source'': ''Log in''" to be displayed for "BPP Digital Admin Logs Response Body text" element
    Then I should see the "Success" message
    #Logout Admin
    And I execute "Log Out from Hub Admin" reusable step

  @Positive #TC-4708
  Scenario: Submit RFI form for an Employer to capture API data
    #RFI Submitting
    When I am on "https://web-stage-bppdigital.bppuniversity.com" URL
    And I click on the "/request-information" "link address"
    When I click on the "I am an Employer" "Build Empire RFI Label text item"
    And I set "Auto[FIRSTNAME]" text to the "Enter your first name" "Build Empire text field"
    And I set "Auto[LASTNAME]" text to the "Enter your last name" "Build Empire text field"
    And I set "Auto[EMAIL-HARAKIRI]" text to the "Enter your email address" "Build Empire text field"
    And I set "[PHONE-0913]" text to the "tel" "element by type"
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
    And I click on the "BPP Digital Marketing Cloud Log Show button" element if "BPP Digital Marketing Cloud Log Show button" "element is present"
    And I click on the "BPP Digital Marketing Cloud Log Show button two" element if "BPP Digital Marketing Cloud Log Show button" "element is present"
    Then I validate text "CONTAINS=EC_AUTO_EMAIL" to be displayed for "BPP Digital Admin Logs Response Body text" element
    Then I validate text "CONTAINS=''e_sub-source'': ''Request a Callback''" to be displayed for "BPP Digital Admin Logs Response Body text" element
    Then I should see the "Success" message
    #Logout Admin
    And I execute "Log Out from Hub Admin" reusable step