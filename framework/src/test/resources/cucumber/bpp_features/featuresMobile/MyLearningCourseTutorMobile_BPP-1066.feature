@Mobile
Feature: BPP University Hub My Learning Course Tutor

  @Positive @Samsung @iPad @iPhone #TC-721
  Scenario: Hub My Learning Course Tutor_Mobile
    Then I execute "Login as Admin Totara" reusable step replacing some steps
    |1|I am on "https://totara-stage-bppdigital.bppuniversity.com/auth/saml2/login.php?wants&idp=9ff4f795dc76021c15c1617ffeac8c28&passive=off" URL|
    |2|I wait for "3" seconds                                                                                                                     |
    And I wait for "10" seconds
    #Totara Assign Tutor Role
    When I click on the "Dashboard" "text contained in SPAN element"
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Course Assign Roles Link" link by JS
    And I click on the "Totara Course Bpp Lead Tutor Button" button by JS
    And I capture text data "Totara Course Current Tutor Name" as "EC_CURRENT_TUTOR" variable
    #Admin Logout
    And I execute "Logout as Admin Totara" reusable step
    #Login As student
    And I wait for "3" seconds
    When I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And Browser performs "Refresh" command
    And I execute "Log In to Hub as Student" reusable step replacing some steps
      |2|I set "AutoFrancisMcKnight2507@getnada.com" text to the "Email" "Build Empire text field"|
      |3|I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"               |
    And I wait for "10" seconds
    #Validate My Learning Course Tutor Name
    And I click on the "Hub VPE Mobile Hamburger Menu" button if "Hub VPE Mobile Hamburger Menu" "element is present"
    Then I click on the "Hub Mobile My Learning Link Hamburger Menu" element if "Hub Mobile My Learning Link Hamburger Menu" "element is present"
    And I wait for "4" seconds
    And I validate text "CONTAINS=EC_CURRENT_TUTOR" to be displayed for "Direct App My Learning First Course Tutor Name" element
    #Student Logout
    And I click on the "Hub VPE Mobile Hamburger Menu" element
    Then I click on the "Direct App Mobile Logout" element
    And I execute "Logout Totara Workaround" reusable step
    #Admin Login With Walkaround
    And Browser deletes cookies
    And I wait for "5" seconds
    Then I execute "Login as Admin Totara" reusable step replacing some steps
      |1|I am on "https://totara-stage-bppdigital.bppuniversity.com/auth/saml2/login.php?wants&idp=9ff4f795dc76021c15c1617ffeac8c28&passive=off" URL|
      |2|I wait for "3" seconds                                                                                                                     |
    And I wait for "10" seconds
    #Totara UnAssign Tutor Role
    When I click on the "Totara ICAEW Course" link by JS
    And I click on the "Totara Left Menu Users link" link by JS
    And I click on the "Totara Enrolled Users button" button by JS
    And I wait for "3" seconds
    And I click on the "Totara Course Remove Bpp Lead Tutor Button" button by JS
    And I click on the "Totara Course Confirm Remove Bpp Lead Tutor Button" button by JS
    #Admin Logout
    And I execute "Logout as Admin Totara" reusable step
    And I wait for "7" seconds
    And Browser deletes cookies
    #Login As student
    And I wait for "3" seconds
    When I am on "MD_COMMON_LINKS_BUILDEMPIREURL" URL
    And Browser performs "Refresh" command
    And I execute "Log In to Hub as Student" reusable step replacing some steps
      |2| I set "AutoFrancisMcKnight2507@getnada.com" text to the "Email" "Build Empire text field" |
      |3| I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"                |
    #Validate My Learning Course Tutor Name
    And I wait for "5" seconds
    And I click on the "Hub VPE Mobile Hamburger Menu" button if "Hub VPE Mobile Hamburger Menu" "element is present"
    Then I click on the "Hub Mobile My Learning Link Hamburger Menu" element if "Hub Mobile My Learning Link Hamburger Menu" "element is present"
    And I wait for "7" seconds
    And I validate text "NOT_CONTAINS=EC_CURRENT_TUTOR" to be displayed for "Direct App My Learning First Course Tutor Name" element