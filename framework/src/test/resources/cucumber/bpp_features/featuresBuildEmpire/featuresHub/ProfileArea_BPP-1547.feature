@BuildEmpire @Hub @Smoke
Feature: BPP University Hub Profile Area
  As a user
  I expect to see an updated link to access my profile

  @ProfileArea @Positive #TC-1170, TC-4962
  Scenario: Hub Profile Area
    #Register New Student
    And I register new Hub account using API
    Then I execute "Log In to Hub as Student" reusable step
    #Profile Area validation
    Then I validate text "CONTAINS=EC_AUTO_FIRSTNAME" to be displayed for "Direct App Account Name Drop Down" element
    Then Attribute "style" of "Direct App Account Avatar Image" should have value "CONTAINS=/assets/icons/avatar-icon.svg"
    And I click on the "Direct App Account Name Drop Down" element by JS
    Then I should see the "Account settings" "BPP Digital Student Applications Menu link"
    Then I should see the "Logout" "BPP Digital Student Applications Menu link"
    #Change Avatar
    When I click on the "Account settings" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=EC_AUTO_FIRSTNAME" to be displayed for "Direct App Edit Account Page Account Name field" element
    Then I validate text "CONTAINS=EC_AUTO_LASTNAME" to be displayed for "Direct App Edit Account Page Account Name field" element
    When I click on the "Direct App Edit Account Page Edit button" button
    And I validate text "CONTAINS=EC_AUTO_EMAIL" to be displayed for "Direct App Edit Account Email" element
    Then Element "Direct App Edit Account Email" should be "disabled"
    And I upload "Avatar.png" file to "Direct App Upload File" element
    And I wait for "2" seconds
    And I validate text "Uploaded" to be displayed for "Direct App Account Avatar Image Upload status" element
    And I click on the "Direct App Edit Account Page Save button" button
    And I wait for "2" seconds
    Then Attribute "style" of "Direct App Account Avatar Image" should have value "CONTAINS=Avatar.png"