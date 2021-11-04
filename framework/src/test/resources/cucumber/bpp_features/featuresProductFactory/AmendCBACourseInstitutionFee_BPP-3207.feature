@ProductFactory @CBA @Courses @Amend @HappyPath
Feature: CBA - Update CBA Course Institution fee - BPP-3207
  As a Product Setter
  I want to be able to update the CBA Course Institution fee

  Background:
    Given I execute "Remember Variables For Creation " reusable step

  @Positive @Regression @P1 @DoNotRun @CoveredWithApi #TC-2650
  Scenario: Update CBA Course Institution Fee
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
    And I set "EC_REGION_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_REGION_NAME" "Product Factory edit button"
    Then I click on the "Courses" element
    Then I click on the "EC_BODY_SHORT_NAME" "Product Factory CBA Course Institute Fee edit button"
    And I set "~UpdatedInstituteFee[###]" text to the "EC_BODY_SHORT_NAME" "Product Factory CBA Course Institute Fee input field"
    And I click on the "Yes" "Product Factory button title"
    And I capture a part of "Product Factory CBA Course BPP Fee" element text by "\d*" regex and save as "EC_BPP_FEE" variable
    Then I should see the "[EC_UPDATED_INSTITUTE_FEE]" element
    And I should see the "[SUM(EC_BPP_FEE,EC_UPDATED_INSTITUTE_FEE)]$.00" element

  @Positive @Regression @P1 @CoveredWithApi #TC-2768
  Scenario: Update CBA Course Institution Fee Additional Scenarios
    Given I execute "Log In" reusable step
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
    And I set "EC_REGION_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_REGION_NAME" "Product Factory edit button"
    Then I click on the "Courses" element
    Then I click on the "EC_BODY_SHORT_NAME" "Product Factory CBA Course Institute Fee edit button"
    And I set "~UpdatedInstituteFee[###]" text to the "EC_BODY_SHORT_NAME" "Product Factory CBA Course Institute Fee input field"

#    And I click on the "Default Institute Fee (£)" "Product Factory edit button"
#    And I set "~UpdatedInstituteFee[###]" text to the "Default Institute Fee (£)" "Product Factory text field"
#    And I click on the "Save" "Product Factory button"
    And I click on the "Yes" "Product Factory button title"
#    And I click on the "Close" "Product Factory button"
    Then I should see the "[EC_UPDATED_INSTITUTE_FEE]" element
#    And I should see the "[SUM(EC_PRICING_MATRIX_PRICE,EC_UPDATED_INSTITUTE_FEE)]$.00" element
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Prices" "Product Factory navigation sub item"
    And I set "EC_SITTING_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    When I click on the "EC_SITTING_NAME" "Product Factory edit button"
    And I click on the "EC_CBA_COURSE_TYPE_DESCRIPTION" "text"
    And I click on the "EC_REGION_NAME" "Product Factory Pricing Matrix dropdown"
    And I click on the "EC_CBA_PAPER_NAME" "Product Factory Pricing Matrix change button"
    And I set "~UpdatedPMPrice[###]" text to the "Enter a Price (£)" "Product Factory text field"
    And I click on the "Save" "Product Factory active button"
    And I wait for "3" seconds
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
    Then I set "EC_REGION_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_REGION_NAME" "Product Factory edit button"
    And I click on the "Courses" element
    And I click on the "refresh" element
    Then I should see the "[EC_UPDATED_PM_PRICE]$.00" element
    And I should see the "[SUM(EC_UPDATED_PM_PRICE,EC_UPDATED_INSTITUTE_FEE)]$.00" element