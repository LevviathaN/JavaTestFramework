@PDBooking @DigitalSite
Feature: As a BPP PD Learner I need to Book Single Courses online


  @Positive #TC-7911, TC-6447, TC-6448
  Scenario: Book a Single Course
    #MasterCard
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
    And I click on the "Mastercard" "element in label"
    And I set "5555444433331111" text to the "card_number" "BPP Digital Booking Payment Data"
    #And I set "Mastercard" text to the "card.cardHolderName" "BPP Digital Booking Payment Data"
    Then I click on the "BPP Digital Course Card Month Dropdown" element
    And I click on the "03" "BPP Digital Drop Down Option value"
    Then I click on the "BPP Digital Course Card Year Dropdown" element
    And I click on the "2030" "BPP Digital Drop Down Option value"
    And I set "737" text to the "card_cvn" "BPP Digital Booking Payment Data"
    And I click on the "Pay" "BPP Digital Admin Value attribute button"
    And I wait for "5" seconds
    And I validate text "CONTAINS=Thank you for your order. Your booking has been successful." to be displayed for "BPP Digital Course Booking Success Message Form" element
    #VISA
    Given I am on "MD_COMMON_LINKS_PDCOURSEURL" URL
    Then I click on the "Book Now" "text contained in element"
    And I set "Auto[FIRSTNAME]" text to the "First name*" "Build Empire text field"
    And I set "Auto[LASTNAME]" text to the "Last name*" "Build Empire text field"
    And I set "Auto[EMAIL-MAILDROP]" text to the "Email*" "Build Empire text field"
    And I fill the "BPP Digital Course Booking Telephone" field with "[PHONE-0913]"
    And I click on the "BPP Digital Course Booking Title Dropdown" button
    Then I click on the "Dr" "Build Empire application type"
    And I set "Automation Visa" text to the "Company Name" "Build Empire text field"
    And I set "Test Address 11" text to the "Address 1" "Build Empire text field"
    And I set "London" text to the "City" "Build Empire text field"
    And I set "W5EH32" text to the "Postcode" "Build Empire text field"
    And I click on the "BPP Digital Course Booking Country Dropdown" button
    And I click on the "BPP Digital Course Booking UK Option" button
    And I click on the "Direct App I Am Happy To Receive Information" button
    And I click on the "BPP Digital Course Booking Conditions Checkbox" button
    Then I click on the "Direct App Register" button
    And I click on the "Visa" "element in label"
    And I set "4111 1111 1111 1111" text to the "card_number" "BPP Digital Booking Payment Data"
    Then I click on the "BPP Digital Course Card Month Dropdown" element
    And I click on the "10" "BPP Digital Drop Down Option value"
    Then I click on the "BPP Digital Course Card Year Dropdown" element
    And I click on the "2025" "BPP Digital Drop Down Option value"
    And I set "123" text to the "card_cvn" "BPP Digital Booking Payment Data"
    And I click on the "Pay" "BPP Digital Admin Value attribute button"
    And I wait for "5" seconds
    And I validate text "CONTAINS=Thank you for your order. Your booking has been successful." to be displayed for "BPP Digital Course Booking Success Message Form" element
    #Maestro UK and negative scenario
    Given I am on "MD_COMMON_LINKS_PDCOURSEURL" URL
    Then I click on the "Book Now" "text contained in element"
    And I set "Auto[FIRSTNAME]" text to the "First name*" "Build Empire text field"
    And I set "Auto[LASTNAME]" text to the "Last name*" "Build Empire text field"
    And I set "Auto[EMAIL-MAILDROP]" text to the "Email*" "Build Empire text field"
    And I fill the "BPP Digital Course Booking Telephone" field with "[PHONE-0913]"
    And I click on the "BPP Digital Course Booking Title Dropdown" button
    Then I click on the "Dr" "Build Empire application type"
    And I set "Automation Maestro" text to the "Company Name" "Build Empire text field"
    And I set "Test Address 10" text to the "Address 1" "Build Empire text field"
    And I set "London" text to the "City" "Build Empire text field"
    And I set "W5EH32" text to the "Postcode" "Build Empire text field"
    And I click on the "BPP Digital Course Booking Country Dropdown" button
    And I click on the "BPP Digital Course Booking UK Option" button
    And I click on the "Direct App I Am Happy To Receive Information" button
    And I click on the "BPP Digital Course Booking Conditions Checkbox" button
    Then I click on the "Direct App Register" button
    And I click on the "Maestro UK" "element in label"
    And I set "1111111111111111" text to the "card_number" "BPP Digital Booking Payment Data"
    Then I click on the "BPP Digital Course Card Month Dropdown" element
    And I click on the "01" "BPP Digital Drop Down Option value"
    Then I click on the "BPP Digital Course Card Year Dropdown" element
    And I click on the "2022" "BPP Digital Drop Down Option value"
    And I set "123" text to the "card_cvn" "BPP Digital Booking Payment Data"
    And I should see the "Enter a valid card number" "message"
    And I click on the "Pay" "BPP Digital Admin Value attribute button"
    And I should see the "You have one or more errors in your payment details. Please fix to continue." "message"
    And I set "6759411100000008" text to the "card_number" "BPP Digital Booking Payment Data"
    Then I click on the "BPP Digital Course Card Month Dropdown" element
    And I click on the "03" "BPP Digital Drop Down Option value"
    Then I click on the "BPP Digital Course Card Year Dropdown" element
    And I click on the "2023" "BPP Digital Drop Down Option value"
    And I click on the "Pay" "BPP Digital Admin Value attribute button"
    And I wait for "5" seconds
    And I validate text "CONTAINS=Thank you for your order. Your booking has been successful." to be displayed for "BPP Digital Course Booking Success Message Form" element
    #Invalid CVV 004
    Given I am on "MD_COMMON_LINKS_PDCOURSEURL" URL
    Then I click on the "Book Now" "text contained in element"
    And I set "Auto[FIRSTNAME]" text to the "First name*" "Build Empire text field"
    And I set "Auto[LASTNAME]" text to the "Last name*" "Build Empire text field"
    And I set "Auto[EMAIL-MAILDROP]" text to the "Email*" "Build Empire text field"
    And I fill the "BPP Digital Course Booking Telephone" field with "[PHONE-0913]"
    And I click on the "BPP Digital Course Booking Title Dropdown" button
    Then I click on the "Dr" "Build Empire application type"
    And I set "Automation Visa" text to the "Company Name" "Build Empire text field"
    And I set "Test Address 11" text to the "Address 1" "Build Empire text field"
    And I set "London" text to the "City" "Build Empire text field"
    And I set "W5EH32" text to the "Postcode" "Build Empire text field"
    And I click on the "BPP Digital Course Booking Country Dropdown" button
    And I click on the "BPP Digital Course Booking UK Option" button
    And I click on the "Direct App I Am Happy To Receive Information" button
    And I click on the "BPP Digital Course Booking Conditions Checkbox" button
    Then I click on the "Direct App Register" button
    And I click on the "Visa" "element in label"
    And I set "4622943127013705" text to the "card_number" "BPP Digital Booking Payment Data"
    Then I click on the "BPP Digital Course Card Month Dropdown" element
    And I click on the "12" "BPP Digital Drop Down Option value"
    Then I click on the "BPP Digital Course Card Year Dropdown" element
    And I click on the "2022" "BPP Digital Drop Down Option value"
    And I set "004" text to the "card_cvn" "BPP Digital Booking Payment Data"
    And I click on the "Pay" "BPP Digital Admin Value attribute button"
    And I wait for "5" seconds
    #And I validate text "CONTAINS=It looks like there was an issue in processing your payment." to be displayed for "BPP Digital Course Booking Success Message Form" element