@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @Level #TC-746
  Scenario: Add a New Level Using a Modal
    Given I execute "Create Level" API step

  @Level @Update #TC-823
  Scenario: Amend a Level Using a Modal
    Given I execute "Create Level" API step
    Then I execute "Update Level" API step

  @Level @Update @Duplicate @Negative #TC-824
  Scenario: Amend a Level Where Short Name Already Exists
    Given I execute "Create Level" API step
    Then I execute "Create Level" API step with parameters saving as "SECOND_"
      |shortName  |ApiLevelShortNameTwo[#####]  |
      |name       |ApiLevelNameTwo[####]        |
      |description|ApiLevelDescriptionTwo[#####]|
    Then I execute negative "Update Level" API step with error name "Short Name must be unique" and parameters
      |shortName|EC_API_LEVEL_SHORT_NAME_TWO|

  @Level @Update @Duplicate @Negative #TC-824
  Scenario: Add a Level Where Short Name Already Exists
    Given I execute "Create Level" API step
    Then I execute negative "Create Level" API step with error name "Short Name must be unique" and parameters
      |shortName|EC_LEVEL_SHORT_NAME|

  @Level @Incomplete #TC-822
  Scenario: Submitting Incomplete Level Fields
    Given I execute negative "Create Level" API step with error name "The Name field is required." and parameters
      |name     ||
    Given I execute negative "Create Level" API step with error name "The ShortName field is required." and parameters
      |shortName||

  @Level @Incomplete #TC-822
  Scenario: Amend Submitting Incomplete Level Fields
    Given I execute "Create Level" API step
    And I execute negative "Update Level" API step with error name "The Name field is required." and parameters
      |name     ||
    Then I execute negative "Update Level" API step with error name "The ShortName field is required." and parameters
      |shortName||

  @Level #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of Level record changes
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    Then I execute "Create Level" API step
    And I verify that "[TIMENOW-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_LEVEL_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_LEVEL_CREATED_BY" element
    And I verify that "EC_LEVEL_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_LEVEL_UPDATED_BY" element "equal" to "null" element
    And I execute "Update Level" API step
    And I verify that "~Second[TIMENOW-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_LEVEL_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_LEVEL_UPDATED_BY" element