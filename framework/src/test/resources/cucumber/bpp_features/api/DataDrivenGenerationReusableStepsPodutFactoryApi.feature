@Reusable @Api
Feature: Product Factory Api
  As a product setter
  I want to be able to log into Product Factory
  In order to (just cause)

  @CreateDataDrivenApi
  Scenario Outline: Create Reference Data Set <type> Using API
    Given I generate new ISBN code saving as "EC_ISBN"
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_"
      |code|$Auto[CourseTypeFDCode]<varName>|
      |description|$Auto[CourseTypeFDDescription]<varName>|
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |code|$Auto[BodyFDCode]<varName>|
      |description|$Auto[BodyFDDescription]<varName>|
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |code       |$Auto[RegionFDCode]<varName>       |
      |description|$Auto[RegionFDDescription]<varName>|
      |dimensionType|PRODUCT   |
      |target       |REGION|
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |code       |$Auto[LocationFDCode]<varName>       |
      |description|$Auto[LocationFDDescription]<varName>|
      |dimensionType|PRODUCT   |
      |target       |LOCATION|
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |code       |$Auto[MaterialTypeFDCode]<varName>       |
      |description|$Auto[MaterialTypeFDDescription]<varName>|
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    And I execute "Create Class Category" API step with parameters
      |name|$Auto[ClassCategoryName]<varName>|
    And I execute "Create Programme" API step with parameters
      |name|$Auto[ProgrammeName]<varName>|
      |code|$Auto[ProgrammeCode]<varName>|
    And I debug
    And I execute "Create Cohort" API step with parameters
      |name|$Auto[CohortName]<varName>|
    And I execute "Create Vertical" API step with parameters
      |name|$Auto[VerticalName]<varName>|
    And I execute "Create Body" API step with parameters
      |name       |$Auto[BodyName]<varName>       |
      |shortName  |$Auto[BodyShortName]<varName>  |
      |description|$Auto[BodyDescription]<varName>|
    And I execute "Create Sitting" API step with parameters
      |name       |$Auto[SittingName]<varName>       |
      |startDate  |2022-02-22                        |
      |endDate    |2025-10-10                        |
    And I execute "Create Vat Rule" API step with parameters
      |code       |$Auto[VatRuleCode]<varName>       |
      |description|$Auto[VatRuleDescription]<varName>|
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Exam Preparation" API step with parameters
      |name       |$Auto[ExamPreparationName]<varName>       |
      |description|$Auto[ExamPreparationDescription]<varName>|
    And I execute "Create Study Mode" API step with parameters
      |name       |$Auto[StudyModeName]<varName>       |
      |description|$Auto[StudyModeDescription]<varName>|
    And I execute "Create Course Type" API step with parameters
      |description|$Auto[CourseTypeDescription]<varName>|
      |costCentreFinancialDimensionReference|EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
      |projectFinancialDimensionReference   |EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
    And I execute "Create Client" API step with parameters
      |name       |$Auto[ClientName]<varName>       |
    And I execute "Create Paper" API step with parameters
      |name       |$Auto[PaperName]<varName>       |
      |shortName  |$At[PprSN]<shortVar>            |
      |description|$Auto[PaperDescription]<varName>|
    And I execute "Create Level" API step with parameters
      |name       |$Auto[LevelName]<varName>       |
      |shortName  |$Auto[LevelShortName]<varName>  |
      |description|$Auto[LevelDescription]<varName>|
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Digital Content" API step with parameters
      |name       |$Auto[DigitalContentName]<varName>       |
    And I execute "Create Region" API step with parameters
      |name       |$Auto[RegionName]<varName>       |
    And I execute "Create Location" API step with parameters
      |name       |$Auto[LocationName]<varName>       |
    And I execute "Create Stock Site" API step with parameters
      |name       |$Auto[StockSiteName]<varName>|
    And I execute "Create Material Type" API step with parameters
      |name  |$Auto[MaterialTypeName]<varName>  |
      |description|$Auto[MaterialTypeDescription]<varName>|
      |financialDimensionReference   |EC_MATERIAL_TYPE_FINANCIAL_DIMENSION_REFERENCE|
    And I execute "Create Session Duration" API step with parameters
      |description|$Auto[SessionDurationDescription]<varName>|
    And I execute "Create Session Duration" API step with parameters saving as "TWO_DATES_"
      |description|$Auto[TwoDatesSessionDurationDescription]<varName>|
      |dateCout   |2                                                 |
    And I execute "Create Material" API step with parameters
      |cost      |~Cost[1000]              |
      |price     |~Price[1000]             |
      |expiryDate|[TIMENOW(TMR)-yyyy-MM-dd]|
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Create Course" API step
    And I execute "Create Stream" API step with parameters
      |name       |$Auto[StreamName]<varName>       |
    And I execute "Create Deactivation Reason" API step with parameters
      |description|$Auto[DeactivationReasonDescription]<varName>|
    And I execute "Create Deactivation Reason" API step with parameters saving as "PREVENT_"
      |description|$Auto[PreventDeactivationReasonDescription]<varName>|
      |preventReactivation|true|
    And I execute "Create Instance" API step
    And I execute "Change Instance Capacity" API step with parameters
      |capacity|1|
    And I execute "Get Instance Sessions" API step
    And I execute "Change Session Timings" API step
    And I execute "Get Instance Steps" API step
    And I execute "Change Step Due Date" API step
    And I execute "Calculate Course Price" API step
    Then I execute "Activate Course" API step
    And I execute "Activate Instance" API step

    And I execute "Create Paper" API step with parameters saving as "CBA_"
      |name       |$Auto[CBAPaperName]<varName>       |
      |shortName  |$A[CBAPsn]<shortVar>               |
      |description|$Auto[CBAPaperDescription]<varName>|
      |isCba|true|
    And I execute "Change Paper Body" API step with parameters
      |paperReference|EC_CBA_PAPER_REFERENCE|
    And I execute "Link Paper To Levels" API step with parameters
      |paperReference|EC_CBA_PAPER_REFERENCE|
    And I execute "Create Session Duration" API step with parameters saving as "CBA_"
      |description|$Auto[CBASessionDurationDescription]<varName>|
      |allowedForCba|true|
    And I execute "Create Course Type" API step with parameters saving as "CBA_"
      |isCba|true|
      |description|$Auto[CBACourseTypeDescription]<varName>|
      |costCentreFinancialDimensionReference|EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
      |projectFinancialDimensionReference   |EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
    And I debug
    And I execute "Create Prices" API step with parameters saving as "CBA_"
      |courseTypeReference|EC_CBA_COURSE_TYPE_REFERENCE|
      |paperReferences    |EC_CBA_PAPER_REFERENCE      |
    And I execute "Create Instance Group" API step with parameters
      |sessionDurationReference|EC_CBA_SESSION_DURATION_REFERENCE|
    And I execute "Create Courses" API step with parameters
      |instanceGroupReference|EC_INSTANCE_GROUP_REFERENCE |
      |paperReference        |EC_CBA_PAPER_REFERENCE      |
      |courseTypeReference   |EC_CBA_COURSE_TYPE_REFERENCE|

    Examples:
      |type        |varName     |ecName       |shortVar|shortEc|
      |            |            |             |        |       |
      |Two         |$Two        |             |$Two    |       |
      |Three       |$Three      |             |$Tre    |       |
      |Edit        |$Edit       |             |$Edt    |       |
      |Draft CBA   |$DraftCBA   |             |$DCB    |       |
      |Draft Course|$DraftCourse|             |$DCO    |       |
      |Dont Touch  |$DontTouch  |             |$DT     |       |
