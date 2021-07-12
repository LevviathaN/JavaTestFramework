@ProductFactory @CBA @Amend
Feature: To allow for Editing of CBAs in the new structure - BPP-13174
  As a Product Setter
  I want to be able to amend any existing CBA records so that I can make any required changes.

  Background:
    And I execute "Remember Variables For Creation Edit" reusable step

    And I remember "AutoBodyNameTwo" text as "EC_BODY_NAME_TWO" variable
    And I remember "AutoCBAPaperNameTwo" text as "EC_PAPER_NAME_TWO" variable
    And I remember "AutoSittingNameTwo" text as "EC_SITTING_NAME_TWO" variable
    And I remember "AutoCourseTypeDescriptionTwo" text as "EC_COURSE_TYPE_DESCRIPTION_TWO" variable

  @Positive @Regression @P1 #TC-5133б, TC-5154, TC-5151
  Scenario: Update Draft CBA Record In New Layout
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    And I remember "11:58:00" text as "EC_CBA_START_TIME" variable
    And I execute modified "Create CBA Record" reusable step
      |10|Replace|I fill the "Product Factory CBA Wizard Start Time" field with "~CBAStartTime[11:58AM]"|

    #First steps deleted to shorten the process
    And I execute modified "Create CBA Course" reusable step
      |1|Delete||
      |2|Delete||
      |3|Delete||
      |4|Delete||
      |5|Delete||

    #Create second course without price and validate error
    And I execute modified "Create CBA Course" reusable step
      |1|Delete||
      |2|Delete||
      |3|Delete||
      |4|Delete||
      |5|Delete||
      |8|Replace|I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory select button"|
      |10|Replace|I click on the "EC_SITTING_NAME_TWO" "Product Factory dropdown option"        |
      |12|Replace|I click on the "EC_BODY_NAME_TWO" "Product Factory dropdown option"           |
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