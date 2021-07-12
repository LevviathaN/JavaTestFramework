#@BuildEmpire @Hub @VPE DO NO RUN UNTIL BPP-12996 WILL BE RESOLVED
Feature: The Hub - Law School - Calendar - Summary

  @Positive @CalendarSummary #TC-2819, TC-2820, TC-2821, TC-3067, TC-3068, TC-3069
  Scenario: The Hub - Law School - Calendar Summary
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "vpecourse@guerillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I wait for "1" seconds
    And I should see the "VPE Course Automation" "Build Empire My Learning Right Block Course name"
    Then I click on the "VPE Course Automation" "Build Empire My Learning Right Block Course name"
    And I switch to window with index "2"
    Then I should see the "Calendar" "element"
    And I click on the "Hub VPE Calendar Current Date" element
    Then I should see the "Course events" "text contained in element"
    Then I should see the "BPP events" "text contained in element"
    Then I should see the "Hub VPE Calendar First Group Event" element
    Then I should see the "Hub VPE Calendar First Group Event Description" element
    Then I should see the "Hub VPE Calendar First Course Event" element
    And I validate text "This is a course event for automated scripts." to be displayed for "Hub VPE Calendar First Course Event Description" element
    And I shouldn't see the "To:" "element"
    Then I click on the "Hub VPE Calendar Task Due Date" element
    Then I should see the "Tasks due" "text contained in element"
    And I validate text "CONTAINS=Sender April 28" to be displayed for "Hub VPE Calendar Task Due Sender" element
    And I validate text "CONTAINS=Test Assignment 1" to be displayed for "Hub VPE Calendar Task Due Assignment" element
    Then I click on the "Hub VPE Calendar Task Due Sender" element by JS
    Then I should see the "To:" "element"
    And I should see the "Hub VPE Resubmit" element