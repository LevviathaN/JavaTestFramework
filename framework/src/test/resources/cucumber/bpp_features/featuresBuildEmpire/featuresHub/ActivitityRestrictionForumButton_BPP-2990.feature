@BuildEmpire @Hub @Totara @Restrictions
Feature: The Hub - Activity Restrictions - Forum Button - Completely Hidden
  As a user, viewing a course in the Hub,
  I only expect to be able to access the forums that I have unrestricted access to within Totara.

  @ForumRestriction #TC-1582
  Scenario: The Hub - Activity Restrictions - Forum Button - Completely Hidden
    #Register New Student
    And I register new "Standard" Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    #Validate Timeline block
    Then I should see the "Timeline" message
    Then I should see the "Welcome to your new logged in area." message
    When I execute "Log Out from Hub Student" reusable step
    And I should see the "Already registered? Log in" message
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    #Enrol to a course
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Enrol User button" button by JS
    And I set "EC_AUTO_EMAIL" text to the element with ID "enrolusersearch" using JS
    And I click on the "Totara Enrol User Search button" button by JS
    And I wait for "2" seconds
    And I click on the "Totara Enrol Button" button by JS
    And I click on the "Totara Finish Enroling Users button" button by JS
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "3" seconds
    #Login As student and check Forum is not visible
    When I execute "Log In to Hub as Student" reusable step
    When I click on the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    When I click on the "Totara Course Select Forum link" link
    Then I shouldn't see the "BPP Digital Course Automation Forum One Option" element
    Then I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    And I wait for "5" seconds
    Then I execute "Login as Admin Totara" reusable step
    #Add to Test Group 2:
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Left Menu Groups link" button by JS
    And I wait for "5" seconds
    And I click on the "Test Group 2" "Dropdown Option Contains text"
    And I click on the "Add/remove users" "Totara button"
    And I set "EC_AUTO_EMAIL" text to the "addselect_searchtext" "element by name"
    And I click on the "Totara Potential Member first option" element
    And I click on the "Add" "element by title"
    And I wait for "1" seconds
    When I click on the "Dashboard" "text contained in SPAN element"
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "3" seconds
    #Login As student and check Forum is visible
    When I execute "Log In to Hub as Student" reusable step
    When I click on the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    When I click on the "Totara Course Select Forum link" link
    Then I should see the "BPP Digital Course Automation Forum One Option" element
    Then I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    And I wait for "5" seconds
    #Check restriction to 'must not'
    Then I execute "Login as Admin Totara" reusable step
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I click on the "Automation Regression Forum1" "Totara Edit Activity Dropdown Button"
    Then I click on the "Automation Regression Forum1" "Totara Edit Activity Edit Settings option" by JS
    And I wait for "1" seconds
    And I click on the "Totara Restrictions Header Expandable link" link
    And I select "must not" from "Restriction type" "Totara Select field with title Parameter"
    And I click on the "Save and return to course" "element by value" by JS
    And I wait for "3" seconds
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "3" seconds
    #Login As student and check Forum is not visible
    When I execute "Log In to Hub as Student" reusable step
    When I click on the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    When I click on the "Totara Course Select Forum link" link
    Then I shouldn't see the "BPP Digital Course Automation Forum One Option" element
    Then I execute "Log Out from Hub Student" reusable step
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    And Browser deletes cookies
    And I wait for "5" seconds
   #CleanUp. Check restriction back to 'must'
    Then I execute "Login as Admin Totara" reusable step
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I click on the "Automation Regression Forum1" "Totara Edit Activity Dropdown Button"
    Then I click on the "Automation Regression Forum1" "Totara Edit Activity Edit Settings option" by JS
    And I wait for "1" seconds
    And I click on the "Totara Restrictions Header Expandable link" link
    And I select "must" from "Restriction type" "Totara Select field with title Parameter"
    And I click on the "Save and return to course" "element by value" by JS
    And I wait for "3" seconds
    Then I execute "Logout as Admin Totara" reusable step

  @ForumRestriction #TC-1596
  Scenario: The Hub - Forum - Activity Completion Restriction
    #Register New Student
    And I register new Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    #Validate Timeline block
    Then I should see the "Timeline" message
    Then I should see the "Welcome to your new logged in area." message
    When I execute "Log Out from Hub Student" reusable step
    And I should see the "Already registered? Log in" message
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    #Enrol to a course
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Enrol User button" button by JS
    And I set "EC_AUTO_EMAIL" text to the element with ID "enrolusersearch" using JS
    And I click on the "Totara Enrol User Search button" button by JS
    And I wait for "2" seconds
    And I click on the "Totara Enrol Button" button by JS
    And I click on the "Totara Finish Enroling Users button" button by JS
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "3" seconds
    #Login As student and check Forum is visible after activity completion
    When I execute "Log In to Hub as Student" reusable step
    When I click on the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    When I click on the "Totara Course Select Forum link" link
    Then I shouldn't see the "BPP Digital Course Automation Regression Forum Three Option" element
    And I should scroll to the "bottom" of the page
    Then I click on the "Auto Regression Restrictions" "Build Empire Course Topic"
    And I wait for "1" seconds
    Then I click on the "BPP Digital Student Sub Topic Quiz svg element" element
    And I click on the "Direct App My Learning Left Menu Link" element
    Then Browser performs "REFRESH" command
    And I wait for "3" seconds
    Then I click on the "BPP Digital Student My Learning Page Open First Course Sticker" option
    When I click on the "Totara Course Select Forum link" link
    Then I should see the "BPP Digital Course Automation Regression Forum Three Option" element


  @ForumRestrictions #TC-1594
    #!!!!IF THE TEST FAILED: Login as admin in Totara: https://totara-stage-bppdigital.bppuniversity.com/course/view.php?id=3#section-7
    # Edit Setting for Automation Regression Forum4 -> Restrict Access -> select 'must', 'from' and current year -> save changes and rerun
  Scenario: The Hub - Forum - Date Restriction
    #Register New Student
    And I register new Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    #Validate Timeline block
    Then I should see the "Timeline" message
    Then I should see the "Welcome to your new logged in area." message
    When I execute "Log Out from Hub Student" reusable step
    And I should see the "Already registered? Log in" message
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    #Enrol to a course
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Enrol User button" button by JS
    And I set "EC_AUTO_EMAIL" text to the element with ID "enrolusersearch" using JS
    And I click on the "Totara Enrol User Search button" button by JS
    And I wait for "2" seconds
    And I click on the "Totara Enrol Button" button by JS
    And I click on the "Totara Finish Enroling Users button" button by JS
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "2" seconds
    #Login As student and check Forum is visible
    When I execute "Log In to Hub as Student" reusable step
    When I click on the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    When I click on the "Totara Course Select Forum link" link
    Then I should see the "BPP Digital Course Automation Regression Forum Four Option" element
    Then I execute "Log Out from Hub Student" reusable step
    And I should see the "Already registered? Log in" message
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    #Change to 'must not' in the past
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I click on the "Automation Regression Forum4" "Totara Edit Activity Dropdown Button"
    Then I click on the "Automation Regression Forum4" "Totara Edit Activity Edit Settings option" by JS
    And I wait for "1" seconds
    And I click on the "Totara Restrictions Header Expandable link" link
    And I select "must not" from "Restriction type" "Totara Select field with title Parameter"
    And I click on the "Save and return to course" "element by value" by JS
    And I wait for "2" seconds
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "2" seconds
    #Check forum is not visible
    When I execute "Log In to Hub as Student" reusable step
    When I click on the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    When I click on the "Totara Course Select Forum link" link
    Then I shouldn't see the "BPP Digital Course Automation Regression Forum Four Option" element
    Then I execute "Log Out from Hub Student" reusable step
    And I should see the "Already registered? Log in" message
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    #Change to 'must not' in the future
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I click on the "Automation Regression Forum4" "Totara Edit Activity Dropdown Button"
    Then I click on the "Automation Regression Forum4" "Totara Edit Activity Edit Settings option" by JS
    And I wait for "1" seconds
    And I click on the "Totara Restrictions Header Expandable link" link
    And I select "until" from "Totara Restriction Direction Dropdown menu" element
    And I click on the "Totara Year Dropdown menu" element
    And I click on the "Totara Year Dropdown Next Year option" element
    And I click on the "Save and return to course" "element by value" by JS
    And I wait for "2" seconds
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "2" seconds
    #Check forum is not visible
    When I execute "Log In to Hub as Student" reusable step
    When I click on the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    When I click on the "Totara Course Select Forum link" link
    Then I shouldn't see the "BPP Digital Course Automation Regression Forum Four Option" element
    Then I execute "Log Out from Hub Student" reusable step
    And I should see the "Already registered? Log in" message
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    #Change to 'must' in the future
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I click on the "Automation Regression Forum4" "Totara Edit Activity Dropdown Button"
    Then I click on the "Automation Regression Forum4" "Totara Edit Activity Edit Settings option" by JS
    And I wait for "1" seconds
    And I click on the "Totara Restrictions Header Expandable link" link
    And I select "must" from "Restriction type" "Totara Select field with title Parameter"
    And I click on the "Save and return to course" "element by value" by JS
    And I wait for "2" seconds
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    And I wait for "2" seconds
    #Check forum is visible
    When I execute "Log In to Hub as Student" reusable step
    When I click on the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    When I click on the "Totara Course Select Forum link" link
    Then I should see the "BPP Digital Course Automation Regression Forum Four Option" element
    Then I execute "Log Out from Hub Student" reusable step
    And I should see the "Already registered? Log in" message
    When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    Then I execute "Login as Admin Totara" reusable step
    #Cleanup
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    And I click on the "Automation Regression Forum4" "Totara Edit Activity Dropdown Button"
    Then I click on the "Automation Regression Forum4" "Totara Edit Activity Edit Settings option" by JS
    And I wait for "1" seconds
    And I click on the "Totara Restrictions Header Expandable link" link
    And I select "must" from "Restriction type" "Totara Select field with title Parameter"
    And I select "from" from "Totara Restriction Direction Dropdown menu" element
    And I click on the "Totara Year Dropdown menu" element
    And I click on the "Totara Restriction Current Year option" element
    And I click on the "Save and return to course" "element by value" by JS
    And I wait for "2" seconds
    Then I execute "Logout as Admin Totara" reusable step

  #Will be fully completed after resolving https://jira.bpp.com/browse/BPP-6785
  # TC-1595
 #Scenario: The Hub - Activity Restrictions - Forum Button - Multiple Access Restrictions
    #Register New Student
    #And I register new Hub account using API
    #Then I execute "Log In to Hub as Student" reusable step
    #Validate Timeline block
    #Then I should see the "Timeline" message
    #When I execute "Log Out from Hub Student" reusable step
    #And I should see the "Already registered? Log in" message
    #When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    #And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    #Then I execute "Login as Admin Totara" reusable step
    #Enrol to a course
    #When I click on the "Totara ICAEW Course" link by JS
    #And I click on the "Totara Left Menu Users link" link by JS
    #And I click on the "Totara Enrolled Users button" button by JS
    #And I wait for "3" seconds
    #And I click on the "Totara Enrol User button" button by JS
    #And I set "EC_AUTO_EMAIL" text to the element with ID "enrolusersearch" using JS
    #And I click on the "Totara Enrol User Search button" button by JS
    #And I wait for "2" seconds
    #And I click on the "Totara Enrol Button" button by JS
    #And I click on the "Totara Finish Enroling Users button" button by JS
    #Admin Logout
    #Then I execute "Logout as Admin Totara" reusable step
    #And Browser deletes cookies
    #And I wait for "3" seconds
    #Login As student and check Forum is not visible
    #When I execute "Log In to Hub as Student" reusable step
    #When I click on the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    #When I click on the "Totara Course Select Forum link" link
    #Then I shouldn't see the "BPP Digital Course Automation Regression Forum Two Option" element
    #Then I execute "Log Out from Hub Student" reusable step
    #And I wait for "1" seconds
    #When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    #And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    #And Browser deletes cookies
    #And I wait for "5" seconds
    #Then I execute "Login as Admin Totara" reusable step
    #Add to Test Group 1:
    #When I click on the "Totara ICAEW Course" link by JS
    #And I click on the "Totara Left Menu Users link" link by JS
    #And I click on the "Totara Left Menu Groups link" button by JS
    #And I wait for "5" seconds
    #And I click on the "Test Group 1" "Dropdown Option Contains text"
    #And I click on the "Add/remove users" "Totara button"
    #And I set "EC_AUTO_EMAIL" text to the "addselect_searchtext" "element by name"
    #And I click on the "Totara Potential Member first option" element
    #And I click on the "Add" "element by title"
    #And I wait for "1" seconds
    #When I click on the "Dashboard" "text contained in SPAN element"
    #Then I execute "Logout as Admin Totara" reusable step
    #And Browser deletes cookies
    #And I wait for "3" seconds
    #Login As student and check Forum is visible
    #When I execute "Log In to Hub as Student" reusable step
    #When I click on the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    #When I click on the "Totara Course Select Forum link" link
    #Then I should see the "BPP Digital Course Automation Regression Forum Two Option" element
    #Then I execute "Log Out from Hub Student" reusable step
    #And Browser deletes cookies
    #And I wait for "2" seconds
    #Given I execute "Log In to Hub as Student" reusable step replacing some steps
    #  | 2 | I set "autotiaamos2362@harakirimail.com" text to the "Email" "Build Empire text field" |
    #  | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    #When I click on the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    #When I click on the "Totara Course Select Forum link" link
    #Then I should see the "BPP Digital Course Automation Regression Forum Two Option" element
    #Then I execute "Log Out from Hub Student" reusable step
    #Check restriction to matches 'all'
    #When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    #And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
    #And Browser deletes cookies
    #And I wait for "3" seconds
    #Then I execute "Login as Admin Totara" reusable step
    #Add to Test Group 2:
    #When I click on the "Totara ICAEW Course" link by JS
    #And I click on the "Totara Left Menu Users link" link by JS
    #And I click on the "Totara Left Menu Groups link" button by JS
    #And I wait for "5" seconds
    #And I click on the "Test Group 2" "Dropdown Option Contains text"
    #And I click on the "Add/remove users" "Totara button"
    #And I set "EC_AUTO_EMAIL" text to the "addselect_searchtext" "element by name"
    #And I click on the "Totara Potential Member first option" element
    #And I click on the "Add" "element by title"
    #And I wait for "1" seconds
    #When I click on the "Dashboard" "text contained in SPAN element"
    #When I click on the "Totara ICAEW Course" link by JS
    #And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    #And I click on the "Automation Regression Forum2" "Totara Edit Activity Dropdown Button"
    #Then I click on the "Automation Regression Forum2" "Totara Edit Activity Edit Settings option" by JS
    #And I wait for "1" seconds
    #And I click on the "Totara Restrictions Header Expandable link" link
    #And I select "all" from "Required restrictions" "Totara Select field with title Parameter"
    #And I click on the "Save and return to course" "element by value" by JS
    #And I wait for "3" seconds
    #Then I execute "Logout as Admin Totara" reusable step
    #And Browser deletes cookies
    #And I wait for "3" seconds
    #Check forum is not visible for one student but displayed for that who is added to both Groups
    #Given I execute "Log In to Hub as Student" reusable step replacing some steps
    #  | 2 | I set "autotiaamos2362@harakirimail.com" text to the "Email" "Build Empire text field" |
    #  | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    #When I click on the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    #When I click on the "Totara Course Select Forum link" link
    #Then I shouldn't see the "BPP Digital Course Automation Regression Forum Two Option" element
    #Then I execute "Log Out from Hub Student" reusable step
    #And Browser deletes cookies
    #And I wait for "2" seconds
    #When I execute "Log In to Hub as Student" reusable step
    #When I click on the "ICAEW Accounting Full" "Build Empire My Learning Right Block Course name"
    #When I click on the "Totara Course Select Forum link" link
    #Then I should see the "BPP Digital Course Automation Regression Forum Two Option" element
    #Then I execute "Log Out from Hub Student" reusable step
    #Clean up to previous state
    #And I should see the "Already registered? Log in" message
    #When I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
    #And I click on the "BPP Digital Log out button" button if "Totara Login Confirmation Popup window" "element is present"
    #Then I execute "Login as Admin Totara" reusable step
    #When I click on the "Totara ICAEW Course" link by JS
    #And I click on the "Turn editing on" "BPP Digital Admin Value attribute button"
    #And I click on the "Automation Regression Forum2" "Totara Edit Activity Dropdown Button"
    #Then I click on the "Automation Regression Forum2" "Totara Edit Activity Edit Settings option" by JS
    #And I wait for "1" seconds
    #And I click on the "Totara Restrictions Header Expandable link" link
    #And I select "any" from "Required restrictions" "Totara Select field with title Parameter"
    #And I click on the "Save and return to course" "element by value" by JS
    #And I wait for "3" seconds
    #Then I execute "Logout as Admin Totara" reusable step
