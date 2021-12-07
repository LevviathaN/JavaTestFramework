@ProductFactory @CBA @Amend
Feature: To allow for Editing of CBAs in the new structure - BPP-13174
  As a Product Setter
  I want to be able to amend any existing CBA records so that I can make any required changes.

  Background:
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT   |
      |target       |REGION|
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT   |
      |target       |LOCATION|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step with parameters saving as "CBA_"
      |isCba|true|
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step with parameters
      |isCba|true|
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Session Duration" API step with parameters
      |allowedForCba|true|
    And I execute "Create Instance Group" API step
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step with parameters
      |courseTypeReference|EC_CBA_COURSE_TYPE_REFERENCE|
    And I execute "Create Courses" API step
    And I execute "Create Deactivation Reason" API step with parameters saving as "PREVENT_"
      |preventReactivation|false|
    And I execute "Create Instances" API step

    And I remember "AutoClientName" text as "EC_CLIENT_NAME" variable

  @Positive @Regression @P1 #TC-5133, TC-5151
  Scenario: Update Draft CBA Record In New Layout
    And I execute "Log In" reusable step

    # Verify user is unable to add negative numbers to Capacity field (TC-5151)
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
#    And I set "EC_REGION_NAME" text to the "Search" "Product Factory text field" from keyboard
#    And I click on the "submit" "element by type"
    And I click on the "EC_REGION_NAME" "Product Factory edit button"
    And I click on the "Edit" "element by title"
    And I set "-2" text to the "EC_LOCATION_NAME" "Product Factory text field"
    And I click on the "Yes" "element by title"
    Then I should see the "Capacity must be at least 0" message
    And I click on the "Edit" "element by title"
    And I set "2" text to the "EC_LOCATION_NAME" "Product Factory text field"
    And I click on the "Yes" "element by title"
    Then I should see the "2" element

    # Verify user is unable to add negative numbers to Institute Fee field (TC-5151)
    Then I click on the "Courses" element
    Then I click on the "EC_BODY_SHORT_NAME" "Product Factory CBA Course Institute Fee edit button"
    And I set "-12" text to the "EC_BODY_SHORT_NAME" "Product Factory CBA Course Institute Fee input field"
    And I click on the "Yes" "Product Factory button title"
    Then I should see the "Institute Fee must be greater than or equal to 0" message
    Then I click on the "EC_BODY_SHORT_NAME" "Product Factory CBA Course Institute Fee edit button"
    And I set "~UpdatedInstituteFee[###]" text to the "EC_BODY_SHORT_NAME" "Product Factory CBA Course Institute Fee input field"
    And I click on the "Yes" "Product Factory button title"
    Then I should see the "EC_UPDATED_INSTITUTE_FEE" element

    And I click on the "Clients" element
    And I click on the "Edit" "Product Factory button"
    And I "check" "EC_CLIENT_NAME" "Product Factory checkbox"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_CLIENT_NAME" element