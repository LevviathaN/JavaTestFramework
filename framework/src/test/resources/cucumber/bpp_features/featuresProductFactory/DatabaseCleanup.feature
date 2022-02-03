@ProductFactoryCleanup @BeforePF
Feature: Product Factory database cleanup

  #TC-1668, TC-1666, TC-1606
  Scenario: Clean Product Factory Database
    Given I am on "http://ec2-35-178-212-44.eu-west-2.compute.amazonaws.com:7474/browser/" URL
    When I fill the "Product Factory Database Connect URL Field" field with "bolt://ec2-35-178-212-44.eu-west-2.compute.amazonaws.com:7687"
    Then I fill the "Product Factory Database Username Field" field with "Neo4j"
    And I fill the "Product Factory Database Password Field" field with "3M#$,qns5uw*W#jr"
    And I click on the "Product Factory Database Connect Button" button
    When I click on the "Product Factory Database Query Field" button
    And I fill the "Product Factory Database Query Field" field with "MATCH (n) DETACH DELETE n"
    Then I click on the "Product Factory Database Submit Query Button" button

    Then I generate new ISBN code saving as "EC_ISBN"
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I click on the "Products" "Product Factory navigation item"
    And I click on the "Materials" "Product Factory navigation sub item"
    Then I should see the "Materials have not yet been configured for use. Please check with your Team Leader" message
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step

    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Financial Dimensions" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "$Auto[CourseFDCode]" text to the "Code" "Product Factory text field"
    And I set "$Auto[CourseFDDescription]" text to the "Description" "Product Factory text field"
    And I click on the "Applies To" "Product Factory dropdown"
    And I click on the "Course" "Product Factory dropdown option"
    And I click on the "Dimension" "Product Factory dropdown"
    And I click on the "Product" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_COURSE_FD_CODE" element
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I click on the "Entity Dimension" "Product Factory change button"
    And I click on the "EC_COURSE_FD_CODE" "Product Factory select button"
    And I click on the "Revenue Dimension" "Product Factory change button"
    And I click on the "EC_COURSE_FD_CODE" "Product Factory select button"
    And I click on the "Save" "Product Factory button"

    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Financial Dimensions" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "$Auto[MaterialFDCode]" text to the "Code" "Product Factory text field"
    And I set "$Auto[MaterialFDDescription]" text to the "Description" "Product Factory text field"
    And I click on the "Applies To" "Product Factory dropdown"
    And I click on the "Material" "Product Factory dropdown option"
    And I click on the "Dimension" "Product Factory dropdown"
    And I click on the "Product" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_MATERIAL_FD_CODE" element
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Materials" "Product Factory navigation sub item"
    And I click on the "Entity Dimension" "Product Factory change button"
    And I click on the "EC_MATERIAL_FD_CODE" "Product Factory select button"
    And I click on the "Revenue Dimension" "Product Factory change button"
    And I click on the "EC_MATERIAL_FD_CODE" "Product Factory select button"
    And I click on the "Save" "Product Factory button"



    #______________________________Remember Variables__________________________
