@BuildEmpire @DirectApps @ProfessionalApprenticeships
Feature: Submit Professional Apprenticeship Applications

  Background:
    Given I register new "Standard" Hub account using API
    Then I execute "Log In to Hub as Student" reusable step

  @Positive @TwoQualifications #TC-847
  Scenario: Submit Professional Apprenticeship With Two Qualifications
    When I execute "Create Professional Apprenticeships Application Chartered Manager" reusable step
    Given I execute "Complete Professional Apprenticeships Application Chartered Manager" reusable step with some additional steps
      |70|I click on the "Direct App Add Qualification" button|
      |71|I click on the "Direct App Country of Study Dropdown" button|
      |72|I click on the "United Kingdom" "Build Empire qualification option"|
      |73|I click on the "Direct App Education Type Degree Radiobutton" button|
      |74|I click on the "Direct App Qualification Title Dropdown" button|
      |75|I fill the "Direct App Education Search Field Dropdown" field with "Foundation degree"|
      |76|I click on the "Foundation degree" "Build Empire application type"|
      |77|I click on the "Direct App Subject Dropdown" button|
      |78|I fill the "Direct App Education Search Field Dropdown" field with "Applied Law (QCF)"|
      |79|I click on the "Applied Law (QCF)" "Build Empire application type"|
      |80|I click on the "Direct App Awarding Institution Dropdown" button|
      |81|I fill the "Direct App Education Search Field Dropdown" field with "Al-Risalah"|
      |82|I click on the "Al-Risalah" "Build Empire application type"|
      |83|I fill the "Direct App Year Completed" field with "11/11/2018"|
      |84|I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Year Completed"|
      |85|I fill the "Direct App Grade" field with "AutoGrade"|
      |86|I fill the "Direct App Examining Body" field with "AutoBody"|
      |87|I click on the "Direct App Add Assesment" button|
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Pre Approve Apprenticeships Application As Admin" reusable step
    And I execute "Attach Automation Line Manager Apprenticeships" reusable step
    And I execute "Log Out from Hub Admin" reusable step
    Given I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And I set "02917uk7sr@harakirimail.com" text to the "Email" "Build Empire text field"
    And I set "qwerty azerty1!" text to the "Password" "Build Empire text field"
    Then I click on the "Direct App Login Button" button
    And I should see the "Direct App My Applications Left Menu Link" element
    Then I execute "Line Manager Review Apprenticeships" reusable step
    And I execute "Log Out from Hub Student" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    And I execute "Complete Professional Apprenticeships Application After Review" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Accept Application As Admin" reusable step
    And I execute "Log Out from Hub Admin" reusable step
    And I execute "Log In to Hub as Student" reusable step
    And I execute "Validate Successful Application As Student" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    And I execute "Post Accepted Apprenticeships Tests" reusable step
    And I execute "Log Out from Hub Admin" reusable step
    And I execute "Log In to Hub as Student" reusable step
    And I execute "Validate Successful Application As Student" reusable step