@DigitalSite @BuildEmpire
Feature: BPP Digital Bulk Upload Functionality for Redirects
  As an admin
  I expect to be able to upload a CSV with columns for each property for redirects

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive @BulkUpload #TC-1579 TC-1580 TC-1581
  Scenario: Bulk Upload Functionality for Redirects
    When I execute "Admin Hub Navigate to Website Redirects" reusable step
    #Upload CSV
    And I click on the "Import CSV" "BPP Digital Admin Page Button"
    And I upload "UploadRedirect.csv" file to "Direct App Upload File" element
    Then I validate text "path" to be displayed for "BPP Digital Import Redirects Table Redirect Type value" element
    Then I validate text "www.bpp.automation.com/" to be displayed for "BPP Digital Import Redirects Table Host value" element
    Then I validate text "/offshore" to be displayed for "BPP Digital Import Redirects Table Source value" element
    Then I validate text "bpp.offshore.automation.com" to be displayed for "BPP Digital Import Redirects Table Target value" element
    Then I validate text "301" to be displayed for "BPP Digital Import Redirects Table Status value" element
    And I click on the "Import" "BPP Digital Button With Specific Name"
    And I set "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINPASSWORD" text to the "Password" "Build Empire text field"
    And I click on the "OK" "button"
    Then I should see the "1 redirects imported!" "BPP Digital Admin Alert Message"
    And Browser performs "Refresh" command
    Then I validate text "www.bpp.automation.com/" to be displayed for "BPP Digital Import Redirects Table Host value" element
    Then I validate text "/offshore" to be displayed for "BPP Digital Import Redirects Table Source value" element
    Then I validate text "bpp.offshore.automation.com" to be displayed for "BPP Digital Import Redirects Table Target value" element
    Then I validate text "301" to be displayed for "BPP Digital Import Redirects Table Status value" element
    Then I validate text "less than a minute ago" to be displayed for "BPP Digital Import Redirects Table Updated value" element
    #Upload Existing CSV with Minor Changes
    And I click on the "Import CSV" "BPP Digital Admin Page Button"
    And I upload "UploadRedirectExisting.csv" file to "Direct App Upload File" element
    Then I validate text "path" to be displayed for "BPP Digital Import Redirects Table Redirect Type value" element
    Then I validate text "www.bpp.automation.com/" to be displayed for "BPP Digital Import Redirects Table Host value" element
    Then I validate text "/offshore" to be displayed for "BPP Digital Import Redirects Table Source value" element
    Then I validate text "bpp.offshore.automation.com.second" to be displayed for "BPP Digital Import Redirects Table Target value" element
    Then I validate text "302" to be displayed for "BPP Digital Import Redirects Table Status value" element
    And I click on the "Import" "BPP Digital Button With Specific Name"
    And I set "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINPASSWORD" text to the "Password" "Build Empire text field"
    And I click on the "OK" "button"
    Then I should see the "1 redirects imported!" "BPP Digital Admin Alert Message"
    And Browser performs "Refresh" command
    Then I validate text "www.bpp.automation.com/" to be displayed for "BPP Digital Import Redirects Table Host value" element
    Then I validate text "/offshore" to be displayed for "BPP Digital Import Redirects Table Source value" element
    Then I validate text "bpp.offshore.automation.com.second" to be displayed for "BPP Digital Import Redirects Table Target value" element
    Then I validate text "302" to be displayed for "BPP Digital Import Redirects Table Status value" element
    Then I validate text "less than a minute ago" to be displayed for "BPP Digital Import Redirects Table Updated value" element
    #Clean Up
    When I remember "www.bpp.automation.com/" text as "EC_AUTOMATION_URL" variable
    Then I click on the "EC_AUTOMATION_URL" "BPP Digital Admin Delete Button for Specific name"
    #Then I should see the "Redirect was successfully removed" "BPP Digital Admin Alert Message"