#  Scenario: Remember Variables
#    And I remember "AutoDeactivationReasonDescription" text as "EC_DEACTIVATION_REASON_DESCRIPTION" variable
#    And I remember "AutoDeactivationReasonDescriptionPrevent" text as "EC_DEACTIVATION_REASON_DESCRIPTION_PREVENT" variable
#    And I remember "23/10/2020" text as "EC_SITTING_START_DATE" variable
#    And I remember "10/10/2025" text as "EC_SITTING_END_DATE" variable
#    And I remember "AutoStreamName" text as "EC_STREAM_NAME" variable
#    And I remember "AutoBodyFDCode" text as "EC_BODY_FD_CODE" variable
#    And I remember "AutoBodyFDDescription" text as "EC_BODY_FD_DESCRIPTION" variable
#    And I remember "AutoBodyShortName" text as "EC_BODY_SHORT_NAME" variable
#    And I remember "AutoBodyName" text as "EC_BODY_NAME" variable
#    And I remember "AutoVatRuleCode" text as "EC_VAT_RULE_CODE" variable
#    And I remember "AutoVatRuleDescription" text as "EC_VAT_RULE_DESCRIPTION" variable
#    And I remember "AutoCourseTypeFDCode" text as "EC_COURSE_TYPE_FD_CODE" variable
#    And I remember "AutoCourseTypeFDDescription" text as "EC_COURSE_TYPE_FD_DESCRIPTION" variable
#    And I remember "AutoCourseTypeDescription" text as "EC_COURSE_TYPE_DESCRIPTION" variable
#    And I remember "AutoLocationFDCode" text as "EC_LOCATION_FD_CODE" variable
#    And I remember "AutoLocationFDDescription" text as "EC_LOCATION_FD_DESCRIPTION" variable
#    And I remember "AutoRegionFDCode" text as "EC_REGION_FD_CODE" variable
#    And I remember "AutoRegionFDDescription" text as "EC_REGION_FD_DESCRIPTION" variable
#    And I remember "AutoRegionName" text as "EC_REGION_NAME" variable
#    And I remember "AutoLocationName" text as "EC_LOCATION_NAME" variable
#    And I remember "AutoLocationAddress" text as "EC_LOCATION_ADDRESS" variable
#    And I remember "AutoLevelName" text as "EC_LEVEL_NAME" variable
#    And I remember "AutoLevelShortName" text as "EC_LEVEL_SHORT_NAME" variable
#    And I remember "AutoPprSN" text as "EC_PPR_SN" variable
#    And I remember "AutoPaperName" text as "EC_PAPER_NAME" variable
#    And I remember "AutoPaperDescription" text as "EC_PAPER_DESCRIPTION" variable
#    And I remember "AtCBAPprSN" text as "EC_CBA_PPR_SN" variable
#    And I remember "AutoCBAPaperName" text as "EC_CBA_PAPER_NAME" variable
#    And I remember "AutoCBAPaperDescription" text as "EC_CBA_PAPER_DESCRIPTION" variable
#    And I remember "AutoSittingName" text as "EC_SITTING_NAME" variable
#    And I remember "AutoMaterialTypeFDCode" text as "EC_MATERIAL_TYPE_FD_CODE" variable
#    And I remember "AutoMaterialTypeFDDescription" text as "EC_MATERIAL_TYPE_FD_DESCRIPTION" variable
#    And I remember "AutoMaterialTypeName" text as "EC_MATERIAL_TYPE_NAME" variable
#    And I remember "AutoMaterialTypeDescription" text as "EC_MATERIAL_TYPE_DESCRIPTION" variable
#    And I remember "AutoSessionDurationDescription" text as "EC_SESSION_DURATION_DESCRIPTION" variable
#    And I remember "AutoCBASessionDurationDescription" text as "EC_CBA_SESSION_DURATION_DESCRIPTION" variable
#    And I remember "AutoSessionDurationDescriptionTwoDates" text as "EC_SESSION_DURATION_DESCRIPTION_TWO_DATES" variable
#    And I remember "AutoClientName" text as "EC_CLIENT_NAME" variable
#    And I remember "2000" text as "EC_PRICE" variable
#    And I remember "10" text as "EC_WEIGHT" variable
#    And I remember "1000" text as "EC_PRICING_MATRIX_PRICE" variable

    #_________________________________Create Reference Data Set____________________________
