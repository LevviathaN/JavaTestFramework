@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @Sitting #TC-835
  Scenario: Add a New Sitting Using a Modal (Link to One Body)
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    Then I execute "Create Sitting" API step

  @Sitting @Update #TC-1547
  Scenario: Amend a Sitting Using a Modal
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    Then I execute "Update Sitting" API step

  @Sitting @Duplicate #TC-
  Scenario: Add a Sitting Where Name Already Exists
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute negative "Create Sitting" API step with error name "The combination of Name and Dates must be unique" and parameters
      |name|EC_SITTING_NAME|

  @Sitting @Incomplete #TC-837
  Scenario: Submitting Incomplete Sitting Fields
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    Given I execute "Create Body" API step
    Given I execute negative "Create Sitting" API step with error name "The Name field is required." and parameters
      |name     ||
    Given I execute negative "Create Sitting" API step with error name "Variable `$command` got invalid value." and parameters
      |startDate||
    Given I execute negative "Create Sitting" API step with error name "Variable `$command` got invalid value." and parameters
      |endDate  ||

  @Sitting #TC-835
  Scenario: Add a New Sitting Using a Modal (Link to Multiple Bodies)
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_TWO_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Vertical" API step saving as "SECOND_"
    And I execute "Create Body" API step
    And I execute "Create Body" API step with parameters saving as "SECOND_"
      |financialDimensionReference|EC_BODY_TWO_FINANCIAL_DIMENSION_REFERENCE|
      |verticalReference          |EC_SECOND_VERTICAL_REFERENCE             |
    Then I execute "Create Sitting" API step
    Then I execute "Create Multiple Body Sitting" API step saving as "SITTING_TWO_"

  @Sitting @Update @Negative @Duplicate #TC-820
  Scenario: Amend a Sitting Where Name Already Exists
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Sitting" API step saving as "TWO_"
    And I execute negative "Update Sitting" API step with error name "The combination of Name and Dates must be unique" and parameters
      |name|EC_TWO_SITTING_NAME|