@Reusable
Feature: Product Factory
  As a product setter
  I want to be able to log into Product Factory
  In order to (just cause)

  Scenario Outline: Remember Variables <type>
    And I remember "AutoDeactivationReasonDescription<varName>" text as "EC_DEACTIVATION_REASON_DESCRIPTION<ecName>" variable
    And I remember "AutoDeactivationReasonDescriptionPrevent<varName>" text as "EC_DEACTIVATION_REASON_DESCRIPTION_PREVENT<ecName>" variable
    And I remember "22/02/2022" text as "EC_SITTING_START_DATE" variable
    And I remember "10/10/2025" text as "EC_SITTING_END_DATE" variable
    And I remember "AutoStudyModeName<varName>" text as "EC_STUDY_MODE_NAME<ecName>" variable
    And I remember "AutoStudyModeDescription<varName>" text as "EC_STUDY_MODE_DESCRIPTION<ecName>" variable
    And I remember "AutoProgrammeName<varName>" text as "EC_PROGRAMME_NAME<ecName>" variable
    And I remember "AutoProgrammeCode<varName>" text as "EC_PROGRAMME_CODE<ecName>" variable
    And I remember "AutoCohortName<varName>" text as "EC_COHORT_NAME<ecName>" variable
    And I remember "AutoModuleSectionName<varName>" text as "EC_MODULE_SECTION_NAME<ecName>" variable
    And I remember "1233456" text as "EC_SIS_TERM_CODE<ecName>" variable
    And I remember "AutoStreamName<varName>" text as "EC_STREAM_NAME<ecName>" variable
    And I remember "AutoBodyFDCode<varName>" text as "EC_BODY_FD_CODE<ecName>" variable
    And I remember "AutoBodyFDDescription<varName>" text as "EC_BODY_FD_DESCRIPTION<ecName>" variable
    And I remember "AutoMaterialFDCode<varName>" text as "EC_MATERIAL_FD_CODE<ecName>" variable
    And I remember "AutoMaterialFDDescription<varName>" text as "EC_MATERIAL_FD_DESCRIPTION<ecName>" variable
    And I remember "AutoCourseFDCode<varName>" text as "EC_COURSE_FD_CODE<ecName>" variable
    And I remember "AutoCourseFDDescription<varName>" text as "EC_COURSE_FD_DESCRIPTION<ecName>" variable
    And I remember "AutoMaterialFDCode<varName>" text as "EC_MATERIAL_FD_CODE<ecName>" variable
    And I remember "AutoMaterialFDDescription<varName>" text as "EC_MATERIAL_FD_DESCRIPTION<ecName>" variable
    And I remember "AutoCourseFDCode<varName>" text as "EC_COURSE_FD_CODE<ecName>" variable
    And I remember "AutoCourseFDDescription<varName>" text as "EC_COURSE_FD_DESCRIPTION<ecName>" variable
    And I remember "AutoVerticalName<varName>" text as "EC_VERTICAL_NAME<ecName>" variable
    And I remember "AutoBodyShortName<varName>" text as "EC_BODY_SHORT_NAME<ecName>" variable
    And I remember "AutoBodyName<varName>" text as "EC_BODY_NAME<ecName>" variable
    And I remember "AutoVatRuleCode<varName>" text as "EC_VAT_RULE_CODE<ecName>" variable
    And I remember "AutoVatRuleDescription<varName>" text as "EC_VAT_RULE_DESCRIPTION<ecName>" variable
    And I remember "AutoCourseTypeFDCode<varName>" text as "EC_COURSE_TYPE_FD_CODE<ecName>" variable
    And I remember "AutoCourseTypeFDDescription<varName>" text as "EC_COURSE_TYPE_FD_DESCRIPTION<ecName>" variable
    And I remember "AutoCourseTypeDescription<varName>" text as "EC_COURSE_TYPE_DESCRIPTION<ecName>" variable
    And I remember "AutoLocationFDCode<varName>" text as "EC_LOCATION_FD_CODE<ecName>" variable
    And I remember "AutoLocationFDDescription<varName>" text as "EC_LOCATION_FD_DESCRIPTION<ecName>" variable
    And I remember "AutoRegionFDCode<varName>" text as "EC_REGION_FD_CODE<ecName>" variable
    And I remember "AutoRegionFDDescription<varName>" text as "EC_REGION_FD_DESCRIPTION<ecName>" variable
    And I remember "AutoRegionName<varName>" text as "EC_REGION_NAME<ecName>" variable
    And I remember "AutoLocationName<varName>" text as "EC_LOCATION_NAME<ecName>" variable
    And I remember "AutoLocationAddress<varName>" text as "EC_LOCATION_ADDRESS<ecName>" variable
    And I remember "AutoStockSiteName<varName>" text as "EC_STOCK_SITE_NAME<ecName>" variable
    And I remember "AutoLevelName<varName>" text as "EC_LEVEL_NAME<ecName>" variable
    And I remember "AutoLevelShortName<varName>" text as "EC_LEVEL_SHORT_NAME<ecName>" variable
    And I remember "AtPprSN<shortVar>" text as "EC_PPR_SN<shortEc>" variable
    And I remember "AutoPaperName<varName>" text as "EC_PAPER_NAME<ecName>" variable
    And I remember "AutoPaperDescription<varName>" text as "EC_PAPER_DESCRIPTION<ecName>" variable
    And I remember "ACBAPsn<shortVar>" text as "EC_CBA_PPR_SN<shortEc>" variable
    And I remember "AutoCBAPaperName<varName>" text as "EC_CBA_PAPER_NAME<ecName>" variable
    And I remember "AutoCBAPaperDescription<varName>" text as "EC_CBA_PAPER_DESCRIPTION<ecName>" variable
    And I remember "AutoSittingName<varName>" text as "EC_SITTING_NAME<ecName>" variable
    And I remember "AutoMaterialTypeFDCode<varName>" text as "EC_MATERIAL_TYPE_FD_CODE<ecName>" variable
    And I remember "AutoMaterialTypeFDDescription<varName>" text as "EC_MATERIAL_TYPE_FD_DESCRIPTION<ecName>" variable
    And I remember "AutoMaterialTypeName<varName>" text as "EC_MATERIAL_TYPE_NAME<ecName>" variable
    And I remember "AutoMaterialTypeDescription<varName>" text as "EC_MATERIAL_TYPE_DESCRIPTION<ecName>" variable
    And I remember "AutoSessionDurationDescription<varName>" text as "EC_SESSION_DURATION_DESCRIPTION<ecName>" variable
    And I remember "AutoCBASessionDurationDescription<varName>" text as "EC_CBA_SESSION_DURATION_DESCRIPTION<ecName>" variable
    And I remember "AutoSessionDurationDescriptionTwoDates<varName>" text as "EC_SESSION_DURATION_DESCRIPTION_TWO_DATES<ecName>" variable
    And I remember "AutoClientName<varName>" text as "EC_CLIENT_NAME<ecName>" variable
    And I remember "2000" text as "EC_PRICE" variable
    And I remember "10" text as "EC_WEIGHT" variable
    And I remember "1000" text as "EC_PRICING_MATRIX_PRICE" variable

    Examples:
      |type        |varName     |ecName       |shortVar|shortEc|
      |            |            |             |        |       |
      |Two         |Two        |_TWO         |Two    |_TWO   |
      |Three       |Three      |_THREE       |Tre    |_TRE   |
      |Edit        |Edit       |_EDIT        |Edt    |_EDT   |
      |Draft CBA   |DraftCBA   |_DRAFT_CBA   |DCB    |_DCB   |
      |Draft Course|DraftCourse|_DRAFT_COURSE|DCO    |_DCO   |
      |Dont Touch  |DontTouch  |_DONT_TOUCH  |DT     |_DT    |

      #______________________________Remember Variables__________________________
  Scenario Outline: Remember Variables For Creation <type>
    And I remember "AutoDeactivationReasonDescription<varName>" text as "EC_DEACTIVATION_REASON_DESCRIPTION" variable
    And I remember "AutoDeactivationReasonDescriptionPrevent<varName>" text as "EC_DEACTIVATION_REASON_DESCRIPTION_PREVENT" variable
    And I remember "23/10/2020" text as "EC_SITTING_START_DATE" variable
    And I remember "10/10/2025" text as "EC_SITTING_END_DATE" variable
    And I remember "AutoStudyModeName<varName>" text as "EC_STUDY_MODE_NAME" variable
    And I remember "AutoStudyModeDescription<varName>" text as "EC_STUDY_MODE_DESCRIPTION" variable
    And I remember "AutoProgrammeName<varName>" text as "EC_PROGRAMME_NAME" variable
    And I remember "AutoProgrammeCode<varName>" text as "EC_PROGRAMME_CODE" variable
    And I remember "AutoCohortName<varName>" text as "EC_COHORT_NAME" variable
    And I remember "AutoModuleSectionName<varName>" text as "EC_MODULE_SECTION_NAME" variable
    And I remember "1233456" text as "EC_SIS_TERM_CODE" variable
    And I remember "AutoStreamName<varName>" text as "EC_STREAM_NAME" variable
    And I remember "AutoBodyFDCode<varName>" text as "EC_BODY_FD_CODE" variable
    And I remember "AutoBodyFDDescription<varName>" text as "EC_BODY_FD_DESCRIPTION" variable
    And I remember "AutoMaterialFDCode<varName>" text as "EC_MATERIAL_FD_CODE" variable
    And I remember "AutoMaterialFDDescription<varName>" text as "EC_MATERIAL_FD_DESCRIPTION" variable
    And I remember "AutoCourseFDCode<varName>" text as "EC_COURSE_FD_CODE" variable
    And I remember "AutoCourseFDDescription<varName>" text as "EC_COURSE_FD_DESCRIPTION*" variable
    And I remember "AutoMaterialFDCode<varName>" text as "EC_MATERIAL_FD_CODE" variable
    And I remember "AutoMaterialFDDescription<varName>" text as "EC_MATERIAL_FD_DESCRIPTION" variable
    And I remember "AutoCourseFDCode<varName>" text as "EC_COURSE_FD_CODE" variable
    And I remember "AutoCourseFDDescription<varName>" text as "EC_COURSE_FD_DESCRIPTION" variable
    And I remember "AutoVerticalName<varName>" text as "EC_VERTICAL_NAME" variable
    And I remember "AutoBodyShortName<varName>" text as "EC_BODY_SHORT_NAME" variable
    And I remember "AutoBodyName<varName>" text as "EC_BODY_NAME" variable
    And I remember "AutoVatRuleCode<varName>" text as "EC_VAT_RULE_CODE" variable
    And I remember "AutoVatRuleDescription<varName>" text as "EC_VAT_RULE_DESCRIPTION" variable
    And I remember "AutoCourseTypeFDCode<varName>" text as "EC_COURSE_TYPE_FD_CODE" variable
    And I remember "AutoCourseTypeFDDescription<varName>" text as "EC_COURSE_TYPE_FD_DESCRIPTION" variable
    And I remember "AutoCourseTypeDescription<varName>" text as "EC_COURSE_TYPE_DESCRIPTION" variable
    And I remember "AutoCBACourseTypeDescription<varName>" text as "EC_CBA_COURSE_TYPE_DESCRIPTION" variable
    And I remember "AutoLocationFDCode<varName>" text as "EC_LOCATION_FD_CODE" variable
    And I remember "AutoLocationFDDescription<varName>" text as "EC_LOCATION_FD_DESCRIPTION" variable
    And I remember "AutoRegionFDCode<varName>" text as "EC_REGION_FD_CODE" variable
    And I remember "AutoRegionFDDescription<varName>" text as "EC_REGION_FD_DESCRIPTION" variable
    And I remember "AutoRegionName<varName>" text as "EC_REGION_NAME" variable
    And I remember "AutoLocationName<varName>" text as "EC_LOCATION_NAME" variable
    And I remember "AutoLocationAddress<varName>" text as "EC_LOCATION_ADDRESS" variable
    And I remember "AutoStockSiteName<varName>" text as "EC_STOCK_SITE_NAME" variable
    And I remember "AutoLevelName<varName>" text as "EC_LEVEL_NAME" variable
    And I remember "AutoLevelShortName<varName>" text as "EC_LEVEL_SHORT_NAME" variable
    And I remember "AtPprSN<shortVar>" text as "EC_PPR_SN" variable
    And I remember "AutoPaperName<varName>" text as "EC_PAPER_NAME" variable
    And I remember "AutoPaperDescription<varName>" text as "EC_PAPER_DESCRIPTION" variable
    And I remember "ACBAPsn<shortVar>" text as "EC_CBA_PPR_SN" variable
    And I remember "AutoCBAPaperName<varName>" text as "EC_CBA_PAPER_NAME" variable
    And I remember "AutoCBAPaperDescription<varName>" text as "EC_CBA_PAPER_DESCRIPTION" variable
    And I remember "AutoSittingName<varName>" text as "EC_SITTING_NAME" variable
    And I remember "AutoMaterialTypeFDCode<varName>" text as "EC_MATERIAL_TYPE_FD_CODE" variable
    And I remember "AutoMaterialTypeFDDescription<varName>" text as "EC_MATERIAL_TYPE_FD_DESCRIPTION" variable
    And I remember "AutoMaterialTypeName<varName>" text as "EC_MATERIAL_TYPE_NAME" variable
    And I remember "AutoMaterialTypeDescription<varName>" text as "EC_MATERIAL_TYPE_DESCRIPTION" variable
    And I remember "AutoSessionDurationDescription<varName>" text as "EC_SESSION_DURATION_DESCRIPTION" variable
    And I remember "AutoCBASessionDurationDescription<varName>" text as "EC_CBA_SESSION_DURATION_DESCRIPTION" variable
    And I remember "AutoSessionDurationDescriptionTwoDates<varName>" text as "EC_SESSION_DURATION_DESCRIPTION_TWO_DATES" variable
    And I remember "AutoClientName<varName>" text as "EC_CLIENT_NAME" variable
    And I remember "2000" text as "EC_PRICE" variable
    And I remember "10" text as "EC_WEIGHT" variable
    And I remember "1000" text as "EC_PRICING_MATRIX_PRICE" variable

    Examples:
      |type        |varName     |ecName       |shortVar|shortEc|
