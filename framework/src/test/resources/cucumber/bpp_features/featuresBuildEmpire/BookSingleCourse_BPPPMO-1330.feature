@PDBooking @DigitalSite
Feature: As a BPP PD Learner I need to Book Single Courses online

  #Created the first part of test without checking Administrate (required after BPP-10802)
  @Positive #TC-7911
  Scenario: Book a Single Course
    Given I am on "MD_COMMON_LINKS_PDCOURSEURL" URL
    Then I click on the "Book Now" "text contained in element"
    And I set "Auto[FIRSTNAME]" text to the "First name*" "Build Empire text field"
    And I set "Auto[LASTNAME]" text to the "Last name*" "Build Empire text field"
    And I set "Auto[EMAIL-MAILDROP]" text to the "Email*" "Build Empire text field"
    And I fill the "BPP Digital Course Booking Telephone" field with "[PHONE-0913]"
    And I click on the "BPP Digital Course Booking Title Dropdown" button
    Then I click on the "Dr" "Build Empire application type"
    And I set "Automation Company" text to the "Company Name" "Build Empire text field"
    And I set "Test Address 11" text to the "Address 1" "Build Empire text field"
    And I set "London" text to the "City" "Build Empire text field"
    And I set "W5EH32" text to the "Postcode" "Build Empire text field"
    And I click on the "BPP Digital Course Booking Country Dropdown" button
    And I click on the "BPP Digital Course Booking UK Option" button
    And I click on the "Direct App I Am Happy To Receive Information" button
    And I click on the "BPP Digital Course Booking Conditions Checkbox" button
    Then I click on the "Direct App Register" button
    Then I should see the "Next Step: Enter your Payment Details" "text"
    And I click on the "MasterCard" "BPP Digital Admin Value attribute button"
    And I set "5555444433331111" text to the "card.cardNumber" "BPP Digital Booking Payment Data"
    And I set "Mastercard" text to the "card.cardHolderName" "BPP Digital Booking Payment Data"
    And I select "03" from "BPP Digital Course Card Month Dropdown" element
    And I select "2030" from "BPP Digital Course Card Year Dropdown" element
    And I set "737" text to the "card.cvcCode" "BPP Digital Booking Payment Data"
    And I click on the "Continue >" "BPP Digital Admin Value attribute button"
    Then I should see the "Step 3: Please review and complete your payment" "text"
    And I click on the "Pay" "BPP Digital Admin Value attribute button"
    And I wait for "3" seconds
    And I validate text "CONTAINS=Thank you for your order. Your booking has been successful." to be displayed for "BPP Digital Course Booking Success Message Form" element