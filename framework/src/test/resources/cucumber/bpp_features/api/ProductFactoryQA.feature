@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @ISBN
  Scenario: Generate new ISBN
    Then I generate new ISBN code saving as "EC_ISBN"

  @ChangeMaterialFinancialDimension #Only once. If Material is created will cause an error: Material have already created, so you cannot change the Course Financial Dimensions
  Scenario: Attach Financial Dimension to Material
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_LEGAL_ENTITY"
      |dimensionType|LEGALENTITY|
      |target       |MATERIAL   |
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_COST_CENTRE"
      |dimensionType|COSTCENTRE|
      |target       |MATERIAL  |
    Then I execute "Change Material Financial Dimension" API step

  @ChangeCourseFinancialDimension #Only once. If Course is created will cause an error: Courses have already created, so you cannot change the Course Financial Dimensions
  Scenario: Attach Financial Dimension to Course
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_LEGAL_ENTITY_"
      |dimensionType|LEGALENTITY|
      |target       |COURSE     |
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSE    |
    Then I execute "Change Course Financial Dimension" API step

  @FinancialDimensionCourseDuplicate #TC-1542
  Scenario: Create Financial Dimension record Course item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_LEGAL_ENTITY_"
      |dimensionType|LEGALENTITY|
      |target       |COURSE     |
    Then I execute negative "Create Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Course'" and parameters
      |code         |EC_COURSE_LEGAL_ENTITY_FINANCIAL_DIMENSION_CODE|
      |dimensionType|LEGALENTITY|
      |target       |COURSE     |

  @FinancialDimensionMaterialDuplicate #TC-1542
  Scenario: Create Financial Dimension record Material item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_LEGAL_ENTITY_"
      |dimensionType|LEGALENTITY|
      |target       |MATERIAL   |
    Then I execute negative "Create Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Material'" and parameters
      |code         |EC_MATERIAL_LEGAL_ENTITY_FINANCIAL_DIMENSION_CODE|
      |dimensionType|LEGALENTITY|
      |target       |MATERIAL   |

  @FinancialDimensionCourseTypeDuplicate #TC-1542
  Scenario: Create Financial Dimension record Course Type item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    Then I execute negative "Create Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'CourseType'" and parameters
      |code         |EC_COURSE_TYPE_PROJECT_FINANCIAL_DIMENSION_CODE|
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|

  @FinancialDimensionMaterialTypeDuplicate #TC-1542
  Scenario: Create Financial Dimension record Material Type item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    Then I execute negative "Create Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'MaterialType'" and parameters
      |code         |EC_MATERIAL_TYPE_FINANCIAL_DIMENSION_CODE|
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|

  @FinancialDimensionBodyDuplicate #TC-1542
  Scenario: Create Financial Dimension record Body item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    Then I execute negative "Create Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Body'" and parameters
      |code         |EC_BODY_FINANCIAL_DIMENSION_CODE|
      |dimensionType|PRODUCT|
      |target       |BODY   |

  @FinancialDimensionLocationDuplicate #TC-1542
  Scenario: Create Financial Dimension record Location item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    Then I execute negative "Create Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Location'" and parameters
      |code         |EC_LOCATION_FINANCIAL_DIMENSION_CODE|
      |dimensionType|PRODUCT |
      |target       |LOCATION|

  @FinancialDimensionREGIONDuplicate #TC-1542
  Scenario: Create Financial Dimension record Region item with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT |
      |target       |REGION|
    Then I execute negative "Create Financial Dimension" API step with error name "A Financial Dimension with the same code already targets 'Region'" and parameters
      |code         |EC_REGION_FINANCIAL_DIMENSION_CODE|
      |dimensionType|PRODUCT |
      |target       |REGION|

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Course Type item
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Material Type item
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Location item
    Given I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Body item
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Region item
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |

  @VatRule #TC-1340
  Scenario: Add a New VAT Rule Using a Modal
    Given I execute "Create Vat Rule" API step

  @VatRule @Update #TC-1348
  Scenario: Amend a VAT Rule Using a Modal
    Given I execute "Create Vat Rule" API step
    Then I execute "Update Vat Rule" API step

  @ExamPreparation #TC-4692
  Scenario: Add a New Exam Preparation Using a Modal
    Given I execute "Create Exam Preparation" API step

  @ExamPreparation @Update #TC-4693
  Scenario: Amend a Exam Preparation Using a Modal
    Given I execute "Create Exam Preparation" API step
    Then I execute "Update Exam Preparation" API step

  @ExamPreparation @Duplicate #TC-
  Scenario: Add a Exam Preparation Where Name Already Exists
    Given I execute "Create Exam Preparation" API step
    Then I execute negative "Create Exam Preparation" API step with error name "Name must be unique" and parameters
      |name|EC_EXAM_PREPARATION_NAME|

  @ExamPreparation @Duplicate #TC-
  Scenario: Amend a Exam Preparation Where Name Already Exists
    Given I execute "Create Exam Preparation" API step
    And I execute "Create Exam Preparation" API step saving as "TWO_"
    Then I execute negative "Update Exam Preparation" API step with error name "Name must be unique" and parameters
      |name|EC_TWO_EXAM_PREPARATION_NAME|

  @ExamPreparation @Incomplete #TC-
  Scenario: Submitting Incomplete Exam Preparation Fields
    Given I execute negative "Create Exam Preparation" API step with error name "The Name field is required." and parameters
      |name       ||
    Given I execute negative "Create Exam Preparation" API step with error name "The Description field is required." and parameters
      |description||

  @StudyMode #TC-4793
  Scenario: Add a New Study Mode Using a Modal
    Given I execute "Create Study Mode" API step

  @CourseType #TC-701
  Scenario: Add a New Course Type Using a Modal
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step

  @CourseType @Incomplete #TC-700
  Scenario: Submitting Incomplete Course Type Fields
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute negative "Create Course Type" API step with error name "The Description field is required." and parameters
      |description                          ||
    Then I execute negative "Create Course Type" API step with error name "Variable `$command` got invalid value." and parameters
      |vatRuleReference                     ||
    Then I execute negative "Create Course Type" API step with error name "Variable `$command` got invalid value." and parameters
      |costCentreFinancialDimensionReference||
    Then I execute negative "Create Course Type" API step with error name "Variable `$command` got invalid value." and parameters
      |projectFinancialDimensionReference   ||

  @CourseType @Update #TC-1546
  Scenario: Amend a Course Type Using a Modal
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    Then I execute "Create Course Type" API step
    And I execute "Update Course Type" API step

  @CourseType @Duplicate @Update #TC-1546
  Scenario: Amend a Course Type Where Short Name Already Exists
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Course Type" API step with parameters
      |description|ApiCourseTypeDescriptionTwo[####]|
    Then I execute negative "Update Course Type" API step with error name "qw" and parameters
      |description|EC_API_COURSE_TYPE_DESCRIPTION_TWO|

  @Vertical #TC-4811
  Scenario: Add a New Vertical Using a Modal
    Given I execute "Create Vertical" API step

  @Vertical @Update #TC-4812
  Scenario: Amend a Vertical Using a Modal
    Given I execute "Create Vertical" API step
    Then I execute "Update Vertical" API step

  @Vertical @Update @Duplicate #TC-
  Scenario: Amend a Vertical Where Name Already Exists
    Given I execute "Create Vertical" API step
    Then I execute "Create Vertical" API step saving as "TWO_"
    And I execute negative "Update Vertical" API step with error name "Name must be unique" and parameters
    |name|EC_TWO_VERTICAL_NAME|

  @Vertical @Duplicate #TC-
  Scenario: Add a Vertical Where Name Already Exists
    Given I execute "Create Vertical" API step
    And I execute negative "Create Vertical" API step with error name "Name must be unique" and parameters
      |name|EC_VERTICAL_NAME|

  @Vertical @Incomplete #TC-
  Scenario: Submitting Incomplete Vertical Fields
    Given I execute "Create Vertical" API step
    Given I execute negative "Create Vertical" API step with error name "The Name field is required." and parameters
      |name||

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

  @Paper #TC-772
  Scenario: Add a New Paper Using a Modal
    Given I execute "Create Paper" API step
    Then I execute "Create Paper" API step with parameters saving as "CBA_"
      |isCba|true|

  @Paper @Update #TC-828
  Scenario: Amend a Paper Using a Modal
    Given I execute "Create Paper" API step
    Then I execute "Update Paper" API step

  @Paper @Update @Duplicate @Negative #TC-831
  Scenario: Amend a Paper Where Name Already Exists
    Given I execute "Create Paper" API step
    And I execute "Create Paper" API step with parameters saving as "SECOND_"
      |shortName  |ApiPSNT[###]  |
      |name       |ApiPaperNameTwo[####]        |
      |description|ApiPaperDescriptionTwo[#####]|
    And I execute negative "Update Paper" API step with error name "Short Name must be unique" and parameters
      |shortName|EC_API_PSNT|

  @Paper @Incomplete #TC-771
  Scenario: Submitting Incomplete Paper Fields
    Then I execute negative "Create Paper" API step with error name "Variable `$command` got invalid value." and parameters
      |shortName    |    |
    And I execute negative "Create Paper" API step with error name "Variable `$command` got invalid value." and parameters
      |name         |    |
    And I execute negative "Create Paper" API step with error name "Variable `$command` got invalid value." and parameters
      |examSchedule |    |
    And I execute negative "Create Paper" API step with error name "Variable `$command` got invalid value." and parameters
      |timeInHours  |    |
      |isCba        |true|

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

  @LinkBodyToLevel #TC-703
  Scenario: Link Body to Level
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Level" API step
    Then I execute "Link Body To Levels" API step

  @ChangePaperBody #TC-697
  Scenario: Link Body to Paper
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
    And I execute "Create Paper" API step
    Then I execute "Link Paper To Levels" API step

  @Region #TC-1875
  Scenario: Create new Region
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    Then I execute "Create Region" API step

  @Region @Duplicate #TC-1885
  Scenario: Create new Region with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    Then I execute "Create Region" API step
    Then I execute negative "Create Region" API step with error name "Name must be unique" and parameters
      |name|EC_REGION_NAME|

  @Region @Negative @Update #TC-1893
  Scenario: Edit Region that is in Use
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_TWO_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT |
      |target       |LOCATION|
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute negative "Update Region" API step with error name "The Region is already linked" and parameters
      |financialDimensionReference|EC_REGION_TWO_FINANCIAL_DIMENSION_REFERENCE|

  @Region @Negative @Update @Duplicate #TC-1902
  Scenario: Edit and save Region with Duplicate Data
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Region" API step
    And I execute "Create Region" API step saving as "TWO_"
    And I execute negative "Update Region" API step with error name "Name must be unique" and parameters
      |name|EC_TWO_REGION_NAME|

  @Region @Negative @Update #TC-1901
  Scenario: Change Financial Dimension for created Region
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    Given I execute "Create Financial Dimension" API step with parameters saving as "REGION_NEW_"
      |dimensionType|PRODUCT|
      |target       |REGION |
    And I execute "Create Region" API step
    And I execute "Update Region" API step with parameters
      |financialDimensionReference|EC_REGION_NEW_FINANCIAL_DIMENSION_REFERENCE|

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

  @Location @Update #TC-832
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

  @SessionDuration #TC-811
  Scenario: Add a New Session Duration Using a Modal
    Given I execute "Create Session Duration" API step

  @SessionDuration @Update #TC-813
  Scenario: Amend a Session Duration Using a Modal
    Given I execute "Create Session Duration" API step
    And I execute "Update Session Duration" API step

  @SessionDuration @Duplicate #TC-812
  Scenario: Add Session Duration where Description Already Exists
    Given I execute "Create Session Duration" API step
    Then I execute negative "Create Session Duration" API step with error name "Description must be unique" and parameters
      |description|EC_SESSION_DURATION_DESCRIPTION|

  @PricingMatrix #TC-981, TC-1868
  Scenario: Add a New Pricing Matrix Using a Modal
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    When I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    Then I execute "Create Pricing Matrix" API step

  @Prices #TC-1032
  Scenario: Add a New Pricing Matrix Full Cycle
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
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    Then I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step

  @Prices @Positive #TC-1145
  Scenario: Update Pricing Matrix Price
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
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    Then I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Change Price" API step

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


  @UniversityProgrammes #TC-5387
  Scenario: Add a New Programme Using a Modal
    Given I execute "Create Programme" API step

  @UniversityProgrammes @Update #TC-5388
  Scenario: Amend a Programme Using a Modal
    Given I execute "Create Programme" API step
    Then I execute "Update Programme" API step

  @UniversityProgrammes @UpdateDuplicate #TC-5390
  Scenario: Amend Programme With Duplicate Values
    Given I execute "Create Programme" API step
    And I execute "Create Programme" API step saving as "SECOND_"
    Then I execute negative "Update Programme" API step with error name "Code must be unique" and parameters
      |reference|EC_SECOND_PROGRAMME_REFERENCE|
      |code|EC_PROGRAMME_CODE|

  @UniversityProgrammesDuplicate #TC-5389
  Scenario: Create Duplicate of Existing Programme
    Given I execute "Create Programme" API step
    Then I execute negative "Create Programme" API step with error name "Code must be unique" and parameters
      |code|EC_PROGRAMME_CODE|

  @ProgrammeCohorts #TC-5391
  Scenario: Add a New Programme Cohort Using a Modal
    Given I execute "Create Programme" API step
    Then I execute "Create Cohort" API step

  @ProgrammeCohorts @Update #TC-5392
  Scenario: Amend a Programme Cohort Using a Modal
    Given I execute "Create Programme" API step
    And I execute "Create Class Category" API step
    Then I execute "Create Cohort" API step
    And I execute "Update Cohort" API step

  @ProgrammeCohortsDuplicate #TC-5401
  Scenario: Create Duplicate of Existing Programme Cohort
    Given I execute "Create Programme" API step
    And I execute "Create Cohort" API step
    Then I execute negative "Create Cohort" API step with error name "Name must be unique" and parameters
    |name|EC_COHORT_NAME|

  @ModuleSection #TC-5407
  Scenario: Add a New Module Section Using a Modal
    Given I execute "Create Programme" API step
    Then I execute "Create Cohort" API step
    And I execute "Create Module" API step

  @StockSite
  Scenario: Add a New Stock Site Using a Modal
    Given I execute "Create Stock Site" API step

  @ClassCategory
  Scenario: Add a New Class Category Using a Modal
    Given I execute "Create Class Category" API step

  @MaterialType @CoveredWithApi #TC-1435
  Scenario: Add a New Material Type Using a Modal
    Given I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    Then I execute "Create Material Type" API step

  @Clients #TC-919
  Scenario: Add a New Client Using a Modal
    Given I execute "Create Client" API step

  @Clients @Duplicate #TC-919
  Scenario: Add a Client Where Name Already Exists
    Given I execute "Create Client" API step
    Then I execute negative "Create Client" API step with error name "Name must be unique" and parameters
      |name|EC_CLIENT_NAME|

  @Clients @Update @Negative #TC-921
  Scenario: Amend a Client Using a Modal
    Given I execute "Create Client" API step
    Then I execute "Update Client" API step

  @Clients @Incomplete #TC-920
  Scenario: Submitting Incomplete Client Fields
    And I execute negative "Create Client" API step with error name "The Name field is required." and parameters
      |name||

  @Streams #TC-2929
  Scenario: Add a New Stream Using a Modal
    Given I execute "Create Stream" API step

  @Streams @Update #TC-2931
  Scenario: Amend a Stream Using a Modal
    Given I execute "Create Stream" API step
    Then I execute "Update Stream" API step

  @Streams @Duplicate #TC-
  Scenario: Add a Stream Where Name Already Exists
    Given I execute "Create Stream" API step
    Then I execute negative "Create Stream" API step with error name "Name must be unique" and parameters
    |name|EC_STREAM_NAME|

  @Streams @Duplicate #TC-2932
  Scenario: Amend a Stream With Name That Already Exists
    Given I execute "Create Stream" API step
    And I execute "Create Stream" API step saving as "TWO_"
    Then I execute negative "Update Stream" API step with error name "Name must be unique" and parameters
      |name|EC_TWO_STREAM_NAME|

  @DeactivationReason #TC-975
  Scenario: Add a New Deactivation Reason Using a Modal
    Given I execute "Create Deactivation Reason" API step

  @DeactivationReason @Update #TC-978
  Scenario: Amend a Deactivation Reason Using a Modal
    Given I execute "Create Deactivation Reason" API step
    Then I execute "Update Deactivation Reason" API step

  @Course
  Scenario: Create Course
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
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Course" API step

  @Instance #TC-696
  Scenario: Create Course Instance
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
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Instance" API step

  @InstanceCapacity
  Scenario: Change Instance Capacity
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
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I debug
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Change Instance Capacity" API step with parameters
      |capacity|15|

  @InstanceSessions
  Scenario: Get Instance Sessions
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

  @SessionTimings
  Scenario: Change Session Timings
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

  @InstanceSteps
  Scenario: Get Instance Steps
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

  @ChangeInstanceSteps  
  Scenario: Change Instance Steps
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

  @CalculatePrice
  Scenario: Calculate Course Price
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
    And I execute "Calculate Course Price" API step

  @ActivateCourse
  Scenario: Activate Course
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
    And I execute "Calculate Course Price" API step
    Then I execute "Activate Course" API step

  @ActivateInstance
  Scenario: Activate Instance
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
    And I execute "Create Session Duration" API step
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Change Instance Capacity" API step with parameters
      |capacity|15|
    And I execute "Get Instance Sessions" API step
    And I execute "Change Session Timings" API step
    And I execute "Get Instance Steps" API step
    And I execute "Change Step Due Date" API step
    And I execute "Calculate Course Price" API step
    Then I execute "Activate Course" API step
    And I execute "Activate Instance" API step

  @CourseBulkOperation
  Scenario: Create Course Bulk Operation
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
    And I execute "Create Session Duration" API step
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Change Instance Capacity" API step with parameters
      |capacity|15|
    And I execute "Get Instance Sessions" API step
    And I execute "Change Session Timings" API step
    And I execute "Get Instance Steps" API step
    And I execute "Change Step Due Date" API step
    And I execute "Calculate Course Price" API step
    Then I execute "Activate Course" API step
    And I execute "Activate Instance" API step
    Then I execute "Create Course Bulk Operation" API step

  @BulkWebPublishing #TC-685
  Scenario: Execute Bulk Web Publishing
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
    And I execute "Change Instance Capacity" API step with parameters
      |capacity|15|
    And I execute "Get Instance Sessions" API step
    And I execute "Change Session Timings" API step
    And I execute "Get Instance Steps" API step
    And I execute "Change Step Due Date" API step
    And I execute "Calculate Course Price" API step
    Then I execute "Activate Course" API step
    And I execute "Activate Instance" API step
    And I debug
    Then I execute "Create Course Bulk Operation" API step
    Then I execute "Bulk Web Publish" API step

  @CBA #TC-3000
  Scenario: Create New CBA Record
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
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Paper" API step with parameters
      |isCba|true|
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Session Duration" API step with parameters
      |allowedForCba|true|
    And I execute "Create Instance Group" API step
    And I execute "Create Courses" API step

  @Material #TC-918
  Scenario: Create Material Wizard
    Given I generate new ISBN code saving as "EC_ISBN"
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Stock Site" API step
    And I execute "Create Material Type" API step
    And I execute "Create Material" API step

  @Material @Update #TC-1432
  Scenario: Amend Material Using Modal
    Given I generate new ISBN code saving as "EC_ISBN"
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Stock Site" API step
    And I execute "Create Material Type" API step
    And I execute "Create Material" API step
    And I execute "Change Material Publisher" API step
    And I execute "Change Material Basic Properties" API step
    And I execute "Change Material Body Paper Level Sitting" API step
    And I execute "Delete Material Stock Site" API step
    And I execute "Create Material Stock Site" API step
    And I execute "Update Material Stock Site" API step

  @CourseMaterial
  Scenario: Create Course Material
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

  @UpdateCourseMaterial
  Scenario: Update Course Material
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
    And I execute "Update Course Material" API step

  @LinkClientsToCourse
  Scenario: Link Clients to Course
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
    And I execute "Create Client" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Digital Content" API step
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
    And I execute "Create Course Materials" API step
    And I execute "Update Course Material" API step
    Then I execute "Link Course To Clients" API step

  @LocationWithoutRegion #TC-1869
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

  @LocationInUse #TC-1871
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
    Then I execute negative "Update Location" API step with error name "The Location is already linked to one or more Sessions, so you cannot change the Financial Dimension" and parameters
      |financialDimensionReference|EC_SECOND_LOCATION_FINANCIAL_DIMENSION_REFERENCE|
