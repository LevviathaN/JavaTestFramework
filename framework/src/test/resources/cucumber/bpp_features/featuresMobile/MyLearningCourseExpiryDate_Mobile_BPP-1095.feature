@Mobile
Feature: BPP University Hub My Learning Course Expiry Date
  As a learner, at a glance, I'd like to be able to see when the access to my course expires

  @Positive @Samsung #TC-718
  Scenario: HUB - My Learning Course Expiry Date Mobile
    #Admin Totara Log in
    Then I execute "Login as Admin Totara" reusable step
    Then I execute "Login as Admin Totara" reusable step if "Direct App Login Button" "element is present"
    #Change Course Expiry Date
    And I execute "arguments[0].click()" JS code for "ICAEW Accounting Full" "BPP Digital Student Applications Menu link"
    And I click on the "Turn editing on" "BPP Digital Admin Value attribute button" by JS
    And I wait for "4" seconds
    And I click on the "Totara Edit Course Setting link" element with JS if "Totara Edit Course Setting link" "element is present"
    And Browser performs "Refresh" command
    And I wait for "3" seconds
    And I click on the "Totara Edit Course Setting link Mobile" element with JS if "Totara Edit Course Setting link Mobile" "element is present"
    And I select "KW_AUTO_SELECT" from "Totara expiry Course Date Day dropdown" element
    And I select "KW_AUTO_SELECT" from "Totara expiry Course Date Month dropdown" element
    And I select "KW_AUTO_SELECT" from "Totara expiry Course Date Year dropdown" element
    And I click on the "Save and display" "Totara button" by JS
    And I wait for "8" seconds
    And Browser performs "Refresh" command
    And I click on the "Totara Edit Course Setting link" element with JS if "Totara Edit Course Setting link" "element is present"
    And I click on the "Totara Edit Course Setting link" element with JS if "Totara Edit Course Setting link" "element is present"
    And I capture text data "Totara expiry Course Date Day selected" as "EC_DAY" variable
    And I capture text data "Totara expiry Course Date Month selected" as "EC_MONTH" variable
    And I capture text data "Totara expiry Course Date Year selected" as "EC_YEAR" variable
    And I remember "<EC_DAY> " text as "EC_DAY_SPACE" variable
    And I remember "<EC_MONTH> " text as "EC_MONTH_SPACE" variable
    And I remember "<EC_DAY_SPACE><EC_MONTH_SPACE><EC_YEAR>" text as "EC_EXPIRY_DATE" variable
    #Admin Logout
    Then I execute "Logout as Admin Totara" reusable step
    And Browser deletes cookies
    #Login As student
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      |2|I set "AutoMacyHood3654@getnada.com" text to the "Email" "Build Empire text field"|
      |3|I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"|
    #Student Validate End Date
    And I click on the "Hub VPE Mobile Hamburger Menu" button by JS
    And I click on the "Hub Mobile My Learning Link Hamburger Menu" option by JS
    And I click on the "BPP Digital Student My Learning Page Open First Course Sticker" element
    And I validate text "CONTAINS=EC_EXPIRY_DATE" to be displayed for "Direct App Expiry Date status field" element