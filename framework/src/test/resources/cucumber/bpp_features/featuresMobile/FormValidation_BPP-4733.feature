@Mobile
Feature: As a user, if I correctly fill in a field with validation rules,
  I expect a green tick to appear next to this field
  As a user, if I incorrectly fill in a field with validation rules, and then focus out of this field,
  I expect to be preseted with a red validation message

  @iPhone @iPad @Samsung #TC-2460
  Scenario: Form Validation_Mobile
    When I am on "https://web-stage-bppdigital.bppuniversity.com/form" URL
    And I click on the "Direct App I Am Happy To Receive Information Mobile" button
    And I set "A" text to the "First Name" "BPP Digital Mobile RFI Input Field"
    And I press "MD_COMMON_KEYBOARD_BACKSPACE" for "First Name" "BPP Digital Mobile RFI Input Field"
    And I set "Automation" text to the "Last Name" "BPP Digital Mobile RFI Input Field"
    Then I should see the "Please enter your name" element
    And I set "Automation" text to the "First Name" "BPP Digital Mobile RFI Input Field"
    And I set "123" text to the "Phone Number" "BPP Digital Mobile RFI Input Field"
    And I set "a" text to the "Email" "BPP Digital Mobile RFI Input Field"
    Then I should see the "Please enter a valid phone number" element
    And I set "[PHONE-0913]" text to the "Phone Number" "BPP Digital Mobile RFI Input Field"
    Then I should see the "Please enter a valid email address" element
    And I set "Automation@test.com" text to the "Email" "BPP Digital Mobile RFI Input Field"
    And I click on the "Automation Regression" element
    Then I should see the "First Name" "BPP Digital Mobile RFI Input Field Green Checkmark"
    Then I should see the "Last Name" "BPP Digital Mobile RFI Input Field Green Checkmark"
    Then I should see the "Email" "BPP Digital Mobile RFI Input Field Green Checkmark"
    Then I should see the "Phone Number" "BPP Digital Mobile RFI Input Field Green Checkmark"
    Then I click on the "BPP Digital Form I Am Employer Tab Mobile" element
    And I set "A" text to the "Company Name" "BPP Digital Mobile RFI Input Field"
    And I press "MD_COMMON_KEYBOARD_BACKSPACE" for "Company Name" "BPP Digital Mobile RFI Input Field"
    And I set "Automation" text to the "Job Title" "BPP Digital Mobile RFI Input Field"
    Then I should see the "Please enter a company name" element
    And I set "AutoCompany" text to the "Company Name" "BPP Digital Mobile RFI Input Field"
    Then I should see the "Company Name" "BPP Digital Mobile RFI Input Field Green Checkmark"
    Then I should see the "Job Title" "BPP Digital Mobile RFI Input Field Green Checkmark"
    Then I click on the "BPP Digital Form Submit Button Mobile" button by JS
    And I wait for "5" seconds
    Then I should see the "BPP Digital Form Success Message Title" element
    And I validate text "Thank you title!" to be displayed for "BPP Digital Form Success Message Title" element