#    |Z           |$Z          |_Z           |$Z      |_Z     |
#    |X           |$X          |_X           |$X      |_X     |
#    |W           |$W          |_W           |$W      |_W     |
#    |O           |$O          |_O           |$O      |_O     |
      |            |            |             |        |       |
      |Two         |Two        |_TWO         |Two    |_TWO   |
      |Three       |Three      |_THREE       |Tre    |_TRE   |
      |Edit        |Edit       |_EDIT        |Edt    |_EDT   |
      |Draft CBA   |DraftCBA   |_DRAFT_CBA   |DCB    |_DCB   |
      |Draft Course|DraftCourse|_DRAFT_COURSE|DCO    |_DCO   |
      |Dont Touch  |DontTouch  |_DONT_TOUCH  |DT     |_DT    |

    #_________________________________Create Reference Data Set____________________________
  @CreateDataDriven
  Scenario Outline: Create Reference Data Set <type>
    Given I am on "https://generate.plus/en/number/isbn" URL
    And I click on the " generate" "button"
    And I capture text data "ISBN Generator Number Field" as "EC_ISBN" variable
    Given I am on "MD_COMMON_LINKS_PRODUCTFACTORYURLNEW" URL
    When I click on the "Sign in with Auth0" button
    And I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYUSER"
    And I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYPASSWORD"
    And I click on the "Product Factory Login" button

    Given I execute "Create Deactivation Reason" reusable step replacing some steps
      |4|I set "$Auto[DeactivationReasonDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute modified "Create Study Mode" reusable step
      |4|Replace|I set "$Auto[StudyModeName]<varName>" text to the "Name" "Product Factory text field"|
      |5|Replace|I set "$Auto[StudyModeDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute modified "Create Deactivation Reason" reusable step
      |4|Replace|I set "$Auto[DeactivationReasonDescriptionPrevent]<varName>" text to the "Description" "Product Factory text field"|
      |5|Add|I click on the "Prevent Reactivation" "Product Factory checkbox"|
      |7|Replace|I should see the "EC_DEACTIVATION_REASON_DESCRIPTION_PREVENT<ecName>" element|
    And I execute "Create Programme" reusable step replacing some steps
      |4|I set "$Auto[ProgrammeCode]<varName>" text to the "Code" "Product Factory text field"|
      |5|I set "$Auto[ProgrammeName]<varName>" text to the "Name" "Product Factory text field"|
    And I execute "Create Programme Cohort" reusable step replacing some steps
      |7|I set "$Auto[CohortName]<varName>" text to the "Name" "Product Factory text field"|
    And I execute "Create Module Section" reusable step replacing some steps
      |6|I set "$Auto[ModuleSectionName]<varName>" text to the "Name" "Product Factory text field"|
    And I execute "Create Stream" reusable step replacing some steps
      |4|I set "$Auto[StreamName]<varName>" text to the "Name" "Product Factory text field"|
    When I execute "Create Body Financial Dimension" reusable step replacing some steps
      |4|I set "$Auto[BodyFDCode]<varName>" text to the "Code" "Product Factory text field"|
      |5|I set "$Auto[BodyFDDescription]<varName>" text to the "Description" "Product Factory text field"|
    When I execute "Create Material Financial Dimension" reusable step replacing some steps
      |4|I set "$Auto[MaterialFDCode]<varName>" text to the "Code" "Product Factory text field"|
      |5|I set "$Auto[MaterialFDDescription]<varName>" text to the "Description" "Product Factory text field"|
    When I execute "Create Course Financial Dimension" reusable step replacing some steps
      |4|I set "$Auto[CourseFDCode]<varName>" text to the "Code" "Product Factory text field"|
      |5|I set "$Auto[CourseFDDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Create Vertical" reusable step replacing some steps
      |4|I set "$Auto[VerticalName]<varName>" text to the "Name" "Product Factory text field"|
    And I execute "Create Body" reusable step replacing some steps
      |4|I set "$Auto[BodyShortName]<varName>" text to the "Short Name" "Product Factory text field"|
      |5|I set "$Auto[BodyName]<varName>" text to the "Name" "Product Factory text field"|
    And I execute "Create VAT Rule" reusable step replacing some steps
      |4|I set "$Auto[VatRuleCode]<varName>" text to the "Code" "Product Factory text field"|
      |5|I set "$Auto[VatRuleDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Create Course Type Financial Dimension" reusable step replacing some steps
      |4|I set "$Auto[CourseTypeFDCode]<varName>" text to the "Code" "Product Factory text field"|
      |5|I set "$Auto[CourseTypeFDDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Create Course Type" reusable step replacing some steps
      |4|I set "$Auto[CourseTypeDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute modified "Create Course Type" reusable step
      |4|Replace|I set "$Auto[CBACourseTypeDescription]<varName>" text to the "Description" "Product Factory text field"|
      |11|Add   |I "check" "Is CBA?" "Product Factory checkbox"                                                       |
    And I execute "Create Location Financial Dimension" reusable step replacing some steps
      |4|I set "$Auto[LocationFDCode]<varName>" text to the "Code" "Product Factory text field"|
      |5|I set "$Auto[LocationFDDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Create Region Financial Dimension" reusable step replacing some steps
      |4|I set "$Auto[RegionFDCode]<varName>" text to the "Code" "Product Factory text field"|
      |5|I set "$Auto[RegionFDDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Create Region" reusable step replacing some steps
      |4|I set "$Auto[RegionName]<varName>" text to the "Name" "Product Factory text field"|
    And I execute "Create Location" reusable step replacing some steps
      |4|I set "$Auto[LocationName]<varName>" text to the "Name" "Product Factory text field"|
      |5|I set "$Auto[LocationAddress]<varName>" text to the "Address Line 1" "Product Factory text field"|
    And I execute "Create Stock Site" reusable step replacing some steps
      |4|I set "$Auto[StockSiteName]<varName>" text to the "Name" "Product Factory text field"|
    And I execute "Create Level" reusable step replacing some steps
      |4|I set "$Auto[LevelShortName]<varName>" text to the "Short Name" "Product Factory text field"|
      |5|I set "$Auto[LevelName]<varName>" text to the "Name" "Product Factory text field"|
    And I execute "Create Paper" reusable step replacing some steps
      |4|I set "$At[PprSN]<shortVar>" text to the "Short Name" "Product Factory text field"|
      |5|I set "$Auto[PaperName]<varName>" text to the "Name" "Product Factory text field"|
      |6|I set "$Auto[PaperDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute modified "Create Paper" reusable step
      |4|Replace|I set "$A[CBAPsn]<shortVar>" text to the "Short Name" "Product Factory text field"|
      |5|Add    |I "check" "CBA Paper?" "Product Factory checkbox"|
      |6|Add    |I set "1" text to the "Time in Hours" "Product Factory text field"|
      |7|Replace|I set "$Auto[CBAPaperName]<varName>" text to the "Name" "Product Factory text field"|
      |8|Replace|I set "$Auto[CBAPaperDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Link Body To Level" reusable step
    And I execute "Link Body To Paper" reusable step
    And I execute "Link Paper To Level" reusable step
    And I execute "Link Body To Paper" reusable step replacing some steps
      |3|I set "EC_CBA_PAPER_DESCRIPTION<ecName>" text to the "Search" "Product Factory text field" from keyboard|
      |5|I click on the "EC_CBA_PAPER_NAME<ecName>" "Product Factory Change Body button"|
    And I execute "Link Paper To Level" reusable step replacing some steps
      |3|I set "EC_CBA_PAPER_DESCRIPTION<ecName>" text to the "Search" "Product Factory text field" from keyboard|
      |5|I click on the "EC_CBA_PAPER_NAME<ecName>" "Product Factory Link Levels button"|
    And I execute "Create Sitting" reusable step replacing some steps
      |4|I set "$Auto[SittingName]<varName>" text to the "Name" "Product Factory text field"|
    And I execute "Create Pricing Matrix" reusable step
    And I execute "Create Pricing Matrix Full" reusable step replacing some steps
      |12|I set "~PricingMatrixPrice[1000]" text to the "Enter a Price (£)" "Product Factory text field"|
    And I execute "Create Pricing Matrix Full" reusable step replacing some steps
      |10|I click on the "EC_CBA_PAPER_NAME" "Product Factory dialog checkbox"|
      |12|I set "~PricingMatrixPrice[1000]" text to the "Enter a Price (£)" "Product Factory text field"|
    And I execute "Create Material Type Financial Dimension" reusable step replacing some steps
      |4|I set "$Auto[MaterialTypeFDCode]<varName>" text to the "Code" "Product Factory text field"|
      |5|I set "$Auto[MaterialTypeFDDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Create Material Type" reusable step replacing some steps
      |4|I set "$Auto[MaterialTypeName]<varName>" text to the "Name" "Product Factory text field"|
      |5|I set "$Auto[MaterialTypeDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Create Session Duration" reusable step replacing some steps
      |4|I set "$Auto[SessionDurationDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute modified "Create Session Duration" reusable step
      |4|Replace|I set "$Auto[CBASessionDurationDescription]<varName>" text to the "Description" "Product Factory text field"|
      |6|Add    |I "check" "Allowed for CBA" "Product Factory checkbox"|
      |8|Replace|I should see the "EC_CBA_SESSION_DURATION_DESCRIPTION<ecName>" element|
    And I execute "Create Session Duration" reusable step replacing some steps
      |4|I set "$Auto[TwoDatesSessionDurationDescription]<varName>" text to the "Description" "Product Factory text field"|
      |5|I set "2" text to the "Number of Dates" "Product Factory text field"|
    And I execute "Create Client" reusable step replacing some steps
      |4|I set "$Auto[ClientName]<varName>" text to the "Name" "Product Factory text field"|
    And I execute "Create Material" reusable step replacing some steps
      |6|I set "~Price[2000]" text to the "Price (£)" "Product Factory text field"|
      |8|I set "~Weight[10]" text to the "Weight (kg)" "Product Factory text field"|
    Then I execute "Create Course" reusable step
    And I execute "Create Course Instance" reusable step
    And I execute modified "Create CBA Record" reusable step
      |4|Replace|I click on the "EC_CBA_SESSION_DURATION_DESCRIPTION<ecName>" "Product Factory select button"|
      |22|Replace|I click on the "EC_CBA_PAPER_NAME" "Product Factory dropdown option"                       |
#    And I execute modified "Create CBA Course" reusable step
#      |11|Replace|I should see the "EC_CBA_PAPER_NAME<ecName>" element|
    And I execute "Create Digital Content" reusable step

    Examples:
    |type        |varName     |ecName       |shortVar|shortEc|
#    |Z           |$Z          |             |$Z      |       |
#    |X           |$X          |             |$X      |       |
#    |W           |$W          |             |$W      |       |
    |            |            |             |        |       |
    |Two         |$Two        |             |$Two    |   |
    |Three       |$Three      |             |$Tre    |   |
    |Edit        |$Edit       |             |$Edt    |   |
    |Draft CBA   |$DraftCBA   |             |$DCB    |   |
    |Draft Course|$DraftCourse|             |$DCO    |   |
    |Dont Touch  |$DontTouch  |             |$DT     |   |
