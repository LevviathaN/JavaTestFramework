@BuildEmpire @Hub @VPE
Feature: The Hub - Law School - Calendar - Side View

  @Positive @Calendar #TC-2806, TC-2810, TC-2811, TC-2807, TC-2823
  Scenario: The Hub - Law School - Calendar-Side View
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "vpecourse@guerillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I wait for "1" seconds
    And I should see the "VPE Course Automation" "Build Empire My Learning Right Block Course name"
    Then I click on the "VPE Course Automation" "Build Empire My Learning Right Block Course name"
    And I switch to window with index "2"
    Then I should see the "Calendar" "element"
    Then I should see the "Task due" "element"
    Then I should see the "Course event" "element"
    Then I should see the "Group event" "element"
    And I shouldn't see the "News&Information" "text contained in element"
    Then I remember "[TIMENOW-CALENDAR-VPE]" text as "EC_TIMENOW" variable
    And I should see the "Hub VPE Calendar Current Date" element
    And Attribute "data-time" of "Hub VPE Calendar Current Date" should have value "CONTAINS=EC_TIMENOW"
    Then I click on the "Hub VPE Calendar Right Arrow" element
    Then I validate text "time=" to be displayed for "CHECK_URL" element
    Then I click on the "Hub VPE Calendar Left Arrow" element
    Then I validate text "time=" to be displayed for "CHECK_URL" element
    Then I click on the "Hub VPE Calendar Left Arrow" element
    Then I validate text "time=" to be displayed for "CHECK_URL" element
    And I switch to window with index "1"
    When I execute "Log Out from Hub Student" reusable step