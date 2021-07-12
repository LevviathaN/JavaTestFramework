@ProductFactory @FinancialDimensions
Feature: Financial Dimension - Reference Data Update Record - BPP-2489
  As a Senior Product Setter
  I want to be able to amend any existing Financial Dimension records
  So that I can correct any errors and make any required changes.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 #TC-1543
  Scenario Outline: Update created Financial Dimension record <type> item
    Given I execute modified "Create Body Financial Dimension" reusable step
      |4|Replace|I set "FDCode[######]" text to the "Code" "Product Factory text field"|
      |5|Replace|I set "FDDescription[######]" text to the "Description" "Product Factory text field"|
      |7|Replace|I click on the "<type>" "Product Factory dropdown option"                           |
      |11|Replace|I should see the "EC_FD_CODE" element                                              |
    Then I should see the "EC_FD_DESCRIPTION" element
    Given I execute modified "Create Body Financial Dimension" reusable step
      |3|Replace|I click on the "EC_FD_CODE" "Product Factory edit button"|
      |4|Add|Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"|
      |5|Replace|I set "FDCodeTwo[######]" text to the "Code" "Product Factory text field"|
      |6|Replace|I set "FDDescriptionTwo[######]" text to the "Description" "Product Factory text field"|
      |7|Delete |                                                                                       |
      |8|Delete||
      |12|Replace|I should see the "EC_FD_CODE_TWO" element|
    Then I should see the "EC_FD_DESCRIPTION_TWO" element
    And I should scroll to the "bottom" of the page
    And I click on the "EC_FD_CODE_TWO" "Product Factory edit button"
    And I click on the "Audit Log" "Product Factory button title"
    And I remember "KW_AUTO_TODAY|DD/MM/YYYY" text as "EC_DATE" variable
    Then I validate text "CONTAINS=Created" to be displayed for "Product Factory Audit Log Created Node" element
    Then I validate text "Samuel Slade" to be displayed for "Product Factory Audit Log Created By Node" element
    #todo issue with date format
#    Then I validate text "CONTAINS=EC_DATE" to be displayed for "Product Factory Audit Log Created When Node" element
    Then I validate text "Updated" to be displayed for "Product Factory Audit Log Updated Node" element
    Then I validate text "Samuel Slade" to be displayed for "Product Factory Audit Log Updated By Node" element
#    Then I validate text "CONTAINS=EC_DATE" to be displayed for "Product Factory Audit Log Updated When Node" element


  Examples:
  |type         |
  |Course       |
  |Material     |
  |Course Type  |
  |Material Type|
  |Location     |
  |Body         |


  @Negative @P2 #TC-1544
  Scenario Outline: Update created Financial Dimension record <type> item with Duplicate Data
    Given I execute modified "Create Body Financial Dimension" reusable step
      |4|Replace|I set "FDCode[######]" text to the "Code" "Product Factory text field"|
      |5|Replace|I set "FDDescription[######]" text to the "Description" "Product Factory text field"|
      |7|Replace|I click on the "<type>" "Product Factory dropdown option"                           |
      |11|Replace|I should see the "EC_FD_CODE" element                                              |
    Given I execute modified "Create Body Financial Dimension" reusable step
      |4|Replace|I set "FDCodeTwo[######]" text to the "Code" "Product Factory text field"|
      |5|Replace|I set "FDDescriptionTwo[######]" text to the "Description" "Product Factory text field"|
      |7|Replace|I click on the "<type>" "Product Factory dropdown option"                           |
      |11|Replace|I should see the "EC_FD_CODE_TWO" element                                              |
    Given I execute modified "Create Body Financial Dimension" reusable step
      |3|Replace|I click on the "EC_FD_CODE" "Product Factory edit button"|
      |4|Add|Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"|
      |5|Replace|I set "EC_FD_CODE_TWO" text to the "Code" "Product Factory text field"|
      |6|Replace|I set "EC_FD_DESCRIPTION_TWO" text to the "Description" "Product Factory text field"|
      |7|Delete |                                                                                       |
      |8|Delete||
      |12|Replace|I validate text "A Financial Dimension with the same code already targets '<Error Type>'" to be displayed for "Product Factory Code Filed Validation Error Message" element|
      |13|Add   |I validate text "A Financial Dimension with the same code already targets '<Error Type>'" to be displayed for "Product Factory Toast Error Message Top-Right corner" element|

    Examples:
      |type         |Error Type   |
      |Course       |Course       |
      |Material     |Material     |
      |Course Type  |CourseType   |
      |Material Type|MaterialType |
      |Location     |Location     |
      |Body         |Body         |