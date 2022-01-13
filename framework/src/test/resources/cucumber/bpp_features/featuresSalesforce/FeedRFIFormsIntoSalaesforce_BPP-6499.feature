@Salesforce @FeedRFI
Feature: To Feed RFI Form
  As a user, when I submit an RFI form on BPP.com or on the "Events App", then an Activity (Task), Lead or Account should be created / updated with relevant fields in Sales Cloud in near-real time.
  The middleware will make a REST API call to Salesforce with the RFI form data.

  @AccountRFI #TC-3471
  Scenario: Submit RFI as a Learner and Create Task for Existing Account
    When I create new student account API
    Given I am on "MD_COMMON_LINKS_BPPDIGITALRFILINK" URL
    And I remember "KW_AUTO_TODAY|DD/MM/YYYY" text as "EC_DATE" variable
    When I click on the "I am a Learner" "Build Empire RFI Label text item"
    And I set "EC_AUTO_FIRSTNAME" text to the "Enter your first name" "Build Empire text field"
    And I set "EC_AUTO_LASTNAME" text to the "Enter your last name" "Build Empire text field"
    And I set "EC_AUTO_EMAIL" text to the "Enter your email address" "Build Empire text field"
    And I set "1234567890" text to the "Phone Number" "Build Empire text field by title"
    And I click on the "Select area of interest" "Build Empire RFI Span dropdown item"
    And I click on the "Accountancy and Tax" "Build Empire RFI dropdown option"
    And I set "SomeCommentLearner[####]" text to the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I click on the "I do not wish to receive information from BPP" "Build Empire RFI Span dropdown item"
    And I click on the "Submit" "Build Empire button"
    Then I wait for "2" seconds
    And I should see the "One of our team will be in touch within 48 hours." "text in div element"
    Then I wait for "60" seconds
    Given I execute "Log In To Salesforce" reusable step
    Then I am on "https://bpp-13fd3e55182--noahuat.lightning.force.com/lightning/r/Account/EC_ACCOUNT_ID/view" URL
    And I wait for "1" seconds
    Then I should see the "Task" "element by title two"
    Then Сss "height" of "Task" "element by title two" should have value "24px"
    And I should see the "Form: RFI Form - New 2020" "text contained in A element"
    And I should see the "Callback: RFI Form - New 2020" "text contained in A element"
    And I click on the "Callback: RFI Form - New 2020" "text contained in A element"
    Then I validate text "Call" to be displayed for "Type" "Salesforce read field"
    Then I validate text "EC_DATE" to be displayed for "Due Date" "Salesforce read field"

  @LeadRFI #TC-3474
  Scenario: Submit RFI as a Learner and Create Task for Existing Prospective Lead
    Given I am on "MD_COMMON_LINKS_BPPDIGITALRFILINK" URL
    And I remember "KW_AUTO_TODAY|DD/MM/YYYY" text as "EC_DATE" variable
    When I click on the "I am a Learner" "Build Empire RFI Label text item"
    And I set "Automation RFI" text to the "Enter your first name" "Build Empire text field"
    And I set "Prospective" text to the "Enter your last name" "Build Empire text field"
    And I set "automationExistingLead@yopmail.com" text to the "Enter your email address" "Build Empire text field"
    And I set "1234567890" text to the "Phone Number" "Build Empire text field by title"
    And I click on the "Select area of interest" "Build Empire RFI Span dropdown item"
    And I click on the "Accountancy and Tax" "Build Empire RFI dropdown option"
    And I set "SomeCommentLearner[####]" text to the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I click on the "I do not wish to receive information from BPP" "Build Empire RFI Span dropdown item"
    And I click on the "Submit" "Build Empire button"
    Then I wait for "2" seconds
    And I should see the "One of our team will be in touch within 48 hours." "text in div element"
    Then I wait for "30" seconds
    Given I execute "Log In To Salesforce" reusable step
    Then I am on "https://bpp-13fd3e55182--noahuat.lightning.force.com/lightning/r/Lead/00Qg000000FLsmrEAD/view" URL
    And I wait for "1" seconds
    Then I should see the "Salesforce Lead Page Task Today" element
    And I should see the "Callback: RFI Form - New 2020" "text contained in A element"
    And I click on the "Callback: RFI Form - New 2020" "text contained in A element"
    Then I validate text "Call" to be displayed for "Type" "Salesforce read field"
    Then I validate text "EC_DATE" to be displayed for "Due Date" "Salesforce read field"

  @NewLeadRFI #TC-3475
  Scenario: Submit RFI as a Learner and Create Task for a New Prospective Lead
    Given I am on "MD_COMMON_LINKS_BPPDIGITALRFILINK" URL
    And I remember "KW_AUTO_TODAY|DD/MM/YYYY" text as "EC_DATE" variable
    When I click on the "I am a Learner" "Build Empire RFI Label text item"
    And I set "[FIRSTNAME]" text to the "Enter your first name" "Build Empire text field"
    And I set "KW_AUTO_LASTNAME" text to the "Enter your last name" "Build Empire text field"
    And I set "Auto[EMAIL-HARAKIRI]" text to the "Enter your email address" "Build Empire text field"
    And I set "1234567890" text to the "Phone Number" "Build Empire text field by title"
    And I click on the "Select area of interest" "Build Empire RFI Span dropdown item"
    And I click on the "Accountancy and Tax" "Build Empire RFI dropdown option"
    And I set "SomeCommentLearner[####]" text to the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I click on the "I do not wish to receive information from BPP" "Build Empire RFI Span dropdown item"
    And I click on the "Submit" "Build Empire button"
    Then I wait for "2" seconds
    And I should see the "One of our team will be in touch within 48 hours." "text in div element"
    Then I wait for "30" seconds
    Given I execute "Log In To Salesforce" reusable step
    Then I click on the "Salesforce Main Header Button Search" element
    And I fill the "Salesforce Main Header Search" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Main Header Search"
    And I wait for "1" seconds
    And I click on the "EC_FIRSTNAME" "Salesforce First Lead In Search"
    And I wait for "1" seconds
    And I should see the "Callback: RFI Form - New 2020" "text contained in A element"
    And I click on the "Callback: RFI Form - New 2020" "text contained in A element"
    Then I validate text "Call" to be displayed for "Type" "Salesforce read field"
    Then I validate text "EC_DATE" to be displayed for "Due Date" "Salesforce read field"

  @NewBDLeadRFI  #TC-3478
  Scenario: Submit RFI as an Employer and Create Task for New BD Account
    #RFI Submitting Employer
    When I am on "MD_COMMON_LINKS_BPPDIGITALRFILINK" URL
    And I remember "KW_AUTO_TODAY|DD/MM/YYYY" text as "EC_DATE" variable
    When I click on the "I am an Employer" "Build Empire RFI Label text item"
    And I set "[FIRSTNAME]" text to the "Enter your first name" "Build Empire text field"
    And I set "Auto[LASTNAME]" text to the "Enter your last name" "Build Empire text field"
    And I set "Auto[EMAIL-HARAKIRI]" text to the "Enter your email address" "Build Empire text field"
    And I set "[PHONE-0913]" text to the "Phone Number" "Build Empire text field by title"
    And I set "AutoCompany[####]" text to the "Enter your company" "Build Empire text field"
    And I set "AutoJobTitle[####]" text to the "Enter your job title" "Build Empire text field"
    And I set "Some Comment Employer" text to the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I click on the "BPP Digital RFI Form Apprenticeship Levy" button
    And I click on the "Select area of interest" "Build Empire RFI Span dropdown item"
    And I click on the "Accountancy and Tax" "Build Empire RFI dropdown option"
    And I click on the "Select option" "Build Empire RFI Span dropdown item"
    And I click on the "Other" "Build Empire RFI dropdown option"
    And I click on the "I do not wish to receive information from BPP" "Build Empire RFI Span dropdown item"
    And I click on the "Submit" "Build Empire button"
    Then I wait for "2" seconds
    And I should see the "One of our team will be in touch within 48 hours." "text in div element"
    Then I wait for "30" seconds
    Given I execute "Log In To Salesforce" reusable step
    Then I click on the "Salesforce Main Header Button Search" element
    And I fill the "Salesforce Main Header Search" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Main Header Search"
    And I wait for "1" seconds
    And I click on the "EC_FIRSTNAME" "Salesforce First Lead In Search"
    And I wait for "1" seconds
    And I should see the "Callback: RFI Form - New 2020" "text contained in A element"
    And I click on the "Callback: RFI Form - New 2020" "text contained in A element"
    Then I validate text "Call" to be displayed for "Type" "Salesforce read field"
    Then I validate text "EC_DATE" to be displayed for "Due Date" "Salesforce read field"

  @ExistingBDLeadRFI  #TC-3477
  Scenario: Submit RFI as an Employer and Create Task for Existing BD Lead
    #RFI Submitting Employer
    When I am on "MD_COMMON_LINKS_BPPDIGITALRFILINK" URL
    And I remember "KW_AUTO_TODAY|DD/MM/YYYY" text as "EC_DATE" variable
    When I click on the "I am an Employer" "Build Empire RFI Label text item"
    And I set "Automation" text to the "Enter your first name" "Build Empire text field"
    And I set "Regression RFI" text to the "Enter your last name" "Build Empire text field"
    And I set "automationregressionrfi@harakirimail.com" text to the "Enter your email address" "Build Empire text field"
    And I set "[PHONE-0913]" text to the "Phone Number" "Build Empire text field by title"
    And I set "Automation Team" text to the "Enter your company" "Build Empire text field"
    And I set "AutoJobTitle[####]" text to the "Enter your job title" "Build Empire text field"
    And I set "Some Comment Employer" text to the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I click on the "BPP Digital RFI Form Apprenticeship Levy" button
    And I click on the "Select area of interest" "Build Empire RFI Span dropdown item"
    And I click on the "Accountancy and Tax" "Build Empire RFI dropdown option"
    And I click on the "Select option" "Build Empire RFI Span dropdown item"
    And I click on the "Other" "Build Empire RFI dropdown option"
    And I click on the "I do not wish to receive information from BPP" "Build Empire RFI Span dropdown item"
    And I click on the "Submit" "Build Empire button"
    Then I wait for "2" seconds
    And I should see the "One of our team will be in touch within 48 hours." "text in div element"
    Then I wait for "30" seconds
    Given I execute "Log In To Salesforce" reusable step
    Then I am on "https://bpp-13fd3e55182--noahuat.lightning.force.com/lightning/r/Lead/00Qg000000FLtSkEAL/view" URL
    And I should see the "Callback: RFI Form - New 2020" "text contained in A element"
    And I click on the "Callback: RFI Form - New 2020" "text contained in A element"
    Then I validate text "Call" to be displayed for "Type" "Salesforce read field"
    Then I validate text "EC_DATE" to be displayed for "Due Date" "Salesforce read field"

  @ExistingBDContactRFI  #TC-3476
  Scenario: Submit RFI as an Employer and Create Task for Existing BD Contact
    #RFI Submitting Employer
    When I am on "MD_COMMON_LINKS_BPPDIGITALRFILINK" URL
    And I remember "KW_AUTO_TODAY|DD/MM/YYYY" text as "EC_DATE" variable
    When I click on the "I am an Employer" "Build Empire RFI Label text item"
    And I set "Regression" text to the "Enter your first name" "Build Empire text field"
    And I set "Contact" text to the "Enter your last name" "Build Empire text field"
    And I set "regressioncontact@harakirimail.com" text to the "Enter your email address" "Build Empire text field"
    And I set "[PHONE-0913]" text to the "Phone Number" "Build Empire text field by title"
    And I set "AutomationTesting" text to the "Enter your company" "Build Empire text field"
    And I set "AutoJobTitle[####]" text to the "Enter your job title" "Build Empire text field"
    And I set "Some Comment Employer" text to the "Add anything else that may help us answer your query as effectively as possible..." "Build Empire RFI Textarea text item"
    And I click on the "BPP Digital RFI Form Apprenticeship Levy" button
    And I click on the "Select area of interest" "Build Empire RFI Span dropdown item"
    And I click on the "Accountancy and Tax" "Build Empire RFI dropdown option"
    And I click on the "Select option" "Build Empire RFI Span dropdown item"
    And I click on the "Other" "Build Empire RFI dropdown option"
    And I click on the "I do not wish to receive information from BPP" "Build Empire RFI Span dropdown item"
    And I click on the "Submit" "Build Empire button"
    Then I wait for "2" seconds
    And I should see the "One of our team will be in touch within 48 hours." "text in div element"
    Then I wait for "30" seconds
    Given I execute "Log In To Salesforce" reusable step
    Then I am on "https://bpp-13fd3e55182--noahuat.lightning.force.com/lightning/r/Contact/003g0000029g0ifAAA/view" URL
    And I should see the "Callback: RFI Form - New 2020" "text contained in A element"
    And I click on the "Callback: RFI Form - New 2020" "text contained in A element"
    Then I validate text "Call" to be displayed for "Type" "Salesforce read field"
    Then I validate text "EC_DATE" to be displayed for "Due Date" "Salesforce read field"