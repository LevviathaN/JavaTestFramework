@BuildEmpire @Hub @SubTopics @Totara
Feature: BPP University Hub Sub Topics and Labels
  As a Hub user, viewing the Topic Overview page,
  I expect to be able to see descriptions regarding my Sub-topics
  As this will help me to understand the course

  Background:
    Given I register new Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    When I execute "Log Out from Hub Student" reusable step
    And I wait for "7" seconds

  @Positive @Description #TC-2233 TC-2239 TC-2242
  Scenario: Hub Sub Topics Description Validation
    #When I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    And I wait for "5" seconds
    Then I execute "Login as Admin Totara" reusable step
    #Enrol to a course
    When I click on the "Totara Automation Only Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Enrol User button" button by JS
    And I set "EC_AUTO_EMAIL" text to the element with ID "enrolusersearch" using JS
    And I click on the "Totara Enrol User Search button" button by JS
    And I wait for "2" seconds
    And I click on the "Totara Enrol Button" button by JS
    And I click on the "Totara Finish Enroling Users button" button by JS
    #Totara Clear Topics
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara Automation Only Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I execute "Course Topic Clean Up" reusable step if "Totara Automation Topic Edit button" "element is present"
    And Browser performs "Refresh" command
    And I wait for "2" seconds
    And I execute "Course Topic Clean Up" reusable step if "Totara Automation Topic Edit button" "element is present"
    And I wait for "2" seconds
    And Browser performs "Refresh" command
    And I wait for "5" seconds
    #Totara Add Topic
    And I click on the "Totara Add Topic Plus icon" element
    And I wait for "2" seconds
    And I click on the "Totara Edit Topic Name icon" element by JS
    And I fill the "Totara Set Topic Name field" field with "AutomationTopic[###]"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Totara Set Topic Name field"
    And I wait for "1" seconds
    And I click on the "Totara Automation First Automation Topic Edit button" element
    And I click on the "Totara Automation Fifth Topic Edit Topic button" element
    And I set "AutomationTopicSummary[####]" text to the element with ID "id_summary_editoreditable" using JS
    And I wait for "2" seconds
    And I click on the "Save changes" "BPP Digital Admin Value attribute button"
    #Totara Add Sub-Topic Label
    And I click on the "Totara Automation Course Created Topic Add and Activity button" link
    And I click on the "Totara Add an Activity Label Radio button" element
    And I click on the "Totara Add an Activity Add Button" button
    And I fill the "Totara Adding a New Label Text Field" field with "AutomationSubTopic[###]"
    And I click on the "Save and return to course" "BPP Digital Admin Value attribute button"
    #Totara Add Sub-Topic Label as a Description
    And I click on the "Totara Automation Course Created Topic Add and Activity button" link
    And I click on the "Totara Add an Activity Label Radio button" element
    And I click on the "Totara Add an Activity Add Button" button
    And I fill the "Totara Adding a New Label Text Field" field with "AutomationSubTopicDescription[###]"
    And I click on the "Save and return to course" "BPP Digital Admin Value attribute button"
    #Totara Add Sub-Topic Label without new Sub-Topic as description
    And I click on the "Totara Automation Course Created Topic Add and Activity button" link
    And I click on the "Totara Add an Activity Label Radio button" element
    And I click on the "Totara Add an Activity Add Button" button
    And I fill the "Totara Adding a New Label Text Field" field with "AutomationSubTopicWithoutDescription[###]"
    And I click on the "Save and return to course" "BPP Digital Admin Value attribute button"
    #Totara Add Assignment
    And I click on the "Totara Automation Course Created Topic Add and Activity button" link
    And I click on the "Totara Add an Activity Assignment Radio button" element
    And I click on the "Totara Add an Activity Add Button" button
    And I fill the "Totara Assignment name Text Field" field with "AutomationAssignmentName[###]"
    And I fill the "Totara Adding a New Label Text Field" field with "AutomationAssignmentDescription[###]"
    And I "check" "Totara Display Description on a Course checkbox" checkbox
    And I click on the "Save and return to course" "BPP Digital Admin Value attribute button"
    And I click on the "EC_AUTOMATION_ASSIGNMENT_NAME" "Totara edit link by EC value"
    And I click on the "EC_AUTOMATION_ASSIGNMENT_NAME" "Totara Move Right link by EC value"
    And Browser performs "Refresh" command
    #Totara Add File PDF
    And I click on the "Totara Automation Course Created Topic Add and Activity button" link
    And I click on the "Totara Add an Activity File Radio button" element
    And I click on the "Totara Add an Activity Add Button" button
    And I fill the "Totara Add New Quiz Name Text Field" field with "AutomationFileName[###]"
    And I fill the "Totara Adding a New Label Text Field" field with "AutomationFileDescription[###]"
    And I "check" "Totara Display Description on a Course checkbox" checkbox
    And I click on the "Add..." "Totara role button with title name"
    And I click on the "Upload a file" "Totara side menu option"
    And I upload "resident.pdf" file to "BPP Digital Upload File Button" element
    And I set "AutomationFile[######]" text to the "title" "VLE Login Fields"
    And I click on the "Totara Upload This File" element
    And I click on the "Save and return to course" "BPP Digital Admin Value attribute button"
    And I wait for "5" seconds
    And I click on the "EC_AUTOMATION_FILE_NAME" "Totara edit link by EC value"
    And I click on the "EC_AUTOMATION_FILE_NAME" "Totara Move Right link by EC value"
    And I wait for "1" seconds
    And Browser performs "Refresh" command
    And I wait for "5" seconds
    #Admin Logout
    And I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    #Login As student
    And I execute "Log In to Hub as Student Fixed" reusable step
    #Navigate to Created Sub Topics
    And I click on the "Direct App My Learning Left Menu Link" link by JS
    And I click on the "BPP Digital Student My Learning Page Open First Course Sticker" element
    And I click on the "BPP Digital Student AutomationTopic Course Sticker" element
    Then I should see the "EC_AUTOMATION_TOPIC" element
    Then I should see the "EC_AUTOMATION_SUB_TOPIC" element
    Then I should see the "EC_AUTOMATION_SUB_TOPIC_DESCRIPTION" element
    Then I should see the "EC_AUTOMATION_ASSIGNMENT_NAME" element
    Then I should see the "EC_AUTOMATION_FILE_NAME" element
    And I click on the "EC_AUTOMATION_ASSIGNMENT_NAME" "Build Empire Course Expandable Labels name" by JS
    Then I should see the "EC_AUTOMATION_ASSIGNMENT_DESCRIPTION" element
    Then I should see the "Start" "Build Empire link"
    And I click on the "EC_AUTOMATION_ASSIGNMENT_NAME" "Build Empire Course Expandable Labels name" by JS
    And I click on the "EC_AUTOMATION_FILE_NAME" "Build Empire Course Expandable Labels name" by JS
    Then I should see the "EC_AUTOMATION_FILE_DESCRIPTION" element
    Then I should see the "Start" "Build Empire link"
    #When I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    And I wait for "5" seconds
    Then I execute "Login as Admin Totara" reusable step
    #Totara Clear Topics
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara Automation Only Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I execute "Course Topic Clean Up" reusable step if "Totara Automation Topic Edit button" "element is present"
    And Browser performs "Refresh" command
    And I wait for "2" seconds