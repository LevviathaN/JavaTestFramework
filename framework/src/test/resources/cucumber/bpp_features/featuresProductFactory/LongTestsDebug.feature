Feature: Long Tests Debug
  Created to make debuging late stages of long Product Factory tests (Courses, Materials, CBAs) effectively

  @Runn
  Scenario: Create Debugging Data
    Given I execute "Generate ISBN" reusable step
    Given I execute "Log In" reusable step
    When I execute "Create Body Financial Dimension" reusable step replacing some steps
      |4|I set "$Debug[BodyFDCode]" text to the "Code" "Product Factory text field"|
      |5|I set "$Debug[BodyFDDescription]" text to the "Description" "Product Factory text field"|
    And I execute "Create Body" reusable step replacing some steps
      |4|I set "$Debug[BodyShortName]" text to the "Short Name" "Product Factory text field"|
      |5|I set "$Debug[BodyName]" text to the "Name" "Product Factory text field"|
    And I execute "Create VAT Rule" reusable step replacing some steps
      |4|I set "$Debug[VatRuleCode]" text to the "Code" "Product Factory text field"|
      |5|I set "$Debug[VatRuleDescription]" text to the "Description" "Product Factory text field"|
    And I execute "Create Course Type Financial Dimension" reusable step replacing some steps
      |4|I set "$Debug[CourseTypeFDCode]" text to the "Code" "Product Factory text field"|
      |5|I set "$Debug[CourseTypeFDDescription]" text to the "Description" "Product Factory text field"|
    And I execute "Create Course Type" reusable step replacing some steps
      |4|I set "$Debug[CourseTypeDescription]" text to the "Description" "Product Factory text field"|
    And I execute "Create Location Financial Dimension" reusable step replacing some steps
      |4|I set "$Debug[LocationFDCode]" text to the "Code" "Product Factory text field"|
      |5|I set "$Debug[LocationFDDescription]" text to the "Description" "Product Factory text field"|
    And I execute "Create Region Financial Dimension" reusable step replacing some steps
      |4|I set "$Debug[RegionFDCode]" text to the "Code" "Product Factory text field"|
      |5|I set "$Debug[RegionFDDescription]" text to the "Description" "Product Factory text field"|
    And I execute "Create Region" reusable step replacing some steps
      |4|I set "$Debug[RegionName]" text to the "Name" "Product Factory text field"|
    And I execute "Create Location" reusable step replacing some steps
      |4|I set "$Debug[LocationName]" text to the "Name" "Product Factory text field"|
      |5|I set "$Debug[LocationAddress]" text to the "Address Line 1" "Product Factory text field"|
    And I execute "Create Location" reusable step replacing some steps
      |4|I set "$Debug[LocationNameTwo]" text to the "Name" "Product Factory text field"|
      |5|I set "$Debug[LocationAddressTwo]" text to the "Address Line 1" "Product Factory text field"|
    And I execute "Create Location" reusable step replacing some steps
      |4|I set "$Debug[LocationNameThree]" text to the "Name" "Product Factory text field"|
      |5|I set "$Debug[LocationAddressThree]" text to the "Address Line 1" "Product Factory text field"|
    And I execute "Create Level" reusable step replacing some steps
      |4|I set "$Debug[LevelShortName]" text to the "Short Name" "Product Factory text field"|
      |5|I set "$Debug[LevelName]" text to the "Name" "Product Factory text field"|
    And I execute "Create Paper" reusable step replacing some steps
      |4|I set "$Debug[PprSN]" text to the "Short Name" "Product Factory text field"|
      |5|I set "$Debug[PaperName]" text to the "Name" "Product Factory text field"|
      |6|I set "$Debug[PaperDescription]" text to the "Description" "Product Factory text field"|
    And I execute modified "Create Paper" reusable step
      |4|Replace|I set "$DbCBA[PprSN]" text to the "Short Name" "Product Factory text field"|
      |5|Add    |I "check" "CBA Paper?" "Product Factory checkbox"|
      |6|Add    |I set "1" text to the "Time in Hours" "Product Factory text field"|
      |7|Replace|I set "$DebugCBA[PaperName]" text to the "Name" "Product Factory text field"|
      |8|Replace|I set "$DebugCBA[PaperDescription]" text to the "Description" "Product Factory text field"|
    And I execute "Link Body To Level" reusable step
    And I execute "Link Body To Paper" reusable step
    And I execute "Link Paper To Level" reusable step
    And I execute "Link Body To Paper" reusable step replacing some steps
      |3|I set "EC_CBA_PAPER_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard|
      |5|I click on the "EC_CBA_PAPER_NAME" "Product Factory Change Body button"|
    And I execute "Link Paper To Level" reusable step replacing some steps
      |3|I set "EC_CBA_PAPER_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard|
      |5|I click on the "EC_CBA_PAPER_NAME" "Product Factory Link Levels button"|
    And I execute "Create Sitting" reusable step replacing some steps
      |4|I set "$Debug[SittingName]" text to the "Name" "Product Factory text field"|
    And I execute "Create Pricing Matrix" reusable step
    And I execute "Create Pricing Matrix Full" reusable step
    And I execute "Create Material Type Financial Dimension" reusable step replacing some steps
      |4|I set "$Debug[MaterialTypeFDCode]" text to the "Code" "Product Factory text field"|
      |5|I set "$Debug[MaterialTypeFDDescription]" text to the "Description" "Product Factory text field"|
    And I execute "Create Material Type" reusable step replacing some steps
      |4|I set "$Debug[MaterialTypeName]" text to the "Name" "Product Factory text field"|
      |5|I set "$Debug[MaterialTypeDescription]" text to the "Description" "Product Factory text field"|
    And I execute "Create Session Duration" reusable step replacing some steps
      |4|I set "$Debug[SessionDurationDescription]" text to the "Description" "Product Factory text field"|
    And I execute "Create Session Duration" reusable step replacing some steps
      |4|I set "$Debug[SessionDurationDescriptionTwoDates]" text to the "Description" "Product Factory text field"|
      |5|I set "2" text to the "Number of Dates" "Product Factory text field"|
    And I execute "Create Client" reusable step replacing some steps
      |4|I set "$Debug[ClientName]" text to the "Name" "Product Factory text field"|
    And I execute "Create Material" reusable step replacing some steps
      |6|I set "~Price[2000]" text to the "Price (£)" "Product Factory text field"|
      |7|I set "~Weight[10]" text to the "Weight (kg)" "Product Factory text field"|

  @Runn
  Scenario: Set EC Variables
    Given I execute "Generate ISBN" reusable step
    Given I execute "Log In" reusable step
    And I remember "23/10/2020" text as "EC_SITTING_START_DATE" variable
    And I remember "10/10/2025" text as "EC_SITTING_END_DATE" variable
    And I remember "DebugBodyFDCode" text as "EC_BODY_FD_CODE" variable
    And I remember "DebugBodyFDDescription" text as "EC_BODY_FD_DESCRIPTION" variable
    And I remember "DebugBodyShortName" text as "EC_BODY_SHORT_NAME" variable
    And I remember "DebugBodyName" text as "EC_BODY_NAME" variable
    And I remember "DebugVatRuleCode" text as "EC_VAT_RULE_CODE" variable
    And I remember "DebugVatRuleDescription" text as "EC_VAT_RULE_DESCRIPTION" variable
    And I remember "DebugCourseTypeFDCode" text as "EC_COURSE_TYPE_FD_CODE" variable
    And I remember "DebugCourseTypeFDDescription" text as "EC_COURSE_TYPE_FD_DESCRIPTION" variable
    And I remember "DebugCourseTypeDescription" text as "EC_COURSE_TYPE_DESCRIPTION" variable
    And I remember "DebugLocationFDCode" text as "EC_LOCATION_FD_CODE" variable
    And I remember "DebugLocationFDDescription" text as "EC_LOCATION_FD_DESCRIPTION" variable
    And I remember "DebugRegionFDCode" text as "EC_REGION_FD_CODE" variable
    And I remember "DebugRegionFDDescription" text as "EC_REGION_FD_DESCRIPTION" variable
    And I remember "DebugRegionName" text as "EC_REGION_NAME" variable
    And I remember "DebugLocationName" text as "EC_LOCATION_NAME" variable
    And I remember "DebugLocationAddress" text as "EC_LOCATION_ADDRESS" variable
    And I remember "DebugLocationNameTwo" text as "EC_LOCATION_NAME_TWO" variable
    And I remember "DebugLocationAddressTwo" text as "EC_LOCATION_ADDRESS_TWO" variable
    And I remember "DebugLocationNameThree" text as "EC_LOCATION_NAME_THREE" variable
    And I remember "DebugLocationAddressThree" text as "EC_LOCATION_ADDRESS_THREE" variable
    And I remember "DebugLevelName" text as "EC_LEVEL_NAME" variable
    And I remember "DebugPprSN" text as "EC_PPR_SN" variable
    And I remember "DebugPaperName" text as "EC_PAPER_NAME" variable
    And I remember "DebugPaperDescription" text as "EC_PAPER_DESCRIPTION" variable
    And I remember "DbCBAPprSN" text as "EC_CBA_PPR_SN" variable
    And I remember "DebugCBAPaperName" text as "EC_CBA_PAPER_NAME" variable
    And I remember "DebugCBAPaperDescription" text as "EC_CBA_PAPER_DESCRIPTION" variable
    And I remember "DebugSittingName" text as "EC_SITTING_NAME" variable
    And I remember "DebugMaterialTypeFDCode" text as "EC_MATERIAL_TYPE_FD_CODE" variable
    And I remember "DebugMaterialTypeFDDescription" text as "EC_MATERIAL_TYPE_FD_DESCRIPTION" variable
    And I remember "DebugMaterialTypeName" text as "EC_MATERIAL_TYPE_NAME" variable
    And I remember "DebugMaterialTypeDescription" text as "EC_MATERIAL_TYPE_DESCRIPTION" variable
    And I remember "DebugSessionDurationDescription" text as "EC_SESSION_DURATION_DESCRIPTION" variable
    And I remember "DebugSessionDurationDescriptionTwoDates" text as "EC_SESSION_DURATION_DESCRIPTION_TWO_DATES" variable
    And I remember "DebugClientName" text as "EC_CLIENT_NAME" variable
    And I remember "2000" text as "EC_PRICE" variable
    And I remember "10" text as "EC_WEIGHT" variable



    When I execute "Create Paper" reusable step replacing some steps
      |5|I set "PaperNameTwo[#####]" text to the "Name" "Product Factory text field"|
      |6|I set "PaperDescriptionNew[######]" text to the "Description" "Product Factory text field"|
      |10|I set "EC_PAPER_DESCRIPTION_NEW" text to the "Search" "Product Factory text field" from keyboard|
      |12|I should see the "EC_PAPER_NAME_NEW" element                                     |
    When I execute "Link Body To Paper" reusable step replacing some steps
      |3|I set "EC_PAPER_DESCRIPTION_NEW" text to the "Search" "Product Factory text field" from keyboard|
      |5|I click on the "EC_PAPER_NAME_NEW" "Product Factory Change Body button"|

    And I execute "Create Pricing Matrix" reusable step
    And I execute "Create Pricing Matrix Full" reusable step


    And I execute "Create Course Type" reusable step replacing some steps
      |4|I set "CourseTypeDescriptionNew[######]" text to the "Description" "Product Factory text field"|
      |13|I set "EC_COURSE_TYPE_DESCRIPTION_NEW" text to the "Search" "Product Factory text field" from keyboard |
      |15|I should see the "EC_COURSE_TYPE_DESCRIPTION_NEW" element                                     |
    When I execute "Create Region" reusable step replacing some steps
      |4|I set "RegionNameNew[######]" text to the "Name" "Product Factory text field"|
      |8|I should see the "EC_REGION_NAME_NEW" element                              |
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Prices" "Product Factory navigation sub item"
    When I click on the "EC_BODY_NAME" "Product Factory edit button"
    Then I click on the "Create" "Product Factory button"
    Then I set "EC_COURSE_TYPE_DESCRIPTION_NEW" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION_NEW" "Product Factory select button"
    And I "check" "EC_REGION_NAME_NEW" "Product Factory dialog checkbox"
    And I click on the "Next" button
    And I "check" "EC_PAPER_DESCRIPTION_NEW" "Product Factory dialog checkbox"
    And I click on the "Next" button
    And I set "888" text to the "Enter a Price (£)" "Product Factory text field"
    And I click on the "Next" button
    And I click on the "Finish" button