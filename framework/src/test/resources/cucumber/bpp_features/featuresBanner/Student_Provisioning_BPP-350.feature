@EndToEnd @Smoke @Banner
Feature: Admitting a single student in Banner - BPP-350
  As a member of the Admissions team, I want to admit a student in Banner.

  @Positive @AdmitStudent #TC-547
  Scenario: Admit Student in Banner
    Given I execute "Log In To Salesforce" reusable step
    Given I execute "Create Student Account" reusable step
    And I execute "Create Address" reusable step
    And I execute "Get Profile ID" reusable step
    And I execute "Create Opportunity" reusable step
    And I click on the "EC_OPPORTUNITY_NAME" "Salesforce link"
    #And I click on the "Product Catalog Items" "Salesforce related new button"
    #New Aproach
    And I click on the "Product Catalog Items" "Salesforce cases status option"
    And I click on the "Salesforce New Case Button" button
#    And I click on the "New" "Salesforce dropdown option"
    And I fill the "Salesforce Offering Text Field" field with "MD_COMMON_VALIDDATA_SFOFFERING"
    And I click on the "Salesforce Search" button
    And I "check" "Salesforce Offering Checkbox" checkbox
    And I click on the "Salesforce Add Products" button
    Given I execute "Submit Application" reusable step
    Given I execute "Log In To Banner" reusable step
    And I wait for "25" seconds
    And I execute "Navigate To Form" reusable step
    When I fill the "Banner Id Text" field with "EC_BANNER_ID"
    And I fill the "Banner Term Code" field with "201819"
    Then I click on the "Banner Go" button
    And I click on the "Banner SAADCRV Set Desicison Insert Button" button
    Then I fill the "Banner Decision Code" field with "AM"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Banner Decision Code"
    Then I click on the "Banner Save" button
    And I should see the "Decision Processed" message in "Banner Frame" frame
    And I wait for "25" seconds
    #Navigate to Salesforce
    Given I execute "Log In To Salesforce" reusable step
    #Search for student
    And I fill the "Salesforce Main Header Search" field with "EC_PROFILE_ID"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Salesforce Main Header Search"
    And I wait for "25" seconds
    And I click on the "Salesforce Student Account link" link
    And I click on the "Details" "Salesforce link"
    Then I validate text "RE=^[a-zA-Z].[a-zA-Z]\w{1,}" to be displayed for "Salesforce Provisioning Username field" element
#    Then I validate text "RE=^[A-z0-9]{1,}" to be displayed for "Salesforce Provisioning Password field" element
    Then I validate text "RE=^([1-zA-Z0-1@.\s]{1,255})$" to be displayed for "Salesforce Provisioning Email Address field" element
#    And I capture text data "Salesforce Provisioning Username field" as "EC_USERNAME" variable
#    And I capture text data "Salesforce Provisioning Password field" as "EC_PASSWORD" variable
#    And I capture text data "Salesforce Provisioning Email Address field" as "EC_PROVISIONING_EMAIL" variable
#    #Navigate to VLE to verify login
#    When I am on "https://bpp-fusion-test.apolloglobal.int/vle/login/index.php?authCAS=CAS" URL
#    And I set "EC_USERNAME" text to the "username" "VLE Login Fields"
#    And I set "EC_PASSWORD" text to the "password" "VLE Login Fields"
#    And I click on the "LOGIN" "Totara button"
#    And I wait for "5" seconds
#    And I should see the "VLE Website Usermenu" element
