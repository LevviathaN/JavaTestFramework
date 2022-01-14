@Salesforce @CSA @Cases
Feature: CSA - SLA Milestones
  As a Salesforce user/CSA
  I want to ensure that all cases assigned to the Customer Service Team Queue
  and are responded to within the agreed SLAs.

  @Milestones #TC-802
  Scenario: CSA - SLA Milestones
    Given I execute "Log In To Salesforce" reusable step
    And I click on the "Cases" "Salesforce navigation menu option"
    And I click on the "Salesforce New Case Button" element
    And I click on the "Customer Service" "Salesforce radiobutton"
    And I click on the "Next" "button"
    And I set "2Automation 2CSA" text to the "Contact Name" "Salesforce text field label"
    Then I press "MD_COMMON_KEYBOARD_ENTER" for "Contact Name" "Salesforce text field label"
    And I wait for "1" seconds
    And I click on the "2Automation 2CSA" "text contained in A element first" by JS
    And I wait for "1" seconds
    And I click on the "Salesforce CS Ready to Close" element
    And I click on the "Case Origin" "Salesforce cases dropdown field"
    And I click on the "Email" "Salesforce cases dropdown option"
    And I click on the "Query Type" "Salesforce cases dropdown field"
    And I click on the "My online learning and VLE" "Salesforce cases dropdown option"
    And I click on the "Query Subtype" "Salesforce cases dropdown field"
    Then I click on the "I need to remove old papers from my VLE" element
    And I click on the "Save" "Product Factory button title"
    And I wait for "3" seconds
    Then I should see the "Salesforce Case Milestone Name" element
    Then I should scroll to the "top" of the page
    And I click on the "Salesforce Case Milestones Tab" button
    And I wait for "1" seconds
    Then I validate text "RE=9.+" to be displayed for "Salesforce Case Milestones Tab Milestone One" element