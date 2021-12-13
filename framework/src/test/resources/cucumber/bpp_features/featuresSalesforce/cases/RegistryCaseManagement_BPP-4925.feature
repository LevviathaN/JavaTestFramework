@Salesforce @RegistryCaseManagement @Cases @AssignmentRules
Feature: Registry Case Management
  As a Registry Salesforce Classic User switching to Lightning Experience,
  I want Registry Case Management to perform as expected

  @EndToEndCases #TC-2535,3975,3984,3974,3983,3982,3973,3966,3965,3964,3981,3976,3978,3980,3977,3979
  Scenario: Registry Case Management End To End
    Given I execute "Log In To Salesforce" reusable step
    And I execute "Create ID Card Registry Case" reusable step
    And I validate text "CONTAINS=Student Records" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER_ENDTOEND" variable
    Then I click on the "Salesforce Edit Case Status" button by JS
    And I click on the "Salesforce Case Status Dropdown" element
    And I click on the "In Progress" "Salesforce cases status option"
    And I click on the "Salesforce Save Account Button" button
    And I wait for "2" seconds
    And I validate text "In Progress" to be displayed for "Salesforce Case Status Data Field" element
    Then I click on the "Salesforce Edit Case Status" button by JS
    And I click on the "Salesforce Case Status Dropdown" element
    And I click on the "Ready to Close" "Salesforce cases status option"
    And I click on the "Salesforce Save Account Button" button
    And I wait for "2" seconds
    And I validate text "Ready to Close" to be displayed for "Salesforce Case Status Data Field" element

  @QueryVerification
  Scenario: Registry Case Management Verify Case Queues
    Given I execute "Log In To Salesforce" reusable step
    And I execute "Validate All Registry Cases Types" reusable step

  @AssignmentRulesAssessments
  Scenario Outline: Registry Case Management Verify Assignment Assessments For <school> School and <caseOwner> Case Owner
    Given I execute "Log In To Salesforce" reusable step
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
    Then I click on the "<subQueue>" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "<school>" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=<caseOwner>" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

    Examples:
      |school      |subQueue                                                    |caseOwner|
      |Business    |I have a Turnitin issue                                     |Business School Academic Admin|
      |Law         |I have a question about my results                          |Exam Operations|
      |Psychology  |I have a question about my exam arrangements                |Exam Operations|
      |Law         |I would like to defer my assessment or request an extension |Law School Programme Support|
      |Psychology  |I have a question about my assessments feedback             |Psychology School Programme Support|
      |Technology  |I would like to resit my exam                               |Technology School Support|

  @AssignmentRulesAttendance
  Scenario Outline: Registry Case Management Verify Assignment Attendance For <school> School and <caseOwner> Case Owner
    Given I execute "Log In To Salesforce" reusable step
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Attendance and Absences" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "<subQueue>" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "<school>" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=<caseOwner>" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

    Examples:
      |school      |subQueue                                                    |caseOwner|
      |Business    |I have a query about my attendance record                   |Business School Attendance|
      |Law         |My name is missing from the class register                  |Law School Attendance|
      |Psychology  |I need to inform you about my absence                       |Psychology School Programme Support|
      |Technology  |I have a query about my attendance record                   |Technology School Support|

  @AssignmentRulesAppointment
  Scenario: Registry Case Management Verify Assignment Book an Appointment
    Given I execute "Log In To Salesforce" reusable step
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Book an Appointment" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "I would like an Appointment with an academic" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "Business" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=Business School Programme Support" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

  @AssignmentRulesChangesStudies
  Scenario Outline: Registry Case Management Verify Assignment Changes to Studies For <school> School and <caseOwner> Case Owner
    Given I execute "Log In To Salesforce" reusable step
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Changes to studies or personal details" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "<subQueue>" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "<school>" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=<caseOwner>" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

    Examples:
      |school      |subQueue                                                    |caseOwner|
      |Business    |I want to change my programme, mode or location             |Business School Programme Support|
      |Law         |I want to change my programme, mode or location             |Law School Programme Support|
      |Psychology  |I want to change my programme, mode or location             |Psychology School Programme Support|
      |Nursing     |I need to change my personal details                        |Student Records|
      |Technology  |I want to change my programme, mode or location             |Technology School Support|

  @AssignmentRulesGraduationCertificates
  Scenario Outline: Registry Case Management Verify Assignment Graduation For <school> School and <caseOwner> Case Owner
    Given I execute "Log In To Salesforce" reusable step
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Graduation and Certificates" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "<subQueue>" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "<school>" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=<caseOwner>" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

    Examples:
      |school      |subQueue                                                    |caseOwner|
      |Business    |I would like my highest module mark certificate             |Business School Academic Admin|
      |Law         |I have not received my certificate                          |Graduation Team|
      |Technology  |I need a replacement certificate                            |Technology School Support|

  @AssignmentRulesIOS
  Scenario Outline: Registry Case Management Verify Assignment IOS For <school> School and <caseOwner> Case Owner
    Given I execute "Log In To Salesforce" reusable step
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
    Then I click on the "<subQueue>" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "<school>" "Salesforce cases dropdown option"
    And I click on the "IOS Form Received?" "Salesforce cases dropdown field"
    Then I click on the "Yes" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=<caseOwner>" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

    Examples:
      |school      |subQueue                                                    |caseOwner|
      |Business    |I am on Interruption of Studies and wish to extend          |Business School Programme Support|
      |Law         |I would like to apply for Interruption of Studies           |Law School Programme Support|
      |Psychology  |I am on Interruption of Studies and wish to extend          |Psychology School Programme Support|
      |Nursing     |I would like to apply for Interruption of Studies           |Student Records|
      |Technology  |I would like to apply for Interruption of Studies           |Technology School Support|

  @AssignmentRulesLetterRequests
  Scenario Outline: Registry Case Management Verify Assignment Letter Requests For <school> School and <caseOwner> Case Owner
    Given I execute "Log In To Salesforce" reusable step
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
    Then I click on the "<subQueue>" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "<school>" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=<caseOwner>" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

    Examples:
      |school      |subQueue                                                    |caseOwner|
      |Business    |I would like an academic reference                          |Business School Academic Admin|
      |Business    |Authorised Leave                                            |Business School Attendance|
      |Business    |Holiday                                                     |Business School Programme Support|
      |Law         |Authorised Leave                                            |Law School Attendance|
      |Psychology  |I would like a holiday letter                               |Psychology School Programme Support|
      |Nursing     |Status Letter                                               |Student Records|
      |Technology  |Authorised Leave                                            |Technology School Support|

  @AssignmentRulesLockers
  Scenario Outline: Registry Case Management Verify Assignment Lockers For <school> School and <caseOwner> Case Owner
    Given I execute "Log In To Salesforce" reusable step
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Lockers" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "<subQueue>" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "<school>" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=<caseOwner>" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

    Examples:
      |school      |subQueue                                                    |caseOwner|
      |Business    |I have a question about my locker key                       |Student Records|

  @AssignmentRulesOnlineLearning
  Scenario Outline: Registry Case Management Verify Assignment Online Learning For <school> School and <caseOwner> Case Owner
    Given I execute "Log In To Salesforce" reusable step
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Online learning" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "<subQueue>" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "<school>" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=<caseOwner>" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

    Examples:
      |school      |subQueue                                                    |caseOwner|
      |Business    |I cannot see a submission link on Hub/VLE                   |Business School Academic Admin|
      |Business    |I have a group number Issue                                 |Business School Programme Support|
      |Law         |I have a group number Issue                                 |Law School Programme Support|
      |Psychology  |I have an issue with my online materials                    |Psychology School Programme Support|
      |Technology  |I have missing or wrong modules on Hub/VLE                  |Technology School Support|

  @AssignmentRulesPersonalTutor
  Scenario Outline: Registry Case Management Verify Assignment Personal Tutor For <school> School and <caseOwner> Case Owner
    Given I execute "Log In To Salesforce" reusable step
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Personal Tutor Support" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "<subQueue>" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "<school>" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=<caseOwner>" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

    Examples:
      |school      |subQueue                                                    |caseOwner|
      |Business    |I would like help with study skills                         |Business School Personal Tutors|

  @AssignmentRulesRegistration
  Scenario Outline: Registry Case Management Verify Assignment Registration For <school> School and <caseOwner> Case Owner
    Given I execute "Log In To Salesforce" reusable step
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
    Then I click on the "<subQueue>" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "<school>" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=<caseOwner>" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

    Examples:
      |school      |subQueue                                                    |caseOwner|
      |Business    |I have an exemptions question                               |Business School Programme Support|
      |Law         |I am an international student with a registration query     |International Student Advice|
      |Law         |I have an exemptions question                               |Law School Programme Support|
      |Psychology  |I missed my induction, how do I catch up?                   |Psychology School Programme Support|
      |Nursing     |My ID card has been lost or stolen                          |Student Records|
      |Technology  |I missed my induction, how do I catch up?                   |Technology School Support|

  @AssignmentRulesStudentFinance
  Scenario Outline: Registry Case Management Verify Assignment Student Finance and Loans For <school> School and <caseOwner> Case Owner
    Given I execute "Log In To Salesforce" reusable step
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Student finance and loans" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "<subQueue>" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "<school>" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=<caseOwner>" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

    Examples:
      |school      |subQueue                                                    |caseOwner|
      |Business    |Can I have a copy of my payment plan?                       |Finance Queue|
      |Law         |How can I pay my fees?                                      |Finance Queue|
      |Technology  |I have a question about my student loan                     |SLC Queries|

  @AssignmentRulesTimetables
  Scenario Outline: Registry Case Management Verify Assignment Timetables For <school> School and <caseOwner> Case Owner
    Given I execute "Log In To Salesforce" reusable step
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Timetables" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "<subQueue>" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "<school>" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=<caseOwner>" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

    Examples:
      |school      |subQueue                                                    |caseOwner|
      |Business    |I have a question about my term dates                       |Business School Programme Support|
      |Law         |I have an issue with my timetable                           |Law School Programme Support|
      |Psychology  |I have a question about my term dates                       |Psychology School Programme Support|
      |Technology  |I have an issue with my timetable                           |Technology School Support|

  @AssignmentRulesVisa
  Scenario Outline: Registry Case Management Verify Assignment Visa For <school> School and <caseOwner> Case Owner
    Given I execute "Log In To Salesforce" reusable step
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Student Query" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Face-to-Face" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "Visa" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "<subQueue>" "Salesforce cases dropdown option"
    And I click on the "Study Location" "Salesforce cases dropdown field"
    Then I click on the "Leeds" "Salesforce cases dropdown option"
    And I click on the "School" "Salesforce cases dropdown field"
    Then I click on the "<school>" "Salesforce cases dropdown option"
    And I click on the "Save" "Product Factory button title"
    And I wait for "2" seconds
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=<caseOwner>" to be displayed for "Salesforce Case Owner Data Field" element
    And I capture text data "Salesforce Case Number Data Field" as "EC_CASENUMBER" variable

    Examples:
      |school      |subQueue                                                    |caseOwner|
      |Business    |I have a question about my Visa                             |International Student Advice|
      |Law         |I need to report a problem with my Biometric Resident Permit|International Student Advice|
      |Psychology  |I want to apply for a Shengen/travel Visa                   |International Student Advice|
      |Technology  |I would like to book an appointment for Visa advice         |International Student Advice|

  @GDL #TC-3975,3984,3974,3983,3982,3973,3966,3965,3964,3981,3976,3978,3980,3977,3979
  Scenario: Registry Case Management Verify Case Assignment GDL Law Schools
    Given I execute "Log In To Salesforce" reusable step
    And I execute "Create Complaints Registry Case" reusable step replacing some steps
      | 9  | I click on the "General GDL Query" "Salesforce cases dropdown option" |
      | 11 | I click on the "Cambridge" "Salesforce cases dropdown option" |
      | 13 | I click on the "Law" "Salesforce cases dropdown option" |
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=General GDL Queries" to be displayed for "Salesforce Case Owner Data Field" element
    And I wait for "1" seconds
    And I execute "Create Complaints Registry Case" reusable step replacing some steps
      | 9  | I click on the "General BPTC/LLM LPB Query" "Salesforce cases dropdown option" |
      | 11 | I click on the "Leeds" "Salesforce cases dropdown option" |
      | 13 | I click on the "Law" "Salesforce cases dropdown option" |
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=General BPTC/LLM LPB Queries" to be displayed for "Salesforce Case Owner Data Field" element
    And I wait for "1" seconds
    And I execute "Create Complaints Registry Case" reusable step replacing some steps
      | 9  | I click on the "General BTC/LLM LPB (from September 2020) Query" "Salesforce cases dropdown option" |
      | 11 | I click on the "Leeds" "Salesforce cases dropdown option" |
      | 13 | I click on the "Law" "Salesforce cases dropdown option" |
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=General BTC/LLM LPB Sept Queries" to be displayed for "Salesforce Case Owner Data Field" element
    And I wait for "1" seconds
    And I execute "Create Complaints Registry Case" reusable step replacing some steps
      | 9  | I click on the "General LPC/LLM LPS Query" "Salesforce cases dropdown option" |
      | 11 | I click on the "Leeds" "Salesforce cases dropdown option" |
      | 13 | I click on the "Law" "Salesforce cases dropdown option" |
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=General LPC/LLM LPS Queries" to be displayed for "Salesforce Case Owner Data Field" element
    And I wait for "1" seconds
    And I execute "Create Complaints Registry Case" reusable step replacing some steps
      | 9  | I click on the "General PGDL/LLM LLP (from September 2020) Query" "Salesforce cases dropdown option" |
      | 11 | I click on the "Bristol" "Salesforce cases dropdown option" |
      | 13 | I click on the "Law" "Salesforce cases dropdown option" |
    And I should scroll to the "top" of the page
    And I validate text "CONTAINS=General PGDL/LLM LLP Sept Queries" to be displayed for "Salesforce Case Owner Data Field" element