#      |A           |$A          |             |$A      |       |
#      |B           |$B          |             |$B      |       |
#      |C           |$C          |             |$C      |       |
#      |D           |$D          |             |$D      |       |
#      |E           |$E          |             |$E      |       |
#      |F           |$F          |             |$F      |       |
#      |G           |$G          |             |$G      |       |
#      |H           |$H          |             |$H      |       |
#      |I           |$I          |             |$I      |       |
#      |J           |$J          |             |$J      |       |
#      |K           |$K          |             |$K      |       |
#      |L           |$L          |             |$L      |       |
#      |M           |$M          |             |$M      |       |
#      |N           |$N          |             |$N      |       |
#      |O           |$O          |             |$O      |       |
#      |P           |$P          |             |$P      |       |
#      |Q           |$Q          |             |$Q      |       |
#      |R           |$R          |             |$R      |       |
#      |S           |$S          |             |$S      |       |
#      |T           |$T          |             |$T      |       |
#      |U           |$U          |             |$U      |       |
#      |V           |$V          |             |$V      |       |
#      |W           |$W          |             |$W      |       |
#      |X           |$X          |             |$X      |       |
#      |Y           |$Y          |             |$Y      |       |
#      |Z           |$Z          |             |$Z      |       |

  @CreateDataDrivenApi
  Scenario: Create Data Set To Check Alphabetic Ordering Using API
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT   |
      |target       |REGION|
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT   |
      |target       |LOCATION|
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Class Category" API step
    And I execute "Create Programme" API step
    And I execute "Create Cohort" API step
    And I execute "Create Vertical" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step


    Then I execute "Create Body" API step with parameters saving as "B_"
      |name       |$Ordering[BodyName]      |
      |shortName  |$BOrdering[BodyShortName]|
      |description|$BAuto[BodyDescription]  |
    Then I execute "Create Body" API step with parameters saving as "C_"
      |name       |$Ordering[BodyName]      |
      |shortName  |$COrdering[BodyShortName]|
      |description|$CAuto[BodyDescription]  |
    Then I execute "Create Body" API step with parameters saving as "D_"
      |name       |$Ordering[BodyName]      |
      |shortName  |$DOrdering[BodyShortName]|
      |description|$DAuto[BodyDescription]  |


    And I execute "Create Sitting" API step with parameters saving as "B_"
      |name|$BOrdering[SittingName]      |
      |bodyReferences|EC_B_BODY_REFERENCE|
    And I execute "Create Sitting" API step with parameters saving as "C_"
      |name|$COrdering[SittingName]      |
      |bodyReferences|EC_B_BODY_REFERENCE|
    And I execute "Create Sitting" API step with parameters saving as "D_"
      |name|$DOrdering[SittingName]      |
      |bodyReferences|EC_B_BODY_REFERENCE|


    And I execute "Create Course Type" API step with parameters saving as "B_"
      |description|$BOrdering[CourseTypeDescription]|
      |costCentreFinancialDimensionReference|EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
      |projectFinancialDimensionReference   |EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
    And I execute "Create Course Type" API step with parameters saving as "C_"
      |description|$COrdering[CourseTypeDescription]|
      |costCentreFinancialDimensionReference|EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
      |projectFinancialDimensionReference   |EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
    And I execute "Create Course Type" API step with parameters saving as "D_"
      |description|$DOrdering[CourseTypeDescription]|
      |costCentreFinancialDimensionReference|EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
      |projectFinancialDimensionReference   |EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|


    And I execute "Create Client" API step with parameters saving as "B_"
      |name|$BOrdering[ClientName]|
    And I execute "Create Client" API step with parameters saving as "C_"
      |name|$COrdering[ClientName]|
    And I execute "Create Client" API step with parameters saving as "D_"
      |name|$DOrdering[ClientName]|


    And I execute "Create Paper" API step with parameters saving as "B_"
      |name       |$BOrdering[PaperName]|
      |shortName  |$BO[PprSN]      |
      |description|$BOrdering[PaperDescription]|
    And I execute "Create Paper" API step with parameters saving as "C_"
      |name       |$COrdering[PaperName]|
      |shortName  |$CO[PprSN]      |
      |description|$COrdering[PaperDescription]|
    And I execute "Create Paper" API step with parameters saving as "D_"
      |name       |$DOrdering[PaperName]|
      |shortName  |$DO[PprSN]      |
      |description|$DOrdering[PaperDescription]|


    And I execute "Create Level" API step with parameters saving as "B_"
      |name       |$BOrdering[LevelName]      |
      |shortName  |$BOrdering[LevelShortName] |
      |description|$Ordering[LevelDescription]|
    And I execute "Create Level" API step with parameters saving as "C_"
      |name       |$COrdering[LevelName]      |
      |shortName  |$COrdering[LevelShortName] |
      |description|$Ordering[LevelDescription]|
    And I execute "Create Level" API step with parameters saving as "D_"
      |name       |$DOrdering[LevelName]      |
      |shortName  |$DOrdering[LevelShortName] |
      |description|$Ordering[LevelDescription]|


    And I execute "Link Body To Levels" API step with parameters
      |bodyReference  |EC_B_BODY_REFERENCE |
      |levelReferences|EC_B_LEVEL_REFERENCE|
    And I execute "Link Body To Levels" API step with parameters
      |bodyReference  |EC_C_BODY_REFERENCE |
      |levelReferences|EC_C_LEVEL_REFERENCE|
    And I execute "Link Body To Levels" API step with parameters
      |bodyReference  |EC_D_BODY_REFERENCE |
      |levelReferences|EC_D_LEVEL_REFERENCE|

    And I execute "Change Paper Body" API step with parameters
      |paperReference|EC_B_PAPER_REFERENCE|
      |bodyReference |EC_B_BODY_REFERENCE |
    And I execute "Change Paper Body" API step with parameters
      |paperReference|EC_C_PAPER_REFERENCE|
      |bodyReference |EC_C_BODY_REFERENCE |
    And I execute "Change Paper Body" API step with parameters
      |paperReference|EC_D_PAPER_REFERENCE|
      |bodyReference |EC_D_BODY_REFERENCE |


    And I execute "Link Paper To Levels" API step with parameters
      |paperReference  |EC_B_PAPER_REFERENCE|
      |levelReferences |EC_B_LEVEL_REFERENCE|
    And I execute "Link Paper To Levels" API step with parameters
      |paperReference  |EC_C_PAPER_REFERENCE|
      |levelReferences |EC_C_LEVEL_REFERENCE|
    And I execute "Link Paper To Levels" API step with parameters
      |paperReference  |EC_D_PAPER_REFERENCE|
      |levelReferences |EC_D_LEVEL_REFERENCE|


    And I execute "Create Region" API step


    And I execute "Create Location" API step with parameters saving as "B_"
      |name|$BOrdering[LocationName]|
    And I execute "Create Location" API step with parameters saving as "C_"
      |name|$COrdering[LocationName]|
    And I execute "Create Location" API step with parameters saving as "D_"
      |name|$DOrdering[LocationName]|


    And I execute "Create Stock Site" API step


    And I execute "Create Material Type" API step with parameters saving as "B_"
      |name       |$BOrdering[MaterialTypeName]      |
      |description|$Ordering[MaterialTypeDescription]|
    And I execute "Create Material Type" API step with parameters saving as "C_"
      |name       |$COrdering[MaterialTypeName]      |
      |description|$Ordering[MaterialTypeDescription]|
    And I execute "Create Material Type" API step with parameters saving as "D_"
      |name       |$DOrdering[MaterialTypeName]      |
      |description|$Ordering[MaterialTypeDescription]|


    And I execute "Create Session Duration" API step with parameters saving as "B_"
      |description|$BOrdering[SessionDurationDescription]|
      |dateCount  |43           |
    And I execute "Create Session Duration" API step with parameters saving as "C_"
      |description|$COrdering[SessionDurationDescription]|
      |dateCount  |43           |
    And I execute "Create Session Duration" API step with parameters saving as "D_"
      |description|$DOrdering[SessionDurationDescription]|
      |dateCount  |43           |


    And I execute "Create Deactivation Reason" API step with parameters saving as "B_"
      |description|$BOrdering[DeactivationReasonDescription]|
    And I execute "Create Deactivation Reason" API step with parameters saving as "C_"
      |description|$COrdering[DeactivationReasonDescription]|
    And I execute "Create Deactivation Reason" API step with parameters saving as "D_"
      |description|$DOrdering[DeactivationReasonDescription]|


  @CreateDataDrivenApi
  Scenario: Create Data Set To Check Numeric Ordering Using API
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT   |
      |target       |REGION|
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT   |
      |target       |LOCATION|
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Class Category" API step
    And I execute "Create Programme" API step
    And I execute "Create Cohort" API step
    And I execute "Create Vertical" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step


    Then I execute "Create Body" API step with parameters saving as "1_"
      |name       |$Numeric[BodyName]      |
      |shortName  |$1Ordering[BodyShortName]|
      |description|$1Auto[BodyDescription]  |
    Then I execute "Create Body" API step with parameters saving as "2_"
      |name       |$Numeric[BodyName]      |
      |shortName  |$2Ordering[BodyShortName]|
      |description|$2Auto[BodyDescription]  |
    Then I execute "Create Body" API step with parameters saving as "3_"
      |name       |$Numeric[BodyName]      |
      |shortName  |$3Ordering[BodyShortName]|
      |description|$3Auto[BodyDescription]  |


    And I execute "Create Sitting" API step with parameters saving as "1_"
      |name|$1Ordering[SittingName]      |
      |bodyReferences|EC_1_BODY_REFERENCE|
    And I execute "Create Sitting" API step with parameters saving as "2_"
      |name|$2Ordering[SittingName]      |
      |bodyReferences|EC_2_BODY_REFERENCE|
    And I execute "Create Sitting" API step with parameters saving as "3_"
      |name|$3Ordering[SittingName]      |
      |bodyReferences|EC_3_BODY_REFERENCE|


    And I execute "Create Course Type" API step with parameters saving as "1_"
      |description|$1Ordering[CourseTypeDescription]|
      |costCentreFinancialDimensionReference|EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
      |projectFinancialDimensionReference   |EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
    And I execute "Create Course Type" API step with parameters saving as "2_"
      |description|$2Ordering[CourseTypeDescription]|
      |costCentreFinancialDimensionReference|EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
      |projectFinancialDimensionReference   |EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
    And I execute "Create Course Type" API step with parameters saving as "3_"
      |description|$3Ordering[CourseTypeDescription]|
      |costCentreFinancialDimensionReference|EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
      |projectFinancialDimensionReference   |EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|


    And I execute "Create Client" API step with parameters saving as "1_"
      |name|$1Ordering[ClientName]|
    And I execute "Create Client" API step with parameters saving as "2_"
      |name|$2Ordering[ClientName]|
    And I execute "Create Client" API step with parameters saving as "3_"
      |name|$3Ordering[ClientName]|


    And I execute "Create Paper" API step with parameters saving as "1_"
      |name       |$1Ordering[PaperName]|
      |shortName  |$1O[PprSN]      |
      |description|$1Ordering[PaperDescription]|
    And I execute "Create Paper" API step with parameters saving as "2_"
      |name       |$2Ordering[PaperName]|
      |shortName  |$2O[PprSN]      |
      |description|$2Ordering[PaperDescription]|
    And I execute "Create Paper" API step with parameters saving as "3_"
      |name       |$3Ordering[PaperName]|
      |shortName  |$3O[PprSN]      |
      |description|$3Ordering[PaperDescription]|


    And I execute "Create Level" API step with parameters saving as "1_"
      |name       |$1Ordering[LevelName]      |
      |shortName  |$1Ordering[LevelShortName] |
      |description|$Numeric[LevelDescription]|
    And I execute "Create Level" API step with parameters saving as "2_"
      |name       |$2Ordering[LevelName]      |
      |shortName  |$2Ordering[LevelShortName] |
      |description|$Numeric[LevelDescription]|
    And I execute "Create Level" API step with parameters saving as "3_"
      |name       |$3Ordering[LevelName]      |
      |shortName  |$3Ordering[LevelShortName] |
      |description|$Numeric[LevelDescription]|


    And I execute "Link Body To Levels" API step with parameters
      |bodyReference  |EC_1_BODY_REFERENCE |
      |levelReferences|EC_1_LEVEL_REFERENCE|
    And I execute "Link Body To Levels" API step with parameters
      |bodyReference  |EC_2_BODY_REFERENCE |
      |levelReferences|EC_2_LEVEL_REFERENCE|
    And I execute "Link Body To Levels" API step with parameters
      |bodyReference  |EC_3_BODY_REFERENCE |
      |levelReferences|EC_3_LEVEL_REFERENCE|

    And I execute "Change Paper Body" API step with parameters
      |paperReference|EC_1_PAPER_REFERENCE|
      |bodyReference |EC_1_BODY_REFERENCE |
    And I execute "Change Paper Body" API step with parameters
      |paperReference|EC_2_PAPER_REFERENCE|
      |bodyReference |EC_2_BODY_REFERENCE |
    And I execute "Change Paper Body" API step with parameters
      |paperReference|EC_3_PAPER_REFERENCE|
      |bodyReference |EC_3_BODY_REFERENCE |


    And I execute "Link Paper To Levels" API step with parameters
      |paperReference  |EC_1_PAPER_REFERENCE|
      |levelReferences |EC_1_LEVEL_REFERENCE|
    And I execute "Link Paper To Levels" API step with parameters
      |paperReference  |EC_2_PAPER_REFERENCE|
      |levelReferences |EC_2_LEVEL_REFERENCE|
    And I execute "Link Paper To Levels" API step with parameters
      |paperReference  |EC_3_PAPER_REFERENCE|
      |levelReferences |EC_3_LEVEL_REFERENCE|


    And I execute "Create Region" API step


    And I execute "Create Location" API step with parameters saving as "1_"
      |name|$1Ordering[LocationName]|
    And I execute "Create Location" API step with parameters saving as "2_"
      |name|$2Ordering[LocationName]|
    And I execute "Create Location" API step with parameters saving as "3_"
      |name|$3Ordering[LocationName]|


    And I execute "Create Stock Site" API step


    And I execute "Create Material Type" API step with parameters saving as "1_"
      |name       |$1Ordering[MaterialTypeName]      |
      |description|$Numeric[MaterialTypeDescription]|
    And I execute "Create Material Type" API step with parameters saving as "2_"
      |name       |$2Ordering[MaterialTypeName]      |
      |description|$Numeric[MaterialTypeDescription]|
    And I execute "Create Material Type" API step with parameters saving as "3_"
      |name       |$3Ordering[MaterialTypeName]      |
      |description|$Numeric[MaterialTypeDescription]|


    And I execute "Create Session Duration" API step with parameters saving as "1_"
      |description|$1Ordering[SessionDurationDescription]|
      |dateCount  |34           |
    And I execute "Create Session Duration" API step with parameters saving as "2_"
      |description|$2Ordering[SessionDurationDescription]|
      |dateCount  |34           |
    And I execute "Create Session Duration" API step with parameters saving as "3_"
      |description|$3Ordering[SessionDurationDescription]|
      |dateCount  |34           |


    And I execute "Create Deactivation Reason" API step with parameters saving as "1_"
      |description|$1Ordering[DeactivationReasonDescription]|
    And I execute "Create Deactivation Reason" API step with parameters saving as "2_"
      |description|$2Ordering[DeactivationReasonDescription]|
    And I execute "Create Deactivation Reason" API step with parameters saving as "3_"
      |description|$3Ordering[DeactivationReasonDescription]|



  @Debug
  Scenario Outline: Create Data Set To Check Ordering Using API Debug <type>
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT   |
      |target       |REGION|
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT   |
      |target       |LOCATION|
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    Given I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT|
      |target       |BODY   |
    And I execute "Create Vertical" API step
    And I execute "Create Class Category" API step
    And I execute "Create Programme" API step
    And I execute "Create Cohort" API step
    And I execute "Create Vertical" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step


    Then I execute "Create Body" API step with parameters saving as "B_"
      |name       |$Ordering[BodyName]<varName>      |
      |shortName  |$BOrdering[BodyShortName]<varName>|
      |description|$BAuto[BodyDescription]<varName>  |
    Then I execute "Create Body" API step with parameters saving as "C_"
      |name       |$Ordering[BodyName]<varName>      |
      |shortName  |$COrdering[BodyShortName]<varName>|
      |description|$CAuto[BodyDescription]<varName>  |
    Then I execute "Create Body" API step with parameters saving as "D_"
      |name       |$Ordering[BodyName]<varName>      |
      |shortName  |$DOrdering[BodyShortName]<varName>|
      |description|$DAuto[BodyDescription]<varName>  |


    And I execute "Create Sitting" API step with parameters saving as "B_"
      |name|$BOrdering[SittingName]<varName>|
      |bodyReferences|EC_B_BODY_REFERENCE   |
    And I execute "Create Sitting" API step with parameters saving as "C_"
      |name|$COrdering[SittingName]<varName>|
      |bodyReferences|EC_C_BODY_REFERENCE   |
    And I execute "Create Sitting" API step with parameters saving as "D_"
      |name|$DOrdering[SittingName]<varName>|
      |bodyReferences|EC_D_BODY_REFERENCE   |


    And I execute "Create Course Type" API step with parameters saving as "B_"
      |description|$BOrdering[CourseTypeDescription]<varName>|
      |costCentreFinancialDimensionReference|EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
      |projectFinancialDimensionReference   |EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
    And I execute "Create Course Type" API step with parameters saving as "C_"
      |description|$COrdering[CourseTypeDescription]<varName>|
      |costCentreFinancialDimensionReference|EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
      |projectFinancialDimensionReference   |EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
    And I execute "Create Course Type" API step with parameters saving as "D_"
      |description|$DOrdering[CourseTypeDescription]<varName>|
      |costCentreFinancialDimensionReference|EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|
      |projectFinancialDimensionReference   |EC_COURSE_TYPE_FINANCIAL_DIMENSION_REFERENCE|


    And I execute "Create Client" API step with parameters saving as "B_"
      |name|$BOrdering[ClientName]<varName>|
    And I execute "Create Client" API step with parameters saving as "C_"
      |name|$COrdering[ClientName]<varName>|
    And I execute "Create Client" API step with parameters saving as "D_"
      |name|$DOrdering[ClientName]<varName>|


    And I execute "Create Paper" API step with parameters saving as "B_"
      |name       |$BOrdering[PaperName]<varName>|
      |shortName  |$BO[PprSN]<varName>      |
      |description|$BOrdering[PaperDescription]<varName>|
    And I execute "Create Paper" API step with parameters saving as "C_"
      |name       |$COrdering[PaperName]<varName>|
      |shortName  |$CO[PprSN]<varName>      |
      |description|$COrdering[PaperDescription]<varName>|
    And I execute "Create Paper" API step with parameters saving as "D_"
      |name       |$DOrdering[PaperName]<varName>|
      |shortName  |$DO[PprSN]<varName>      |
      |description|$DOrdering[PaperDescription]<varName>|


    And I execute "Create Level" API step with parameters saving as "B_"
      |name       |$BOrdering[LevelName]<varName>      |
      |shortName  |$BOrdering[LevelShortName]<varName> |
      |description|$Ordering[LevelDescription]<varName>|
    And I execute "Create Level" API step with parameters saving as "C_"
      |name       |$COrdering[LevelName]<varName>      |
      |shortName  |$COrdering[LevelShortName]<varName> |
      |description|$Ordering[LevelDescription]<varName>|
    And I execute "Create Level" API step with parameters saving as "D_"
      |name       |$DOrdering[LevelName]<varName>      |
      |shortName  |$DOrdering[LevelShortName]<varName> |
      |description|$Ordering[LevelDescription]<varName>|


    And I execute "Link Body To Levels" API step with parameters
      |bodyReference  |EC_B_BODY_REFERENCE |
      |levelReferences|EC_B_LEVEL_REFERENCE|
    And I execute "Link Body To Levels" API step with parameters
      |bodyReference  |EC_C_BODY_REFERENCE |
      |levelReferences|EC_C_LEVEL_REFERENCE|
    And I execute "Link Body To Levels" API step with parameters
      |bodyReference  |EC_D_BODY_REFERENCE |
      |levelReferences|EC_D_LEVEL_REFERENCE|

    And I execute "Change Paper Body" API step with parameters
      |paperReference|EC_B_PAPER_REFERENCE|
      |bodyReference |EC_B_BODY_REFERENCE |
    And I execute "Change Paper Body" API step with parameters
      |paperReference|EC_C_PAPER_REFERENCE|
      |bodyReference |EC_C_BODY_REFERENCE |
    And I execute "Change Paper Body" API step with parameters
      |paperReference|EC_D_PAPER_REFERENCE|
      |bodyReference |EC_D_BODY_REFERENCE |


    And I execute "Link Paper To Levels" API step with parameters
      |paperReference  |EC_B_PAPER_REFERENCE|
      |levelReferences |EC_B_LEVEL_REFERENCE|
    And I execute "Link Paper To Levels" API step with parameters
      |paperReference  |EC_C_PAPER_REFERENCE|
      |levelReferences |EC_C_LEVEL_REFERENCE|
    And I execute "Link Paper To Levels" API step with parameters
      |paperReference  |EC_D_PAPER_REFERENCE|
      |levelReferences |EC_D_LEVEL_REFERENCE|