#  Scenario: Create Reference Data Set
#    Given I execute "Create Deactivation Reason" reusable step replacing some steps
#      |4|I set "$Auto[DeactivationReasonDescription]" text to the "Description" "Product Factory text field"|
#    And I execute modified "Create Deactivation Reason" reusable step
#      |4|Replace|I set "$Auto[DeactivationReasonDescriptionPrevent]" text to the "Description" "Product Factory text field"|
#      |5|Add|I click on the "Prevent Reactivation" "Product Factory checkbox"|
#      |7|Replace|I should see the "EC_DEACTIVATION_REASON_DESCRIPTION_PREVENT" element|
#    And I execute "Create Stream" reusable step replacing some steps
#      |4|I set "$Auto[StreamName]" text to the "Name" "Product Factory text field"|
#    When I execute "Create Body Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[BodyFDCode]" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[BodyFDDescription]" text to the "Description" "Product Factory text field"|
#    And I execute "Create Body" reusable step replacing some steps
#      |4|I set "$Auto[BodyShortName]" text to the "Short Name" "Product Factory text field"|
#      |5|I set "$Auto[BodyName]" text to the "Name" "Product Factory text field"|
#    And I execute "Create VAT Rule" reusable step replacing some steps
#      |4|I set "$Auto[VatRuleCode]" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[VatRuleDescription]" text to the "Description" "Product Factory text field"|
#    And I execute "Create Course Type Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[CourseTypeFDCode]" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[CourseTypeFDDescription]" text to the "Description" "Product Factory text field"|
#    And I execute "Create Course Type" reusable step replacing some steps
#      |4|I set "$Auto[CourseTypeDescription]" text to the "Description" "Product Factory text field"|
#    And I execute "Create Location Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[LocationFDCode]" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[LocationFDDescription]" text to the "Description" "Product Factory text field"|
#    And I execute "Create Region Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[RegionFDCode]" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[RegionFDDescription]" text to the "Description" "Product Factory text field"|
#    And I execute "Create Region" reusable step replacing some steps
#      |4|I set "$Auto[RegionName]" text to the "Name" "Product Factory text field"|
#    And I execute "Create Location" reusable step replacing some steps
#      |4|I set "$Auto[LocationName]" text to the "Name" "Product Factory text field"|
#      |5|I set "$Auto[LocationAddress]" text to the "Address Line 1" "Product Factory text field"|
#    And I execute "Create Level" reusable step replacing some steps
#      |4|I set "$Auto[LevelShortName]" text to the "Short Name" "Product Factory text field"|
#      |5|I set "$Auto[LevelName]" text to the "Name" "Product Factory text field"|
#    And I execute "Create Paper" reusable step replacing some steps
#      |4|I set "$Auto[PprSN]" text to the "Short Name" "Product Factory text field"|
#      |5|I set "$Auto[PaperName]" text to the "Name" "Product Factory text field"|
#      |6|I set "$Auto[PaperDescription]" text to the "Description" "Product Factory text field"|
#    And I execute modified "Create Paper" reusable step
#      |4|Replace|I set "$At[CBAPprSN]" text to the "Short Name" "Product Factory text field"|
#      |5|Add    |I "check" "CBA Paper?" "Product Factory checkbox"|
#      |6|Add    |I set "1" text to the "Time in Hours" "Product Factory text field"|
#      |7|Replace|I set "$Auto[CBAPaperName]" text to the "Name" "Product Factory text field"|
#      |8|Replace|I set "$Auto[CBAPaperDescription]" text to the "Description" "Product Factory text field"|
#    And I execute "Link Body To Level" reusable step
#    And I execute "Link Body To Paper" reusable step
#    And I execute "Link Paper To Level" reusable step
#    And I execute "Link Body To Paper" reusable step replacing some steps
#      |3|I set "EC_CBA_PAPER_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard|
#      |5|I click on the "EC_CBA_PAPER_NAME" "Product Factory Change Body button"|
#    And I execute "Link Paper To Level" reusable step replacing some steps
#      |3|I set "EC_CBA_PAPER_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard|
#      |5|I click on the "EC_CBA_PAPER_NAME" "Product Factory Link Levels button"|
#    And I execute "Create Sitting" reusable step replacing some steps
#      |4|I set "$Auto[SittingName]" text to the "Name" "Product Factory text field"|
#    And I execute "Create Pricing Matrix" reusable step
#    And I execute "Create Pricing Matrix Full" reusable step replacing some steps
#      |12|I set "~PricingMatrixPrice[1000]" text to the "Enter a Price (£)" "Product Factory text field"|
#    And I execute "Create Pricing Matrix Full" reusable step replacing some steps
#      |10|I click on the "EC_CBA_PAPER_NAME" "Product Factory dialog checkbox"|
#      |12|I set "~PricingMatrixPrice[1000]" text to the "Enter a Price (£)" "Product Factory text field"|
#    And I execute "Create Material Type Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[MaterialTypeFDCode]" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[MaterialTypeFDDescription]" text to the "Description" "Product Factory text field"|
#    And I execute "Create Material Type" reusable step replacing some steps
#      |4|I set "$Auto[MaterialTypeName]" text to the "Name" "Product Factory text field"|
#      |5|I set "$Auto[MaterialTypeDescription]" text to the "Description" "Product Factory text field"|
#    And I execute "Create Session Duration" reusable step replacing some steps
#      |4|I set "$Auto[SessionDurationDescription]" text to the "Description" "Product Factory text field"|
#    And I execute modified "Create Session Duration" reusable step
#      |4|Replace|I set "$Auto[CBASessionDurationDescription]" text to the "Description" "Product Factory text field"|
#      |6|Add    |I "check" "Allowed for CBA" "Product Factory checkbox"|
#      |8|Replace|I should see the "EC_CBA_SESSION_DURATION_DESCRIPTION" element|
#    And I execute "Create Session Duration" reusable step replacing some steps
#      |4|I set "$Auto[SessionDurationDescriptionTwoDates]" text to the "Description" "Product Factory text field"|
#      |5|I set "2" text to the "Number of Dates" "Product Factory text field"|
#    And I execute "Create Client" reusable step replacing some steps
#      |4|I set "$Auto[ClientName]" text to the "Name" "Product Factory text field"|
#    And I execute "Create Material" reusable step replacing some steps
#      |6|I set "~Price[2000]" text to the "Price (£)" "Product Factory text field"|
#      |7|I set "~Weight[10]" text to the "Weight (kg)" "Product Factory text field"|
#    And I execute "Create Course Instance" reusable step
#    And I execute modified "Create CBA Record" reusable step
#      |5|Replace|I click on the "EC_CBA_SESSION_DURATION_DESCRIPTION" "Product Factory select button"|
#      |14|Replace|I should see the "EC_CBA_SESSION_DURATION_DESCRIPTION" element                         |
#    And I execute modified "Create CBA Course" reusable step
#      |11|Replace|I should see the "EC_CBA_PAPER_NAME" element|
#    And I execute "Create Digital Content" reusable step

  #______________________________Remember Variables 2__________________________
