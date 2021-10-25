@ProductFactory @CBA @Amend
Feature: To allow for Editing of CBAs in the new structure - BPP-13174
  As a Product Setter
  I want to be able to amend any existing CBA records so that I can make any required changes.

  Background:
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE   |
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
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Client" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Digital Content" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Change Instance Capacity" API step with parameters
      |capacity|1|
    And I execute "Get Instance Sessions" API step
    And I execute "Change Session Timings" API step
    And I execute "Get Instance Steps" API step
    And I execute "Change Step Due Date" API step
    And I execute "Calculate Course Price" API step
    Then I execute "Activate Course" API step
    And I execute "Activate Instance" API step

    And I execute "Create Course Type" API step with parameters saving as "CBA_"
      |isCba|true|
    And I execute "Create Paper" API step with parameters saving as "CBA_"
      |isCba|true|
    And I execute "Change Paper Body" API step with parameters
      |paperReference|EC_CBA_PAPER_REFERENCE|
    And I execute "Link Paper To Levels" API step with parameters
      |paperReference|EC_CBA_PAPER_REFERENCE|
    And I execute "Create Session Duration" API step with parameters saving as "CBA_"
      |allowedForCba|true|
    And I execute "Create Instance Group" API step
    And I execute "Create Courses" API step

    And I remember "AutoBodyNameTwo" text as "EC_BODY_NAME_TWO" variable
    And I remember "AutoCBAPaperNameTwo" text as "EC_PAPER_NAME_TWO" variable
    And I remember "AutoSittingNameTwo" text as "EC_SITTING_NAME_TWO" variable
    And I remember "AutoCourseTypeDescriptionTwo" text as "EC_COURSE_TYPE_DESCRIPTION_TWO" variable
    And I remember "AutoCBACourseTypeDescriptionTwo" text as "EC_CBA_COURSE_TYPE_DESCRIPTION_TWO" variable

  @Positive @Regression @P1 @Runn #TC-5133, TC-5154, TC-5151
  Scenario: Update Draft CBA Record In New Layout
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|

    #Create second course without price and validate error
    And I execute modified "Create CBA Course" reusable step
      |3|Replace|I set "EC_CBA_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard|
      |5|Replace|I click on the "EC_CBA_COURSE_TYPE_DESCRIPTION" "Product Factory edit button"|
      |8|Replace|I click on the "EC_CBA_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory select button"|
      |10|Replace|I click on the "EC_BODY_NAME_TWO" "Product Factory dropdown option"        |
      |12|Replace|I click on the "EC_SITTING_NAME_TWO" "Product Factory dropdown option"           |
      |14|Replace|I click on the "EC_PAPER_NAME_TWO" "Product Factory dropdown option"          |
    When I click on the "Activate" "Product Factory button"
    Then I should see the "Failed to find a Price for the Course in the Pricing Matrix" message

    #Create Price for the second course
    When I execute modified "Create Pricing Matrix Full" reusable step
      |3|Replace|I click on the "EC_BODY_NAME_TWO" "Product Factory edit button"|
      |5|Replace|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
      |7|Replace|I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory select button"                           |
      |10|Replace|I click on the "EC_PAPER_NAME_TWO" "Product Factory dialog checkbox"                                     |
      |12|Replace|I set "~PricingMatrixPriceNew[####]" text to the "Enter a Price (£)" "Product Factory text field"        |

    # Recalculate and validate the price of second course is present
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
    And I click on the "EC_REGION_NAME" "Product Factory edit button"
    And I click on the "edit" "text contained in SPAN element"
    Then I click on the "Courses" element
    And I shouldn't see the "[EC_PRICING_MATRIX_PRICE_NEW].00" element
    Then I click on the "EC_BODY_NAME_TWO" "Product Factory CBA Course BPP Fee recalculate button"
    And I shouldn't see the "[EC_PRICING_MATRIX_PRICE_NEW].00" element

    # Validate user can now publish CBA
    When I click on the "Activate" "Product Factory button"
    Then I should see the "(Active)" element
    Then I should see the "Published" message
    And I should see the "Deactivate" "Product Factory button"
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"

    # Verify user is unable to add negative numbers to Capasity field (TC-5151)
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
#    And I set "EC_REGION_NAME" text to the "Search" "Product Factory text field" from keyboard
#    And I click on the "submit" "element by type"
    And I click on the "EC_REGION_NAME" "Product Factory edit button"
    And I click on the "edit" "text contained in SPAN element"
    And I set "-2" text to the "EC_LOCATION_NAME" "Product Factory text field"
    And I click on the "Yes" "element by title"
    Then I should see the "Capacity must be at least 0" message
    And I click on the "edit" "text contained in SPAN element"
    And I set "2" text to the "EC_LOCATION_NAME" "Product Factory text field"
    And I click on the "Yes" "element by title"
    Then I should see the "2" element

    # Verify user is unable to add negative numbers to Capasity field (TC-5151)
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