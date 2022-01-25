@BuildEmpire @Hub @Deadlines
Feature: The Hub - Dashboard / Timeline - Activity Deadline
  As a learner,
  I'd like to see any upcoming Deadlines for any Activities I have that are associated with my enrolled Courses

  @Positive  #TC-1165,TС-1167
  Scenario: The Hub - Activity Deadline
    Then I execute "Login as Admin Totara" reusable step
    And I remember "KW_AUTO_TODAY|DDMMYYYY_14D" text as "EC_DEADLINEDAY" variable
    And I remember "KW_AUTO_TODAY|DDMMYYYY_14D" text as "EC_DEADLINEMONTH" variable
    Then I click on the "Totara Automation Second Course" button by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I should scroll to the "bottom" of the page
    Then I click on the "Assignment Deadline" "Totara Edit Activity Dropdown Button" by JS
    Then I click on the "Assignment Deadline" "Totara Edit Activity Edit Settings option" by JS
    Then I wait for "2" seconds
    Then I click on the "Totara Assignment Due Date Day" element by JS
    Then I select "EC_DEADLINEDAY" from "Totara Assignment Due Date Day" element
    Then I select "EC_DEADLINEMONTH" from "Totara Assignment Due Date Month" element
    And I select "2022" from "Totara Assignment Due Date Year" element
    And I click on the "Save and return to course" "element by value" by JS
    And I wait for "2" seconds
    Then I click on the "Scorm Deadline Assignment" "Totara Edit Activity Dropdown Button" by JS
    Then I click on the "Scorm Deadline Assignment" "Totara Edit Activity Edit Settings option" by JS
    Then I wait for "2" seconds
    Then I select "EC_DEADLINEDAY" from "Totara Assignment Due Date Day" element
    Then I select "EC_DEADLINEMONTH" from "Totara Assignment Due Date Month" element
    And I select "2022" from "Totara Assignment Due Date Year" element
    And I click on the "Save and return to course" "element by value"
    Then I wait for "2" seconds
    And I execute "Logout as Admin Totara" reusable step
    Then Browser deletes cookies
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "autoselinarichard2247@guerrillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    #And I should see the "Automation Test Course" "Build Empire My Learning Right Block Course name"
    And I should see the "DEADLINES" "element"
    And I should see the "Assignment Deadline" "Hub Deadline Activity Name"
    And I should see the "Scorm Deadline Assignment" "Hub Deadline Activity Name Second"
    Then I click on the "Hub Scorm Deadline View" element
    And I switch to window with index "2"
    And I click on the "Totara Completed Activity Checkbox" element
    Then I switch to window with index "1"
    And Browser performs "REFRESH" command
    And I wait for "1" seconds
    And I shouldn't see the "Scorm Deadline Assignment" "Hub Deadline Activity Name"
    Given I am on "https://totara-stage-bppdigital.bppuniversity.com/mod/assign/view.php?id=13071" URL
    And I click on the "Totara Completed Activity Checkbox" element
    And I wait for "1" seconds
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "autoselinarichard2247@guerrillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I should see the "Scorm Deadline Assignment" "Hub Deadline Activity Name Second"
    And I should see the "Assignment Deadline" "Hub Deadline Activity Name"
    When I execute "Log Out from Hub Student" reusable step
    Then Browser deletes cookies
    And I wait for "1" seconds
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    Then I click on the "Totara Automation Second Course" button by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I should scroll to the "bottom" of the page
    Then I click on the "Assignment Deadline" "Totara Edit Activity Dropdown Button" by JS
    Then I click on the "Assignment Deadline" "Totara Edit Activity Edit Settings option" by JS
    Then I wait for "2" seconds
    And I select "2024" from "Totara Assignment Due Date Year" element
    And I click on the "Save and return to course" "element by value" by JS
    And I wait for "2" seconds
    Then I click on the "Scorm Deadline Assignment" "Totara Edit Activity Dropdown Button" by JS
    Then I click on the "Scorm Deadline Assignment" "Totara Edit Activity Edit Settings option" by JS
    Then I wait for "2" seconds
    And I select "2024" from "Totara Assignment Due Date Year" element
    And I click on the "Save and return to course" "element by value"
    Then I wait for "2" seconds
    And I execute "Logout as Admin Totara" reusable step
    Then Browser deletes cookies
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "autoselinarichard2247@guerrillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I shouldn't see the "DEADLINES" "element"
