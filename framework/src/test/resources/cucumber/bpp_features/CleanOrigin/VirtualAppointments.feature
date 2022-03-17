@CleanOrigin @VirtualAppointments
Feature: Virtual Appointments
  As an user
  I want to book virtual appointments
  So that I consult with jewelry expert.


  @Positive @Regression @P1
  Scenario: Virtual Appointments Check Presence
    Given I am on "https://www.cleanorigin.com" URL
    And I click on the "Accept Cookies" "text in span"
    And I click on the "Virtual Appointments" "span"
    And I click on the "Clean Origin Virtual Appointments Link" element