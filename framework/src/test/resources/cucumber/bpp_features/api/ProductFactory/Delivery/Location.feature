@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @Location #TC-775
  Scenario: Add a New Location Using a Modal
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    And I execute "Create Region" API step
    And I execute "Create Location" API step

  @Location @Duplicate #TC-776
  Scenario: Add a Location Where Name Already Exists
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    Then I execute negative "Create Location" API step with error name "Name must be unique" and parameters
      |name|EC_LOCATION_NAME|

  @Location @MandatoryOnly #TC-4180
  Scenario: Add a New Location Populate Only Mandatory Fields
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    And I execute "Create Region" API step
    And I execute "Create Location" API step with parameters
      |addressLine1||
      |addressLine2||
      |addressLine3||
      |postcode    ||
      |city        ||
      |countryCode ||

  @Location @Update #TC-832 #TC-1870
  Scenario: Amend Location
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Update Location" API step

  @Location @Incomplete #TC-774
  Scenario: Submitting Incomplete Location Fields
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    And I execute "Create Region" API step
    And I execute negative "Create Location" API step with error name "The Name field is required." and parameters
      |name                       ||
    Then I execute negative "Create Location" API step with error name "Variable `$command` got invalid value." and parameters
      |regionReference            ||
    Then I execute negative "Create Location" API step with error name "Variable `$command` got invalid value." and parameters
      |financialDimensionReference||

  @Location @LocationWithoutRegion #TC-1869
  Scenario: Creating New Location without and with a Region record
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT   |
      |target       |REGION    |
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT   |
      |target       |LOCATION  |
    And I execute negative "Negative Location" API step with expected error "regionReference"
    And I execute "Create Region" API step
    Then I execute "Create Location" API step

  @Location @LocationInUse #TC-1871
  Scenario: Edit Location that is in use
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
    Given I execute "Create Study Mode" API step
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
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Create Financial Dimension" API step with parameters saving as "SECOND_LOCATION_"
      |dimensionType|PRODUCT   |
      |target       |LOCATION|
    And I execute "Create Region" API step saving as "SECOND_"
    Then I execute negative "Update Location" API step with error name "The Location is already linked to one or more Sessions, so you cannot change the Region" and parameters
      |regionReference|EC_SECOND_REGION_REFERENCE|

  @Location @LocationInUse #TC-1771
  Scenario: Edit Financial Dimension for the Location that is in use
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
    Given I execute "Create Study Mode" API step
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
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Create Financial Dimension" API step with parameters saving as "SECOND_LOCATION_"
      |dimensionType|PRODUCT   |
      |target       |LOCATION|
    And I execute "Create Region" API step saving as "SECOND_"
    Then I execute negative "Update Location" API step with error name "The Location is already linked to one or more Sessions, so you cannot change the Financial Dimension" and parameters
      |financialDimensionReference|EC_SECOND_LOCATION_FINANCIAL_DIMENSION_REFERENCE|

  @Location #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of Location record changes
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I transform "[TIMENOW-PLUS-0HOURS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd'T'HH:mm" pattern saving value as "EC_TIME_NOW_ONE"
    And I verify that "EC_TIME_NOW_ONE" element "contains" to "EC_LOCATION_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_LOCATION_CREATED_BY" element
    And I verify that "EC_LOCATION_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_LOCATION_UPDATED_BY" element "equal" to "null" element
    And I execute "Update Location" API step
    And I transform "[TIMENOW-PLUS-0HOURS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd'T'HH:mm" pattern saving value as "EC_TIME_NOW_TWO"
    And I verify that "EC_TIME_NOW_TWO" element "contains" to "EC_LOCATION_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_LOCATION_UPDATED_BY" element