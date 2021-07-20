#@DirectApps
Feature: As an admin, editing an apprenticeship application, when change the programme,
  location or variation of the application
  I expect a record that these items have been edited to be included in the notes

  @EditApplication #TC-2885 To be completed after fixing bug with editing apprenticeship
  Scenario: Edit Apprenticeships Application and Validate Changes as Admin
    Given I register new Hub account using API
    Then I execute "Harakirimail Verify Email" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    And I wait for "2" seconds
    When I execute "Create Professional Apprenticeships Application UAT Accounting Option Two" reusable step
    Given I execute "Complete Professional Apprenticeships UAT Accounting Assistant" reusable step
    Then I execute "Submit Application Hub" reusable step
    And I execute "Log Out from Hub Student" reusable step
    And I execute "Log In to Hub as Admin" reusable step
    Given I click on the "Direct App Admin Apps Top Link" button
    And I click on the "Direct App Admin Direct Apps List Option" element
    Given I click on the "Direct App Admin Apprenticeships Tab" link by JS
    And I fill the "Direct App Admin Filter By User" field with "EC_AUTO_EMAIL"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Direct App Admin Filter By User"
    And I click on the "Show" "button"
    Then I click on the "BPP Digital Admin Edit Application" button
    And I click on the "BPP Digital Admin Edit Application Programme" element
    And I fill the "BPP Digital Searchbox Field" field with "Chartered Manager Degree Apprenticeship"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Searchbox Field"
    Then I click on the "BPP Digital Admin Edit Application Save" button

    And I click on the "BPP Digital Admin Edit Application Variation" element

    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Searchbox Field"
    Then I click on the "BPP Digital Admin Edit Application Save" button

    And I click on the "BPP Digital Admin Edit Application Location" element
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Searchbox Field"
    Then I click on the "BPP Digital Admin Edit Application Save" button
    And I execute "Log Out from Hub Admin" reusable step



