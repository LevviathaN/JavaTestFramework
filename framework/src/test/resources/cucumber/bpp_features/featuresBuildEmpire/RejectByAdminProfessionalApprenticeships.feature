@BuildEmpire @DirectApps @ProfessionalApprenticeships
Feature: Reject Professional Apprenticeship Applications

  Background:
    Given I register new "Standard" Hub account using API
    Then I execute "Log In to Hub as Student" reusable step

  @Negative @RejectByAdmin #TC-1023, TC-1573
  Scenario: Reject Professional Apprenticeship By Admin
    When I execute "Create Professional Apprenticeships Application Chartered Manager" reusable step
    Given I execute "Complete Professional Apprenticeships Application Chartered Manager" reusable step replacing some steps
      |31|I click on the "I am a school / college leaver (This is my first professional role)" "Build Empire nationality option"|
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    # Verify logic for BPP-13608 (upload of encrypted documents)
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Then I click on the "Apprenticeships" "Build Empire admin applications tab"
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I upload "BPP-13608.docx" file to "BPP Digital Additional Files Upload File Button" element
    And I click on the "BPP Digital Additional Files Upload Button" button
    Then I wait for "1" seconds
    And I should see the "BPP-13608.docx" "text contained in A element"
    And I execute "Reject University Degree Apprenticeships As Admin" reusable step
    #Validate employment status
    And I validate text "CONTAINS=I am a school / college leaver (This is my first professional role)" to be displayed for "Direct App Admin Employment Status Additional Answer" element
    Then I should scroll to the "top" of the page
    And I validate text "CONTAINS=SL" to be displayed for "Direct App Admin Employment Status for Apprenticeships" element
    Then I click on the "BPP Digital Admin Edit Application" button
    And I fill the "BPP Digital Overwritten Start Date" field with "2021/10/10 12:00"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Overwritten Start Date"
    And I fill the "BPP Digital Overwritten End Date" field with "2022/11/01 12:10"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Overwritten End Date"
    And I click on the "BPP Digital Admin Edit Application Save" element
    And I validate text "CONTAINS=Overwritten" to be displayed for "Direct App Admin Start Date for Apprenticeships" element
    And I validate text "CONTAINS=Overwritten" to be displayed for "Direct App Admin End Date for Apprenticeships" element
    And I execute "Log Out from Hub Admin" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    And I click on the "Direct App My Applications Left Menu Link" link by JS
    Then I validate text "CONTAINS=Unfortunately," to be displayed for "Direct App Validate As Student Application Accepted" element