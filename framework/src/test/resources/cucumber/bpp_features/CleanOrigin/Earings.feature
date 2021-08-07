@Earings
Feature: Earings
  As an user
  I want to be able to see Earings page
  So that I can order some nice earings.


  @Positive @Regression @P1 #TC-919
  Scenario: Add a New Client Using a Modal
    Given I am on "https://www.cleanorigin.com/en_ca/" URL
    And I hover over the "//li[@class='nav-item dropdown'][contains(.,'JEVELRY')]" element

  @Negative @P2 #TC-920
  Scenario: Submitting Incomplete Client Fields
    When I click on the "Miscellaneous" "Product Factory navigation item"
    When I click on the "Clients" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

  @Negative @P2 #TC-921
  Scenario: Add a Client Where Name Already Exists
    When I execute "Create Client" reusable step replacing some steps
      |4|I set "EC_CLIENT_NAME" text to the "Name" "Product Factory text field"|

  @Positive @Regression @P1 @Amend #TC-1548
  Scenario: Amend a Client Using a Modal
    When I execute "Create Client" reusable step
    When I execute modified "Create Client" reusable step
      |3|Replace|I click on the "EC_CLIENT_NAME" "Product Factory edit button"|