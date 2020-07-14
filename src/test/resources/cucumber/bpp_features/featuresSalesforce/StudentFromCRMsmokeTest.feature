@EndToEnd @Student @Smoke
Feature: Student from CRM Smoke Test
  Description

  @Positive @BET #TC-547
  Scenario: Student from CRM Smoke Test
    #Create Student
    When I execute "Log In To Salesforce" reusable step
    And I execute "Create Student Account" reusable step replacing some steps
    |13|I set "Can" text to the "Primary Nationality" "Salesforce search field"|
    |14|I click on the "Salesforce First Qualification Subject" link|
    And I execute "Create Address" reusable step
    And I execute "Get Profile ID" reusable step
    And I execute "Create Opportunity" reusable step
    And I click on the "EC_OPPORTUNITY_NAME" "Salesforce link"
    And I click on the "Product Catalog Items" "Salesforce related new button"

    And I click on the "New" "Salesforce dropdown option"
    And I fill the "Salesforce Offering Text Field" field with "MD_COMMON_VALIDDATA_SFOFFERING"
    And I click on the "Salesforce Search" button
    And I "check" "Salesforce Offering Checkbox" checkbox
    And I click on the "Salesforce Add Products" button
    #Add qualification
    And I click on the "Salesforce Account Name link from Opportunity page" link
    And Browser performs "Refresh" command
    And I click on the "Qualifications" "Salesforce Related Buttons link"
    And I set "LAW" text to the "Qualification Subject" "Salesforce New Qualification input fields"
    And I wait for "2" seconds
    And I click on the "Salesforce First Qualification Subject" link
    And I wait for "12" seconds














#    Then I execute "Submit Application" reusable step
#    And Browser performs "Refresh" command












#    #Login to Banner and Addmit student
#    When I execute "Log In To Banner" reusable step
#    And I execute "Navigate To Form" reusable step
#    And I wait for "2" seconds
#    When I fill the "Banner Id Text" field with "EC_BANNER_ID"
#    And I fill the "Banner Term Code" field with "201819"
#    Then I click on the "Banner Go" button
#    And I click on the "Banner SAADCRV Set Desicison Insert Button" button
#    Then I fill the "Banner Decision Code" field with "AM"
#    And I press "MD_COMMON_KEYBOARD_ENTER" for "Banner Decision Code"
#    Then I click on the "Banner Save" button
#    And I should see the "Decision Processed" message in "Banner Frame" frame
#    #Navigate to Salesforce
#    Given I am on "https://bpp-13fd3e55182--noahqa.lightning.force.com/" URL
#    #Search for student
#    And I fill the "Salesforce Main Header Search" field with "EC_PROFILE_ID"
#    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Main Header Search"
#    And I wait for "2" seconds
#    And I click on the "Salesforce Student Account link" link
#    And I click on the "Details" "Salesforce link"
#    Then I validate text "RE=^[a-zA-Z].[a-zA-Z]\w{1,}" to be displayed for "Salesforce Provisioning Username field" element
#    Then I validate text "RE=^[A-z0-9]{1,}" to be displayed for "Salesforce Provisioning Password field" element
#    Then I validate text "RE=^([1-zA-Z0-1@.\s]{1,255})$" to be displayed for "Salesforce Provisioning Email Address field" element
#    And I wait for "21" seconds
#    #Navigate to VLE to verify login
#    Given I am on "http://bpp-fusion-test.apolloglobal.int/vle/" URL