@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @Body @Update #TC-1545
  Scenario: Amend a Body Using a Modal
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    Then I execute "Create Body" API step
    And I execute "Update Body" API step

  @Body @Update @Negative @Duplicate #TC-820
  Scenario: Amend a Body Where Short Name Already Exists
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    Then I execute "Create Body" API step
    And I execute "Create Body" API step with parameters saving as "SECOND_"
      |shortName  |ApiBodyShortNameTwo[#####]  |
      |name       |ApiBodyNameTwo[####]        |
      |description|ApiBodyDescriptionTwo[#####]|
    And I execute negative "Update Body" API step with error name "Short Name must be unique" and parameters
      |shortName|EC_API_BODY_SHORT_NAME_TWO|

  @Body #TC-743
  Scenario: Add a New Body Using a Modal
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    Then I execute "Create Body" API step

  @Body @Incomplete #TC-814
  Scenario: Submitting Incomplete Body Fields
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    Given I execute negative "Create Body" API step with error name "The Name field is required." and parameters
      |name     ||
    Given I execute negative "Create Body" API step with error name "The ShortName field is required." and parameters
      |shortName||

  @Body @Negative @P2 #TC-744
  Scenario: Add a Body Where Short Name Already Exists
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    Given I execute negative "Create Body" API step with error name "Short Name must be unique" and parameters
      |shortName|EC_BODY_SHORT_NAME|

  @LinkBodyToLevel #TC-703
  Scenario: Link Body to Level
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Level" API step
    Then I execute "Link Body To Levels" API step

  @Body @BodyInUse #TC-1756
  Scenario: Edit Financial Dimension for the Body that is in use
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_TWO"
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
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    Then I execute negative "Update Body" API step with error name "This Body is already linked to one or more Sittings, so you cannot change the Financial Dimension" and parameters
      |financialDimensionReference|EC_COURSE_TYPE_PROJECT_TWOFINANCIAL_DIMENSION_REFERENCE|