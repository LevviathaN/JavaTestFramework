@Mobile
Feature: BPP University Hub My Courses Mobile
  As a learner
  I'd like to be able to see a summary of my most recently accessed Courses and my progression for each within the dashboard
  So that I can see where I am up to at a glance

  Background:
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      |2| I set "AutoFrancisMcKnight2507@getnada.com" text to the "Email" "Build Empire text field" |
      |3| I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"                |

  @Positive @iPad @iPhone @Samsung #TC-1106 TC-1107 TC-1111 TC-1122 TC-1125 TC-1126
  Scenario: HUB - My Courses Mobile
    #Validate Timeline block
    Then I should see the "Timeline" message
    #Then I should see the "Welcome to your new logged in area." message
    #Admin Login With Walkaround
#    Then Browser deletes cookies
#    And I wait for "4" seconds
#    And I click on the "Hub VPE Mobile Hamburger Menu" button
#    And I wait for "4" seconds
#    And I click on the "Direct App Mobile Logout" element
#    And I wait for "8" seconds
#    Then Browser deletes cookies
#    And I wait for "8" seconds
#    Given I am on "MD_COMMON_LINKS_TOTARALOGINURL" URL
#    And I wait for "4" seconds
#    And I execute "Logout as Admin Totara" reusable step if "Totara Account Expandable Menu" "element is present"
#    Then I click on the "Totara Login" button by JS
#    And I wait for "4" seconds
#    And I fill the "Direct App Admin Email" field with "MD_COMMON_CREDENTIALS_TOTARAADMINUSER"
#    And I fill the "Direct App Admin Password" field with "MD_COMMON_CREDENTIALS_TOTARAADMINPASSWORD"
#    Then I click on the "Direct App Login Button" button
#    And I wait for "4" seconds
#    #Enrol to a course
#    And I execute "arguments[0].click()" JS code for "ICAEW Accounting Full" "BPP Digital Student Applications Menu link"
#    And I click on the "Totara Left Menu Users link" link by JS
#    And I click on the "Totara Enrolled Users button" button by JS
#    And I wait for "4" seconds
#    And I click on the "Totara Enrol User button" button by JS
#    And I wait for "4" seconds
#    And I set "EC_AUTO_EMAIL" text to the element with ID "enrolusersearch" using JS
#    And I wait for "4" seconds
#    And I click on the "Totara Enrol User Search button" button by JS
#    And I click on the "Totara Enrol Button" button by JS
#    And I wait for "6" seconds
#    And I click on the "Totara Finish Enroling Users button" button by JS
#    And I wait for "4" seconds
#    #Admin Logout
#    Then I execute "Logout as Admin Totara" reusable step
#    And I wait for "8" seconds
#    And Browser deletes cookies
#    And I wait for "8" seconds
#    #Login As student
#    Given I execute "Log In to Hub as Student" reusable step replacing some steps
#      |2| I set "AutoFrancisMcKnight2507@getnada.com" text to the "Email" "Build Empire text field" |
#      |3| I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"                |
    #My Learning Validation
    #Then I should see the "You are now enrolled onto ICAEW Accounting Full" message
    Then I should see the "ICAEW Accounting Full" message
    Then Attribute "alt" of "Direct App Announcement Megaphone icon" should have value "megaphone-icon"
    #Click Most Recent Course
    When I click on the "Hub Mobile My Learning Right Block Course name" element if "Hub Mobile My Learning Right Block Course name" "element is present"
    When I click on the "Hub Mobile  My Learning Timeline Course name Mobile" element if "Hub Mobile  My Learning Timeline Course name Mobile" "element is present"
    #Validate Recent Course Name and Percentage
    Then I should see the "ICAEW Accounting Full" message
    #Click My Learning
    And I click on the "Hub VPE Mobile Hamburger Menu" button
    When I click on the "My Learning" "Build Empire Navigation Menu elements"
    And I wait for "4" seconds
    When I click on the "Direct App First Course link" link if "Direct App First Course link" "element is present"
    Then I validate text "ICAEW Accounting Full" to be displayed for "Direct App Course Section title" element
    Then I validate text "0%" to be displayed for "Direct App Course Progress Percentage value" element