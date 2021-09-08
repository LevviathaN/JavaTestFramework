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
    And I execute "Create Vertical" API step with parameters
      |name|$Auto[VerticalName]<varName>|
    And I execute "Create Body" API step with parameters
      |name       |$Auto[BodyName]<varName>       |
      |shortName  |$Auto[BodyShortName]<varName>  |
      |description|$Auto[BodyDescription]<varName>|
    And I execute "Create Sitting" API step with parameters
      |name       |$Auto[SittingName]<varName>       |
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
    And I execute "Create Material" API step
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Create Course" API step
    And I execute "Create Stream" API step with parameters
      |name       |$Auto[streamName]<varName>       |
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
      |description|$Auto[CbaCourseTypeDescription]<varName>|
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