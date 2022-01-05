@ProductFactory @Bodies @Amend
Feature: Search and Filter Functionality - BPP-1184
  As a Product Setter
  I want to be able to search for Courses and Materials
  So that I can find the records I want.


  @Negative @Regression #TC-1118
  Scenario: Searching Course Material by Reference Data that not linked to any Material
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    Then I execute "Create Sitting" API step
    Given I execute "Create Study Mode" API step
    Given I execute "Create Paper" API step
    Then I execute "Create Paper" API step with parameters saving as "CBA_"
      |isCba|true|
    Given I execute "Create Level" API step
    Then I generate new ISBN code saving as "EC_ISBN"
    Then I execute "Create Material Type" API step
    Given I execute "Log In" reusable step
    When I click on the "Products" "Product Factory navigation item"
    And I click on the "Materials" "Product Factory navigation sub item"
    And I execute "Search Non Existing Material Products" reusable step
    And I execute "Search Non Existing Material Products" reusable step replacing some steps
      |1|And I fill the "Product Factory Search Field" field with "EC_PAPER_NAME"|
    And I execute "Search Non Existing Material Products" reusable step replacing some steps
      |1|And I fill the "Product Factory Search Field" field with "EC_LEVEL_NAME"|
    And I execute "Search Non Existing Material Products" reusable step replacing some steps
      |1|And I fill the "Product Factory Search Field" field with "EC_SITTING_NAME"|
    And I execute "Search Non Existing Material Products" reusable step replacing some steps
      |1|And I fill the "Product Factory Search Field" field with "EC_MATERIAL_TYPE_NAME"|
    And I execute "Search Non Existing Material Products" reusable step replacing some steps
      |1|And I fill the "Product Factory Search Field" field with "EC_ISBN"|

  @Positive @P1 @Regression #TC-1156 #TODO: Check after BPP-2247 is FIXED
  Scenario: Body search by linked Level
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Level" API step
    Then I execute "Link Body To Levels" API step
    Given I execute "Log In" reusable step
    When I click on the "Programme" "Product Factory navigation item"
    And I click on the "Bodies" "Product Factory navigation sub item"
    And I set "EC_LEVEL_NAME" text to the "Search" "Product Factory Search Field" from keyboard
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Search" "Product Factory Search Field"
    And I wait for "1" seconds
    And I should see the "EC_BODY_NAME" message
    And I set "EC_LEVEL_SHORT_NAME" text to the "Search" "Product Factory Search Field" from keyboard
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Search" "Product Factory Search Field"
    And I wait for "1" seconds
    And I should see the "EC_BODY_SHORT_NAME" message

  @Positive @P1 @Regression #TC-1117
  Scenario: Searching Course Material by Linked Reference Data
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
    And I generate new ISBN code saving as "EC_ISBN"
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Change Instance Capacity" API step with parameters
      |capacity|15|
    And I execute "Get Instance Sessions" API step
    And I execute "Change Session Timings" API step
    And I execute "Get Instance Steps" API step
    And I execute "Change Step Due Date" API step
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Calculate Course Price" API step
    And I execute "Create Stock Site" API step
    And I execute "Create Material Type" API step
    And I execute "Create Material" API step
    Then I execute "Create Course Materials" API step
    Given I execute "Log In" reusable step
    When I click on the "Products" "Product Factory navigation item"
    And I click on the "Materials" "Product Factory navigation sub item"
    And I execute "Search Existing Course Material Products" reusable step
    And I execute "Search Existing Course Material Products" reusable step replacing some steps
      |1|I set "EC_PAPER_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Existing Course Material Products" reusable step replacing some steps
      |1|I set "EC_LEVEL_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Existing Course Material Products" reusable step replacing some steps
      |1|I set "EC_SITTING_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Existing Course Material Products" reusable step replacing some steps
      |1|I set "EC_MATERIAL_TYPE_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Existing Course Material Products" reusable step replacing some steps
      |1|I set "EC_ISBN" text to the "Search" "Product Factory Search Field" from keyboard|

  @Negative @Regression #TC-1116
  Scenario: Searching Course by Reference Data that is not Linked to any Course
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    Then I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    Given I execute "Create Client" API step
    Given I execute "Create Session Duration" API step
    Given I execute "Create Deactivation Reason" API step
    Then I execute "Create Material Type" API step
    Given I execute "Log In" reusable step
    When I click on the "Products" "Product Factory navigation item"
    And I click on the "Courses" "Product Factory navigation sub item"
    And I execute "Search Non Existing Courses" reusable step
    And I execute "Search Non Existing Courses" reusable step replacing some steps
      |1|I set "EC_SESSION_DURATION_DESCRIPTION" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Non Existing Courses" reusable step replacing some steps
      |1|I set "EC_PAPER_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Non Existing Courses" reusable step replacing some steps
      |1|I set "EC_LEVEL_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Non Existing Courses" reusable step replacing some steps
      |1|I set "EC_SITTING_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Non Existing Courses" reusable step replacing some steps
      |1|I set "EC_MATERIAL_TYPE_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Non Existing Courses" reusable step replacing some steps
      |1|I set "EC_LOCATION_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Non Existing Courses" reusable step replacing some steps
      |1|I set "EC_CLIENT_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Non Existing Courses" reusable step replacing some steps
      |1|I set "EC_DEACTIVATION_REASON_DESCRIPTION" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Non Existing Courses" reusable step replacing some steps
      |1|I set "EC_API_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Non Existing Courses" reusable step replacing some steps
      |1|I set "EC_PRICES_PRICES_VALUE" text to the "Search" "Product Factory Search Field" from keyboard|


  @Positive @P1 @Regression #TC-1155
  Scenario: Body Search by Name and Short Name
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I generate new ISBN code saving as "EC_ISBN"
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    Given I execute "Log In" reusable step
    When I click on the "Programme" "Product Factory navigation item"
    And I click on the "Bodies" "Product Factory navigation sub item"
    And I set "EC_BODY_NAME" text to the "Search" "Product Factory Search Field" from keyboard
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Search" "Product Factory Search Field"
    And I should see the "EC_BODY_NAME" element
    And I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory Search Field" from keyboard
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Search" "Product Factory Search Field"
    And I should see the "EC_BODY_SHORT_NAME" element

  @Positive @P1 @Regression #TC-1062
  Scenario: Searching Course by linked Reference Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    Then I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    Given I execute "Create Client" API step
    Given I execute "Create Session Duration" API step
    Given I execute "Create Deactivation Reason" API step
    Then I execute "Create Material Type" API step
    And I execute "Create Course" API step
    Then I execute "Link Course To Clients" API step
    Given I execute "Log In" reusable step
    When I click on the "Products" "Product Factory navigation item"
    And I click on the "Courses" "Product Factory navigation sub item"
    And I execute "Search Existing Courses" reusable step
    And I execute "Search Existing Courses" reusable step replacing some steps
      |1|I set "EC_PAPER_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Existing Courses" reusable step replacing some steps
      |1|I set "EC_LEVEL_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Existing Courses" reusable step replacing some steps
      |1|I set "EC_SITTING_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Existing Courses" reusable step replacing some steps
      |1|I set "EC_REGION_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Existing Courses" reusable step replacing some steps
      |1|I set "EC_CLIENT_NAME" text to the "Search" "Product Factory Search Field" from keyboard|
    And I execute "Search Existing Courses" reusable step replacing some steps
      |1|I set "EC_API_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory Search Field" from keyboard|