#    And I execute "Create Digital Content" API step
    And I execute "Create Region" API step


    And I execute "Create Location" API step with parameters saving as "B_"
      |name|$BOrdering[LocationName]<varName>|
    And I execute "Create Location" API step with parameters saving as "C_"
      |name|$COrdering[LocationName]<varName>|
    And I execute "Create Location" API step with parameters saving as "D_"
      |name|$DOrdering[LocationName]<varName>|


    And I execute "Create Stock Site" API step


    And I execute "Create Material Type" API step with parameters saving as "B_"
      |name       |$BOrdering[MaterialTypeName]<varName>      |
      |description|$Ordering[MaterialTypeDescription]<varName>|
    And I execute "Create Material Type" API step with parameters saving as "C_"
      |name       |$COrdering[MaterialTypeName]<varName>      |
      |description|$Ordering[MaterialTypeDescription]<varName>|
    And I execute "Create Material Type" API step with parameters saving as "D_"
      |name       |$DOrdering[MaterialTypeName]<varName>      |
      |description|$Ordering[MaterialTypeDescription]<varName>|


    And I execute "Create Session Duration" API step with parameters saving as "B_"
      |description|$BOrdering[SessionDurationDescription]<varName>|
      |dateCount  |43           |
    And I execute "Create Session Duration" API step with parameters saving as "C_"
      |description|$COrdering[SessionDurationDescription]<varName>|
      |dateCount  |43           |
    And I execute "Create Session Duration" API step with parameters saving as "D_"
      |description|$DOrdering[SessionDurationDescription]<varName>|
      |dateCount  |43           |


    And I execute "Create Deactivation Reason" API step with parameters saving as "B_"
      |description|$BOrdering[DeactivationReasonDescription]<varName>|
    And I execute "Create Deactivation Reason" API step with parameters saving as "C_"
      |description|$COrdering[DeactivationReasonDescription]<varName>|
    And I execute "Create Deactivation Reason" API step with parameters saving as "D_"
      |description|$DOrdering[DeactivationReasonDescription]<varName>|


    Examples:
      |type|varName|
#      |A   |$A     |
#      |B   |$B     |
#      |C   |$C     |
#      |D   |$D     |
#      |E   |$E     |
      |F   |$F     |
#      |G   |$G     |
#      |H   |$H     |
#      |I   |$I     |
#      |J   |$J     |
#      |K   |$K     |
#      |L   |$L     |
#      |M   |$M     |
#      |N   |$N     |
#      |O   |$O     |
#      |P   |$P     |
#      |Q   |$Q     |
#      |R   |$R     |
#      |S   |$S     |
#      |T   |$T     |
#      |U   |$U     |
#      |V   |$V     |
#      |W   |$W     |
#      |X   |$X     |
#      |Y   |$Y     |
#      |Z   |$Z     |