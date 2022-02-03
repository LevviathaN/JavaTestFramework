@ProductFactory @FinancialDimensions @Materials @Search
Feature: Material Search - additional filter fields - BPP-10792
  As a Product Setter
  I want the Material Search to be refactored to follow the same approach as the Course search
  so that I have a consistent user experience when searching.

  Background:
    Given I generate new ISBN code saving as "EC_ISBN"
    Given I execute "Log In" reusable step


  @Positive @P1 #TC-1619
  Scenario: Material Page Additional Filters Validation
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Materials" "Product Factory navigation sub item"
    And I execute "Remember Variables " reusable step
    And I execute "Remember Variables Two" reusable step

    # Check Body Additional Filter
    And I wait for "1" seconds
    And I click on the "Product Factory Additional Filters Button" button by JS
    And I wait for "7" seconds
    And I click on the "Body" "Product Factory dropdown"
    And I wait for "1" seconds
    And I click on the "EC_BODY_SHORT_NAME - EC_BODY_NAME" "Product Factory dropdown option" by JS
    And I click on the "Done" "Product Factory button" by JS
    Then I should see the "EC_BODY_SHORT_NAME" "button"
    And I shouldn't see the "EC_BODY_SHORT_NAME_TWO" element
    And I click on the "Product Factory Clear Body Additional Filter" button
    # Check Level Additional Filter
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Level" "Product Factory dropdown"
    And I wait for "1" seconds
    And I click on the "EC_LEVEL_SHORT_NAME - EC_LEVEL_NAME" "Product Factory dropdown option" by JS
    And I click on the "Done" "Product Factory button" by JS
    Then I should see the "EC_BODY_SHORT_NAME" "button"
    And I shouldn't see the "EC_BODY_SHORT_NAME_TWO" element
    And I click on the "Product Factory Clear Level Additional Filter" button
    # Check Material Type Additional Filter
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Material Type" "Product Factory dropdown"
    And I wait for "1" seconds
    And I click on the "EC_MATERIAL_TYPE_NAME - EC_MATERIAL_TYPE_DESCRIPTION" "Product Factory dropdown option" by JS
    And I click on the "Done" "Product Factory button" by JS
    Then I should see the "EC_MATERIAL_TYPE_NAME" "button"
    And I shouldn't see the "EC_MATERIAL_TYPE_NAME_TWO" element
    And I click on the "Product Factory Clear Material Type Additional Filter" button
    # Check Sitting Additional Filter
    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Sitting" "Product Factory dropdown"
    And I wait for "1" seconds
    And I debug
    And I click on the "EC_SITTING_NAME (EC_SITTING_START_DATE - EC_SITTING_END_DATE)" "Product Factory dropdown option" by JS
    And I click on the "Done" "Product Factory button" by JS
    Then I should see the "EC_BODY_SHORT_NAME" "button"
    And I shouldn't see the "EC_BODY_SHORT_NAME_TWO" element
    And I click on the "Product Factory Clear Sitting Additional Filter" button

  @Positive @P1 #TC-1624
  Scenario: Material Page Additional Filters Validation All At Once
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Materials" "Product Factory navigation sub item"
    And I execute "Remember Variables " reusable step
    And I execute "Remember Variables Two" reusable step
    # Check all at once
    And I click on the "Product Factory Additional Filters Button" button by JS
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "EC_BODY_SHORT_NAME - EC_BODY_NAME" "Product Factory dropdown option" by JS
    And I click on the "Level" "Product Factory dropdown"
    And I click on the "EC_LEVEL_SHORT_NAME - EC_LEVEL_NAME" "Product Factory dropdown option" by JS
    And I click on the "Material Type" "Product Factory dropdown"
    And I click on the "EC_MATERIAL_TYPE_NAME - EC_MATERIAL_TYPE_DESCRIPTION" "Product Factory dropdown option" by JS
    And I click on the "Sitting" "Product Factory dropdown"
    And I click on the "EC_SITTING_NAME (EC_SITTING_START_DATE - EC_SITTING_END_DATE)" "Product Factory dropdown option" by JS
    And I click on the "Done" "Product Factory button" by JS
    Then I should see the "EC_BODY_SHORT_NAME" "button"
    And I shouldn't see the "EC_BODY_SHORT_NAME_TWO" element

  @Positive @P1 #TC-1625
  Scenario: Material Page Additional Filters Validation Additional Scenarios
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Materials" "Product Factory navigation sub item"

    # Check reference data not used in any material
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I execute "Create Material Type" API step
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Level" API step
    And I execute "Create Stock Site" API step
    And I execute "Create Sitting" API step
    And I execute "Link Body To Levels" API step

    And I click on the "Product Factory Additional Filters Button" button by JS
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "EC_BODY_SHORT_NAME - EC_BODY_NAME" "Product Factory dropdown option"
    And I click on the "Level" "Product Factory dropdown"
    And I click on the "EC_LEVEL_SHORT_NAME - EC_LEVEL_NAME" "Product Factory dropdown option"
    And I click on the "Material Type" "Product Factory dropdown"
    And I click on the "EC_MATERIAL_TYPE_NAME - EC_MATERIAL_TYPE_DESCRIPTION" "Product Factory dropdown option"
    And I click on the "Sitting" "Product Factory dropdown"
    And I click on the "EC_SITTING_NAME ([DATEFORMAT(EC_SITTING_START_DATE,yyyy-MM-dd,dd/MM/yyyy)] - [DATEFORMAT(EC_SITTING_END_DATE,yyyy-MM-dd,dd/MM/yyyy)])" "Product Factory dropdown option"
    And I click on the "Done" "Product Factory button"
    And I shouldn't see the "Product Factory Materials Page Entry" element

    # Check reference data from different materials
    And I execute "Remember Variables " reusable step
    And I execute "Remember Variables Two" reusable step
    And I execute "Remember Variables Three" reusable step

    And I click on the "Product Factory Additional Filters Button" button
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "EC_BODY_SHORT_NAME_TWO - EC_BODY_NAME_TWO" "Product Factory dropdown option"
    And I click on the "Level" "Product Factory dropdown"
    And I click on the "EC_LEVEL_SHORT_NAME_TWO - EC_LEVEL_NAME_TWO" "Product Factory dropdown option"
    And I click on the "Material Type" "Product Factory dropdown"
    And I click on the "EC_MATERIAL_TYPE_NAME_THREE - EC_MATERIAL_TYPE_DESCRIPTION_THREE" "Product Factory dropdown option"
    And I click on the "Sitting" "Product Factory dropdown"
    And I click on the "EC_SITTING_NAME_TWO (EC_SITTING_START_DATE - EC_SITTING_END_DATE)" "Product Factory dropdown option"
    And I click on the "Done" "Product Factory button"
    And I shouldn't see the "Product Factory Materials Page Entry" element