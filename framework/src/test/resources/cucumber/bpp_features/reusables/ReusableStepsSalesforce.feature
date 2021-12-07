@Reusable
Feature: Salesforce

  Scenario: Log In To Salesforce
    Given I am on "MD_COMMON_LINKS_SALESFORCEURL" URL
    Then I fill the "Salesforce Username" field with "MD_COMMON_CREDENTIALS_BPPADMINUSER"
    And I fill the "Salesforce Password" field with "MD_COMMON_CREDENTIALS_BPPADMINPASSWORD"
    And I click on the "Salesforce Login" button
    Then I should see the "Salesforce Context Bar Menu" element

  Scenario: Log Out Salesforce
    And I click on the "Salesforce User Menu Icon" button
    And I click on the "Salesforce Log Out" button

  Scenario: Switch to Sales App
    Given I click on the "Salesforce App Launcher" button
    When I click on the "View All" link
    And I click on the "Sales" "Salesforce app launcher app"

  Scenario: Switch to Key Clients App
    Given I click on the "Salesforce App Launcher" button
    When I click on the "Salesforce View All Application" link by JS
    And I wait for "2" seconds
    And I click on the "Key Clients" "Salesforce app launcher app" by JS

  Scenario: Create Student Account
    When I click on the "Account/home" "Salesforce navigation href links"
    And I wait for "2" seconds
    And I click on the "Salesforce New Case Button" button
    And I click on the "Student Account" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I set "Auto[FIRSTNAME]" text to the "First Name" "Salesforce text field"
    And I fill the "Salesforce Student Last Name" field with "Auto[LASTNAME]"
    And I click on the "Student Type" "Salesforce dropdown field"
    And I wait for "2" seconds
    And I click on the "Domestic" "element by title"
    And I set "31/01/1998" text to the "Date of Birth" "Salesforce date field"
    And I click on the "Gender" "Salesforce dropdown field" by JS
    And I click on the "Male" "option"
    And I set "Canada" text to the "Primary Nationality" "Salesforce search field"
    And I click on the "Canada" "option"
    And I click on the "Domicile" "Salesforce dropdown field" by JS
    And I click on the "Canada" "Salesforce dropdown field option" by JS
    And I click on the "Preferred Phone" "Salesforce dropdown field" by JS
    And I click on the "Home" "Salesforce dropdown field option" by JS
    And I set "[PHONE]" text to the "Home Phone" "Salesforce text field"
    And I click on the "Legal Entity" "Salesforce dropdown field" by JS
    And I click on the "UC~COL" "Salesforce dropdown field option" by JS
    And I set "Auto[EMAIL-HARAKIRI]" text to the "Personal Email" "Salesforce text field"
    And I click on the "Preferred Email" "Salesforce dropdown field" by JS
    And I click on the "Personal" "Salesforce dropdown field option" by JS
    And I wait for "1" seconds
    And I click on the "Salesforce Save Account Button" button by JS
    And I wait for "7" seconds

  Scenario: Create Address
    And I click on the "Salesforce Addresses Quick Link Tab" button by JS
    And I wait for "1" seconds
    And I click on the "Salesforce Student Account Pages New button" button
    And I click on the "Address Type" "Salesforce dropdown field" by JS
    And I click on the "Billing" "option"
    And I set "KW_AUTO_STREET" text to the "Address Line 1" "Salesforce text field label"
    And I set "London" text to the "City" "Salesforce text field label"
    And I set "KW_AUTO_ZIPCODE|#####" text to the "Zip/Postal Code" "Salesforce text field label"
    And I click on the "Salesforce Address Primary Delivery" button by JS
    And I set "United Kingdom" text to the "Country" "Salesforce search field"
    Then I wait for "2" seconds
    And I click on the "Kingdom" "option" by JS
    And I wait for "1" seconds
    And I click on the "Salesforce Account Creation Save button" element
    #Then I should see the " was created." message
    And I click on the "Salesforce Student Account Link Address Page" element by JS

  Scenario: Get Profile ID
    #And I click on the "Salesforce More Actions Dropdown" button
    #And I click on the "Get Profile ID LEX" "Salesforce dropdown option"
    Then I click on the "Salesforce Get Profile ID" button by JS
    Then I should see the "Profile Id created Successfully" message

  Scenario: Create Opportunity
    Then I click on the "Salesforce Opportunities Quick Link Tab" element
    And I click on the "Salesforce Student Account Pages New button" button
    And I click on the "Application" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I set "OpportunityName[###]" text to the "Opportunity Name" "Salesforce text field label"
    And I click on the "Status" "Salesforce dropdown field" by JS
    And I click on the "Accepted - Conditional Firm" "Salesforce dropdown field option" by JS
    And I click on the "Customer Group" "Salesforce dropdown field" by JS
    And I click on the "SELFFUND" "Salesforce dropdown field option"
    And I click on the "Application Type" "Salesforce dropdown field" by JS
    And I click on the "University Application" "Salesforce dropdown field option"
    And I set "31/01/2022" text to the "Close Date" "Salesforce date field"
    #And I fill the "Salesforce Opportunity Close Date field" field with "31/01/2022"
    And I click on the "Salesforce Account Creation Save button" element
    And I should see the " was created." message

  # This reusable scenario is not working, because its steps are not treated as separate Gherkin steps, so AfterStep
  # method that switches to default content is not called for two serial inframe elements, so the second element's parent
  # xpath cannot be found as the focus of the test is still inside the first element's iframe
  Scenario: Add Product Catalog Item
    And I click on the "EC_AUTO_LASTNAME" "Salesforce link"
    And I click on the "Product Catalog Items" "Salesforce related new button"
    And I wait for "1" seconds
    And I click on the "New" "Salesforce dropdown option"
    And I fill the "Salesforce Offering Text Field" field with "MD_COMMON_VALIDDATA_SFOFFERING"
    And I click on the "Salesforce Search" button
    And I "check" "Salesforce Offering Checkbox" checkbox
    And I "check" "Salesforce Product Checkbox" checkbox
    And I click on the "Salesforce Add Products" button
    And I wait for "4" seconds

  Scenario: Add Qualification
    And I click on the "Salesforce Qualifications link" element
    And I click on the "Salesforce Student Account Pages New button" button
    And I set "LAW" text to the "Qualification Subject" "Salesforce New Qualification input fields"
    And I wait for "2" seconds
    And I click on the "Law and Society" "Salesforce Qualification Subject" by JS
    And I capture text data "Salesforce Qualification Subject Capture information" as "EC_QUALIFICATION_SUBJECT" variable
    And I set "Accrington Academy" text to the "Qualification Institution" "Salesforce New Qualification input fields"
    And I wait for "2" seconds
    And I click on the "Accrington Academy" "Salesforce Qualification Subject" by JS
    And I capture text data "Salesforce Qualification Institution Capture information" as "EC_QUALIFICATION_INSTITUTION" variable
    And I set "ACC" text to the "Qualification Type" "Salesforce New Qualification input fields"
    And I wait for "2" seconds
    And I click on the "Acc to HE Dip (AQA)" "Salesforce Qualification Subject" by JS
    And I capture text data "Salesforce Qualification Type Capture information" as "EC_QUALIFICATION_INSTITUTION" variable
    And I set "EC_QUALIFICATION_LASTNAME" text to the "Student" "Salesforce New Qualification input fields"
    Then I click on the "Salesforce First Qualification Subject" element
    And I remember "KW_AUTO_RANDOMNUMBER|####" text as "EC_TARIFF_POINT" variable
    And I fill the "Salesforce Qualification Tariff Points" field with "EC_TARIFF_POINT"
    And I click on the "Status" "Salesforce dropdown field"
    And I click on the "Actual" "Salesforce dropdown field option"
    And I remember "Actual" text as "EC_STATUS" variable
    And I set "KW_AUTO_TODAY|DD/MM/YYYY" text to the "Qualification Date" "Salesforce date field"
    And I set "G[####]" text to the "Grade" "Salesforce New Qualification input fields"
    And I click on the "Used for Offer" "Salesforce checkbox" by JS
    And I click on the "NARIC Indicator" "Salesforce checkbox" by JS
    And I click on the "NARIC Equivalent Grade" "Salesforce dropdown field" by JS
    And I click on the "8~ Specialist awards" "Salesforce dropdown field option" by JS
    And I click on the "Salesforce Account Creation Save button" link
    Then I should see the " was created." message
    Then I wait for "5" seconds

  Scenario: Submit Application
    #And I click on the "Salesforce More Actions Dropdown" button
    #And I click on the "Submit Application LEX" "Salesforce dropdown option"
    Then I click on the "Salesforce Submit Application" button
    Then I should scroll to the "top" of the page
    And I click on the "Salesforce Account Name Link" element
    And I click on the "Salesforce Account Details Tab" element
    And I validate text "STARTS-WITH=BP" to be displayed for "Salesforce Banner ID Field" element
    And I capture text data "Salesforce Banner ID Field" as "EC_BANNER_ID" variable
    And I capture text data "Salesforce Profile Services ID Field" as "EC_PROFILE_ID" variable
    Then I validate text "RE=^[a-zA-Z].[a-zA-Z]\w{1,}" to be displayed for "Salesforce Provisioning Username field" element
    Then I validate text "RE=^([1-zA-Z0-1@.\s]{1,255})$" to be displayed for "Salesforce Provisioning Email Address field" element

  Scenario: Create And Validate CSA Cases Query Types and Subtypes
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Customer Service" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I set "2Automation 2CSA" text to the "Contact Name" "Salesforce text field label"
    And I wait for "1" seconds
    And I click on the "2Automation 2CSA" "Salesforce cases search student"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Email" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "My course" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "I have a question about my course" "Salesforce cases dropdown option"
    Then I should see the "I have a question about the achievement ladder" "Salesforce cases dropdown option"
    Then I should see the "I have a question about my exam" "Salesforce cases dropdown option"
    Then I should see the "I need to defer my course" "Salesforce cases dropdown option"
    Then I should see the "What is the eligibility for Pass Assurance?" "Salesforce cases dropdown option"
    Then I should see the "I need to request a reference" "Salesforce cases dropdown option"
    Then I should see the "I have missed my assessment deadline" "Salesforce cases dropdown option"
    Then I should see the "I need to extend my assessment deadline" "Salesforce cases dropdown option"
    Then I should see the "I have a question about my mark for my mock/assessment" "Salesforce cases dropdown option"
    Then I should see the "I haven’t received my exam results" "Salesforce cases dropdown option"
    Then I should see the "I need further support with my studies" "Salesforce cases dropdown option"
    Then I should see the "I need to access learning support advice" "Salesforce cases dropdown option"
    Then I should see the "I have a specialist learning need, which I need additional support for" "Salesforce cases dropdown option"
    Then I should see the "I need to change my course" "Salesforce cases dropdown option"
    Then I should see the "I need to change my study mode" "Salesforce cases dropdown option"
    Then I should see the "I need to change my study location" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "My online learning and VLE" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "I haven’t received my log in details" "Salesforce cases dropdown option"
    Then I should see the "I need to extend my online access" "Salesforce cases dropdown option"
    Then I should see the "How do I access my account?" "Salesforce cases dropdown option"
    Then I should see the "I haven’t received a link to my live course" "Salesforce cases dropdown option"
    Then I should see the "I can’t see my course on the VLE" "Salesforce cases dropdown option"
    Then I should see the "I need to remove old papers from my VLE" "Salesforce cases dropdown option"
    Then I should see the "I have a different problem with my VLE" "Salesforce cases dropdown option"
    Then I should see the "My account has been locked" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "My study materials" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "When will my study materials be delivered?" "Salesforce cases dropdown option"
    Then I should see the "I haven’t received my study materials" "Salesforce cases dropdown option"
    Then I should see the "When will my study materials be back in stock?" "Salesforce cases dropdown option"
    Then I should see the "How do I access my EBook?" "Salesforce cases dropdown option"
    Then I should see the "My Ebook has expired" "Salesforce cases dropdown option"
    Then I should see the "Where can I find the link to my EBook?" "Salesforce cases dropdown option"
    Then I should see the "I would like to return my study materials" "Salesforce cases dropdown option"
    Then I should see the "My activation code isn’t working" "Salesforce cases dropdown option"
    Then I should see the "I have a question about a Customs Charge" "Salesforce cases dropdown option"
    Then I should see the "Which variants do BPP offer?" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Feedback" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "I have some feedback about my course" "Salesforce cases dropdown option"
    Then I should see the "I have some feedback about my tutor" "Salesforce cases dropdown option"
    Then I should see the "I have some feedback about my study centre/location" "Salesforce cases dropdown option"
    Then I should see the "I have some feedback about my recent experience" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Finance and billing" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "My invoice address is incorrect" "Salesforce cases dropdown option"
    Then I should see the "My company discount hasn’t been applied to my order" "Salesforce cases dropdown option"
    Then I should see the "The Purchase Order wasn’t included in my invoice" "Salesforce cases dropdown option"
    Then I should see the "When will I receive my refund?" "Salesforce cases dropdown option"
    Then I should see the "I need my invoice to be re-sent to me" "Salesforce cases dropdown option"
    Then I should see the "I need my receipt to be re-sent to me" "Salesforce cases dropdown option"
    Then I click on the "My invoice address is incorrect" "Salesforce cases dropdown option"
    And I click on the "Salesforce CS Ready to Close" element
    And I click on the "Save" "Product Factory button title"
    And I wait for "3" seconds
    And I validate text "CONTAINS=Customer Service Team" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

  Scenario: Create CSA Case My Course
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I wait for "1" seconds
    And I click on the "Customer Service" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Salesforce CS Ready to Close" element
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Email" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "My course" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "I need to defer my course" "Salesforce cases dropdown option"
    Then I hover over the "Contact Name" "Salesforce text field label"
    And I set "2Automation 2CSA" text to the "Contact Name" "Salesforce text field label"
    And I wait for "3" seconds
    And I click on the "2Automation 2CSA" "Salesforce cases contact" by JS
    And I wait for "1" seconds
    And I click on the "Save" "Product Factory button title"
    And I wait for "3" seconds
    And I validate text "CONTAINS=Customer Service Team" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

  Scenario: Search Case by Number
    Then I click on the "Salesforce Main Header Button Search" element
    And I fill the "Salesforce Main Header Search" field with "EC_CASENUMBER"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Main Header Search"
    And I wait for "2" seconds
    And I click on the "Salesforce First Case Number Search Table" element
    And I click on the "Salesforce First Case Number" element

  Scenario: Create ID Card Registry Case
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "ID Card" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "Lost" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "Law" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "3" seconds

  Scenario: Validate All Registry Cases Types
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Web" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Assessments" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "Appeals" "Salesforce cases dropdown option"
    Then I should see the "Deferals, Extensions and Mitigating Circumstances" "Salesforce cases dropdown option"
    Then I should see the "Examination Date /Venue/Time" "Salesforce cases dropdown option"
    Then I should see the "Exemptions" "Salesforce cases dropdown option"
    Then I should see the "Fail, resit and progression" "Salesforce cases dropdown option"
    Then I should see the "Feedback" "Salesforce cases dropdown option"
    Then I should see the "Final Grade calculations" "Salesforce cases dropdown option"
    Then I should see the "Learning Support" "Salesforce cases dropdown option"
    Then I should see the "Overseas Exams" "Salesforce cases dropdown option"
    Then I should see the "Results" "Salesforce cases dropdown option"
    Then I should see the "Transcripts" "Salesforce cases dropdown option"
    Then I should see the "Turnitin" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Attendance & Absences" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "Absence" "Salesforce cases dropdown option"
    Then I should see the "Attendance record" "Salesforce cases dropdown option"
    Then I should see the "Name missing from class register" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Book an Appointment" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "Appointment with an Academic" "Salesforce cases dropdown option"
    Then I should see the "International Student Advice" "Salesforce cases dropdown option"
    Then I should see the "Personal Tutor" "Salesforce cases dropdown option"
    Then I should see the "Programme Support Officer" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Graduation and Certificates" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "Certificate not received" "Salesforce cases dropdown option"
    Then I should see the "Graduation Information" "Salesforce cases dropdown option"
    Then I should see the "Highest module mark certificate" "Salesforce cases dropdown option"
    Then I should see the "Professional Body Certificates" "Salesforce cases dropdown option"
    Then I should see the "Replacement BPP Certificates" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "ID Card" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "Lost" "Salesforce cases dropdown option"
    Then I should see the "Not Received" "Salesforce cases dropdown option"
    Then I should see the "Stolen" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "International Support" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "Book an appointment" "Salesforce cases dropdown option"
    Then I should see the "Short term study visa letters" "Salesforce cases dropdown option"
    Then I should see the "Incorrect visa conditions" "Salesforce cases dropdown option"
    Then I should see the "Lost Documents" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "IoS (Interruption of Studies)" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "Extension" "Salesforce cases dropdown option"
    Then I should see the "New" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Letter requests" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "Academic References" "Salesforce cases dropdown option"
    Then I should see the "Acceptance" "Salesforce cases dropdown option"
    Then I should see the "Authorised Leave" "Salesforce cases dropdown option"
    Then I should see the "Bank" "Salesforce cases dropdown option"
    Then I should see the "Confirmation of completion letter" "Salesforce cases dropdown option"
    Then I should see the "Council Tax" "Salesforce cases dropdown option"
    Then I should see the "Holiday" "Salesforce cases dropdown option"
    Then I should see the "Schengen" "Salesforce cases dropdown option"
    Then I should see the "Short term study visa letters" "Salesforce cases dropdown option"
    Then I should see the "Status Letter" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Lockers" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "Lost" "Salesforce cases dropdown option"
    Then I should see the "Other" "Salesforce cases dropdown option"
    Then I should see the "Returned" "Salesforce cases dropdown option"
    Then I should see the "Withheld Results" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Oyster Card" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "Other" "Salesforce cases dropdown option"
    Then I should see the "Why Not Approved" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Personal Details" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "Change of contact details" "Salesforce cases dropdown option"
    Then I should see the "Change of name" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Registration and enrolment" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "Exemptions" "Salesforce cases dropdown option"
    Then I should see the "International Query" "Salesforce cases dropdown option"
    Then I should see the "Missed induction" "Salesforce cases dropdown option"
    Then I should see the "Not Received Joining Instructions" "Salesforce cases dropdown option"
    Then I should see the "Pay my first instalment" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Timetable" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I should see the "Group number" "Salesforce cases dropdown option"
    Then I should see the "Missing or Incorrect" "Salesforce cases dropdown option"
    Then I should see the "Term dates" "Salesforce cases dropdown option"
    Then I click on the "Term dates" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Birmingham" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "Health" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "3" seconds
    And I should scroll to the "top" of the page
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

  Scenario: Create Assesments Registry Case
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Assessments" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "Appeals" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Doncaster" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "Law" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds

  Scenario: Create IOS Registry Case
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "IoS (Interruption of Studies)" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "Extension" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Doncaster" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "Law" "Salesforce cases dropdown option"
    And I click on the "IOS Form Received?" "Salesforce cases dropdown field"
    Then I click on the "Yes" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "3" seconds

  Scenario: Create Letter Production Registry Case
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Letter requests" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "Acceptance" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Doncaster" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "Law" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "3" seconds

  Scenario: Create Registration and Induction Registry Case
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Registration and enrolment" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "Missed induction" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Bristol" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "Law" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "3" seconds

  Scenario: Create Timetable Registry Case
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Timetable" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "Term dates" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Bristol" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "Law" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "3" seconds

  Scenario: Create Complaints Registry Case
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "School" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Complaint (Non-Uni)" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Manchester" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "Health" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "3" seconds

  Scenario: Create Business Account
    When I click on the "Account/home" "Salesforce navigation href links"
    And I wait for "2" seconds
    And I click on the "Salesforce New Case Button" button
    And I click on the "Business Development Account" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I set "AutoBusiness[FIRSTNAME]" text to the "Account Name" "Salesforce text field label"
    And I click on the "Client Category" "Salesforce dropdown field" by JS
    And I wait for "1" seconds
    And I click on the "Key Client" "Salesforce dropdown field option"
    And I click on the "Account Tax Category" "Salesforce dropdown field"
    Then I click on the "Domestic Business" "Salesforce dropdown field option"
    And I set "[PHONE]" text to the "Phone" "element by name"
    And I set "www.bpp.com" text to the "Website" "element by name"
    And I set "London" text to the "Head Office City" "Salesforce text field label"
    And I set "Automation 1" text to the "Head Office Address 1" "Salesforce text field label"
    And I set "W3H56" text to the "Head Office Postal Code" "Salesforce text field label"
    And I set "United Kingdom" text to the "Head Office Country" "Salesforce search field"
    And I wait for "1" seconds
    And I click on the "Kingdom" "option"
    And I click on the "Salesforce Account Creation Save button" element
    And I wait for "2" seconds

  Scenario: Create Business Opportunity
    Then I click on the "Salesforce Opportunities Quick Link Tab" element
    And I click on the "Salesforce Student Account Pages New button" button
    And I wait for "1" seconds
    #Then I click on the "Business Development" "Salesforce radiobutton"
    #Then I click on the "Next" "button"
    #Then I wait for "3" seconds
    And I set "AutoOpportunity[###]" text to the "Opportunity Name" "Salesforce text field label"
    And I set "1000" text to the "Amount" "Salesforce text field label"
    And I click on the "Status" "Salesforce dropdown field" by JS
    And I click on the "Prospecting" "Salesforce dropdown field option"
    And I set "31/01/2021" text to the "Close Date" "Salesforce date field"
    And I set "31/01/2021" text to the "Desired Start Date" "Salesforce date field"
    And I click on the "Type" "Salesforce dropdown field" by JS
    And I click on the "New Business: New Client" "Salesforce dropdown field option"
    And I click on the "Salesforce Account Creation Save button" element
    #And I should see the " was created." message

  Scenario: Create Business Opportunity CSA User
    Then I click on the "Salesforce Opportunities Quick Link Tab" element
    And I click on the "Salesforce Student Account Pages New button" button
    And I wait for "1" seconds
    Then I click on the "Business Development" "Salesforce radiobutton"
    Then I click on the "Next" "button"
    Then I wait for "3" seconds
    And I set "AutoOpportunity[###]" text to the "Opportunity Name" "Salesforce text field label"
    And I set "1000" text to the "Amount" "Salesforce text field label"
    And I click on the "Status" "Salesforce dropdown field" by JS
    And I click on the "Prospecting" "Salesforce dropdown field option"
    And I set "31/01/2021" text to the "Close Date" "Salesforce date field"
    And I set "31/01/2021" text to the "Desired Start Date" "Salesforce date field"
    And I click on the "Type" "Salesforce dropdown field" by JS
    And I click on the "New Business: New Client" "Salesforce dropdown field option"
    And I click on the "Salesforce Account Creation Save button" element

  Scenario: Add A Booking
    And I click on the "Salesforce New Booking" button
    And I fill the "Salesforce Booking Search Account" field with "EC_AUTO_LASTNAME"
    And I click on the "EC_AUTO_LASTNAME" "option"
    And I click on the "Salesforce Status Booking" element by JS
    And I click on the "Confirmed" "option"
    And I fill the "Salesforce Booking Search Instance" field with "MD_COMMON_VALIDDATA_SFCPQINSTANCENUMBER"
    And I click on the "MD_COMMON_VALIDDATA_SFCPQINSTANCENUMBER" "option"
    And I click on the "Salesforce Save Booking Button" element
    And I wait for "2" seconds
    Then Browser performs "REFRESH" command
    And I click on the "Salesforce Account Related Tab" element
    And I wait for "5" seconds
    And I capture text data "Salesforce Booking Number Data Field" as "EC_BOOKING" variable
    And I capture current URL as "EC_BOOKING_URL" variable
    And I wait for "2" seconds

  Scenario: Add A Booking Sales User
    And I click on the "Salesforce New Booking" button
    And I fill the "Salesforce Booking Search Account" field with "EC_AUTO_LASTNAME"
    And I click on the "EC_AUTO_LASTNAME" "option"
    And I click on the "Salesforce Status Booking" element by JS
    And I click on the "Confirmed" "option"
    And I fill the "Salesforce Booking Search Instance" field with "MD_COMMON_VALIDDATA_SFCPQINSTANCENUMBER"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Booking Search Instance"
    Then I wait for "1" seconds
    And I click on the "I-2524" "text contained in A element"
    And I click on the "Salesforce Save Booking Button" element
    And I wait for "2" seconds
    Then Browser performs "REFRESH" command
    And I click on the "Salesforce Account Related Tab" element
    And I wait for "5" seconds
    And I capture text data "Salesforce Booking Number Data Field" as "EC_BOOKING" variable
    And I capture current URL as "EC_BOOKING_URL" variable
    And I wait for "2" seconds

  Scenario: Create Address Business Account
    And I click on the "Salesforce Addresses Quick Link Tab" button by JS
    And I wait for "1" seconds
    And I click on the "Salesforce Student Account Pages New button" button
    And I click on the "Address Type" "Salesforce dropdown field" by JS
    And I click on the "Mailing" "option" by JS
    And I set "KW_AUTO_STREET" text to the "Address Line 1" "Salesforce text field label"
    And I set "London" text to the "City" "Salesforce text field label"
    And I set "KW_AUTO_ZIPCODE|#####" text to the "Zip/Postal Code" "Salesforce text field label"
    And I click on the "Salesforce Address Primary Delivery" button by JS
    And I set "United Kingdom" text to the "Country" "Salesforce search field"
    Then I wait for "2" seconds
    And I click on the "Kingdom" "option" by JS
    And I click on the "Salesforce Account Creation Save button" element
    And I wait for "3" seconds
    And I click on the "Salesforce Business Account Link Address Page" element by JS