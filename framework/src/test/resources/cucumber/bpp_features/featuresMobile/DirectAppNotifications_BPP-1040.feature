@Mobile
Feature: BPP University Hub Direct App Notifications
  As a Hub user
  I would like to see notifications on my dashboard in regards to Direct Apps

  @Positive @iPad @iPhone#TC-1130 TC-1104 TC-1171
  Scenario: Direct App Notifications_Mobile
    Then I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "AutoFrancisMcKnight2507@getnada.com" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    And I wait for "1" seconds
    #Verify CTA Banner
    Then I shouldn't see the "Direct App CTA Banner Bar" message
    #Timeline for New Started Application
    Given I click on the "Direct App My Applications Left Menu Link" link by JS
    And I click on the "Direct App Start New Application Button" link by JS
    And I click on the "Direct App What Are You Applying For Dropdown" element
    Then I click on the "BPP Professional Apprenticeships" "Build Empire application type"
    And I click on the "Direct App Programmes Programm Dropdown" element
    Then I click on the "UAT Accounting Assistant" "Build Empire application type"
    Then I click on the "Direct App Location Dropdown" element
    And I wait for "1" seconds
    And I click on the "Direct App Start Date Application Dropdown" element
    Then I click on the "UAT Assisstant Accountant - Option 2" "Build Empire application type"
    And I click on the "Direct App Create Application" button
    #Start Application
    And I wait for "2" seconds
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
    And I click on the "Direct App Next" button
    And I wait for "7" seconds
    #Navigate Home and verify timeline notification
    And I am on "https://web-stage-bppdigital.bppuniversity.com/my/home" URL
    Then I should see the "You started an application for UAT Accounting Assistant" "message mobile"