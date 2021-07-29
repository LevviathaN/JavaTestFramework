@BuildEmpire @Hub @Totara @Restrictions
Feature: The Hub - Activity Restrictions - Call to Action Button - Completely Hidden - BPP-3004
  As a user, viewing a course in the Hub,
  I only expect to be able to access a Call to Action button that
  I have unrestricted access to within Totara.

  @Positive #TC-1589
  Scenario: Topic Restrictions by Group CTA button Completely Hidden
    #Register New Student
    And I register new Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    #Validate Timeline block
    Then I should see the "Timeline" message
    Then I should see the "Welcome to your new logged in area." message
    #When I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    Then I execute "Login as Admin Totara" reusable step
    #Enrol to a course
    When I click on the "Totara Automation Only Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Enrol User button" button by JS
    And I set "EC_AUTO_EMAIL" text to the element with ID "enrolusersearch" using JS
    And I click on the "Totara Enrol User Search button" button by JS
    And I click on the "Totara Enrol Button" button by JS
    And I click on the "Totara Finish Enroling Users button" button by JS
    #Add to Test Group 1:
    When I click on the "Totara Automation Only Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Left Menu Groups link" button by JS
    And I wait for "5" seconds
    And I click on the "Automation Group 1" "Dropdown Option Contains text"
    And I click on the "Add/remove users" "Totara button"
    And I set "EC_AUTO_EMAIL" text to the "addselect_searchtext" "element by name"
    And I click on the "Totara Potential Member first option" element
    And I click on the "Add" "element by title"
    #Change Group Visibility
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara Automation Only Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I click on the "CTA Button" "Totara edit topic by name using EC value"
    And I click on the "CTA Button" "Totara Edit Activity link  by EC value"
    And I click on the "Totara Restrictions Header Expandable link" link
    And I click on the "Totara Delete Restriction button" element if "Totara Delete Restriction button" "element is present"
    And I click on the "Add restriction..." "BPP Digital Profile button"
    And I wait for "2" seconds
    And I click on the "Group" "BPP Digital Profile button"
    And I select "Automation Group 1" from "id" "Totara Select field with name Parameter"
    And I wait for "1" seconds
    And I select "must" from "Restriction type" "Totara Select field with title Parameter"
    And I click on the "Totara Group Restriction EYE icon click to Hide" element with JS if "Totara Group Restriction EYE icon click to Hide" "element is present"
    And I click on the "Save and return to course" "element by value" by JS
    And I wait for "3" seconds
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "4" seconds
    #Login As student
    When I execute "Log In to Hub as Student" reusable step
    #Click Most Recent Course
    When I click on the "Only for Automation " "Build Empire My Learning Right Block Course name"
    And I should see the "CTA Button" element
    And I validate text "CTA Button" to be displayed for "Direct App CTA Button" element
    #When I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    Then I execute "Login as Admin Totara" reusable step
    #Add to Test Group 1:
    When I click on the "Totara Automation Only Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Left Menu Groups link" button by JS
    And I wait for "5" seconds
    And I click on the "Automation Group 1" "Dropdown Option Contains text"
    And I click on the "Add/remove users" "Totara button"
    And I set "EC_AUTO_EMAIL" text to the "removeselect_searchtext" "element by name"
    And I click on the "Totara Potential Member first option" element
    And I click on the "Remove" "element by title"
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "6" seconds
    #Login As student
    When I execute "Log In to Hub as Student" reusable step
    #Click Most Recent Course
    When I click on the "Only for Automation " "Build Empire My Learning Right Block Course name"
    And I shouldn't see the "CTA Button" "element"
    #When I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    Then I execute "Login as Admin Totara" reusable step
    #Change Group Visibility
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara Automation Only Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I click on the "CTA Button" "Totara edit topic by name using EC value"
    And I click on the "CTA Button" "Totara Edit Activity link  by EC value"
    And I click on the "Totara Restrictions Header Expandable link" link
    And I select "must not" from "Restriction type" "Totara Select field with title Parameter"
    And I click on the "Totara Set Of One Restriction EYE icon click to Hide" element with JS if "Totara Set Of One Restriction EYE icon click to Hide" "element is present"
    And I wait for "3" seconds
    And I click on the "Save and return to course" "element by value" by JS
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "4" seconds
    #Login As student
    When I execute "Log In to Hub as Student" reusable step
    #Click Most Recent Course
    When I click on the "Only for Automation " "Build Empire My Learning Right Block Course name"
    And I should see the "CTA Button" element
    And I validate text "CTA Button" to be displayed for "Direct App CTA Button" element
    #CleanUp
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    Then I execute "Login as Admin Totara" reusable step
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara Automation Only Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I click on the "CTA Button" "Totara edit topic by name using EC value"
    And I click on the "CTA Button" "Totara Edit Activity link  by EC value"
    And I click on the "Totara Restrictions Header Expandable link" link
    And I click on the "Totara Delete Restriction button" element if "Totara Delete Restriction button" "element is present"
    And I click on the "Save and return to course" "element by value" by JS
    And I wait for "2" seconds

  @Positive #TC-1591
  Scenario: Topic Restrictions by Date CTA button Completely Hidden
    #Register New Student
    And I execute "Register New Student Account" reusable step
    Then I execute "Harakirimail Verify Email" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    #Validate Timeline block
    Then I should see the "Timeline" message
    Then I should see the "Welcome to your new logged in area." message
    #When I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    Then I execute "Login as Admin Totara" reusable step
    #Enrol to a course
    When I click on the "Totara Automation Only Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Enrol User button" button by JS
    And I set "EC_AUTO_EMAIL" text to the element with ID "enrolusersearch" using JS
    And I click on the "Totara Enrol User Search button" button by JS
    And I click on the "Totara Enrol Button" button by JS
    And I click on the "Totara Finish Enroling Users button" button by JS
    #Add Date Restriction
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara Automation Only Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I click on the "CTA Button" "Totara edit topic by name using EC value"
    And I click on the "CTA Button" "Totara Edit Activity link  by EC value"
    And I click on the "Totara Restrictions Header Expandable link" link
    And I click on the "Totara Delete Restriction button" element if "Totara Delete Restriction button" "element is present"
    And I click on the "Add restriction..." "BPP Digital Profile button"
    And I wait for "2" seconds
    And I click on the "Date" "BPP Digital Profile button"
    And I click on the "Totara Year Dropdown menu" element
    And I click on the "Totara Year Dropdown Next Year option" element
    And I click on the "Totara Date Restriction EYE icon click to Hide" element with JS if "Totara Date Restriction EYE icon click to Hide" "element is present"
    And I select "must" from "Restriction type" "Totara Select field with title Parameter"
    And I click on the "Save and return to course" "element by value" by JS
    And I wait for "3" seconds
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "4" seconds
    #Login As student
    When I execute "Log In to Hub as Student" reusable step
    #Click Most Recent Course
    When I click on the "Only for Automation " "Build Empire My Learning Right Block Course name"
    And I shouldn't see the "CTA Button" "element"
    #When I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    Then I execute "Login as Admin Totara" reusable step
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "6" seconds
    #Login As student
    When I execute "Log In to Hub as Student" reusable step
    #Click Most Recent Course
    When I click on the "Only for Automation " "Build Empire My Learning Right Block Course name"
    And I shouldn't see the "CTA Button" "element"
    #When I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    Then I execute "Login as Admin Totara" reusable step
    #Date Restriction
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara Automation Only Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I click on the "CTA Button" "Totara edit topic by name using EC value"
    And I click on the "CTA Button" "Totara Edit Activity link  by EC value"
    And I click on the "Totara Restrictions Header Expandable link" link
    And I select "must not" from "Restriction type" "Totara Select field with title Parameter"
    And I click on the "Totara Delete Restriction button" element if "Totara Delete Restriction button" "element is present"
    And I click on the "Add restriction..." "BPP Digital Profile button"
    And I wait for "2" seconds
    And I click on the "Date" "BPP Digital Profile button"
    And I click on the "Totara Year Dropdown menu" element
    And I click on the "Totara Year Dropdown Next Year option" element
    And I click on the "Totara Set Of One Restriction EYE icon click to Hide" element with JS if "Totara Set Of One Restriction EYE icon click to Hide" "element is present"
    And I click on the "Save and return to course" "element by value" by JS
    And I wait for "3" seconds
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "4" seconds
    #Login As student
    When I execute "Log In to Hub as Student" reusable step
    #Click Most Recent Course
    When I click on the "Only for Automation " "Build Empire My Learning Right Block Course name"
    And I should see the "CTA Button" element
    And I validate text "CTA Button" to be displayed for "Direct App CTA Button" element
    #CleanUp
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    Then I execute "Login as Admin Totara" reusable step
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara Automation Only Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I click on the "CTA Button" "Totara edit topic by name using EC value"
    And I click on the "CTA Button" "Totara Edit Activity link  by EC value"
    And I click on the "Totara Restrictions Header Expandable link" link
    And I click on the "Totara Delete Restriction button" element if "Totara Delete Restriction button" "element is present"
    And I click on the "Save and return to course" "element by value" by JS
    And I wait for "2" seconds

  @Positive #TC-1592 TC-1593
  Scenario: Topic Restrictions by Multiple Activity Completion CTA button Completely Hidden
    #Register New Student
    And I execute "Register New Student Account" reusable step
    Then I execute "Harakirimail Verify Email" reusable step
    Then I execute "Log In to Hub as Student" reusable step
    #Validate Timeline block
    Then I should see the "Timeline" message
    Then I should see the "Welcome to your new logged in area." message
    #When I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    Then I execute "Login as Admin Totara" reusable step
    #Enrol to a course
    When I click on the "Totara Automation CTA Button Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Enrol User button" button by JS
    And I set "EC_AUTO_EMAIL" text to the element with ID "enrolusersearch" using JS
    And I click on the "Totara Enrol User Search button" button by JS
    And I wait for "2" seconds
    And I click on the "Totara Enrol Button" button by JS
    And I click on the "Totara Finish Enroling Users button" button by JS
    #Add Restriction
    When I click on the "Totara Automation CTA Button Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I click on the "Totara CTA Button edit link" element
    And I click on the "CTA Button" "Totara Edit Activity link  by EC value"
    And I click on the "Totara Restrictions Header Expandable link" link
    And I click on the "Totara Delete Restriction button" element if "Totara Delete Restriction button" "element is present"
    And I wait for "1" seconds
    And I click on the "Totara Delete Restriction button" element if "Totara Delete Restriction button" "element is present"
    And I click on the "Add restriction..." "BPP Digital Profile button"
    And I wait for "2" seconds
    And I click on the "Activity completion" "BPP Digital Profile button"
    And I select "Quiz 1" from "Activity or resource" "Totara Select field with title Parameter"
    And I click on the "Totara Activity One Restriction EYE icon click to Hide" option if "Totara Activity One Restriction EYE icon click to Hide" "element is present"
    And I click on the "Add restriction..." "BPP Digital Profile button"
    And I wait for "2" seconds
    And I click on the "Activity completion" "BPP Digital Profile button"
    And I select "Quiz 2" from "Activity or resource" "Totara Second Select field with title Parameter"
    And I click on the "Totara Activity Two Restriction EYE icon click to Hide" option if "Totara Activity One Restriction EYE icon click to Hide" "element is present"
    And I select "must" from "Restriction type" "Totara Select field with title Parameter"
    And I click on the "Save and return to course" "element by value" by JS
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "4" seconds
    #Login As student
    When I execute "Log In to Hub as Student" reusable step
    #Click Most Recent Course
    When I click on the "Automation CTA Button Course" "Build Empire My Learning Right Block Course name"
    And I shouldn't see the "CTA Button" "element"
    #When I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    Then I execute "Login as Admin Totara" reusable step
    #Add Restriction must not
    When I click on the "Totara Automation CTA Button Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I click on the "Totara CTA Button edit link" element
    And I click on the "CTA Button" "Totara Edit Activity link  by EC value"
    And I click on the "Totara Restrictions Header Expandable link" link
    And I click on the "Totara Set Of Two Restriction EYE icon click to Hide" option if "Totara Set Of Two Restriction EYE icon click to Hide" "element is present"
    And I select "must not" from "Restriction type" "Totara Select field with title Parameter"
    And I select "any" from "Required restrictions" "Totara Select field with title Parameter"
    And I click on the "Save and return to course" "element by value" by JS
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "4" seconds
    #Login As student
    When I execute "Log In to Hub as Student" reusable step
    #Click Most Recent Course
    When I click on the "Automation CTA Button Course" "Build Empire My Learning Right Block Course name"
    And I should see the "CTA Button" element
    And I validate text "CTA Button" to be displayed for "Direct App CTA Button" element
    #Complete Course
    And I click on the "BPP Digital Student Automation Topic for CTA Topic Sticker" element
    And I click on the "BPP Digital Student Automation Topic To Complete label" option
    And I click on the "Build Empire Quiz One Activity checkbox" element
    And I wait for "3" seconds
    And Browser performs "Refresh" command
    And I click on the "BPP Digital Student Automation Topic To Complete label" option
    And I click on the "Build Empire Quiz Two Activity checkbox" element
    And I wait for "3" seconds
    #Log out Student
    And I execute "Log Out from Hub Student" reusable step
    And I wait for "3" seconds
    #Login As student
    When I execute "Log In to Hub as Student" reusable step
    #Click Most Recent Course
    When I click on the "Automation CTA Button Course" "Build Empire My Learning Right Block Course name"
    And I shouldn't see the "CTA Button" "element"