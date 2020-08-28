@DirectApps @ProfessionalApprenticeships
Feature: Reject Professional Apprenticeship Applications

  Background:
    Given I execute "Register New Student Account" reusable step

  @Negative @RejectByAdmin #TC-1023
  Scenario: Reject Professional Apprenticeship By Admin
    When I execute "Create Professional Apprenticeships Application Chartered Manager" reusable step
    Given I execute "Complete Professional Apprenticeships Application Chartered Manager" reusable step replacing some steps
    |31|I click on the "I am a school / college leaver (This is my first professional role)" "Build Empire nationality option"|
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Reject University Degree Apprenticeships As Admin" reusable step
    #Validate employment status
    And I validate text "CONTAINS=I am a school / college leaver (This is my first professional role)" to be displayed for "Direct App Admin Employment Status Additional Answer" element
    Then I should scroll to the "top" of the page
    And I validate text "CONTAINS=SL" to be displayed for "Direct App Admin Employment Status for Apprenticeships" element
    And I execute "Log Out from Hub Admin" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    And I click on the "Direct App My Applications Left Menu Link" link by JS
    Then I validate text "CONTAINS=Unfortunately," to be displayed for "Direct App Validate As Student Application Accepted" element