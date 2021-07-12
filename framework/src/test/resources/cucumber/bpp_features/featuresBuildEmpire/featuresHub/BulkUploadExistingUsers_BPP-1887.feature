@BuildEmpire @Hub
Feature: BPP University Hub Bulk Upload Existing Users
  As an admin, if I upload a user via CSV import, and there is an email address that already has a user in the database,
  I expect this to update the current user in the database, rather than skip, so my import works as I expect
  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive #TC-1173
  Scenario: Hub Bulk Upload Existing Users
    #Navigate to User Imports
    When I execute "Admin Hub Navigate to Users List" reusable step
    #Import Students via CSV
    And I click on the "Import" "BPP Digital Admin Page Button"
    And I upload "BAusersToUploadExisting.csv" file to "Direct App Upload File" element
    And I click on the "BPP Digital Green Import button" button
    And I set "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINPASSWORD" text to the "Password" "Build Empire text field"
    And I click on the "OK" "BPP Digital Search Label Button"
    #Generate variable for logs
    And I remember "[TIMENOW]" text as "EC_DATE_TIME" variable
    #Validate process start
    Then I should see the "Import started!" "BPP Digital Admin Alert Message"
    #Validate data processed
    And I click on the "Refresh status" "BPP Digital Admin Page Button"
    And I wait for "2" seconds
    Then I validate text "3" to be displayed for "BPP Digital Existing Users Updated field value" element
    Then I validate text "Completed" to be displayed for "BPP Digital Status field value" element
    Then I validate text "3" to be displayed for "BPP Digital Rows field value" element
    #Navigate to User Import Logs
    When I execute "Admin Hub Navigate to User Imports" reusable step
    #Validate User Logs
    And I click on the "BPP Digital Marketing Cloud Log Show button" button
    Then I validate text "3" to be displayed for "BPP Digital Existing Users Updated field value" element
    Then I validate text "Completed" to be displayed for "BPP Digital Status field value" element
    Then I validate text "3" to be displayed for "BPP Digital Rows field value" element
