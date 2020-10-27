@Salesforce @RegistryCaseManagement @Milestones @Cases
Feature: Registry Case Management
  As a Registry Salesforce Classic User switching to Lightning Experience,
  I want Registry Case Management to perform as expected

#TC-2537
  Scenario: Registry Case Verify Milestones Assesments and ID Cards
    Given I execute "Log In To Salesforce" reusable step
    And I execute "Create Assesments Registry Case" reusable step
    And I click on the "Salesforce Case Milestones Tab" button
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=14.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element
    And I execute "Create ID Card Registry Case" reusable step
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Student Query - Work Started" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab Second Milestone Name" element
    Then I validate text "RE=4.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element
    Then I validate text "RE=9.+" to be displayed for "Salesforce Case Milestones Tab Milestone Two" element

  Scenario: Registry Case Verify Milestones Letter Production and IOS
    Given I execute "Log In To Salesforce" reusable step
    And I execute "Create Letter Production Registry Case" reusable step
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "1" seconds
    Then I validate text "RE=9.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element
    And I execute "Create IOS Registry Case" reusable step
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Student Query - Work Started" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab Second Milestone Name" element
    Then I validate text "RE=4.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element
    Then I validate text "RE=9.+" to be displayed for "Salesforce Case Milestones Tab Milestone Two" element

  Scenario: Registry Case Verify Milestones Registration and Induction
    Given I execute "Log In To Salesforce" reusable step
    And I execute "Create Registration and Induction Registry Case" reusable step
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=9.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element
    When I execute "Create Registration and Induction Registry Case" reusable step replacing some steps
      | 11 | I click on the "Pay my first instalment" "Salesforce cases dropdown option" |
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=4.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element

  Scenario: Registry Case Verify Milestones Timetable, VLE
    Given I execute "Log In To Salesforce" reusable step
    And I execute "Create Timetable Registry Case" reusable step
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "2" seconds
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=9.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element
    When I execute "Create Timetable Registry Case" reusable step replacing some steps
      | 9  | I click on the "VLE" "Salesforce cases dropdown option"                   |
      | 11 | I click on the "Cant login to the VLE" "Salesforce cases dropdown option" |
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "2" seconds
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=9.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element

  Scenario: Registry Case Verify Milestones Attendance and Absence and Book an Appointment
    Given I execute "Log In To Salesforce" reusable step
    When I execute "Create Timetable Registry Case" reusable step replacing some steps
      | 9  | I click on the "Attendance & Absences" "Salesforce cases dropdown option" |
      | 11 | I click on the "Attendance record" "Salesforce cases dropdown option"     |
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "2" seconds
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=4.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element
    When I execute "Create Timetable Registry Case" reusable step replacing some steps
      | 9  | I click on the "Book an Appointment" "Salesforce cases dropdown option" |
      | 11 | I click on the "Personal Tutor" "Salesforce cases dropdown option"      |
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "2" seconds
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=4.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element

  Scenario: Registry Case Verify Milestones Graduation and Certificates
    Given I execute "Log In To Salesforce" reusable step
    When I execute "Create Timetable Registry Case" reusable step replacing some steps
      | 9  | I click on the "Graduation and Certificates" "Salesforce cases dropdown option"     |
      | 11 | I click on the "Highest module mark certificate" "Salesforce cases dropdown option" |
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=14.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element
    When I execute "Create Timetable Registry Case" reusable step replacing some steps
      | 9  | I click on the "Graduation and Certificates" "Salesforce cases dropdown option" |
      | 11 | I click on the "Graduation Information" "Salesforce cases dropdown option"      |
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=24.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element

  Scenario: Registry Case Verify Milestones Complaints
    Given I execute "Log In To Salesforce" reusable step
    When I execute "Create Complaints Registry Case" reusable step
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Student Query - Work Started" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=9.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element

  Scenario: Registry Case Verify Milestones Personal Details and Change of Programme
    Given I execute "Log In To Salesforce" reusable step
    When I execute "Create Complaints Registry Case" reusable step replacing some steps
      | 9 | I click on the "Change of programme, mode or location" "Salesforce cases dropdown option" |
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=9.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element
    When I execute "Create Timetable Registry Case" reusable step replacing some steps
      | 9  | I click on the "Personal Details" "Salesforce cases dropdown option"          |
      | 11 | I click on the "Change of contact details" "Salesforce cases dropdown option" |
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=4.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element

  Scenario: Registry Case Verify Milestones Student Loans and Locker Key
    Given I execute "Log In To Salesforce" reusable step
    When I execute "Create Complaints Registry Case" reusable step replacing some steps
      | 9 | I click on the "Student Loans Company query" "Salesforce cases dropdown option" |
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "2" seconds
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=4.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element
    When I execute "Create Timetable Registry Case" reusable step replacing some steps
      | 9  | I click on the "Locker Key" "Salesforce cases dropdown option" |
      | 11 | I click on the "Returned" "Salesforce cases dropdown option"   |
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "2" seconds
    Then I validate text "CONTAINS=Student Query - Work Started" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab Second Milestone Name" element
    Then I validate text "RE=4.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element
    Then I validate text "RE=9.+" to be displayed for "Salesforce Case Milestones Tab Milestone Two" element

  Scenario: Registry Case Verify Milestones International Support
    Given I execute "Log In To Salesforce" reusable step
    When I execute "Create Timetable Registry Case" reusable step replacing some steps
      | 9  | I click on the "International Support" "Salesforce cases dropdown option" |
      | 11 | I click on the "Lost Documents" "Salesforce cases dropdown option"        |
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=4.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element
    When I execute "Create Timetable Registry Case" reusable step replacing some steps
      | 9  | I click on the "International Support" "Salesforce cases dropdown option"         |
      | 11 | I click on the "Short term study visa letters" "Salesforce cases dropdown option" |
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "RE=9.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element

  Scenario: Registry Case Verify Milestones Oyster Card
    Given I execute "Log In To Salesforce" reusable step
    When I execute "Create Timetable Registry Case" reusable step replacing some steps
      | 9  | I click on the "Oyster Card" "Salesforce cases dropdown option" |
      | 11 | I click on the "Other" "Salesforce cases dropdown option"       |
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Student Query - Work Started" to be displayed for "Salesforce Case Milestones Tab First Milestone Name" element
    Then I validate text "CONTAINS=Student Query - Ready to Close" to be displayed for "Salesforce Case Milestones Tab Second Milestone Name" element
