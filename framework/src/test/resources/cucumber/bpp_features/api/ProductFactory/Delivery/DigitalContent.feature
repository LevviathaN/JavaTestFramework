@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @DigitalContent #TC-3148
  Scenario: Create Digital Content
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Then I execute "Create Digital Content" API step

  @DigitalContentDuplicate #TC-3149
  Scenario: Create Digital Content Prevent Duplicate
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Then I execute "Create Digital Content" API step
    Then I execute negative "Create Digital Content" API step with error name "Digital Content already exists with the display name 'ApiDigitalContentName" and parameters
      |name|EC_API_DIGITAL_CONTENT_NAME|

  @DigitalContentDuplicate #TC-3453
  Scenario: Digital Content Name Suffix Field Prevent Duplicate
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Then I execute "Create Digital Content" API step
    Then I execute negative "Create Digital Content" API step with error name "Digital Content already exists for the combination of Body, Level, Paper, Sitting" and parameters
      |nameSuffix|ApiNameSuffix[#####]|

  @DigitalContent @Update #TC-
  Scenario: Edit Digital Content
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Then I execute "Create Digital Content" API step
    Then I execute "Update Digital Content Name" API step

  @DigitalContent @Duplicate #TC-3204
  Scenario: Create Digital Content Multiple Course Types Duplicate
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Course Type" API step saving as "SECOND_"
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Then I execute "Create Digital Content Multiple Course Types" API step with parameters
      |nameSuffix|ApiDigitalContentSuffix[#######]|
    Then I execute negative "Create Digital Content Multiple Course Types" API step with error name "Digital Content already exists" and parameters
      |name      |EC_API_DIGITAL_CONTENT_NAME  |
      |nameSuffix|EC_API_DIGITAL_CONTENT_SUFFIX|

  @DigitalContent #TC-3203
  Scenario: Create Digital Content Multiple Course Types
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Course Type" API step saving as "SECOND_"
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Then I execute "Create Digital Content Multiple Course Types" API step

  @DigitalContent @Duplicate #TC-3198
  Scenario: Edit Digital Content Duplicate
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Course Type" API step saving as "SECOND_"
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Then I execute "Create Digital Content" API step
    Given I execute "Create Financial Dimension" API step with parameters saving as "SECOND_COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "SECOND_COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "SECOND_BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step saving as "SECOND_"
    And I execute "Create Body" API step with parameters saving as "SECOND_"
      |financialDimensionReference|EC_SECOND_BODY_FINANCIAL_DIMENSION_REFERENCE|
      |verticalReference|EC_SECOND_VERTICAL_REFERENCE|
    And I execute "Create Sitting" API step with parameters saving as "SECOND_"
      |bodyReferences|EC_SECOND_BODY_REFERENCE|
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Exam Preparation" API step saving as "SECOND_"
    And I execute "Create Study Mode" API step saving as "SECOND_"
    And I execute "Create Course Type" API step with parameters saving as "SECOND_"
      |vatRuleReference|EC_SECOND_VAT_RULE_REFERENCE|
      |costCentreFinancialDimensionReference|EC_SECOND_COURSE_TYPE_COST_CENTRE_FINANCIAL_DIMENSION_REFERENCE|
      |projectFinancialDimensionReference|EC_SECOND_COURSE_TYPE_PROJECT_FINANCIAL_DIMENSION_REFERENCE|
      |examPreparationReference|EC_SECOND_EXAM_PREPARATION_REFERENCE|
      |studyModeReference|EC_SECOND_STUDY_MODE_REFERENCE|
    And I execute "Create Paper" API step saving as "SECOND_"
    And I execute "Create Level" API step saving as "SECOND_"
    And I execute "Link Body To Levels" API step with parameters saving as "SECOND_"
      |bodyReference|EC_SECOND_BODY_REFERENCE|
      |levelReferences|EC_SECOND_LEVEL_REFERENCE|
    And I execute "Change Paper Body" API step with parameters saving as "SECOND_"
      |paperReference|EC_SECOND_PAPER_REFERENCE|
      |bodyReference|EC_SECOND_BODY_REFERENCE|
    And I execute "Link Paper To Levels" API step with parameters saving as "SECOND_"
      |paperReference|EC_SECOND_PAPER_REFERENCE|
      |levelReferences|EC_SECOND_LEVEL_REFERENCE|
    Then I execute "Create Digital Content" API step with parameters saving as "SECOND_"
      |name|ApiDigitalContentNameOne[#####]|
      |nameSuffix|ApiDigitalContentSuffixOne[#####]|
      |bodyReference|EC_SECOND_BODY_REFERENCE|
      |levelReference|EC_SECOND_LEVEL_REFERENCE|
      |paperReference|EC_SECOND_PAPER_REFERENCE|
      |sittingReferences|EC_SECOND_SITTING_REFERENCE|
      |courseTypeReferences|EC_SECOND_COURSE_TYPE_REFERENCE|
    Then I execute negative "Update Digital Content Name" API step with error name "Digital Content already exists with the display name" and parameters
      |name|EC_API_DIGITAL_CONTENT_NAME_ONE|
      |nameSuffix|EC_API_DIGITAL_CONTENT_SUFFIX_ONE|

  @DigitalContent #TC-3205
  Scenario: Create Digital Content Multiple Course Types Remove
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Course Type" API step saving as "SECOND_"
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Then I execute "Create Digital Content Multiple Course Types" API step
    And I execute "Digital Contents" API step with parameters
      |reference|EC_DIGITAL_CONTENT_MULTIPLE_COURSE_TYPES_REFERENCE|
    Then I execute "Update Combination" API step with parameters
      |reference|EC_DIGITAL_CONTENTS_RESULT_COMBINATIONS_REFERENCE|
