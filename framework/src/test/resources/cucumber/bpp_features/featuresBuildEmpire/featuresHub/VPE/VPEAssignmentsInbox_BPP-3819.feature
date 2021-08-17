@BuildEmpire @Hub @VPE
Feature: The Hub - Law School - Assignments/Emails - Inbox Overview
  As a user, if an "assignment" has been added to a topic in a VPE course,
  I expect each assignment to display as a separate "email" on the left hand side of the page

  @Positive @AssignmentInbox #TC-1916, TC-2109, TC-2112, TC-2081, TC-2076, TC-2133, TC-2608, TC-2881,
                        #TC-2096, TC-2098, TC-2085, TC-2087, TC-2090, TC-2101, TC-2110, TC-2725,
                        # TC-2880, TC-2878, TC-2136, TC-2621, TC-2108, TC-4215
  Scenario: The Hub - Law School - Assignments and Emails - Inbox Overview
    Then I execute "Login as Admin Totara" reusable step
    When I click on the "VPE Course Automation" "element"
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I should scroll to the "bottom" of the page
    Then I wait for "2" seconds
    And I execute "arguments[0].click();" JS code for "Increase the number of sections" "Salesforce cases status option"
    And I click on the "Totara Add Activity For VPE Last Topic" button by JS
    And I wait for "1" seconds
    And I execute "arguments[0].click();" JS code for "Assignment" "Product Factory button"
    Then I click on the "Totara Add an Activity Add Button" link by JS
    And I wait for "2" seconds
    #And I fill the "Totara Add New Quiz Name Text Field" field with "AutoTest Created"
    And I execute "document.getElementById('id_name').value = 'AutoTest Created'" JS code for "Totara Add New Quiz Name Text Field" element
    And I execute "arguments[0].click();" JS code for "VPE Settings" "text contained in A element"
    And I execute "document.getElementById('id_vpe_email_sender').value = 'Script Created'" JS code for "Totara VPE Email Sender" element
    And I execute "document.getElementById('id_introeditoreditable').innerText = 'Automation Test Description'" JS code
    Then I execute "document.getElementById('id_vpe_assign_feedbackeditable').innerText = 'This is feedback automated text'" JS code
    And I wait for "5" seconds
    And I execute "arguments[0].click();" JS code for "Save and return to course" "BPP Digital Admin Value attribute button"
    And I wait for "3" seconds
    And I click on the "Totara Add Activity For VPE Last Topic" button by JS
    And I wait for "1" seconds
    And I execute "arguments[0].click();" JS code for "Assignment" "Product Factory button"
    Then I click on the "Totara Add an Activity Add Button" link by JS
    And I wait for "2" seconds
    And I execute "document.getElementById('id_name').value = 'AutoTest Assignment2'" JS code for "Totara Add New Quiz Name Text Field" element
    And I select "2023" from "Totara Assignment Due Date Year" element
    And I wait for "1" seconds
    And I execute "arguments[0].click();" JS code for "Save and return to course" "BPP Digital Admin Value attribute button"
    And I wait for "3" seconds
    And I click on the "Totara Add Activity For VPE Last Topic" button by JS
    And I wait for "1" seconds
    And I execute "arguments[0].click();" JS code for "Assignment" "Product Factory button"
    Then I click on the "Totara Add an Activity Add Button" link by JS
    And I wait for "2" seconds
    And I execute "document.getElementById('id_name').value = 'AutoTest Assignment3'" JS code for "Totara Add New Quiz Name Text Field" element
    And I select "2022" from "Totara Assignment Due Date Year" element
    And I wait for "1" seconds
    And I execute "arguments[0].click();" JS code for "Save and return to course" "BPP Digital Admin Value attribute button"
    And I click on the "Totara Add Activity For VPE Last Topic" button by JS
    And I wait for "1" seconds
    And I execute "arguments[0].click();" JS code for "Forum" "Product Factory button"
    Then I click on the "Totara Add an Activity Add Button" link by JS
    And I execute "document.getElementById('id_name').value = 'AutoPage To Test BPP-3816'" JS code
    And I execute "arguments[0].click();" JS code for "Save and return to course" "BPP Digital Admin Value attribute button"
    And I wait for "3" seconds
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    #User validation
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "vpecourse@guerillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I wait for "1" seconds
    And I should see the "VPE Course Automation" "Build Empire My Learning Right Block Course name"
    Then I click on the "VPE Course Automation" "Build Empire My Learning Right Block Course name"
    And Browser deletes cookies
    And I switch to window with index "2"
    Then I should see the "AutoTest Created" "element"
    Then I should see the "Script Created" "element"
    Then I should see the "AutoTest Assignment3" "element"
    Then I should see the "AutoTest Assignment2" "element"
    Then I should see the "HUb VPE Banner" element
    Then I click on the "AutoTest Created" "element"
    And I should see the "Hub VPE Assignemnt Activity Layout" element
    #Then I should see the "Automation Test Description" "text contained in element"
    Then I should see the "To:" "element"
    And I validate text "CONTAINS=VPE One Course" to be displayed for "Hub VPE Call To" element
    And I should see the "REPLY" "text contained in element"
    Then I click on the "REPLY" "text contained in element"
    And I upload "fileToUpload.txt" file to "Direct App Upload File" element
    And I set "AutomationScript" text to the "Type your response here" "Build Empire RFI Textarea text item"
    Then I click on the "SEND " "button"
    And I should see the "Hub VPE Sent Email Notification" message
    #And I should see the "Hub VPE Assignment Feedback" element
    And I wait for "1" seconds
    And I click on the "Hub VPE Resubmit" button by JS
    And I upload "CallOut.png" file to "Direct App Upload File" element
    Then I click on the "SEND " "button"
    And I remember "[TIMENOW-VPE]" text as "EC_CURRENT_DATE" variable
    And I should see the "Hub VPE Sent Email Notification" message
    Then I validate text "EC_TIMENOW" to be displayed for "Hub VPE Email Assignment Date" element
    And I click on the "BPP-10456" "element the last"
    Then I click on the "Hub VPE Resubmit" button
    And I shouldn't see the "Direct App Upload File" element
    And I set "Automation" text to the "Type your response here" "Build Empire RFI Textarea text item"
    Then I click on the "SEND " "button"
    And I should see the "Hub VPE Sent Email Notification" message
    And Browser deletes cookies
    And I switch to window with index "1"
    And I wait for "1" seconds
    When I execute "Log Out from Hub Student" reusable step
    And Browser deletes cookies
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    #Remove topic
    Then I execute "Login as Admin Totara" reusable step
    When I click on the "VPE Course Automation" "element"
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I should scroll to the "bottom" of the page
    Then I click on the "Totara Edit Topic Dropdown" element by JS
    Then I click on the "Totara Delete Topic Dropdown Option" element by JS
    And I wait for "1" seconds
    Then I execute "arguments[0].click();" JS code for "Delete" "Totara button"
    And I wait for "3" seconds