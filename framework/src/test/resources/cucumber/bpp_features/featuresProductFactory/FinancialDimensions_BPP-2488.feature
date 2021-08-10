@ProductFactory @FinancialDimensions
Feature: Financial Dimension - Reference Data Create Record - BPP-2488
  As a Senior Product Setter
  I want to be able to create new Financial Dimension records
  so that I can setup appropriate codes for accounting purposes.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 @HappyPath @CoveredWithApi #TC-1532
  Scenario Outline: Create Financial Dimensions record <type> item
    Given I execute "Create Body Financial Dimension" reusable step replacing some steps
      |4|I set "FDCode[######]" text to the "Code" "Product Factory text field"|
      |5|I set "FDDescription[######]" text to the "Description" "Product Factory text field"|
      |7|I click on the "<type>" "Product Factory dropdown option"                           |
      |11|I should see the "EC_FD_CODE" element                                              |

    Examples:
      |type         |
      |Course       |
      |Material     |
      |Course Type  |
      |Material Type|
      |Location     |
      |Body         |
      |Region       |

  @Negative @P2 #TC-1542
  Scenario Outline: Create Financial Dimension record <type> item with Duplicate Data
    Given I execute modified "Create Body Financial Dimension" reusable step
      |4|Replace|I set "FDCode[######]" text to the "Code" "Product Factory text field"|
      |5|Replace|I set "FDDescription[######]" text to the "Description" "Product Factory text field"|
      |7|Replace|I click on the "<type>" "Product Factory dropdown option"                           |
      |11|Replace|I should see the "EC_FD_CODE" element                                              |
    Given I execute modified "Create Body Financial Dimension" reusable step
      |4|Replace|I set "EC_FD_CODE" text to the "Code" "Product Factory text field"|
      |5|Replace|I set "EC_FD_DESCRIPTION" text to the "Description" "Product Factory text field"|
      |7|Replace|I click on the "<type>" "Product Factory dropdown option"                           |
      |11|Replace|I validate text "A Financial Dimension with the same code already targets '<Error Type>'" to be displayed for "Product Factory Code Filed Validation Error Message" element|
      |12|Add   |I validate text "A Financial Dimension with the same code already targets '<Error Type>'" to be displayed for "Product Factory Toast Error Message Top-Right corner" element|

    Examples:
      |type         |Error Type   |
      |Course       |Course       |
      |Material     |Material     |
      |Course Type  |CourseType   |
      |Material Type|MaterialType |
      |Location     |Location     |
      |Body         |Body         |
      |Region       |Region       |