#  Scenario: Remember Variables Two
#    And I remember "23/10/2020" text as "EC_SITTING_START_DATE" variable
#    And I remember "10/10/2025" text as "EC_SITTING_END_DATE" variable
#    And I remember "AutoBodyFDCodeTwo" text as "EC_BODY_FD_CODE" variable
#    And I remember "AutoBodyFDDescriptionTwo" text as "EC_BODY_FD_DESCRIPTION" variable
#    And I remember "AutoBodyShortNameTwo" text as "EC_BODY_SHORT_NAME" variable
#    And I remember "AutoBodyNameTwo" text as "EC_BODY_NAME" variable
#    And I remember "AutoVatRuleCodeTwo" text as "EC_VAT_RULE_CODE" variable
#    And I remember "AutoVatRuleDescriptionTwo" text as "EC_VAT_RULE_DESCRIPTION" variable
#    And I remember "AutoCourseTypeFDCodeTwo" text as "EC_COURSE_TYPE_FD_CODE" variable
#    And I remember "AutoCourseTypeFDDescriptionTwo" text as "EC_COURSE_TYPE_FD_DESCRIPTION" variable
#    And I remember "AutoCourseTypeDescriptionTwo" text as "EC_COURSE_TYPE_DESCRIPTION" variable
#    And I remember "AutoLocationFDCodeTwo" text as "EC_LOCATION_FD_CODE" variable
#    And I remember "AutoLocationFDDescriptionTwo" text as "EC_LOCATION_FD_DESCRIPTION" variable
#    And I remember "AutoRegionFDCodeTwo" text as "EC_REGION_FD_CODE" variable
#    And I remember "AutoRegionFDDescriptionTwo" text as "EC_REGION_FD_DESCRIPTION" variable
#    And I remember "AutoRegionNameTwo" text as "EC_REGION_NAME" variable
#    And I remember "AutoLocationNameTwo" text as "EC_LOCATION_NAME" variable
#    And I remember "AutoLocationAddressTwo" text as "EC_LOCATION_ADDRESS" variable
#    And I remember "AutoLevelNameTwo" text as "EC_LEVEL_NAME" variable
#    And I remember "AutoLevelShortNameTwo" text as "EC_LEVEL_SHORT_NAME" variable
#    And I remember "AtPprSNTwo" text as "EC_PPR_SN" variable
#    And I remember "AutoPaperNameTwo" text as "EC_PAPER_NAME" variable
#    And I remember "AutoPaperDescriptionTwo" text as "EC_PAPER_DESCRIPTION" variable
#    And I remember "AutoSittingNameTwo" text as "EC_SITTING_NAME" variable
#    And I remember "AutoMaterialTypeFDCodeTwo" text as "EC_MATERIAL_TYPE_FD_CODE" variable
#    And I remember "AutoMaterialTypeFDDescriptionTwo" text as "EC_MATERIAL_TYPE_FD_DESCRIPTION" variable
#    And I remember "AutoMaterialTypeNameTwo" text as "EC_MATERIAL_TYPE_NAME" variable
#    And I remember "AutoMaterialTypeDescriptionTwo" text as "EC_MATERIAL_TYPE_DESCRIPTION" variable
#    And I remember "AutoSessionDurationDescriptionTwo" text as "EC_SESSION_DURATION_DESCRIPTION" variable
#    And I remember "AutoCBASessionDurationDescriptionTwo" text as "EC_CBA_SESSION_DURATION_DESCRIPTION" variable
#    And I remember "AutoSessionDurationDescriptionTwoDatesTwo" text as "EC_SESSION_DURATION_DESCRIPTION_TWO_DATES" variable
#    And I remember "AutoClientNameTwo" text as "EC_CLIENT_NAME" variable
#    And I remember "2000" text as "EC_PRICE" variable
#    And I remember "10" text as "EC_WEIGHT" variable

    #_________________________________Create Reference Data Set 2____________________________
