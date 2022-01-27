@Reusable
Feature: BuildEmpire

  Scenario: Register New Student Account
    Given I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    Then I click on the "Direct App Register Link on Login Page" button
    And I set "Auto[FIRSTNAME]" text to the "First name" "Build Empire text field"
    And I set "Auto[LASTNAME]" text to the "Surname" "Build Empire text field"
    And I set "Auto[EMAIL-HARAKIRI]" text to the "Email" "Build Empire text field"
    And I set "[PHONE-0913]" text to the "Telephone number" "Build Empire text field"
    Then I remember "A@polloGlobal2020" text as "EC_PASSWORD" variable
    And I set "EC_PASSWORD" text to the "Password" "Build Empire text field"
    And I click on the "Direct App I Am Happy To Receive Information" button
    Then I click on the "Direct App Register" button
    And I wait for "3" seconds
    And I should see the "Thanks for registering, please verify your email address." "message"

  Scenario: Log In to Hub as Student
    Given I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And I set "EC_AUTO_EMAIL" text to the "Email" "Build Empire text field"
    And I set "EC_PASSWORD" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button by JS
    And I wait for "3" seconds
    And I should see the "Timeline and Dashboard" "element"

  Scenario: Log In to Hub as Admin
    Given I am on "MD_COMMON_LINKS_BUILDEMPIREADMINURL" URL
    And I fill the "Direct App Admin Email" field with "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINUSER"
    And I fill the "Direct App Admin Password" field with "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINPASSWORD"
    Then I click on the "Direct App Login Button" button
    And I should see the "Direct App Admin Apps Top Link" element

  Scenario: Create Scholarships Application
    Given I click on the "Direct App My Applications Left Menu Link" button by JS
    And I hover over the "Direct App What Are You Applying For Dropdown" button
    And I click on the "Direct App What Are You Applying For Dropdown" element
    Then I wait for "1" seconds
    Then I click on the "BPP University Scholarships" "Build Empire application type"
    And I wait for "2" seconds
    And I hover over the "Direct App Scholarship Dropdown" button
    And I click on the "Direct App Scholarship Dropdown" element
    Then I click on the "Career Guarantee Scholarship" "Build Empire application type"
    #And I hover over the "Direct App Programme Dropdown" button
    #And I click on the "Direct App Programme Dropdown" element
    #Then I wait for "1" seconds
    #Then I click on the "Legal Practice Course (LPC)" "Build Empire application type"
    And I click on the "Direct App Create Application" button

  Scenario: Submit Application Hub
    Given I click on the "Direct App Submit Application" button
    And I click on the "Direct App Confirm Application Radiobutton" button
    And I click on the "Direct App Submit Application on Confirmation Page" button
    Then I validate text "CONTAINS=100" to be displayed for "Direct App Application Progress Percentage" element

  Scenario: Log Out from Hub Student
    Given I click on the "Direct App User Icon Menu" button
    And I click on the "Direct App Logout" link
    And I wait for "1" seconds

  Scenario: Log Out from Hub Admin
    Given I click on the "Direct App User Icon Menu Admin" button
    And I click on the "Direct App Admin Logout" link

  Scenario: Create Academic Appeals Application
    Given I click on the "Direct App My Applications Left Menu Link" button by JS
    And I hover over the "Direct App What Are You Applying For Dropdown" button
    And I click on the "Direct App What Are You Applying For Dropdown" element
    And I wait for "1" seconds
    Then I click on the "BPP University Academic Appeals" "Build Empire application type"
    And I click on the "Direct App Create Application" button

  Scenario: Accept Academic Appeals As Admin
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Then I click on the "Academic Appeals" "Build Empire admin applications tab"
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I click on the "Begin review" "Build Empire admin applications tab"
    Then I click on the "Submit" "button"

  Scenario: Create Mitigating Circumstances Application
    Given I click on the "Direct App My Applications Left Menu Link" button by JS
    And I hover over the "Direct App What Are You Applying For Dropdown" button
    And I click on the "Direct App What Are You Applying For Dropdown" element
    Then I wait for "1" seconds
    Then I click on the "BPP University Mitigating Circumstances" "Build Empire application type"
    And I wait for "1" seconds
    And I click on the "Direct App Create Application" button
    Then I wait for "1" seconds

  Scenario: Accept Mitigating Circumstances As Admin
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Then I click on the "Mitigating Circumstances" "Build Empire admin applications tab"
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I click on the "Begin review" "Build Empire admin applications tab"
    Then I click on the "Submit" "button"
    Then I validate text "CONTAINS=Accepted" to be displayed for "Direct App Admin Status Changed for Mitigating Circumstances" element

  Scenario: Reject Mitigating Circumstances As Admin
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Then I click on the "Mitigating Circumstances" "Build Empire admin applications tab"
    And I select "Submitted" from "Direct App Admin Assesment Status" element
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I click on the "Begin review" "Build Empire admin applications tab"
    And I select "Reject" from "Direct App Admin New Status Dropdown" element
    Then I click on the "Submit" "button"
    Then I validate text "CONTAINS=Rejected" to be displayed for "Direct App Admin Status Changed for Mitigating Circumstances" element

  Scenario: Student Validates Application Status Changed
    Given I click on the "Direct App My Applications Left Menu Link" button
    Then I validate text "CONTAINS=Your application was successful." to be displayed for "Direct App Validate As Student Application Accepted" element

  Scenario: Put in Review Mitigating Circumstances
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Then I click on the "Mitigating Circumstances" "Build Empire admin applications tab"
    And I select "Rejected" from "Direct App Admin Assesment Status" element
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I click on the "Submit" "button"
    Then I validate text "CONTAINS=Full application in review" to be displayed for "Direct App Admin Status Changed for Mitigating Circumstances" element

  Scenario: Complete Mitigating Circumstances
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Direct App Final Award In Relation To Programme" button
    And I click on the "Direct App Ten Working Days To Submit Application Yes" button
    And I wait for "1" seconds
    And I click on the "Direct App Next" button
    And I fill the "Diret App Phone Number" field with "EC_PHONE"
    And I click on the "Direct App Country Dropdown" button
    And I click on the "Direct App Country Dropdown UK Option" button
    And I set "Address 1" text to the "Address Line 1*" "Build Empire text field"
    And I set "Address 1" text to the "Address Line 2" "Build Empire text field"
    And I set "London" text to the "Town/City*" "Build Empire text field"
    And I fill the "Diret App Postal Code" field with "12345"
    Then I remember "KW_AUTO_DOB|DD/MM/YYYY_21" text as "EC_DOB" variable
    And I fill the "Direct App DOB" field with "EC_DOB"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App DOB"
    And I set "London" text to the "Town/City*" "Build Empire text field"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "1" seconds
    And I click on the "Direct App Next" button
    And I set "12345" text to the "SRN" "Build Empire course details element"
    And I set "Auto Location" text to the "Location" "Build Empire course details element"
    And I set "Automation" text to the "Programme" "Build Empire course details element"
    And I set "Automation" text to the "Programme Leader" "Build Empire course details element"
    And I click on the "Direct App Course Details Mode" element
    And I click on the "Direct App Course Details Mode Part One" element
    And I fill the "Direct App Course Details Start Date" field with "12/2020"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Course Details Start Date"
    And I click on the "Direct App Course Details School" element
    And I click on the "Direct App Course Details School Law" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    Then I wait for "1" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Add Assesment" button
    And I fill the "Direct App Assesment Title" field with "AutoTitle"
    And I click on the "Direct App Assesment Type" button
    And I click on the "Direct App Assesment Exam Type Option" button
    And I click on the "Direct App Assesment Attempt Number" button
    And I click on the "Direct App Assesment Attempt Number Option Two" button
    And I click on the "Direct App Sit Assesment Yes" button
    And I fill the "Direct App Assesment Date" field with "12/12/2020"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Assesment Date"
    And I click on the "Direct App Mitigating Checkbox If Application Is Successful" button
    And I fill the "Direct App Assesment Examination Venue" field with "Venue"
    And I click on the "Direct App Did You Apply For Deferral" button
    Then I click on the "Direct App Sit Assessment No" element
    And I shouldn't see the "Direct App Mitigating Checkbox If Application Is Successful" "element"
    And I click on the "Direct App Assesment Type" button
    And I click on the "Direct App Assessment Coursebook Type Option" button
    And I fill the "Direct App Assessment Handout Date" field with "12/12/2020"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Assessment Handout Date"
    And I should see the "Direct App Assessment Not Submitted Coursebook Please Note Message" element
    Then I validate text "CONTAINS=As you have not submitted your coursework(s), the sit(s) will be disregarded from your record and, if eligible" to be displayed for "Direct App Assessment Not Submitted Coursebook Please Note Message" element
    And I click on the "Direct App Submit Coursebook Yes" button
    Then I validate text "CONTAINS=PLEASE NOTE: If the application is granted" to be displayed for "Direct App Assessment Not Submitted Coursebook Please Note Message" element
    And I click on the "I confirm that I wish to have the assessment listed disregarded" "Build Empire radiobutton" by JS
    And I click on the "Direct App Add Filled Assesment" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "1" seconds
    And I click on the "Direct App Next" button
    Then I upload "directApp.pdf" file to "Direct App Upload File" element
    And I fill the "Direct App Uploaded File Description" field with "Test"
    And I fill the "Direct App Details Text Area  Line Manager" field with "Automation Testing"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "1" seconds
    And I click on the "Direct App Save And Return" button

  Scenario: Create Bespoke Scotland Application
    Given I click on the "Direct App My Applications Left Menu Link" link by JS
    And I wait for "2" seconds
    And I hover over the "Direct App What Are You Applying For Dropdown" button
    And I click on the "Direct App What Are You Applying For Dropdown" element
    And I wait for "1" seconds
    Then I click on the "Professional Career Development Programmes Scotland" "Build Empire application type"
    And I wait for "1" seconds
    And I hover over the "Direct App Programmes Programm Dropdown" button
    And I click on the "Direct App Programmes Programm Dropdown" element
    Then I wait for "1" seconds
    Then I click on the "Chartered Manager" "Build Empire application type"
    And I wait for "1" seconds
    And I click on the "Direct App Create Application" button
    Then I wait for "1" seconds

  Scenario: Pre Approve Apprenticeships Application As Admin
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Given I click on the "Direct App Admin Apprenticeships Tab" link by JS
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I click on the "Begin review" "Build Empire admin applications tab"
    Then I click on the "Direct App Admin Submit Apprenticeships" button
    Then I validate text "CONTAINS=Pre approved" to be displayed for "Direct App Admin Status Changed for Apprenticeships" element

  Scenario: Complete Bespoke Scotland Application
    Given I click on the "I Understand" "button"
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "You are UK based" "Build Empire bespoke Scotland eligibility"
    And I click on the "The programme addresses" "Build Empire bespoke Scotland eligibility"
    And I click on the "Your line manager is willing" "Build Empire bespoke Scotland eligibility"
    And I click on the "You are working at least 16 hours per week" "Build Empire bespoke Scotland eligibility"
    And I click on the "You are applying for a programme" "Build Empire bespoke Scotland eligibility"
    And I click on the "You confirm that you have discussed" "Build Empire bespoke Scotland eligibility"
    And I click on the "You confirm that you meet the programme eligibility" "Build Empire bespoke Scotland eligibility"
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I fill the "Direct App Insurance Number" field with "12345"
    And I click on the "Direct App Country Dropdown" button
    And I click on the "Direct App Country Dropdown UK Option" button
    And I fill the "Diret App Phone Number" field with "EC_PHONE"
    And I set "Address 1" text to the "Address Line 1*" "Build Empire text field"
    And I set "Address 2" text to the "Address Line 2" "Build Empire text field"
    And I fill the "Diret App Postal Code" field with "12345"
    Then I remember "KW_AUTO_DOB|DD/MM/YYYY_21" text as "EC_DOB" variable
    And I fill the "Direct App DOB" field with "EC_DOB"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App DOB"
    And I set "London" text to the "Town/City*" "Build Empire text field"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Country of birth" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Country of nationality" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Country of domicile/permanent residency" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Is English your first language?" "Build Empire nationality dropdown"
    And I click on the "Yes" "Build Empire nationality option"
    And I click on the "Direct App Nationality No Visa" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Add Qualification" button
    And I click on the "Direct App Country of Study Dropdown" button
    And I click on the "United Kingdom" "Build Empire qualification option"
    And I click on the "Direct App Education Type Degree Radiobutton" button
    And I click on the "Direct App Qualification Title Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Foundation degree"
    Then I click on the "Foundation degree" "Build Empire application type"
    And I click on the "Direct App Subject Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Applied Law (QCF)"
    Then I click on the "Applied Law (QCF)" "Build Empire application type"
    And I click on the "Direct App Awarding Institution Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Zaskin College"
    Then I click on the "Zaskin College" "Build Empire application type"
    And I fill the "Direct App Year Completed" field with "11/11/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Year Completed"
    And I fill the "Direct App Grade" field with "AutoGrade"
    And I fill the "Direct App Examining Body" field with "AutoBody"
    And I click on the "Direct App Add Assesment" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I fill the "Direct App Job Title" field with "Job Title"
    And I set "32" text to the "contracted working hours?" "Build Empire employment element"
    And I set "Manager Name" text to the "Manager First Name" "Build Empire employment element"
    And I set "Manager Lastname" text to the "Manager Last Name" "Build Empire employment element"
    And I set "AutoTitle" text to the "Manager Job Title" "Build Empire employment element"
    And I set "automation11@mail.com" text to the "Manager Email" "Build Empire employment element"
    And I fill the "Direct App Line Manager Telephone" field with "[PHONE-0913]"
    And I set "Address 1" text to the "Address Line 1" "Build Empire employment element"
    And I set "London" text to the "Company/Employer City" "Build Empire employment element"
    And I set "Employee" text to the "Employee" "Build Empire employment element"
    And I set "Division" text to the "Division" "Build Empire employment element"
    And I set "Subdivision" text to the "Subdivision" "Build Empire employment element"
    And I click on the "Direct App Company Health And Safety" element
    And I fill the "Direct App When You Start At Company" field with "05/05/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App When You Start At Company"
    And I click on the "Direct App Company Country Dropdown" element
    And I click on the "Direct App Company Country Dropdown UK Option" element
    And I set "12345" text to the "Postcode" "Build Empire employment element"
    And I click on the "Direct App Mark As Complete Checkbox" button
    Then I wait for "1" seconds
    And I click on the "Direct App Save And Return" button

  Scenario: Attach Automation Line Manager
    Given I click on the "Direct App Admin Line Manager Edit" button
    And I select "Automation" from "Direct App Admin Company Dropdown" element
    And I click on the "Direct App Admin Line Manager Dropdown" button
    And I fill the "Direct App Admin Attach Line Manger Text Field" field with "idlgfcvgdh@harakirimail.com"
    And I click on the "Automation Line Manager 2" "Build Empire line manager option"
    Then I click on the "Attach" "button"

  Scenario: Complete Bespoke Sctotland Application After Review
    Given I click on the "Direct App My Applications Left Menu Link" link by JS
    And I wait for "3" seconds
    Then I validate text "CONTAINS=82" to be displayed for "Direct App Application Progress Percentage After Review" element
    Then I click on the "Direct App Go To Application" button
    And I click on the "documents" "Build Empire application section"
    And I click on the "Download Application of" "Build Empire application section"
    Then I switch to window with index "1"
    Then I upload "directApp.pdf" file to "Direct App Upload Other Documents" element
    Then I upload "application_pack_document.pdf" file to "Direct App Upload Job Role Documents" element
    And I wait for "3" seconds
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save And Return" button

  Scenario: Line Manager Review Bespoke Scotland
    Given I click on the "Direct App My Approvals Tab" link by JS
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Review Application" button
    And I click on the "Line Manager Review" "Build Empire application section"
    And I click on the "Direct App Line Manager Agree To Support Amount" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I wait for "1" seconds
    And Browser performs "Refresh" command
    And I wait for "10" seconds
    And I click on the "Application documents" "Build Empire application section"
    #And I click on the "Download Application of" "Build Empire application section"
    #Then I switch to window with index "0"
    Then I upload "application_pack_document.pdf" file to "Direct App Upload Job Role Documents" element
    And I wait for "2" seconds
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I click on the "Submit Approval" "button"
    And I click on the "OK" "button"

  Scenario: Accept Application As Admin
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Given I click on the "Direct App Admin Apprenticeships Tab" link by JS
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I click on the "Begin full application review" "Build Empire application section"
    Then I click on the "Submit" "button"
    Then I validate text "Accepted" to be displayed for "Direct App Admin Status Changed for Apprenticeships" element

  Scenario: Validate Successful Application As Student
    Given I click on the "Direct App My Applications Left Menu Link" link by JS
    And I wait for "2" seconds
    And I should see the "Direct App Application Accepted Message" element

  Scenario: Create Bespoke England Application
    Given I click on the "Direct App My Applications Left Menu Link" link by JS
    And I wait for "2" seconds
    And I hover over the "Direct App What Are You Applying For Dropdown" button
    And I click on the "Direct App What Are You Applying For Dropdown" element
    And I wait for "2" seconds
    Then I click on the "Professional Career Development Programmes England" "Build Empire application type"
    And I hover over the "Direct App Programmes Programm Dropdown" button
    And I click on the "Direct App Programmes Programm Dropdown" element
    And I wait for "1" seconds
    Then I click on the "Financial Services Professional" "Build Empire application type"
    And I click on the "Direct App Create Application" button
    Then I wait for "1" seconds

  Scenario: Complete Bespoke England Application
    Given I click on the "I Understand" "button"
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Are you aged 16" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you have a husband," "Build Empire bespoke Scotland eligibility"
    And I click on the "Direct App Are You Working At Least 16 Hours" element
    And I click on the "Direct App Right To Work in England?" element
    And I click on the "Direct App Bespoke Enrolled On Another Apprenticeship No" element
    And I click on the "Direct App Do You Spend 50 Percent" element
    And I click on the "Do you confirm that your job is" "Build Empire bespoke Scotland eligibility"
    And I click on the "Are you applying for a programme" "Build Empire bespoke Scotland eligibility"
    And I click on the "Direct App Are You In Employment" element
    And I click on the "Do you confirm that you have discussed" "Build Empire bespoke Scotland eligibility"
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I fill the "Direct App Insurance Number" field with "12345"
    And I click on the "Direct App Country Dropdown" button
    And I click on the "Direct App Country Dropdown UK Option" button
    And I fill the "Diret App Phone Number" field with "EC_PHONE"
    And I set "Address 1" text to the "Address Line 1*" "Build Empire text field"
    And I set "Address 2" text to the "Address Line 2" "Build Empire text field"
    And I fill the "Diret App Postal Code" field with "12345"
    Then I remember "KW_AUTO_DOB|DD/MM/YYYY_21" text as "EC_DOB" variable
    And I fill the "Direct App DOB" field with "EC_DOB"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App DOB"
    And I set "London" text to the "Town/City*" "Build Empire text field"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Additional Info Aged 19" element
    And I wait for "1" seconds
    And I click on the "employment status?:" "Build Empire nationality dropdown"
    And I click on the "I have work experience in this sector of up to 2 years" "Build Empire nationality option"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Diret App Gender Dropdown" element
    And I click on the "Diret App Gender Not To Say" element
    #And I click on the "Diret App Gender At Birth Dropdown" element
    #And I click on the "Diret App Gender At Birth Yes" element
    And I click on the "Diret App Ethnicity Dropdown" element
    And I click on the "Diret App Ethnicity White And Black African" element
    #And I click on the "Diret App Religion Dropdown" element
    #And I click on the "Diret App Religion Chrisitan" element
    #And I click on the "Diret App Sexual Orientation Dropdown" element
    #And I click on the "Diret App Sexual Orientation Heterosexual" element
    And I click on the "Diret App Learning Disability No" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "1" seconds
    And I click on the "Direct App Next" button
    And I click on the "Country of birth" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Country of nationality" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Country of domicile/permanent residency" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Is English your first language?" "Build Empire nationality dropdown"
    And I click on the "Yes" "Build Empire nationality option"
    And I click on the "Direct App Nationality No Visa" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Add Qualification" button
    And I click on the "Direct App Country of Study Dropdown" button
    And I click on the "United Kingdom" "Build Empire qualification option"
    And I click on the "Direct App Education Type Degree Radiobutton" button
    And I click on the "Direct App Qualification Title Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Foundation degree"
    Then I click on the "Foundation degree" "Build Empire application type"
    And I click on the "Direct App Subject Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Applied Law (QCF)"
    Then I click on the "Applied Law (QCF)" "Build Empire application type"
    And I click on the "Direct App Awarding Institution Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Zaskin College"
    Then I click on the "Zaskin College" "Build Empire application type"
    And I fill the "Direct App Year Completed" field with "11/11/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Year Completed"
    And I fill the "Direct App Grade" field with "AutoGrade"
    And I fill the "Direct App Examining Body" field with "AutoBody"
    And I click on the "Direct App Add Assesment" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "1" seconds
    And I click on the "Direct App Next" button
    And I fill the "Direct App Job Title" field with "Job Title"
    And I set "32" text to the "contracted working hours?" "Build Empire employment element"
    And I set "Manager Name" text to the "Manager First Name" "Build Empire employment element"
    And I set "Manager Lastname" text to the "Manager Last Name" "Build Empire employment element"
    And I set "AutoTitle" text to the "Manager Job Title" "Build Empire employment element"
    And I set "automation11@mail.com" text to the "Manager Email" "Build Empire employment element"
    And I fill the "Direct App Line Manager Telephone" field with "[PHONE-0913]"
    And I set "Address 1" text to the "Address Line 1" "Build Empire employment element"
    And I set "London" text to the "Company/Employer City" "Build Empire employment element"
    And I set "Employee" text to the "Employee" "Build Empire employment element"
    And I click on the "Direct App Company Division Dropdown" element
    Then I click on the "NatWest Markets" "Build Empire dropdown option"
    And I set "Subdivision" text to the "Subdivision" "Build Empire employment element"
    And I click on the "Direct App Company Health And Safety" element
    And I fill the "Direct App When You Start At Company" field with "05/05/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App When You Start At Company"
    And I click on the "Direct App Company Country Dropdown" element
    And I click on the "Direct App Company Country Dropdown UK Option" element
    And I set "12345" text to the "Postcode" "Build Empire employment element"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "1" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Privacy Notice By Email Bespoke England" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save And Return" button

  Scenario: Line Manager Review Bespoke England
    Given I click on the "Direct App My Approvals Tab" link by JS
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Review Application" button
    And I click on the "Line Manager Review" "Build Empire application section"
    Then I fill the "Direct App Details Text Area  Line Manager" field with "Automation"
    And I click on the "Direct App Line Manager Agree To Support Amount" element
    And I click on the "Direct App Line Manager New Role" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I wait for "1" seconds
    And Browser performs "Refresh" command
    And I click on the "Application documents" "Build Empire application section"
    And I click on the "Download Application of" "Build Empire application section"
    Then I switch to window with index "1"
    Then I upload "application_pack_document.pdf" file to "Direct App Apprenticeships Upload Documents" element
    Then I upload "application_pack_document.pdf" file to "Direct App Upload Job Role Documents" element
    And I wait for "2" seconds
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I click on the "Submit Approval" "button"
    And I click on the "OK" "button"

  Scenario: Complete Apprenticeships Application After Review
    Given I click on the "Direct App My Applications Left Menu Link" link by JS
    And I wait for "2" seconds
    Then I validate text "CONTAINS=88" to be displayed for "Direct App Application Progress Percentage After Review" element
    Then I click on the "Direct App Go To Application" button
    And I click on the "documents" "Build Empire application section"
    And I click on the "Download Application of" "Build Empire application section"
    Then I switch to window with index "1"
    Then I upload "directApp.pdf" file to "Direct App Apprenticeships Upload Documents" element
    Then I upload "application_pack_document.pdf" file to "Direct App Upload Job Role Documents" element
    And I wait for "3" seconds
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save And Return" button

  Scenario: Mitigating Circumstances Admin Status Change
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Then I click on the "Mitigating Circumstances" "Build Empire admin applications tab"
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I click on the "Begin review" "Build Empire admin applications tab"
    Then I validate text "In review" to be displayed for "Direct App Admin Status Changed for Mitigating Circumstances" element
    And I select "Referral Panel" from "Direct App Admin New Status Dropdown" element
    And I fill the "Direct App Admin Reason" field with "Reason Referral Panel"
    Then I click on the "Submit" "button"
    Then I validate text "Referral panel" to be displayed for "Direct App Admin Status Changed for Mitigating Circumstances" element
    And I select "Referral ODP" from "Direct App Admin New Status Dropdown" element
    And I fill the "Direct App Admin Reason" field with "Reason Referral ODP"
    Then I click on the "Submit" "button"
    Then I validate text "Referral ODP" to be displayed for "Direct App Admin Status Changed for Mitigating Circumstances" element
    And I select "Part Accept" from "Direct App Admin New Status Dropdown" element
    And I fill the "Direct App Admin Reason" field with "Reason Part Accept"
    Then I click on the "Submit" "button"
    Then I validate text "Part accepted" to be displayed for "Direct App Admin Status Changed for Mitigating Circumstances" element
    And I fill the "Direct App Admin Reason" field with "Reason Full Application In Review Second"
    Then I click on the "Submit" "button"
    Then I validate text "Full application in review" to be displayed for "Direct App Admin Status Changed for Mitigating Circumstances" element
    And I select "Accept" from "Direct App Admin New Status Dropdown" element
    And I fill the "Direct App Admin Reason" field with "Reason Accept"
    Then I click on the "Submit" "button"
    Then I validate text "Accepted" to be displayed for "Direct App Admin Status Changed for Mitigating Circumstances" element
    And I fill the "Direct App Admin Reason" field with "Reason Full Application In Review Second"
    Then I click on the "Submit" "button"
    Then I validate text "Full application in review" to be displayed for "Direct App Admin Status Changed for Mitigating Circumstances" element
    And I select "Reject" from "Direct App Admin New Status Dropdown" element
    And I fill the "Direct App Admin Reason" field with "Reason Reject"
    Then I click on the "Submit" "button"
    Then I validate text "Rejected" to be displayed for "Direct App Admin Status Changed for Mitigating Circumstances" element

  Scenario: Mitigating Circumstances Admin Status Validation
    Then I validate text "User start" to be displayed for "Direct App Admin Started Status Reason" element
    Then I validate text "User submit" to be displayed for "Direct App Admin Submitted Status Reason" element
    Then I validate text "User begin review" to be displayed for "Direct App Admin In Review Status Reason" element
    Then I validate text "Reason Referral Panel" to be displayed for "Direct App Admin Referral Panel Reason" element
    Then I validate text "Reason Referral ODP" to be displayed for "Direct App Admin Referral ODP Reason" element
    Then I validate text "Reason Part Accept" to be displayed for "Direct App Admin Part Accepted Reason" element
    Then I validate text "Reason Full Application in Review Second" to be displayed for "Direct App Admin Full Application Reason" element
    Then I validate text "Reason Accept" to be displayed for "Direct App Admin Accepted Status Reason" element
    Then I validate text "Reason Full Application in Review Second" to be displayed for "Direct App Admin Full Application Status Second Reason" element
    Then I validate text "Reason Reject" to be displayed for "Direct App Admin Rejected Status Reason" element

  Scenario: Edit Hub Student
    Given I click on the "Direct App User Icon Menu" button by JS
    And I click on the "Direct App Account settings" link by JS
    And I wait for "1" seconds

  Scenario: Create Programmes Application
    Given I click on the "Direct App My Applications Left Menu Link" button by JS
    And I wait for "1" seconds
    And I hover over the "Direct App What Are You Applying For Dropdown" button
    And I click on the "Direct App What Are You Applying For Dropdown" element
    Then I wait for "1" seconds
    Then I click on the "BPP University Programmes" "Build Empire application type"
    And I hover over the "Direct App Programmes Programm Dropdown" button
    And I click on the "Direct App Programmes Programm Dropdown" element
    Then I wait for "1" seconds
    Then I click on the "Build Empire Programmes Nursing Programme" element
    And I hover over the "Direct App Location Dropdown" button
    And I click on the "Direct App Location Dropdown" element
    Then I wait for "1" seconds
    Then I click on the "Online GDL" "Build Empire application type"
    And I hover over the "Direct App Start Date Application Dropdown" button
    And I click on the "Direct App Start Date Application Dropdown" element
    And I wait for "1" seconds
    Then I click on the "Full time- Aug-2020" "Build Empire application type"
    And I click on the "Direct App Create Application" button
    Then I wait for "1" seconds

  Scenario: Create Professional Apprenticeships Application Chartered Manager
    Given I click on the "Direct App My Applications Left Menu Link" link by JS
    And I hover over the "Direct App What Are You Applying For Dropdown" button
    And I click on the "Direct App What Are You Applying For Dropdown" element
    And I wait for "2" seconds
    Then I click on the "BPP Professional Apprenticeships" "Build Empire application type"
    And I wait for "2" seconds
    And I hover over the "Direct App Programmes Programm Dropdown" button
    And I click on the "Direct App Programmes Programm Dropdown" element
    And I wait for "1" seconds
    Then I click on the "Chartered Manager Degree Apprenticeship" "Build Empire application type"
    And I hover over the "Direct App Location Dropdown" button
    And I click on the "Direct App Location Dropdown" element
    And I wait for "2" seconds
    Then I click on the "Scotland" "Build Empire application type"
    And I click on the "Direct App Create Application" button
    Then I wait for "1" seconds

  Scenario: Complete Professional Apprenticeships Application Chartered Manager
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Are you aged over 15" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you have a husband, wife," "Build Empire bespoke Scotland eligibility"
    And I click on the "Direct App Right To Work in England?" element
    And I click on the "Direct App Do You Spend 50 Percent" element
    And I click on the "Direct App Bespoke Enrolled On Another Apprenticeship No" element
    And I click on the "Direct App Are You In Employment" element
    And I click on the "Direct App Are You Working At Least 16 Hours" element
    And I click on the "Are you applying for a programme" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you confirm that your job is a new" "Build Empire bespoke Scotland eligibility"
    And I click on the "You confirm that you have discussed" "Build Empire bespoke Scotland eligibility"
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I fill the "Direct App Insurance Number" field with "12345"
    And I click on the "Direct App Country Dropdown" button
    And I click on the "Direct App Country Dropdown UK Option" button
    And I fill the "Diret App Phone Number" field with "EC_PHONE"
    And I set "Address 1" text to the "Address Line 1*" "Build Empire text field"
    And I set "Address 2" text to the "Address Line 2" "Build Empire text field"
    And I fill the "Diret App Postal Code" field with "12345"
    Then I remember "KW_AUTO_DOB|DD/MM/YYYY_21" text as "EC_DOB" variable
    And I fill the "Direct App DOB" field with "EC_DOB"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App DOB"
    And I set "London" text to the "Town/City*" "Build Empire text field"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Additional Info Aged 19" element
    And I click on the "employment status?:" "Build Empire nationality dropdown"
    And I click on the "I have work experience in this sector of up to 2 years" "Build Empire nationality option"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    Then I click on the "Direct App Scholarship Add" button
    And I set "AutomationTest" text to the "Kin/Emergency" "Build Empire emergency field"
    And I set "AutomationTest" text to the "What is your relationship with this person?" "Build Empire emergency field"
    Then I fill the "Direct App Line Manager Telephone" field with "09138333731"
    And I fill the "Direct App Admin Email" field with "automation111@mailinator.com"
    Then I click on the "Direct App Scholarship Add" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Diret App Gender Dropdown" element
    And I click on the "Diret App Gender Not To Say" element
    And I click on the "Diret App Gender At Birth Dropdown" element
    And I click on the "Diret App Gender At Birth Yes" element
    And I click on the "Diret App Ethnicity Dropdown" element
    And I click on the "Diret App Ethnicity White And Black African" element
    And I click on the "Diret App Religion Dropdown" element
    And I click on the "Diret App Religion Chrisitan" element
    And I click on the "Diret App Sexual Orientation Dropdown" element
    And I click on the "Diret App Sexual Orientation Heterosexual" element
    And I click on the "Diret App Learning Disability No" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Country of birth" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Country of nationality" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Country of domicile/permanent residency" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Is English your first language?" "Build Empire nationality dropdown"
    And I click on the "Yes" "Build Empire nationality option"
    And I click on the "Direct App Nationality No Visa" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Add Qualification" button
    And I click on the "Direct App Country of Study Dropdown" button
    And I click on the "United Kingdom" "Build Empire qualification option"
    And I click on the "Direct App Education Type Degree Radiobutton" button
    And I click on the "Direct App Qualification Title Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Foundation degree"
    Then I click on the "Foundation degree" "Build Empire application type"
    And I click on the "Direct App Subject Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Applied Law (QCF)"
    Then I click on the "Applied Law (QCF)" "Build Empire application type"
    And I click on the "Direct App Awarding Institution Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Zaskin College"
    Then I click on the "Zaskin College" "Build Empire application type"
    And I fill the "Direct App Year Completed" field with "11/11/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Year Completed"
    And I fill the "Direct App Grade" field with "AutoGrade"
    And I fill the "Direct App Examining Body" field with "AutoBody"
    And I click on the "Direct App Add Assesment" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I fill the "Direct App Job Title" field with "Job Title"
    And I set "32" text to the "contracted working hours?" "Build Empire employment element"
    And I set "Manager Name" text to the "Manager First Name" "Build Empire employment element"
    And I set "Manager Lastname" text to the "Manager Last Name" "Build Empire employment element"
    And I set "AutoTitle" text to the "Manager Job Title" "Build Empire employment element"
    And I set "automation11@mail.com" text to the "Manager Email" "Build Empire employment element"
    And I fill the "Direct App Line Manager Telephone" field with "[PHONE-0913]"
    And I set "Address 1" text to the "Address Line 1" "Build Empire employment element"
    And I set "London" text to the "Company/Employer City" "Build Empire employment element"
    And I set "Employee" text to the "Company/Employer Name" "Build Empire employment element"
    And I click on the "Direct App Company Health And Safety" element
    And I fill the "Direct App When You Start At Company" field with "05/05/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App When You Start At Company"
    And I click on the "Direct App Company Country Dropdown" element
    And I click on the "Direct App Company Country Dropdown UK Option" element
    And I set "12345" text to the "Postcode" "Build Empire employment element"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Privacy Notice By Email" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    Then I wait for "1" seconds
    And I click on the "Direct App Save And Return" button

  Scenario: Line Manager Review Apprenticeships
    Given I click on the "Direct App My Approvals Tab" link by JS
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Review Application" button
    And I click on the "Line Manager Review" "Build Empire application section"
    Then I fill the "Direct App Line Manager End Point Assessment" field with "Automation"
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Agree To Support Amount" element
    And I click on the "Direct App Line Manager New Role" button
    Then I click on the "I confirm that my organisation employs fewer than 50 people" "Build Empire checkbox"
    Then I click on the "I confirm that I understand it is my requirement to reserve" "Build Empire checkbox"
    Then I fill the "Direct App Details Text Area  Line Manager" field with "Automation"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Next" button
    And I click on the "Direct App Line Manager Review Health And Safety Checkbox" button
    And I click on the "Direct App Save Review And Next" button
    #And I click on the "Direct App Save Review And Back" button
    #And I wait for "1" seconds
    #Then Browser performs "REFRESH" command
    And I wait for "3" seconds
    #And I click on the "Application documents" "Build Empire application section"
    And I click on the "Download Application of" "Build Empire application section"
    Then I switch to window with index "1"
    Then I upload "application_pack_document.pdf" file to "Direct App Apprenticeships Upload Documents" element
    Then I upload "application_pack_document.pdf" file to "Direct App Upload Job Role Documents" element
    And I wait for "2" seconds
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I click on the "Submit Approval" "button"
    And I click on the "OK" "button"

  Scenario: Attach Automation Line Manager Apprenticeships
    Given I click on the "Direct App Admin Line Manager Edit" button
    And I select "Automation" from "Direct App Admin Company Dropdown" element
    And I click on the "Direct App Admin Line Manager Dropdown" button
    And I fill the "Direct App Admin Attach Line Manger Text Field" field with "02917uk7sr@harakirimail.com"
    And I click on the "Automation Line Manager 1" "Build Empire line manager option"
    Then I click on the "Attach" "button"

  Scenario: Complete Professional Apprenticeships Application After Review
    Given I click on the "Direct App My Applications Left Menu Link" link by JS
    And I wait for "2" seconds
    Then I click on the "Direct App Go To Application" button
    And I click on the "documents" "Build Empire application section"
    And I click on the "Download Application of" "Build Empire application section"
    Then I switch to window with index "1"
    Then I upload "directApp.pdf" file to "Direct App Apprenticeships Upload Documents" element
    Then I upload "application_pack_document.pdf" file to "Direct App Upload Job Role Documents" element
    And I wait for "3" seconds
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save And Return" button

  Scenario: Admin Hub Navigate to Blog Posts
    When I click on the "Website" "BPP Digital Admin Menu Item links"
    And I click on the "Blog Posts" "BPP Digital Admin Sub Menu Item links"
    Then I should see the "Blog Posts" "BPP Digital Admin Page Header name"

  Scenario: Create Blog Post
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "AutoBlogPost[#####]" text to the "Title *" "BPP Digital Mandatory input field"
    And I set "AutoUrl[#####]" text to the "URL path *" "BPP Digital Mandatory input field"
    And I set "MetaDescription[####]" text to the "Meta description *" "BPP Digital Mandatory input field"
    And I set "Summary[####]" text to the "Summary *" "BPP Digital Mandatory input field"
    And I select "Research" from "Content type *" "BPP Digital Mandatory select field"
    And I select "Topic 1" from "Topics" "BPP Digital Mandatory select field"
    And I select "Law" from "Schools/Professions" "BPP Digital Mandatory select field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Blog Post was successfully created." "BPP Digital Admin Alert Message"

  Scenario: Search for Blog Post
    When I fill the "BPP Digital Filter by title search field" field with "EC_AUTO_BLOG_POST"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by title search field"
    Then I should see the "EC_AUTO_BLOG_POST" element

  Scenario: Add Image Component To CMS or Blog Post page
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Images" "BPP Digital Admin Sub Menu Item links"
    And I set "CMS Images" text to the "Html" "BPP Digital Mandatory input field"
    And I click on the "Add" "BPP Digital Search Label Button"
    And I click on the "Image" "BPP Digital Admin Choose Image button"
    And I switch to window with index "2"
    And I set "tree.jpg" text to the "Search..." "Build Empire text field"
    And I click on the "Search" "button"
    And I capture text data "BPP Digital First Image name from Image Uploader Popup" as "EC_IMAGE_NAME" variable
    And I click on the "BPP Digital First CMS Component First Select button" button by JS
    And I switch to window with index "1"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I wait for "3" seconds

  Scenario: Publish a CMS or Blog Post page
    When I wait for "2" seconds
    When I click on the "Publish" "button"
    Then I should see the "Blog post successfully published." "BPP Digital Admin Alert Message"

  Scenario: Archive a CMS or Blog Post page
    When I wait for "2" seconds
    When I click on the "Archive" "button"
    Then I should see the "Blog post successfully archived." "BPP Digital Admin Alert Message"

  Scenario: Admin Hub Navigate to Blog Topics
    When I click on the "Website" "BPP Digital Admin Menu Item links"
    And I click on the "Blog Topics" "BPP Digital Admin Sub Menu Item links"
    Then I should see the "Blog Topics" "BPP Digital Admin Page Header name"

  Scenario: Create Blog Topic
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "AutoBlogTopic[#####]" text to the "Name *" "BPP Digital Mandatory input field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Blog Topic was successfully created." "BPP Digital Admin Alert Message"

  Scenario: Create University Degree Apprenticeships Application
    Given I click on the "Direct App My Applications Left Menu Link" link by JS
    And I wait for "1" seconds
    Then I hover over the "Direct App What Are You Applying For Dropdown" element
    And I click on the "Direct App What Are You Applying For Dropdown" element
    Then I click on the "BPP University Degree Apprenticeships" "Build Empire application type"
    Then I wait for "1" seconds
    Then I hover over the "Direct App Programmes Programm Dropdown" element
    And I click on the "Direct App Programmes Programm Dropdown" element
    Then I click on the "Chartered Manager Degree Apprenticeship" "Build Empire application type"
    Then I wait for "1" seconds
    And I hover over the "Direct App Location Dropdown" button
    And I click on the "Direct App Location Dropdown" element
    Then I wait for "1" seconds
    And I click on the "Scotland" "Build Empire dropdown option"
    And I click on the "Direct App Create Application" button
    Then I wait for "1" seconds

  Scenario: Complete University Degree Apprenticeships Application Chartered Manager
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Are you aged over 15" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you have a husband, wife," "Build Empire bespoke Scotland eligibility"
    And I click on the "Direct App Right To Work in England?" element
    And I click on the "Direct App Do You Spend 50 Percent" element
    And I click on the "Direct App Bespoke Enrolled On Another Apprenticeship No" element
    And I click on the "Direct App Are You In Employment" element
    And I click on the "Direct App Are You Working At Least 16 Hours" element
    And I click on the "Are you applying for a programme" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you confirm that your job is a" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you confirm that you have discussed" "Build Empire bespoke Scotland eligibility"
    Then I wait for "1" seconds
    And I click on the "Direct App Next" button
    And I click on the "Title" "Build Empire dropdown"
    And I click on the "Mr" "Build Empire dropdown option"
    And I set "EC_AUTO_FIRSTNAME" text to the "Forenames" "Build Empire text field by title"
    And I set "EC_AUTO_LASTNAME" text to the "Family name" "Build Empire text field by title"
    And I set "12345" text to the "National insurance number" "Build Empire text field by title"
    And I set "[DOB-21]" text to the "Date of Birth" "Build Empire text field by title"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App DOB"
    And I set "EC_PHONE" text to the "Phone number" "Build Empire text field by title"
    And I set "Address 1" text to the "Address Line 1*" "Build Empire text field"
    And I set "Address 2" text to the "Address Line 2" "Build Empire text field"
    And I set "Address 3" text to the "Address Line 3" "Build Empire text field"
    And I set "80004" text to the "Postcode" "Build Empire text field by title"
    And I set "[CITYUSA]" text to the "Town/City*" "Build Empire text field"
    And I click on the "Country*" "Build Empire dropdown"
    And I click on the "Afghanistan" "Build Empire dropdown option"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Additional Info Aged 19" element
    And I click on the "employment status?:" "Build Empire nationality dropdown"
    And I click on the "I have work experience in this sector of up to 2 years" "Build Empire nationality option"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Diret App Gender Dropdown" element
    And I click on the "Diret App Gender Not To Say" element
    And I click on the "Diret App Gender At Birth Dropdown" element
    And I click on the "Diret App Gender At Birth Yes" element
    And I click on the "Diret App Ethnicity Dropdown" element
    And I click on the "Diret App Ethnicity White And Black African" element
    And I click on the "Diret App Religion Dropdown" element
    And I click on the "Diret App Religion Chrisitan" element
    And I click on the "Diret App Sexual Orientation Dropdown" element
    And I click on the "Diret App Sexual Orientation Heterosexual" element
    And I click on the "Diret App Learning Disability No" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Country of birth" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Country of nationality" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Country of domicile/permanent residency" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Is English your first language?" "Build Empire nationality dropdown"
    And I click on the "Yes" "Build Empire nationality option"
    And I click on the "Direct App Nationality No Visa" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Add Qualification" button
    And I click on the "Direct App Country of Study Dropdown" button
    And I click on the "United Kingdom" "Build Empire qualification option"
    And I click on the "Direct App Education Type Degree Radiobutton" button
    And I click on the "Direct App Qualification Title Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Foundation degree"
    Then I click on the "Foundation degree" "Build Empire application type"
    And I click on the "Direct App Subject Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Applied Law (QCF)"
    Then I click on the "Applied Law (QCF)" "Build Empire application type"
    And I click on the "Direct App Awarding Institution Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Zaskin College"
    Then I click on the "Zaskin College" "Build Empire application type"
    And I fill the "Direct App Year Completed" field with "11/11/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Year Completed"
    And I fill the "Direct App Grade" field with "AutoGrade"
    And I fill the "Direct App Examining Body" field with "AutoBody"
    And I click on the "Direct App Add Assesment" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Do you have any criminal" "Build Empire radiobutton no"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I fill the "Direct App Job Title" field with "Job Title"
    And I set "32" text to the "contracted working hours?" "Build Empire employment element"
    And I set "Manager Name" text to the "Manager First Name" "Build Empire employment element"
    And I set "Manager Lastname" text to the "Manager Last Name" "Build Empire employment element"
    And I set "AutoTitle" text to the "Manager Job Title" "Build Empire employment element"
    And I set "automation11@mail.com" text to the "Manager Email" "Build Empire employment element"
    And I fill the "Direct App Line Manager Telephone" field with "[PHONE-0913]"
    And I click on the "Do you know how to raise" "Build Empire radiobutton yes"
    And I set "Address 1" text to the "Address Line 1" "Build Empire employment element"
    And I set "London" text to the "Company/Employer City" "Build Empire employment element"
    And I click on the "Direct App Company Country Dropdown" element
    And I click on the "Direct App Company Country Dropdown UK Option" element
    And I set "12345" text to the "Postcode" "Build Empire employment element"
    And I click on the "Direct App Company Health And Safety" element
    And I fill the "Direct App When You Start At Company" field with "05/05/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App When You Start At Company"
    And I set "Automation Company" text to the "Company/Employer Name*" "Build Empire employment element"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Privacy Notice By Email" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    Then I wait for "1" seconds
    And I click on the "Direct App Save And Return" button

  Scenario: Complete Professional Apprenticeships UAT Accounting Assistant Parent Guardian
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Are you aged over 15" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you have a husband, wife, civil partner and child of any of the above?" "Build Empire bespoke Scotland eligibility"
    And I click on the "Direct App Right To Work in England?" element
    And I click on the "Direct App Do You Spend 50 Percent" element
    And I click on the "Direct App Bespoke Enrolled On Another Apprenticeship No" element
    And I click on the "Direct App Are You In Employment" element
    And I click on the "Direct App Are You Working At Least 16 Hours" element
    And I click on the "Are you applying for a programme" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you confirm that your job is a new job role relevant to the career development" "Build Empire bespoke Scotland eligibility"
    And I click on the "You confirm that you have discussed" "Build Empire bespoke Scotland eligibility"
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I fill the "Direct App Insurance Number" field with "12345"
    And I click on the "Direct App Country Dropdown" button
    And I click on the "Direct App Country Dropdown UK Option" button
    And I fill the "Diret App Phone Number" field with "EC_PHONE"
    And I set "Address 1" text to the "Address Line 1*" "Build Empire text field"
    And I set "Address 2" text to the "Address Line 2" "Build Empire text field"
    And I fill the "Diret App Postal Code" field with "12345"
    And I set "[DOB-16]" text to the "Date of Birth" "Build Empire text field by title"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App DOB"
    And I set "London" text to the "Town/City*" "Build Empire text field"
     #Parent/Legal Guardian Information
    And I validate text "CONTAINS=If you are under 18 years of age at the point you are accepted" to be displayed for "Direct App If You Are Under 18 Note" element
    And I set "Autotest" text to the "Name of Parent/Legal" "Build Empire text field by title"
    Then I remember "[EMAIL-YOPMAIL]" text as "EC_GUARDIAN_EMAIL" variable
    And I set "EC_GUARDIAN_EMAIL" text to the "Email Address of Parent/Legal" "Build Empire text field by title"
    And I set "1234567890" text to the "Phone Number of Parent/Legal" "Build Empire text field by title"
    And I set "JustTest" text to the "What is your relationship with this person?" "Build Empire text field by title"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Additional Info Aged 16 and 18 first" element
    And I click on the "employment status?:" "Build Empire nationality dropdown"
    And I click on the "I am a school / college leaver (This is my first professional role)" "Build Empire nationality option"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    Then I click on the "Direct App Scholarship Add" button
    And I set "AutomationTest" text to the "Kin/Emergency" "Build Empire emergency field"
    And I set "AutomationTest" text to the "What is your relationship with this person?" "Build Empire emergency field"
    Then I fill the "Direct App Line Manager Telephone" field with "09138333731"
    And I fill the "Direct App Admin Email" field with "automation111@mailinator.com"
    Then I click on the "Direct App Scholarship Add" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Diret App Gender Dropdown" element
    And I click on the "Diret App Gender Not To Say" element
    And I click on the "Diret App Ethnicity Dropdown" element
    And I click on the "Diret App Ethnicity White And Black African" element
    And I click on the "Diret App Learning Disability No" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Country of birth" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Country of nationality" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Country of domicile/permanent residency" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Is English your first language?" "Build Empire nationality dropdown"
    And I click on the "Yes" "Build Empire nationality option"
    And I click on the "Direct App Nationality No Visa" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Add Qualification" button
    And I click on the "Direct App Country of Study Dropdown" button
    And I click on the "United Kingdom" "Build Empire qualification option"
    And I click on the "Direct App Education Type Degree Radiobutton" button
    And I click on the "Direct App Qualification Title Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Foundation degree"
    Then I click on the "Foundation degree" "Build Empire application type"
    And I click on the "Direct App Subject Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Applied Law (QCF)"
    Then I click on the "Applied Law (QCF)" "Build Empire application type"
    And I click on the "Direct App Awarding Institution Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Zaskin College"
    Then I click on the "Zaskin College" "Build Empire application type"
    And I fill the "Direct App Year Completed" field with "11/11/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Year Completed"
    And I fill the "Direct App Grade" field with "AutoGrade"
    And I fill the "Direct App Examining Body" field with "AutoBody"
    And I click on the "Direct App Add Assesment" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I fill the "Direct App Job Title" field with "Job Title"
    And I set "32" text to the "contracted working hours?" "Build Empire employment element"
    And I set "Manager Name" text to the "Manager First Name" "Build Empire employment element"
    And I set "Manager Lastname" text to the "Manager Last Name" "Build Empire employment element"
    And I set "AutoTitle" text to the "Manager Job Title" "Build Empire employment element"
    And I set "automation11@mail.com" text to the "Manager Email" "Build Empire employment element"
    And I fill the "Direct App Line Manager Telephone" field with "[PHONE-0913]"
    And I set "Address 1" text to the "Address Line 1" "Build Empire employment element"
    And I set "London" text to the "Company/Employer City" "Build Empire employment element"
    And I set "Employee" text to the "Company/Employer Name" "Build Empire employment element"
    And I click on the "Direct App Company Health And Safety" element
    And I fill the "Direct App When You Start At Company" field with "05/05/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App When You Start At Company"
    And I click on the "Direct App Company Country Dropdown" element
    And I click on the "Direct App Company Country Dropdown UK Option" element
    And I set "12345" text to the "Postcode" "Build Empire employment element"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Privacy Notice By Email" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save And Return" button

  Scenario: Line Manager Review University Degree Apprenticeships Scotland
    Given I click on the "Direct App My Approvals Tab" link by JS
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Review Application" button
    And I click on the "Line Manager Review" "Build Empire application section"
    Then I fill the "Direct App Details Text Area  Line Manager" field with "Automation"
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Agree To Support Amount" element
    And I click on the "Direct App Line Manager New Role" button
    Then I click on the "I confirm that my organisation employs fewer than 50 people" "Build Empire checkbox"
    Then I click on the "I confirm that I understand it is my requirement to reserve" "Build Empire checkbox"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I wait for "1" seconds
    And Browser performs "Refresh" command
    And I click on the "Application documents" "Build Empire application section"
    And I click on the "Download Application of" "Build Empire application section"
    Then I switch to window with index "2"
    Then I upload "application_pack_document.pdf" file to "Direct App Apprenticeships Upload Documents" element
    Then I upload "application_pack_document.pdf" file to "Direct App Upload Job Role Documents" element
    And I wait for "2" seconds
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I click on the "Submit Approval" "button"
    And I click on the "OK" "button"

  Scenario: Reject University Degree Apprenticeships As Admin
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Then I click on the "Apprenticeships" "Build Empire admin applications tab"
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I click on the "Begin review" "Build Empire admin applications tab"
    And I select "Reject" from "Direct App Admin New Status Dropdown" element
    Then I click on the "Direct App Admin Apprenticeships Change Status Submit Button" button
    Then I validate text "CONTAINS=Rejected" to be displayed for "Direct App Admin Status Changed for Apprenticeships" element

  Scenario: Line Manager Review And Reject University Degree Apprenticeships Scotland
    Given I click on the "Direct App My Approvals Tab" link by JS
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Review Application" button
    And I click on the "Line Manager Review" "Build Empire application section"
    Then I fill the "Direct App Details Text Area  Line Manager" field with "Automation"
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Agree To Support Amount" element
    And I click on the "Direct App Line Manager New Role" button
    Then I click on the "I confirm that my organisation employs fewer than 50 people" "Build Empire checkbox"
    Then I click on the "I confirm that I understand it is my requirement to reserve" "Build Empire checkbox"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I wait for "1" seconds
    And Browser performs "Refresh" command
    And I click on the "Application documents" "Build Empire application section"
    And I click on the "Download Application of" "Build Empire application section"
    Then I switch to window with index "2"
    Then I upload "application_pack_document.pdf" file to "Direct App Apprenticeships Upload Documents" element
    Then I upload "application_pack_document.pdf" file to "Direct App Upload Job Role Documents" element
    And I wait for "2" seconds
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I click on the "Reject Application" button
    And I click on the "OK" "button"

  Scenario: Application Rejected by Line Manager Validation
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Then I click on the "Apprenticeships" "Build Empire admin applications tab"
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I validate text "CONTAINS=Line manager rejected" to be displayed for "Direct App Admin Status Changed for Apprenticeships" element

  Scenario: Incomplete University Degree Apprenticeships Application As Admin
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Then I click on the "Apprenticeships" "Build Empire admin applications tab"
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    And I click on the "Begin review" "Build Empire admin applications tab" if "Begin review" "element is present"
    And I select "Incomplete" from "Direct App Admin Force Change Status Dropdown" element
    And I click on the "Change" "button"
    And I fill the "Direct App Admin Application Page Password Field" field with "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINPASSWORD"
    And I click on the "OK" "button"
    Then I validate text "CONTAINS=Incomplete" to be displayed for "Direct App Admin Status Changed for Apprenticeships" element

  Scenario: Complete University Degree Apprenticeships Application With Existing Student
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Are you aged over 15" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you have a husband, wife, civil partner and child of any of the above?" "Build Empire bespoke Scotland eligibility"
    And I click on the "Direct App Right To Work in England?" element
    And I click on the "Direct App Do You Spend 50 Percent" element
    And I click on the "Direct App Bespoke Enrolled On Another Apprenticeship No" element
    And I click on the "Direct App Are You In Employment" element
    And I click on the "Direct App Are You Working At Least 16 Hours" element
    And I click on the "Are you applying for a programme" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you confirm that your job is a new job role relevant to the career development" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you confirm that you have discussed" "Build Empire bespoke Scotland eligibility"
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "employment status?:" "Build Empire nationality dropdown"
    And I click on the "I have work experience in this sector of up to 2 years" "Build Empire nationality option"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I set "AutoTitle" text to the "Manager Job Title" "Build Empire employment element"
    And I fill the "Direct App Line Manager Telephone" field with "1234567890"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Privacy Notice By Email" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save And Return" button

  Scenario: Admin Hub Navigate to CMS Pages
    When I click on the "Website" "BPP Digital Admin Menu Item links"
    And I click on the "Pages" "BPP Digital Admin Sub Menu Item links"
    Then I should see the "Pages - All" "BPP Digital Admin Page Header name"

  Scenario: Create CMS Page
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "AutoCMSPage[#####]" text to the "Name *" "BPP Digital Mandatory input field"
    And I select "CMS page" from "Page type *" "BPP Digital Mandatory select field"
    And I set "AutoCMSUrl[#####]" text to the "Path *" "BPP Digital Mandatory input field"
    And I select "About Us" from "Parent" "BPP Digital Mandatory select field"
    And I set "Title[####]" text to the "Title" "BPP Digital Mandatory input field"
    And I set "Summary[####]" text to the "Summary" "BPP Digital Mandatory text area field"
    And I set "MetaDescription[####]" text to the "Meta description" "BPP Digital Mandatory text area field"
    And I set "LinkTitle[####]" text to the "Link title *" "BPP Digital Mandatory input field"
    And I set "LinkDescription[####]" text to the "Link description *" "BPP Digital Mandatory text area field"
    And I "check" "Show in navigation" "BPP Digital Admin Mandatory checkbox"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "CMS Page was successfully created." "BPP Digital Admin Alert Message"

  Scenario: Search for CMS Page
    When I fill the "BPP Digital Filter by name search field" field with "EC_AUTO_CMS_PAGE"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Filter by name search field"
    Then I should see the "EC_AUTO_CMS_PAGE" element

  Scenario: Admin Hub Navigate to Applications list
    When I click on the "Direct Apps" "BPP Digital Admin Menu Item links"
    And I click on the "List" "BPP Digital Admin Sub Menu Item links"
    Then I should see the "Applications" "BPP Digital Admin Page Header name"

  Scenario: Admin Hub Navigate to Website Redirects
    When I click on the "Website" "BPP Digital Admin Menu Item links"
    And I click on the "Redirects" "BPP Digital Admin Sub Menu Item links"
    Then I should see the "Redirects" "BPP Digital Admin Page Header name"

  Scenario: Admin Hub Navigate to new Courses Pages
    When I click on the "Website" "BPP Digital Admin Menu Item links"
    And I click on the "Courses (new)" "BPP Digital Admin Sub Menu Item links"
    Then I should see the "Pages - Courses (new)" "BPP Digital Admin Page Header name"

  Scenario: Admin Hub Navigate to new Professions Pages
    When I click on the "Website" "BPP Digital Admin Menu Item links"
    And I click on the "Professions (new)" "BPP Digital Admin Sub Menu Item links"
    Then I should see the "Pages - Professions (new)" "BPP Digital Admin Page Header name"

  Scenario: Create Professional Apprenticeships Application UAT Accounting Option Two
    Given I click on the "Direct App My Applications Left Menu Link" link by JS
    And I wait for "1" seconds
    And I hover over the "Direct App What Are You Applying For Dropdown" element
    And I click on the "Direct App What Are You Applying For Dropdown" element
    Then I click on the "BPP Professional Apprenticeships" "Build Empire application type"
    And I wait for "2" seconds
    And I hover over the "Direct App Programmes Programm Dropdown" element
    And I click on the "Direct App Programmes Programm Dropdown" element
    Then I click on the "UAT Accounting Assistant" "Build Empire application type"
    And I wait for "2" seconds
    #And I hover over the "Direct App Location Dropdown" button
    #And I click on the "Direct App Location Dropdown" element
    #Then I wait for "1" seconds
    #Then I click on the "Online real-time learning" "Build Empire application type"
    And I hover over the "Direct App Start Date Application Dropdown" element
    And I click on the "Direct App Start Date Application Dropdown" element
    Then I click on the "UAT Assisstant Accountant - Option 2" "Build Empire application type"
    And I wait for "2" seconds
    And I click on the "Direct App Create Application" button
    Then I wait for "1" seconds

  Scenario: Create Professional Apprenticeships Application UAT Accounting Option Three
    Given I click on the "Direct App My Applications Left Menu Link" link by JS
    And I wait for "2" seconds
    And I hover over the "Direct App What Are You Applying For Dropdown" button
    And I click on the "Direct App What Are You Applying For Dropdown" element
    And I wait for "1" seconds
    Then I click on the "BPP Professional Apprenticeships" "Build Empire application type"
    And I wait for "2" seconds
    And I hover over the "Direct App Programmes Programm Dropdown" button
    And I click on the "Direct App Programmes Programm Dropdown" element
    And I wait for "2" seconds
    Then I click on the "UAT Accounting Assistant" "Build Empire application type"
    And I wait for "2" seconds
    #And I hover over the "Direct App Location Dropdown" button
    #And I click on the "Direct App Location Dropdown" element
    #Then I wait for "1" seconds
    #Then I click on the "Online real-time learning" "Build Empire application type"
    And I hover over the "Direct App Start Date Application Dropdown" button
    And I click on the "Direct App Start Date Application Dropdown" element
    And I wait for "2" seconds
    Then I click on the "UAT Assisstant Accountant - Option 3" "Build Empire application type"
    And I wait for "2" seconds
    And I hover over the "Direct App Which Application you want Application Dropdown" button
    And I click on the "Direct App Which Application you want Application Dropdown" element
    And I wait for "2" seconds
    Then I click on the "ACCA" "Build Empire application type"
    And I wait for "2" seconds
    And I click on the "Direct App Create Application" button
    And I wait for "1" seconds

  Scenario: Complete Professional Apprenticeships UAT Accounting Assistant
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Are you aged over 15" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you have a husband, wife, civil partner and child of any of the above?" "Build Empire bespoke Scotland eligibility"
    And I click on the "Direct App Right To Work in England?" element
    And I click on the "Direct App Do You Spend 50 Percent" element
    And I click on the "Direct App Bespoke Enrolled On Another Apprenticeship No" element
    And I click on the "Direct App Are You In Employment" element
    And I click on the "Direct App Are You Working At Least 16 Hours" element
    And I click on the "Are you applying for a programme" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you confirm that your job is a new job role relevant to the career development" "Build Empire bespoke Scotland eligibility"
    And I click on the "You confirm that you have discussed" "Build Empire bespoke Scotland eligibility"
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I fill the "Direct App Insurance Number" field with "12345"
    And I click on the "Direct App Country Dropdown" button
    And I click on the "Direct App Country Dropdown UK Option" button
    And I fill the "Diret App Phone Number" field with "EC_PHONE"
    And I set "Address 1" text to the "Address Line 1*" "Build Empire text field"
    And I set "Address 2" text to the "Address Line 2" "Build Empire text field"
    And I fill the "Diret App Postal Code" field with "12345"
    Then I remember "KW_AUTO_DOB|DD/MM/YYYY_21" text as "EC_DOB" variable
    And I fill the "Direct App DOB" field with "EC_DOB"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App DOB"
    And I set "London" text to the "Town/City*" "Build Empire text field"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Additional Info Aged 19" element
    And I click on the "employment status?:" "Build Empire nationality dropdown"
    And I click on the "I have work experience in this sector of up to 2 years" "Build Empire nationality option"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    Then I click on the "Direct App Scholarship Add" button
    And I set "AutomationTest" text to the "Kin/Emergency" "Build Empire emergency field"
    And I set "AutomationTest" text to the "What is your relationship with this person?" "Build Empire emergency field"
    Then I fill the "Direct App Line Manager Telephone" field with "09138333731"
    And I fill the "Direct App Admin Email" field with "automation111@mailinator.com"
    Then I click on the "Direct App Scholarship Add" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Diret App Gender Dropdown" element
    And I click on the "Diret App Gender Not To Say" element
    And I click on the "Diret App Ethnicity Dropdown" element
    And I click on the "Diret App Ethnicity White And Black African" element
    And I click on the "Diret App Learning Disability No" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Country of birth" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Country of nationality" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Country of domicile/permanent residency" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Is English your first language?" "Build Empire nationality dropdown"
    And I click on the "Yes" "Build Empire nationality option"
    And I click on the "Direct App Nationality No Visa" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Add Qualification" button
    And I click on the "Direct App Country of Study Dropdown" button
    And I click on the "United Kingdom" "Build Empire qualification option"
    And I click on the "Direct App Education Type Degree Radiobutton" button
    And I click on the "Direct App Qualification Title Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Foundation degree"
    Then I click on the "Foundation degree" "Build Empire application type"
    And I click on the "Direct App Subject Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Applied Law (QCF)"
    Then I click on the "Applied Law (QCF)" "Build Empire application type"
    And I click on the "Direct App Awarding Institution Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Zaskin College"
    Then I click on the "Zaskin College" "Build Empire application type"
    And I fill the "Direct App Year Completed" field with "11/11/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Year Completed"
    And I fill the "Direct App Grade" field with "AutoGrade"
    And I fill the "Direct App Examining Body" field with "AutoBody"
    And I click on the "Direct App Add Assesment" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I fill the "Direct App Job Title" field with "Job Title"
    And I set "32" text to the "contracted working hours?" "Build Empire employment element"
    And I set "Manager Name" text to the "Manager First Name" "Build Empire employment element"
    And I set "Manager Lastname" text to the "Manager Last Name" "Build Empire employment element"
    And I set "AutoTitle" text to the "Manager Job Title" "Build Empire employment element"
    And I set "automation11@mail.com" text to the "Manager Email" "Build Empire employment element"
    And I fill the "Direct App Line Manager Telephone" field with "[PHONE-0913]"
    And I set "Address 1" text to the "Address Line 1" "Build Empire employment element"
    And I set "London" text to the "Company/Employer City" "Build Empire employment element"
    And I set "Employee" text to the "Company/Employer Name" "Build Empire employment element"
    And I click on the "Direct App Company Health And Safety" element
    And I fill the "Direct App When You Start At Company" field with "05/05/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App When You Start At Company"
    And I click on the "Direct App Company Country Dropdown" element
    And I click on the "Direct App Company Country Dropdown UK Option" element
    And I set "12345" text to the "Postcode" "Build Empire employment element"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Privacy Notice By Email" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save And Return" button

  Scenario: Line Manager Review And Reject Professional Apprenticeships
    Given I click on the "Direct App My Approvals Tab" link by JS
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Review Application" button
    And I click on the "Line Manager Review" "Build Empire application section"
    Then I fill the "Direct App Details Text Area  Line Manager" field with "Automation"
    And I wait for "2" seconds
    And I click on the "Direct App Line Manager Agree To Support Amount" element
    And I fill the "Direct Apps Line Manager End Point Assessment Organisation" field with "AutomationTesting"
    And I click on the "Direct App Line Manager New Role" button
    Then I click on the "I confirm that my organisation employs fewer than 50 people" "Build Empire checkbox"
    Then I click on the "I confirm that I understand it is my requirement to reserve" "Build Empire checkbox"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Save Review And Next" button
    And I wait for "1" seconds
    And I click on the "Direct App Line Manager Review Health And Safety Checkbox" element
    And I click on the "Direct App Save Review And Next" button
    And I click on the "Download Application of" "Build Empire application section"
    Then I switch to window with index "2"
    Then I upload "application_pack_document.pdf" file to "Direct App Apprenticeships Upload Documents" element
    Then I upload "application_pack_document.pdf" file to "Direct App Upload Job Role Documents" element
    And I wait for "2" seconds
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save Review And Back" button
    And I click on the "Reject Application" button
    And I click on the "OK" "button"

  Scenario: Create Automation Line Manager
    And I click on the "Direct App Admin Create Line Manager" button
    And I click on the "Direct App Admin Company Dropdown For Line Manager Creation" button
    And I wait for "1" seconds
    And I fill the "Direct App Admin Company Text Field Line Manager Creation" field with "Automation"
    Then I click on the "Automation" "Build Empire application type"
    Then I remember "Email[#####]/@/guerrillamail.com" text as "EC_LINEMANAGER_EMAIL" variable
    And I fill the "Direct App Admin Email Line Manager Creation" field with "EC_LINEMANAGER_EMAIL"
    And I fill the "Direct App Admin Firstname Line Manager Creation" field with "AutoFirst"
    And I fill the "Direct App Admin Lastname Line Manager Creation" field with "AutoLast"
    Then I click on the "Create" "button"

  Scenario: Reset Line Manager Password
    Given I am on "EC_RESET_PASSWORD" URL
    And I fill the "Direct App Reset New Password" field with "Welcome2@#!Welc"
    And I fill the "Direct App Confirm New Password" field with "Welcome2@#!Welc"
    Then I click on the "Direct App Reset Password Button" button
    And I wait for "1" seconds

  Scenario: Create Channel Islands Mk2 Application
    Given I click on the "Direct App My Applications Left Menu Link" button by JS
    And I wait for "3" seconds
    And I click on the "Direct App Create Application" button
    And I wait for "2" seconds

  Scenario: Complete Channel Islands Mk2 Application
    Given I click on the "Direct App Start Application" button
    And I click on the " Personal details" "Build Empire application section"
    And I set "EC_AUTO_FIRSTNAME" text to the "Forenames" "Build Empire text field by title"
    And I set "EC_AUTO_LASTNAME" text to the "Family name" "Build Empire text field by title"
    And I set "[DOB-21]" text to the "Date of Birth" "Build Empire text field by title"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App DOB"
    And I set "EC_PHONE" text to the "Phone number" "Build Empire text field by title"
    And I set "Address 1" text to the "Address Line 1*" "Build Empire text field"
    And I set "Address 2" text to the "Address Line 2" "Build Empire text field"
    And I set "80004" text to the "Postcode" "Build Empire text field by title"
    And I set "London" text to the "Town/City*" "Build Empire text field"
    And I click on the "Country*" "Build Empire dropdown"
    And I click on the "Direct App Country Dropdown UK Option" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Payment Employer Funded" button
    And I wait for "2" seconds
    And I fill the "Direct App Channel Islands Phone Training Manager" field with "EC_PHONE"
    And I set "AutoTest" text to the "First name" "Build Empire Channel Islands text field"
    And I set "AutoTest" text to the "organisation/company" "Build Empire Channel Islands text field"
    And I set "AutoTest" text to the "Surname" "Build Empire Channel Islands text field"
    And I set "AutoTest" text to the "Purchase" "Build Empire Channel Islands text field"
    And I set "AutoTest" text to the "City" "Build Empire Channel Islands text field"
    And I set "12345" text to the "Postcode" "Build Empire Channel Islands text field"
    And I click on the "Direct App Channel Islands Country Dropdown" button
    And I click on the "United Kingdom" "Build Empire dropdown option"
    Then I remember "e-mail[#####]/@/guerrillamail.com" text as "EC_LINEMANAGER_EMAIL" variable
    And I fill the "Direct App Channel Islands Email Training Manager" field with "EC_LINEMANAGER_EMAIL"
    And I fill the "Direct App Channel Islands Address Training Manager" field with "Simple Test 1"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Channel Islands Compliance" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "1" seconds
    And I click on the "Direct App Save And Return" button

  Scenario: Approve Channel Isalnds Application as Training Manager
      And I click on the "Direct App My Approvals Tab" button by JS
      And I click on the "Approve" "button"
      And I fill the "Direct App Channel Islands Training Manager Reason" field with "Automation Testing"
      And I click on the "Direct App Channel Islands Training Manager OK" button
      And I wait for "2" seconds
      Then I validate text "CONTAINS=Accepted" to be displayed for "Direct App Channel Islands Accepted Applciation" element

  Scenario: Reject Channel Isalnds Application as Training Manager
    And I click on the "Direct App My Approvals Tab" button by JS
    And I click on the "Reject" "button"
    And I fill the "Direct App Channel Islands Training Manager Reason" field with "Automation Testing"
    And I click on the "Direct App Channel Islands Training Manager OK" button
    And I wait for "2" seconds
    Then I validate text "CONTAINS=Rejected" to be displayed for "Direct App Channel Islands Accepted Applciation" element

  Scenario: Negative Scenarios - Validate User Cannot Proceed
      Given I click on the "Direct App Start Application" button
      And I click on the "Eligibility criteria" "Build Empire application section"
      And I click on the "Are you aged over 15" "Build Empire bespoke Scotland eligibility"
      And I click on the "Do you have a husband, wife, civil partner and child of any of the above?" "Build Empire bespoke Scotland eligibility"
      And I click on the "Direct App Right To Work in England?" element
      And I click on the "Direct App Do You Spend 50 Percent" element
      And I click on the "Direct App Bespoke Enrolled On Another Apprenticeship No" element
      And I click on the "Direct App Are You In Employment" element
      And I click on the "Direct App Are You Working At Least 16 Hours" element
      And I click on the "Are you applying for a programme" "Build Empire bespoke Scotland eligibility"
      And I click on the "Do you confirm that your job is a new job role relevant to the career development" "Build Empire bespoke Scotland eligibility"
      And I click on the "You confirm that you have discussed" "Build Empire bespoke Scotland eligibility"
      And I wait for "2" seconds
      And I click on the "Direct App Next" button
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I fill the "Direct App Insurance Number" field with "12345"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Direct App Country Dropdown" button
      And I click on the "Direct App Country Dropdown UK Option" button
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I fill the "Diret App Phone Number" field with "EC_PHONE"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I set "Address 1" text to the "Address Line 1*" "Build Empire text field"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I set "Address 2" text to the "Address Line 2" "Build Empire text field"
      And I fill the "Diret App Postal Code" field with "12345"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      Then I remember "KW_AUTO_DOB|DD/MM/YYYY_21" text as "EC_DOB" variable
      And I fill the "Direct App DOB" field with "EC_DOB"
      And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App DOB"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I set "London" text to the "Town/City*" "Build Empire text field"
      And I click on the "Direct App Mark As Complete Checkbox" button
      And I wait for "2" seconds
      And I click on the "Direct App Next" button
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Direct App Additional Info Aged 19" element
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "employment status?:" "Build Empire nationality dropdown"
      And I wait for "1" seconds
      And I click on the "I have work experience in this sector of up to 2 years" "Build Empire nationality option"
      And I click on the "Direct App Mark As Complete Checkbox" button
      And I wait for "2" seconds
      And I click on the "Direct App Next" button
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      Then I click on the "Direct App Scholarship Add" button
      And I set "AutomationTest" text to the "Kin/Emergency" "Build Empire emergency field"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I set "AutomationTest" text to the "What is your relationship with this person?" "Build Empire emergency field"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      Then I fill the "Direct App Line Manager Telephone" field with "09138333731"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I fill the "Direct App Admin Email" field with "automation111@mailinator.com"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      Then I click on the "Direct App Scholarship Add" button
      And I click on the "Direct App Mark As Complete Checkbox" button
      And I wait for "2" seconds
      And I click on the "Direct App Next" button
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Diret App Gender Dropdown" element
      And I click on the "Diret App Gender Not To Say" element
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Diret App Ethnicity Dropdown" element
      And I click on the "Diret App Ethnicity White And Black African" element
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Diret App Learning Disability No" element
      And I click on the "Direct App Mark As Complete Checkbox" button
      And I wait for "2" seconds
      And I click on the "Direct App Next" button
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Country of birth" "Build Empire nationality dropdown"
      And I click on the "United Kingdom" "Build Empire nationality option"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Country of nationality" "Build Empire nationality dropdown"
      And I click on the "United Kingdom" "Build Empire nationality option"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Country of domicile/permanent residency" "Build Empire nationality dropdown"
      And I click on the "United Kingdom" "Build Empire nationality option"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Is English your first language?" "Build Empire nationality dropdown"
      And I click on the "Yes" "Build Empire nationality option"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Direct App Nationality No Visa" element
      And I click on the "Direct App Mark As Complete Checkbox" button
      And I wait for "2" seconds
      And I click on the "Direct App Next" button
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Direct App Add Qualification" button
      And I click on the "Direct App Country of Study Dropdown" button
      And I click on the "United Kingdom" "Build Empire qualification option"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Direct App Education Type Degree Radiobutton" button
      And I click on the "Direct App Qualification Title Dropdown" button
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I fill the "Direct App Education Search Field Dropdown" field with "Foundation degree"
      Then I click on the "Foundation degree" "Build Empire application type"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Direct App Subject Dropdown" button
      And I wait for "1" seconds
      And I fill the "Direct App Education Search Field Dropdown" field with "Applied Law (QCF)"
      And I wait for "2" seconds
      Then I click on the "Applied Law (QCF)" "Build Empire application type"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Direct App Awarding Institution Dropdown" button
      And I fill the "Direct App Education Search Field Dropdown" field with "Zaskin College"
      Then I click on the "Zaskin College" "Build Empire application type"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I fill the "Direct App Year Completed" field with "11/11/2018"
      And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Year Completed"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I fill the "Direct App Grade" field with "AutoGrade"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I fill the "Direct App Examining Body" field with "AutoBody"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Direct App Add Assesment" button
      And I click on the "Direct App Mark As Complete Checkbox" button
      And I wait for "2" seconds
      And I click on the "Direct App Next" button
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I fill the "Direct App Job Title" field with "Job Title"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I set "32" text to the "contracted working hours?" "Build Empire employment element"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I set "Manager Name" text to the "Manager First Name" "Build Empire employment element"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I set "Manager Lastname" text to the "Manager Last Name" "Build Empire employment element"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I set "AutoTitle" text to the "Manager Job Title" "Build Empire employment element"
      And I set "automation11@mail.com" text to the "Manager Email" "Build Empire employment element"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I fill the "Direct App Line Manager Telephone" field with "[PHONE-0913]"
      And I set "Address 1" text to the "Address Line 1" "Build Empire employment element"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I set "London" text to the "Company/Employer City" "Build Empire employment element"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I set "Employee" text to the "Company/Employer Name" "Build Empire employment element"
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Direct App Company Health And Safety" element
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I fill the "Direct App When You Start At Company" field with "05/05/2018"
      And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App When You Start At Company"
      And I click on the "Direct App Company Country Dropdown" element
      And I click on the "Direct App Company Country Dropdown UK Option" element
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I set "12345" text to the "Postcode" "Build Empire employment element"
      And I click on the "Direct App Mark As Complete Checkbox" button
      And I wait for "2" seconds
      And I click on the "Direct App Next" button
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Direct App Privacy Notice By Email" button
      And I click on the "Direct App Mark As Complete Checkbox" button
      And I click on the "Direct App Save And Return" button
      Given I click on the "Direct App Submit Application" button
      And I wait for "1" seconds
      And Attribute "class" of "Direct App Inactive Status Button" should have value "step-actions disabled"
      And I click on the "Direct App Confirm Application Radiobutton" button
      And I click on the "Direct App Submit Application on Confirmation Page" button
      Then I validate text "CONTAINS=100" to be displayed for "Direct App Application Progress Percentage" element

  Scenario: Admin Hub Navigate to Application Categories
    When I click on the "Direct Apps" "BPP Digital Admin Menu Item links"
    And I click on the "Categories" "BPP Digital Admin Sub Menu Item links"
    Then I should see the "Application Categories" "BPP Digital Admin Page Header name"

  Scenario: Submit RFI Form
    And I set "Automation" text to the "First Name" "BPP Digital RFI Input Field"
    And I set "Automation" text to the "Last Name" "BPP Digital RFI Input Field"
    And I set "Automation@test.com" text to the "Email" "BPP Digital RFI Input Field"
    And I set "Automation" text to the "Phone" "BPP Digital RFI Input Field"
    And I set "Automation" text to the "Company" "BPP Digital RFI Input Field"
    And I set "AutoJob" text to the "Job" "BPP Digital RFI Input Field"
    And I set "[PHONE-0913]" text to the "Phone Number" "BPP Digital RFI Input Field"
    And I click on the "BPP Digital RFI Form Apprenticeship Levy" button
    And I click on the "Direct App I Am Happy To Receive Information" button
    Then I click on the "Submit" "button"
    Then I should see the "EC_FORM_THANK_YOU_TITLE" element
    Then I should see the "EC_FORM_THANK_YOU_MESSAGE" element
    Then I click on the "Click here to download" "Build Empire link"
    And I wait for "2" seconds
    And I switch to window with index "2"
    And I validate text "222012-QAA-Report.pdf" to be displayed for "CHECK_URL" element

  Scenario: Admin Hub Navigate to Marketing Cloud Logs
    When I click on the "BPP Digital Admin Logs Menu Item link" element
    And I click on the "Marketing Cloud" "BPP Digital Admin Sub Menu Item links"
    Then I should see the "Marketing Cloud Logs" "BPP Digital Admin Page Header name"

  Scenario: Admin Hub Navigate to Users List
    When I click on the "Users" "BPP Digital Admin Menu Item links"
    And I click on the "List" "BPP Digital Admin Users Sub Menu Item links"
    Then I should see the "Users" "BPP Digital Admin Page Header name"

  Scenario: Admin Hub Navigate to User Imports
    When I click on the "Logs" "BPP Digital Admin Menu Item links"
    And I click on the "User Import" "BPP Digital Admin Logs Sub Menu Item links"
    Then I should see the "User Import Logs" "BPP Digital Admin Page Header name"

  Scenario: Admin Hub Navigate to Announcements
    When I click on the "Website" "BPP Digital Admin Menu Item links"
    And I click on the "Announcements" "BPP Digital Admin Sub Menu Item links"
    Then I should see the "Announcements" "BPP Digital Admin Page Header name"

  Scenario: Create University Degree Level Three Paralegal
    Given I click on the "Direct App My Applications Left Menu Link" link by JS
    And I click on the "Direct App What Are You Applying For Dropdown" element
    Then I click on the "BPP University Degree Apprenticeships" "Build Empire application type"
    And I click on the "Direct App Programmes Programm Dropdown" element
    Then I click on the "Direct App Level Three Paralegal" element
    And I hover over the "Direct App Start Date Application Dropdown" button
    And I click on the "Direct App Start Date Application Dropdown" element
    And I wait for "2" seconds
    Then I click on the "January 2021" "Build Empire application type"
    And I wait for "2" seconds
    And I click on the "Direct App Create Application" button

  Scenario: Log In to Hub as Student Fixed
    When I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And Browser performs "Refresh" command
    And I wait for "5" seconds
    And I set "EC_AUTO_EMAIL" text to the "Email" "Build Empire text field"
    And I set "EC_PASSWORD" text to the "Password" "Build Empire text field"
    And I click on the "Direct App Login Button" button by JS
    Then I should see the "Direct App My Applications Left Menu Link" element

  Scenario: Log In to Hub as Student VPE Mobile
    Given I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And I set "vpecourse@guerillamail.info" text to the "Email" "Build Empire text field"
    And I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button by JS
    And I wait for "1" seconds
    And I should see the "Timeline and Dashboard" "element"

  Scenario: Complete University Degree Apprenticeships Application Chartered Manager Mobile
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Are you aged over 15" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you have a husband, wife," "Build Empire bespoke Scotland eligibility"
    And I click on the "Direct App Right To Work in England?" element
    And I click on the "Direct App Do You Spend 50 Percent" element
    And I click on the "Direct App Bespoke Enrolled On Another Apprenticeship No" element
    And I click on the "Direct App Are You In Employment" element
    And I click on the "Direct App Are You Working At Least 16 Hours" element
    And I click on the "Are you applying for a programme" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you confirm that your job is a" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you confirm that you have discussed" "Build Empire bespoke Scotland eligibility"
    Then I wait for "1" seconds
    And I click on the "Direct App Next" button
    And I set "EC_AUTO_FIRSTNAME" text to the "Forenames" "Build Empire text field by title"
    And I set "EC_AUTO_LASTNAME" text to the "Family name" "Build Empire text field by title"
    And I set "12345" text to the "National insurance number" "Build Empire text field by title"
    And I set "[DOB-21]" text to the "Date of Birth" "Build Empire text field by title"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App DOB"
    And I set "EC_PHONE" text to the "Phone number" "Build Empire text field by title"
    And I set "Address 1" text to the "Address Line 1*" "Build Empire text field"
    And I set "Address 2" text to the "Address Line 2" "Build Empire text field"
    And I set "Address 3" text to the "Address Line 3" "Build Empire text field"
    And I set "80004" text to the "Postcode" "Build Empire text field by title"
    And I set "[CITYUSA]" text to the "Town/City*" "Build Empire text field"
    And I click on the "Country*" "Build Empire dropdown"
    And I click on the "Afghanistan" "Build Empire dropdown option"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Additional Info Aged 19" element
    And I click on the "employment status?:" "Build Empire nationality dropdown"
    And I click on the "I have work experience in this sector of up to 2 years" "Build Empire nationality option"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Diret App Gender Dropdown" element
    And I click on the "Diret App Gender Not To Say" element
    And I click on the "Diret App Gender At Birth Dropdown" element
    And I click on the "Diret App Gender At Birth Yes" element
    And I click on the "Diret App Ethnicity Dropdown" element
    And I click on the "Diret App Ethnicity White And Black African" element
    And I click on the "Diret App Religion Dropdown" element
    And I click on the "Diret App Religion Chrisitan" element
    And I click on the "Diret App Sexual Orientation Dropdown" element
    And I click on the "Diret App Sexual Orientation Heterosexual" element
    And I click on the "Diret App Learning Disability No" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Country of birth" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Country of nationality" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Country of domicile/permanent residency" "Build Empire nationality dropdown"
    And I click on the "United Kingdom" "Build Empire nationality option"
    And I click on the "Is English your first language?" "Build Empire nationality dropdown"
    And I click on the "Yes" "Build Empire nationality option"
    And I click on the "Direct App Nationality No Visa" element
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Add Qualification" button
    And I click on the "Direct App Country of Study Dropdown" button
    And I click on the "United Kingdom" "Build Empire qualification option"
    And I click on the "Direct App Education Type Degree Radiobutton" button
    And I hover over the "Direct App Qualification Title Dropdown" button
    And I click on the "Direct App Qualification Title Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Foundation degree"
    Then I click on the "Foundation degree" "Build Empire application type"
    And I click on the "Direct App Subject Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Applied Law (QCF)"
    Then I click on the "Applied Law (QCF)" "Build Empire application type"
    And I click on the "Direct App Awarding Institution Dropdown" button
    And I fill the "Direct App Education Search Field Dropdown" field with "Zaskin College"
    Then I click on the "Zaskin College" "Build Empire application type"
    And I fill the "Direct App Year Completed" field with "11/11/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Year Completed"
    And I fill the "Direct App Grade" field with "AutoGrade"
    And I fill the "Direct App Examining Body" field with "AutoBody"
    And I click on the "Direct App Add Assesment" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Do you have any criminal" "Build Empire radiobutton no"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I fill the "Direct App Job Title" field with "Job Title"
    And I set "32" text to the "contracted working hours?" "Build Empire employment element"
    And I set "Manager Name" text to the "Manager First Name" "Build Empire employment element"
    And I set "Manager Lastname" text to the "Manager Last Name" "Build Empire employment element"
    And I set "AutoTitle" text to the "Manager Job Title" "Build Empire employment element"
    And I set "automation11@mail.com" text to the "Manager Email" "Build Empire employment element"
    And I fill the "Direct App Line Manager Telephone" field with "[PHONE-0913]"
    And I click on the "Do you know how to raise" "Build Empire radiobutton yes"
    And I set "Address 1" text to the "Address Line 1" "Build Empire employment element"
    And I set "London" text to the "Company/Employer City" "Build Empire employment element"
    And I click on the "Direct App Company Country Dropdown" element
    And I click on the "Direct App Company Country Dropdown UK Option" element
    And I set "12345" text to the "Postcode" "Build Empire employment element"
    And I click on the "Direct App Company Health And Safety" element
    And I fill the "Direct App When You Start At Company" field with "05/05/2018"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App When You Start At Company"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Privacy Notice By Email" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    Then I wait for "1" seconds
    And I click on the "Direct App Save And Return" button

  Scenario: Course Topic Clean Up
    Given I click on the "Totara Automation First Automation Topic Edit button" button
    And I click on the "Totara Automation First Automation Topic Delete button" button
    And I wait for "3" seconds
    And I click on the "Delete" "Totara button"
    And I wait for "3" seconds

  Scenario: Complete Professional Apprenticeships Application Chartered Manager Existing Student
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Are you aged over 15" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you have a husband, wife," "Build Empire bespoke Scotland eligibility"
    And I click on the "Direct App Right To Work in England?" element
    And I click on the "Direct App Do You Spend 50 Percent" element
    And I click on the "Direct App Bespoke Enrolled On Another Apprenticeship No" element
    And I click on the "Direct App Are You In Employment" element
    And I click on the "Direct App Are You Working At Least 16 Hours" element
    And I click on the "Are you applying for a programme" "Build Empire bespoke Scotland eligibility"
    And I click on the "Do you confirm that your job is a new" "Build Empire bespoke Scotland eligibility"
    And I click on the "You confirm that you have discussed" "Build Empire bespoke Scotland eligibility"
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I wait for "2" seconds
    And I click on the "employment status?:" "Build Empire nationality dropdown"
    And I click on the "I have work experience in this sector of up to 2 years" "Build Empire nationality option"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I wait for "2" seconds
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    Then I wait for "1" seconds
    And I click on the "Direct App Save And Return" button

  Scenario: Release Grade for Assignment in Totara
    Given I am on "https://totara-stage-bppdigital.bppuniversity.com/mod/assign/view.php?id=14685&action=grader" URL
    Then I wait for "2" seconds
    Then I set "EC_AUTO_FIRSTNAME" text to the "Change user" "Build Empire text field"
    And I click on the "form_autocomplete_suggestions-0-0" "element by id"
    And I set "100" text to the "grade" "VLE Login Fields"
    Then I select "Released" from "workflowstate" "Totara Select field with name Parameter"
    And I click on the "Save changes" "button"
    Then I click on the "Ok" "element by value"
    Then I wait for "2" seconds
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL

  Scenario: Post Accepted Apprenticeships Tests
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Given I click on the "Direct App Admin Apprenticeships Tab" link by JS
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I wait for "1" seconds
    And I click on the "Direct App Admin New Status Dropdown" element
    Then I click on the "Submit" "button"
    Then I validate text "CONTAINS=Accepted booked onto program" to be displayed for "Direct App Admin Status Changed for Apprenticeships" element
    And I click on the "Direct App Admin New Status Dropdown" element
    Then I click on the "Accept - Induction Email Sent to Learner" "text contained in Option element"
    Then I click on the "Submit" "button"
    Then I validate text "CONTAINS=Accepted induction email sent to learner" to be displayed for "Direct App Admin Status Changed for Apprenticeships" element
    And I click on the "Direct App Admin New Status Dropdown" element
    Then I click on the "Accept - Induction Email Sent to Line Manager" "text contained in Option element"
    Then I click on the "Submit" "button"
    Then I validate text "CONTAINS=Accepted induction email sent to line manager" to be displayed for "Direct App Admin Status Changed for Apprenticeships" element
    And I click on the "Direct App Admin New Status Dropdown" element
    Then I click on the "Accept - Induction Email Sent to Both" "text contained in Option element"
    Then I click on the "Submit" "button"
    Then I validate text "CONTAINS=Accepted induction email sent to both" to be displayed for "Direct App Admin Status Changed for Apprenticeships" element

  Scenario: Academic Appeals Admin Status Change
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Then I click on the "Academic Appeals" "Build Empire admin applications tab"
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I click on the "Begin review" "Build Empire admin applications tab"
    And I select "Referral Panel" from "Direct App Admin New Status Dropdown" element
    And I fill the "Direct App Admin Reason" field with "Reason Referral Panel"
    Then I click on the "Submit" "button"
    Then I validate text "Referral panel" to be displayed for "Direct App Admin Status Changed for Academic Appeals" element
    And I select "Referral ODP" from "Direct App Admin New Status Dropdown" element
    And I fill the "Direct App Admin Reason" field with "Reason Referral ODP"
    Then I click on the "Submit" "button"
    Then I validate text "Referral ODP" to be displayed for "Direct App Admin Status Changed for Academic Appeals" element
    And I select "Part Accept" from "Direct App Admin New Status Dropdown" element
    And I fill the "Direct App Admin Reason" field with "Reason Part Accept"
    Then I click on the "Submit" "button"
    Then I validate text "Part accepted" to be displayed for "Direct App Admin Status Changed for Academic Appeals" element
    And I fill the "Direct App Admin Reason" field with "Reason Full Application In Review Second"
    Then I click on the "Submit" "button"
    Then I validate text "Full application in review" to be displayed for "Direct App Admin Status Changed for Academic Appeals" element
    And I select "Accept" from "Direct App Admin New Status Dropdown" element
    And I fill the "Direct App Admin Reason" field with "Reason Referral ODP"
    Then I click on the "Submit" "button"
    Then I validate text "Accepted" to be displayed for "Direct App Admin Status Changed for Academic Appeals" element
    And I fill the "Direct App Admin Reason" field with "Reason Full Application In Review Second"
    Then I click on the "Submit" "button"
    Then I validate text "Full application in review" to be displayed for "Direct App Admin Status Changed for Academic Appeals" element
    And I select "Reject" from "Direct App Admin New Status Dropdown" element
    And I fill the "Direct App Admin Reason" field with "Reason Reject"
    Then I click on the "Submit" "button"
    Then I validate text "Rejected" to be displayed for "Direct App Admin Status Changed for Academic Appeals" element