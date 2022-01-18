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
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Then I execute "Create Digital Content" API step

  @DigitalContent @Duplicate #TC-3149
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
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Then I execute "Create Digital Content" API step
    Then I execute negative "Create Digital Content" API step with error name "Digital Content already exists with the display name '<EC_API_DIGITAL_CONTENT_NAME>'" and parameters
      |name|EC_API_DIGITAL_CONTENT_NAME|

  @DigitalContent @Duplicate #TC-3453
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
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Then I execute "Create Digital Content" API step
    Then I execute negative "Create Digital Content" API step with error name "Digital Content already exists for the combination of Body, Level, Paper, Sitting (<EC_SITTING_NAME>) & Course Type (<EC_COURSE_TYPE_DESCRIPTION>)" and parameters
      |nameSuffix|ApiNameSuffix[#####]|

  @DigitalContent @Update @NeedToBeUi #TC-
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
    Given I execute "Create Study Mode" API step
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
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Then I execute "Create Digital Content" API step with parameters
      |nameSuffix|ApiDigitalContentSuffix[#######]|
    Then I execute negative "Create Digital Content" API step with error name "Digital Content already exists with the display name '<EC_API_DIGITAL_CONTENT_NAME> - <EC_API_DIGITAL_CONTENT_SUFFIX>'" and parameters
      |name      |EC_API_DIGITAL_CONTENT_NAME  |
      |nameSuffix|EC_API_DIGITAL_CONTENT_SUFFIX|
      |courseTypeReferences|EC_COURSE_TYPE_REFERENCE,EC_SECOND_COURSE_TYPE_REFERENCE|

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
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I debug
    Then I execute "Create Digital Content" API step with parameters
      |courseTypeReferences|EC_COURSE_TYPE_REFERENCE,EC_SECOND_COURSE_TYPE_REFERENCE|

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
    Given I execute "Create Study Mode" API step
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
    Then I execute negative "Update Digital Content Name" API step with error name "Digital Content already exists with the display name '<EC_API_DIGITAL_CONTENT_NAME_ONE> - <EC_API_DIGITAL_CONTENT_SUFFIX_ONE>'" and parameters
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
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Then I execute "Create Digital Content" API step with parameters
      |courseTypeReferences|EC_COURSE_TYPE_REFERENCE,EC_SECOND_COURSE_TYPE_REFERENCE|
    And I execute "Digital Contents" API step
    Then I execute "Update Combination" API step with parameters
      |reference|EC_DIGITAL_CONTENTS_RESULT_COMBINATIONS_REFERENCE|

  @DigitalContent @Duplicate #TC-5489
  Scenario: Create Digital Content Prevent Duplicate University Type
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
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Given I execute "Create Programme" API step
    And I execute "Create Class Category" API step
    Then I execute "Create Cohort" API step
    And I execute "Create Module" API step
    Then I execute "Create Digital Content University" API step with parameters
      |name|EC_MODULE_NAME - EC_SIS_CODE - EC_MODULE_TERM_CODE - EC_MODULE_REFERENCE_NUMBER|
    And I execute negative "Create Digital Content University" API step with error name "Digital Content already exists with the display name '<EC_MODULE_NAME> - <EC_SIS_CODE> - <EC_TERM_CODE> - <EC_CRN_CODE> - <EC_NAME_SUFFIX>'" and parameters
      |nameSuffix|EC_NAME_SUFFIX|
      |name|EC_MODULE_NAME - EC_SIS_CODE - EC_MODULE_TERM_CODE - EC_MODULE_REFERENCE_NUMBER|

  @DigitalContent @Create #TC-3194
  Scenario: Create Digital Content Additional Scenarios
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
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_SECOND_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step saving as "SECOND_"
    And I execute "Create Body" API step with parameters saving as "SECOND_"
      |financialDimensionReference|EC_BODY_SECOND_FINANCIAL_DIMENSION_REFERENCE|
      |verticalReference|EC_SECOND_VERTICAL_REFERENCE|
    Then I execute "Create Sitting" API step with parameters saving as "SECOND_"
      |bodyReferences|EC_SECOND_BODY_REFERENCE|
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
    Then I execute "Create Digital Content" API step with parameters
      |sittingReferences|EC_SITTING_REFERENCE, EC_SECOND_SITTING_REFERENCE|
    And I execute "Create Level" API step saving as "SECOND_"
    And I execute "Link Body To Levels" API step with parameters
      |bodyReference|EC_SECOND_BODY_REFERENCE|
      |levelReferences|EC_LEVEL_REFERENCE,EC_SECOND_LEVEL_REFERENCE|
    Then I execute "Create Digital Content" API step with parameters
      |bodyReference|EC_SECOND_BODY_REFERENCE|
    And I execute "Create Paper" API step saving as "SECOND_"
    And I execute "Create Paper" API step saving as "THIRD_"
    And I execute "Create Course Type" API step saving as "SECOND_"
    And I execute "Change Paper Body" API step with parameters
      |paperReference|EC_SECOND_PAPER_REFERENCE|
      |bodyReference |EC_SECOND_BODY_REFERENCE |
    And I execute "Change Paper Body" API step with parameters
      |paperReference|EC_THIRD_PAPER_REFERENCE|
      |bodyReference |EC_SECOND_BODY_REFERENCE |
    Then I execute "Create Digital Content" API step with parameters saving as "SECOND_"
      |bodyReference|EC_SECOND_BODY_REFERENCE|
      |sittingReferences|EC_SECOND_SITTING_REFERENCE|
      |nameSuffix       |NewSuffix[#####]         |
      |courseTypeReferences|EC_SECOND_COURSE_TYPE_REFERENCE|
      |externalReference   |                               |

  #TODO: Complete test after Bug fixing BPP-17447
  @DigitalContent @Update #TC-3210
  Scenario: Edit Digital Content Additional Scenario
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
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    #Second
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_SECOND_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_SECOND_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_SECOND_COST_CENTRE_"
      |dimensionType|COSTCENTRE   |
      |target       |COURSETYPE|
    And I execute "Create Exam Preparation" API step saving as "SECOND_"
    And I execute "Create Study Mode" API step saving as "SECOND_"
    And I execute "Create Vertical" API step saving as "SECOND_"
    And I execute "Create Body" API step with parameters saving as "SECOND_"
      |financialDimensionReference|EC_BODY_SECOND_FINANCIAL_DIMENSION_REFERENCE|
      |verticalReference          |EC_SECOND_VERTICAL_REFERENCE|
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    Then I execute "Create Sitting" API step with parameters saving as "SECOND_"
      |bodyReferences|EC_SECOND_BODY_REFERENCE|
    And I execute "Create Course Type" API step with parameters saving as "SECOND_"
      |vatRuleReference|EC_SECOND_VAT_RULE_REFERENCE|
      |costCentreFinancialDimensionReference|EC_COURSE_TYPE_SECOND_COST_CENTRE_FINANCIAL_DIMENSION_REFERENCE|
      |projectFinancialDimensionReference|EC_COURSE_TYPE_SECOND_PROJECT_FINANCIAL_DIMENSION_REFERENCE|
      |examPreparationReference|EC_SECOND_EXAM_PREPARATION_REFERENCE|
      |studyModeReference|EC_SECOND_STUDY_MODE_REFERENCE|
    Then I execute "Create Digital Content" API step with parameters
      |courseTypeReferences|<EC_COURSE_TYPE_REFERENCE>,<EC_SECOND_COURSE_TYPE_REFERENCE>|
      |sittingReferences|<EC_SITTING_REFERENCE>, <EC_SECOND_SITTING_REFERENCE>|
    And I execute "Digital Contents" API step
#    Then I execute negative "Update Combination Empty Sitting" API step with error name "sdhhdsh" and parameters
#      |reference|EC_DIGITAL_CONTENTS_RESULT_COMBINATIONS_REFERENCE|
#    Then I execute negative "Update Combination Empty Sitting" API step with error name "Digital Content Combination '<EC_DIGITAL_CONTENT_REFERENCE>' does not exist" and parameters
#      |reference|EC_DIGITAL_CONTENTS_RESULT_COMBINATIONS_REFERENCE|
#    Then I execute negative "Update Combination Empty Course Types" API step with error name "Digital Content Combination '<EC_DIGITAL_CONTENT_REFERENCE>' does not exist" and parameters
#      |reference|EC_DIGITAL_CONTENTS_RESULT_COMBINATIONS_REFERENCE|
#    Then I execute negative "Update Combination Empty Sitting Course Types" API step with error name "Digital Content Combination '<EC_DIGITAL_CONTENT_REFERENCE>' does not exist" and parameters
#      |reference|EC_DIGITAL_CONTENTS_RESULT_COMBINATIONS_REFERENCE|
#    Then I execute "Update Combination" API step with parameters
  #      |reference|EC_DIGITAL_CONTENTS_RESULT_COMBINATIONS_REFERENCE|
#      |sittingReferences|<EC_SITTING_REFERENCE>, <EC_SECOND_SITTING_REFERENCE>|
#      |courseTypeReferences|EC_SECOND_COURSE_TYPE_REFERENCE|

  @DigitalContent #TC-1044
  Scenario: Audit Trail - Low Fidelity logging of Digital Content record changes
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
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    Then I execute "Create Digital Content" API step
    And I execute "Digital Contents" API step
    And I verify that "[TIMENOW-OHB-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_DIGITAL_CONTENTS_RESULT_COMBINATIONS_CREATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_DIGITAL_CONTENTS_RESULT_COMBINATIONS_CREATED_BY" element
    And I verify that "EC_DIGITAL_CONTENTS_RESULT_COMBINATIONS_UPDATED_ON" element "equal" to "null" element
    And I verify that "EC_DIGITAL_CONTENTS_RESULT_COMBINATIONS_UPDATED_BY" element "equal" to "null" element
    Then I execute "Update Digital Content Name" API step
    And I execute "Digital Contents" API step saving as "SECOND_"
    And I verify that "~Second[TIMENOW-OHB-yyyy-MM-dd'T'HH:mm]" element "contains" to "EC_DIGITAL_CONTENT_NAME_UPDATED_ON" element
    And I verify that "S2IKmTfukVIwVP9iGu9QezxwxCbVBPKp@clients" element "equal" to "EC_DIGITAL_CONTENT_NAME_UPDATED_BY" element