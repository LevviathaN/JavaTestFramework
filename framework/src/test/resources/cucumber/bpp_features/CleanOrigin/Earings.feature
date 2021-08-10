@Earings
Feature: Earings
  As an user
  I want to be able to see Earings page
  So that I can order some nice earings.


  Scenario: Earings E2E
    Given I am on "https://www.cleanorigin.com/en_ca/" URL
    Then I hover over the "JEWELRY" "Navigation Menu Item"
    And I click on the "Diamond Stud Earrings" "Navigation Submenu Item"