#  Scenario: Create Reference Data Set Two
#    When I execute "Create Body Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[BodyFDCode]$Two" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[BodyFDDescription]$Two" text to the "Description" "Product Factory text field"|
#    And I execute "Create Body" reusable step replacing some steps
#      |4|I set "$Auto[BodyShortName]$Two" text to the "Short Name" "Product Factory text field"|
#      |5|I set "$Auto[BodyName]$Two" text to the "Name" "Product Factory text field"|
#    And I execute "Create VAT Rule" reusable step replacing some steps
#      |4|I set "$Auto[VatRuleCode]$Two" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[VatRuleDescription]$Two" text to the "Description" "Product Factory text field"|
#    And I execute "Create Course Type Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[CourseTypeFDCode]$Two" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[CourseTypeFDDescription]$Two" text to the "Description" "Product Factory text field"|
#    And I execute "Create Course Type" reusable step replacing some steps
#      |4|I set "$Auto[CourseTypeDescription]$Two" text to the "Description" "Product Factory text field"|
#    And I execute "Create Location Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[LocationFDCode]$Two" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[LocationFDDescription]$Two" text to the "Description" "Product Factory text field"|
#    And I execute "Create Region Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[RegionFDCode]$Two" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[RegionFDDescription]$Two" text to the "Description" "Product Factory text field"|
#    And I execute "Create Region" reusable step replacing some steps
#      |4|I set "$Auto[RegionName]$Two" text to the "Name" "Product Factory text field"|
#    And I execute "Create Location" reusable step replacing some steps
#      |4|I set "$Auto[LocationName]$Two" text to the "Name" "Product Factory text field"|
#      |5|I set "$Auto[LocationAddress]$Two" text to the "Address Line 1" "Product Factory text field"|
#    And I execute "Create Level" reusable step replacing some steps
#      |4|I set "$Auto[LevelShortName]$Two" text to the "Short Name" "Product Factory text field"|
#      |5|I set "$Auto[LevelName]$Two" text to the "Name" "Product Factory text field"|
#    And I execute "Create Paper" reusable step replacing some steps
#      |4|I set "$At[PprSN]$Two" text to the "Short Name" "Product Factory text field"|
#      |5|I set "$Auto[PaperName]$Two" text to the "Name" "Product Factory text field"|
#      |6|I set "$Auto[PaperDescription]$Two" text to the "Description" "Product Factory text field"|
#    And I execute "Link Body To Level" reusable step
#    And I execute "Link Body To Paper" reusable step
#    And I execute "Link Paper To Level" reusable step
#    And I execute "Create Sitting" reusable step replacing some steps
#      |4|I set "$Auto[SittingName]$Two" text to the "Name" "Product Factory text field"|
#    And I execute "Create Pricing Matrix" reusable step
#    And I execute "Create Pricing Matrix Full" reusable step replacing some steps
#      |12|I set "~PricingMatrixPrice[1000]" text to the "Enter a Price (£)" "Product Factory text field"|
#    And I execute "Create Material Type Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[MaterialTypeFDCode]$Two" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[MaterialTypeFDDescription]$Two" text to the "Description" "Product Factory text field"|
#    And I execute "Create Material Type" reusable step replacing some steps
#      |4|I set "$Auto[MaterialTypeName]$Two" text to the "Name" "Product Factory text field"|
#      |5|I set "$Auto[MaterialTypeDescription]$Two" text to the "Description" "Product Factory text field"|
#    And I execute "Create Session Duration" reusable step replacing some steps
#      |4|I set "$Auto[SessionDurationDescription]$Two" text to the "Description" "Product Factory text field"|
#    And I execute modified "Create Session Duration" reusable step
#      |4|Replace|I set "$Auto[CBASessionDurationDescription]$Two" text to the "Description" "Product Factory text field"|
#      |6|Add    |I "check" "Allowed for CBA" "Product Factory checkbox"|
#      |8|Replace|I should see the "EC_CBA_SESSION_DURATION_DESCRIPTION" element|
#    And I execute "Create Session Duration" reusable step replacing some steps
#      |4|I set "$Auto[SessionDurationDescriptionTwoDates]$Two" text to the "Description" "Product Factory text field"|
#      |5|I set "2" text to the "Number of Dates" "Product Factory text field"|
#    And I execute "Create Client" reusable step replacing some steps
#      |4|I set "$Auto[ClientName]$Two" text to the "Name" "Product Factory text field"|
#    And I execute "Create Material" reusable step replacing some steps
#      |6|I set "~Price[2000]" text to the "Price (£)" "Product Factory text field"|
#      |7|I set "~Weight[10]" text to the "Weight (kg)" "Product Factory text field"|
#    And I execute "Create Course Instance" reusable step

