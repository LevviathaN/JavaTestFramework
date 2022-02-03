@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @Paper #TC-772
  Scenario: Add a New Paper Using a Modal
    Given I execute "Create Study Mode" API step
    Given I execute "Create Paper" API step
    Then I execute "Create Paper" API step with parameters saving as "CBA_"
      |isCba|true|

  @Paper @Update #TC-828
  Scenario: Amend a Paper Using a Modal
    Given I execute "Create Study Mode" API step
    Given I execute "Create Paper" API step
    Then I execute "Update Paper" API step

  @Paper @Update #TC-1552
  Scenario: Amend a Paper Changing Body And Level
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Body" API step saving as "TWO_"
    Given I execute "Create Level" API step
    And I execute "Create Level" API step saving as "TWO_"
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    Then I execute "Change Paper Body" API step
    Then I execute "Link Paper To Levels" API step
    Then I execute "Change Paper Body" API step with parameters
      |bodyReference|EC_TWO_BODY_REFERENCE|
    Then I execute "Link Paper To Levels" API step with parameters
      |levelReferences|EC_TWO_LEVEL_REFERENCE|

  @Paper @Update @Duplicate @Negative #TC-831
  Scenario: Amend a Paper Where Name Already Exists
    Given I execute "Create Study Mode" API step
    Given I execute "Create Paper" API step
    And I execute "Create Paper" API step with parameters saving as "SECOND_"
      |shortName  |ApiPSNT[###]                 |
      |name       |ApiPaperNameTwo[####]        |
      |description|ApiPaperDescriptionTwo[#####]|
    And I execute negative "Update Paper" API step with error name "Short Name must be unique" and parameters
      |shortName  |EC_API_PSNT                  |
    And I execute negative "Update Paper" API step with error name "Name must be unique" and parameters
      |name       |EC_API_PAPER_NAME_TWO        |

  @Paper @Negative #TC-773
  Scenario: Add a Paper Where Description Already Exists
    Given I execute "Create Study Mode" API step
    Given I execute "Create Paper" API step
    And I execute "Create Paper" API step with parameters
      |description|EC_PAPER_DESCRIPTION|

  @Paper @Incomplete #TC-771
  Scenario: Submitting Incomplete Paper Fields
    Given I execute "Create Study Mode" API step
    Then I execute negative "Create Paper" API step with error name "The ShortName field is required." and parameters
      |shortName    |    |
    And I execute negative "Create Paper" API step with error name "The Name field is required." and parameters
      |name         |    |
    And I execute negative "Create Paper" API step with error name "Variable `$command` got invalid value." and parameters
      |examSchedule |    |
    And I execute negative "Create Paper" API step with error name "Variable `$command` got invalid value." and parameters
      |timeInHours  |    |
      |isCba        |true|

  @ChangePaperBody #TC-697
  Scenario: Link Body to Paper
    Given I execute "Create Study Mode" API step
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Paper" API step
    Then I execute "Change Paper Body" API step

  @LinkPaperToLevel #TC-716
  Scenario: Link Paper to Level
    Given I execute "Create Level" API step
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    Then I execute "Link Paper To Levels" API step

  @Paper #TC-6685, TC-6686
  Scenario: Scheduled Auto De-publish of courses from the website
    Given I execute "Create Study Mode" API step
    Given I execute "Create Paper" API step
    And I execute "Search Paper" API step
    And I verify that "EC_PAPER_EXPIRY_EXPIRY_WEEKS" element "equal" to "EC_SEARCH_PAPER_RESULT_EXPIRY_EXPIRY_WEEKS" element
    And I verify that "EC_PAPER_EXPIRY_EXPIRY_OPTION" element "equal" to "EC_SEARCH_PAPER_RESULT_EXPIRY_EXPIRY_OPTION" element

  @Paper #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of Papers record changes
    Given I execute "Create Study Mode" API step
    Given I execute "Create Paper" API step
    And I transform "[TIMENOW-PLUS-0HOURS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd'T'HH:mm" pattern saving value as "EC_TIME_NOW_ONE"
    And I verify that "EC_TIME_NOW_ONE" element "contains" to "EC_PAPER_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_PAPER_CREATED_BY" element
    And I verify that "EC_PAPER_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_PAPER_UPDATED_BY" element "equal" to "null" element
    Then I execute "Update Paper" API step
    And I transform "[TIMENOW-PLUS-0HOURS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd'T'HH:mm" pattern saving value as "EC_TIME_NOW_ONE"
    And I verify that "EC_TIME_NOW_TWO" element "contains" to "EC_PAPER_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_PAPER_UPDATED_BY" element