@DirectApps @Scholarship
Feature: Complete BPP University Scholarship Application

  Background:
    Given I execute "Register New Student Account" reusable step
    When I execute "Create Scholarships Application" reusable step

  Scenario: Complete Scholarship Application
    Given I click on the "Direct App Start Application" button
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I click on the "Diret App Do You Meet Eligilibility Criteria Yes" button
    And I click on the "Direct App Next" button
    And I fill the "Diret App Phone Number" field with "EC_PHONENUMBER"
    And I set "Address 1" text to the "Address Line 1*" "Build Empire text field"
    And I set "Address 1" text to the "Address Line 2" "Build Empire text field"
    And I set "London" text to the "Town/City*" "Build Empire text field"
    And I fill the "Diret App Postal Code" field with "12345"
    Then I remember "KW_AUTO_DOB|DD/MM/YYYY_21" text as "EC_DOB" variable
    And I fill the "Direct App DOB" field with "EC_DOB"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App DOB"
    And I set "London" text to the "Town/City*" "Build Empire text field"
    And I click on the "Direct App Mark As Complete Checkbox" button
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
    And I click on the "Direct App Next" button
    Then I upload "directApp.pdf" file to "Direct App Upload File" element
    And I fill the "Direct App Uploaded File Description" field with "Test"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I click on the "Direct App Scholarships Add Employment" button
    And I set "Name" text to the "Name of employer" "Build Empire employment element"
    And I set "Title" text to the "Job title" "Build Empire employment element"
    And I fill the "Direct App Scholarship Start Date" field with "11/10/2015"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Scholarship Start Date"
    And I fill the "Direct App Scholarship End Date" field with "11/05/2016"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Scholarship End Date"
    And I set "Description" text to the "Description" "Build Empire employment element"
    And I click on the "Direct App Scholarship Add" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I fill the "Direct App Scholarship Evidence Summary" field with "Evidence Summary"
    And I click on the "Direct App Scholarship Add New Reference" button
    And I set "Name" text to the "Name of reference" "Build Empire scholarship evidence element"
    And I set "Position" text to the "Position" "Build Empire scholarship evidence element"
    And I set "Address 1" text to the "Address" "Build Empire scholarship evidence element"
    And I set "EC_PHONENUMBER" text to the "Telephone" "Build Empire scholarship evidence element"
    And I fill the "Direct App Scholarship Evidence Date" field with "10/10/2017"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Scholarship Evidence Date"
    And I set "email000@mail.com" text to the "Email" "Build Empire scholarship evidence element"
    And I click on the "Direct App Scholarship Add" button
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Next" button
    And I set "TestSubject" text to the "Subject" "Build Empire education element"
    And I set "test" text to the "School/awarding institution" "Build Empire education element"
    And I set "TestGrade" text to the "Grade/ Class of degree" "Build Empire education element"
    And I click on the "Direct App Education Type" button
    And I click on the "Degree" "Build Empire application type"
    And I click on the "Direct App Actual Radiobutton" element
    And I fill the "Direct App Days Studying Law Textarea" field with "Automation"
    And I fill the "Direct App Skill Range Textarea" field with "Automation"
    And I click on the "Direct App Mark As Complete Checkbox" button
    And I click on the "Direct App Save And Return" button
    Then I execute "Submit Application Hub" reusable step