#    ______________________________Remember Variables 3__________________________
#  Scenario: Remember Variables Three
#    And I remember "23/10/2020" text as "EC_SITTING_START_DATE" variable
#    And I remember "10/10/2025" text as "EC_SITTING_END_DATE" variable
#    And I remember "AutoBodyFDCodeThree" text as "EC_BODY_FD_CODE" variable
#    And I remember "AutoBodyFDDescriptionThree" text as "EC_BODY_FD_DESCRIPTION" variable
#    And I remember "AutoBodyShortNameThree" text as "EC_BODY_SHORT_NAME" variable
#    And I remember "AutoBodyNameThree" text as "EC_BODY_NAME" variable
#    And I remember "AutoVatRuleCodeThree" text as "EC_VAT_RULE_CODE" variable
#    And I remember "AutoVatRuleDescriptionThree" text as "EC_VAT_RULE_DESCRIPTION" variable
#    And I remember "AutoCourseTypeFDCodeThree" text as "EC_COURSE_TYPE_FD_CODE" variable
#    And I remember "AutoCourseTypeFDDescriptionThree" text as "EC_COURSE_TYPE_FD_DESCRIPTION" variable
#    And I remember "AutoCourseTypeDescriptionThree" text as "EC_COURSE_TYPE_DESCRIPTION" variable
#    And I remember "AutoLocationFDCodeThree" text as "EC_LOCATION_FD_CODE" variable
#    And I remember "AutoLocationFDDescriptionThree" text as "EC_LOCATION_FD_DESCRIPTION" variable
#    And I remember "AutoRegionFDCodeThree" text as "EC_REGION_FD_CODE" variable
#    And I remember "AutoRegionFDDescriptionThree" text as "EC_REGION_FD_DESCRIPTION" variable
#    And I remember "AutoRegionNameThree" text as "EC_REGION_NAME" variable
#    And I remember "AutoLocationNameThree" text as "EC_LOCATION_NAME" variable
#    And I remember "AutoLocationAddressThree" text as "EC_LOCATION_ADDRESS" variable
#    And I remember "AutoLevelNameThree" text as "EC_LEVEL_NAME" variable
#    And I remember "AutoLevelShortNameThree" text as "EC_LEVEL_SHORT_NAME" variable
#    And I remember "AtPprSNTre" text as "EC_PPR_SN" variable
#    And I remember "AutoPaperNameThree" text as "EC_PAPER_NAME" variable
#    And I remember "AutoPaperDescriptionThree" text as "EC_PAPER_DESCRIPTION" variable
#    And I remember "AutoSittingNameThree" text as "EC_SITTING_NAME" variable
#    And I remember "AutoMaterialTypeFDCodeThree" text as "EC_MATERIAL_TYPE_FD_CODE" variable
#    And I remember "AutoMaterialTypeFDDescriptionThree" text as "EC_MATERIAL_TYPE_FD_DESCRIPTION" variable
#    And I remember "AutoMaterialTypeNameThree" text as "EC_MATERIAL_TYPE_NAME" variable
#    And I remember "AutoMaterialTypeDescriptionThree" text as "EC_MATERIAL_TYPE_DESCRIPTION" variable
#    And I remember "AutoSessionDurationDescriptionThree" text as "EC_SESSION_DURATION_DESCRIPTION" variable
#    And I remember "AutoCBASessionDurationDescriptionThree" text as "EC_CBA_SESSION_DURATION_DESCRIPTION" variable
#    And I remember "AutoSessionDurationDescriptionTwoDatesThree" text as "EC_SESSION_DURATION_DESCRIPTION_TWO_DATES" variable
#    And I remember "AutoClientNameThree" text as "EC_CLIENT_NAME" variable
#    And I remember "2000" text as "EC_PRICE" variable
#    And I remember "10" text as "EC_WEIGHT" variable

    #_________________________________Create Reference Data Set 3____________________________
#  Scenario: Create Reference Data Set Three
#    When I execute "Create Body Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[BodyFDCode]$Three" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[BodyFDDescription]$Three" text to the "Description" "Product Factory text field"|
#    And I execute "Create Body" reusable step replacing some steps
#      |4|I set "$Auto[BodyShortName]$Three" text to the "Short Name" "Product Factory text field"|
#      |5|I set "$Auto[BodyName]$Three" text to the "Name" "Product Factory text field"|
#    And I execute "Create VAT Rule" reusable step replacing some steps
#      |4|I set "$Auto[VatRuleCode]$Three" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[VatRuleDescription]$Three" text to the "Description" "Product Factory text field"|
#    And I execute "Create Course Type Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[CourseTypeFDCode]$Three" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[CourseTypeFDDescription]$Three" text to the "Description" "Product Factory text field"|
#    And I execute "Create Course Type" reusable step replacing some steps
#      |4|I set "$Auto[CourseTypeDescription]$Three" text to the "Description" "Product Factory text field"|
#    And I execute "Create Location Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[LocationFDCode]$Three" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[LocationFDDescription]$Three" text to the "Description" "Product Factory text field"|
#    And I execute "Create Region Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[RegionFDCode]$Three" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[RegionFDDescription]$Three" text to the "Description" "Product Factory text field"|
#    And I execute "Create Region" reusable step replacing some steps
#      |4|I set "$Auto[RegionName]$Three" text to the "Name" "Product Factory text field"|
#    And I execute "Create Location" reusable step replacing some steps
#      |4|I set "$Auto[LocationName]$Three" text to the "Name" "Product Factory text field"|
#      |5|I set "$Auto[LocationAddress]$Three" text to the "Address Line 1" "Product Factory text field"|
#    And I execute "Create Level" reusable step replacing some steps
#      |4|I set "$Auto[LevelShortName]$Three" text to the "Short Name" "Product Factory text field"|
#      |5|I set "$Auto[LevelName]$Three" text to the "Name" "Product Factory text field"|
#    And I execute "Create Paper" reusable step replacing some steps
#      |4|I set "$At[PprSN]$Tre" text to the "Short Name" "Product Factory text field"|
#      |5|I set "$Auto[PaperName]$Three" text to the "Name" "Product Factory text field"|
#      |6|I set "$Auto[PaperDescription]$Three" text to the "Description" "Product Factory text field"|
#    And I execute "Link Body To Level" reusable step
#    And I execute "Link Body To Paper" reusable step
#    And I execute "Link Paper To Level" reusable step
#    And I execute "Create Sitting" reusable step replacing some steps
#      |4|I set "$Auto[SittingName]$Three" text to the "Name" "Product Factory text field"|
#    And I execute "Create Pricing Matrix" reusable step
#    And I execute "Create Pricing Matrix Full" reusable step replacing some steps
#      |12|I set "~PricingMatrixPrice[1000]" text to the "Enter a Price (£)" "Product Factory text field"|
#    And I execute "Create Material Type Financial Dimension" reusable step replacing some steps
#      |4|I set "$Auto[MaterialTypeFDCode]$Three" text to the "Code" "Product Factory text field"|
#      |5|I set "$Auto[MaterialTypeFDDescription]$Three" text to the "Description" "Product Factory text field"|
#    And I execute "Create Material Type" reusable step replacing some steps
#      |4|I set "$Auto[MaterialTypeName]$Three" text to the "Name" "Product Factory text field"|
#      |5|I set "$Auto[MaterialTypeDescription]$Three" text to the "Description" "Product Factory text field"|
#    And I execute "Create Session Duration" reusable step replacing some steps
#      |4|I set "$Auto[SessionDurationDescription]$Three" text to the "Description" "Product Factory text field"|
#    And I execute modified "Create Session Duration" reusable step
#      |4|Replace|I set "$Auto[CBASessionDurationDescription]$Three" text to the "Description" "Product Factory text field"|
#      |6|Add    |I "check" "Allowed for CBA" "Product Factory checkbox"|
#      |8|Replace|I should see the "EC_CBA_SESSION_DURATION_DESCRIPTION" element|
#    And I execute "Create Session Duration" reusable step replacing some steps
#      |4|I set "$Auto[SessionDurationDescriptionTwoDates]$Three" text to the "Description" "Product Factory text field"|
#      |5|I set "2" text to the "Number of Dates" "Product Factory text field"|
#    And I execute "Create Client" reusable step replacing some steps
#      |4|I set "$Auto[ClientName]$Three" text to the "Name" "Product Factory text field"|
#    And I execute "Create Material" reusable step replacing some steps
#      |6|I set "~Price[2000]" text to the "Price (£)" "Product Factory text field"|
#      |7|I set "~Weight[10]" text to the "Weight (kg)" "Product Factory text field"|
#    And I execute "Create Course Instance" reusable step