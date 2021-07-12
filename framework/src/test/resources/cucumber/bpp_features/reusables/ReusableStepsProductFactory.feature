@Reusable
Feature: Product Factory
  As a product setter
  I want to be able to log into Product Factory
  In order to (just cause)

  Scenario: Log In
    Given I am on "MD_COMMON_LINKS_PRODUCTFACTORYURLNEW" URL
    When I click on the "Sign in with Auth0" button
    And I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYUSER"
    And I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYPASSWORD"
    And I click on the "Product Factory Login" button
#    Then I should be redirected to the "Product Factory" page

  Scenario: Create Body Financial Dimension
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Financial Dimensions" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "BodyFDCode[######]" text to the "Code" "Product Factory text field"
    And I set "BodyFDDescription[######]" text to the "Description" "Product Factory text field"
    And I click on the "Applies To" "Product Factory dropdown"
    And I click on the "Body" "Product Factory dropdown option"
    And I click on the "Dimension" "Product Factory dropdown"
    And I click on the "Product" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_BODY_FD_CODE" element

  Scenario: Create Location Financial Dimension
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Financial Dimensions" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "LocationFDCode[####]" text to the "Code" "Product Factory text field"
    And I set "LocationFDDescription[####]" text to the "Description" "Product Factory text field"
    And I click on the "Applies To" "Product Factory dropdown"
    And I click on the "Location" "Product Factory dropdown option"
    And I click on the "Dimension" "Product Factory dropdown"
    And I click on the "Product" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_LOCATION_FD_CODE" element

  Scenario: Create Region Financial Dimension
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Financial Dimensions" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "RegionFDCode[######]" text to the "Code" "Product Factory text field"
    And I set "RegionFDDescription[######]" text to the "Description" "Product Factory text field"
    And I click on the "Applies To" "Product Factory dropdown"
    And I click on the "Region" "Product Factory dropdown option"
    And I click on the "Dimension" "Product Factory dropdown"
    And I click on the "Product" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_REGION_FD_CODE" element

  Scenario: Create Course Type Financial Dimension
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Financial Dimensions" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "CourseTypeFDCode[######]" text to the "Code" "Product Factory text field"
    And I set "CourseTypeFDDescription[######]" text to the "Description" "Product Factory text field"
    And I click on the "Applies To" "Product Factory dropdown"
    And I click on the "Course Type" "Product Factory dropdown option"
    And I click on the "Dimension" "Product Factory dropdown"
    And I click on the "Product" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_COURSE_TYPE_FD_CODE" element

  Scenario: Create Material Type Financial Dimension
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Financial Dimensions" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "MaterialTypeFDCode[######]" text to the "Code" "Product Factory text field"
    And I set "MaterialTypeFDDescription[######]" text to the "Description" "Product Factory text field"
    And I click on the "Applies To" "Product Factory dropdown"
    And I click on the "Material Type" "Product Factory dropdown option"
    And I click on the "Dimension" "Product Factory dropdown"
    And I click on the "Product" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_MATERIAL_TYPE_FD_CODE" element

  Scenario: Create Material Financial Dimension
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Financial Dimensions" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "MaterialFDCode[######]" text to the "Code" "Product Factory text field"
    And I set "MaterialFDDescription[######]" text to the "Description" "Product Factory text field"
    And I click on the "Applies To" "Product Factory dropdown"
    And I click on the "Material" "Product Factory dropdown option"
    And I click on the "Dimension" "Product Factory dropdown"
    And I click on the "Product" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_MATERIAL_FD_CODE" element

  Scenario: Create Course Financial Dimension
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Financial Dimensions" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "CourseFDCode[######]" text to the "Code" "Product Factory text field"
    And I set "CourseFDDescription[######]" text to the "Description" "Product Factory text field"
    And I click on the "Applies To" "Product Factory dropdown"
    And I click on the "Course" "Product Factory dropdown option"
    And I click on the "Dimension" "Product Factory dropdown"
    And I click on the "Product" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_COURSE_FD_CODE" element

  Scenario: Create Body
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Bodies" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "BodyShortName[######]" text to the "Short Name" "Product Factory text field"
    And I set "BodyName[######]" text to the "Name" "Product Factory text field"
    And I click on the "Financial Dimension" "Product Factory dropdown"
    And I click on the "EC_BODY_FD_CODE" "Product Factory dropdown option"
    And I click on the "Vertical" "Product Factory dropdown"
    And I click on the "EC_VERTICAL_NAME" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_BODY_SHORT_NAME" element

  Scenario: Create Level
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Levels" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "LevelShortName[######]" text to the "Short Name" "Product Factory text field"
    And I set "LevelName[######]" text to the "Name" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_LEVEL_SHORT_NAME" element

    #todo remove search in the end
  Scenario: Create Paper
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Papers" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "PprSN[#####]" text to the "Short Name" "Product Factory text field"
    And I set "PaperName[#####]" text to the "Name" "Product Factory text field"
    And I set "PaperDescription[######]" text to the "Description" "Product Factory text field"
    And I click on the "Exam Schedule" "Product Factory dropdown"
    And I click on the "Not Applicable" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    And I wait for "5" seconds
    And I click on the "Search" "Product Factory text field"
    Then I set "EC_PAPER_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_PAPER_NAME" element
    And I click on the "Clear the search text" "element by title"

  Scenario: Link Body To Paper
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Papers" "Product Factory navigation sub item"
    Then I set "EC_PAPER_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    When I click on the "EC_PAPER_NAME" "Product Factory Change Body button"
    And I click on the "EC_BODY_NAME" "Product Factory select button"
    Then I click on the "Yes" "Product Factory button"
    And I click on the "Clear the search text" "element by title"

  Scenario: Link Paper To Level
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Papers" "Product Factory navigation sub item"
    Then I set "EC_PAPER_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    When I click on the "EC_PAPER_NAME" "Product Factory Link Levels button"
    And I "check" "EC_LEVEL_NAME" "Product Factory dialog checkbox"
    And I click on the "Save" "Product Factory button"
    And I click on the "Clear the search text" "element by title"

  Scenario: Create Sitting
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Sittings" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "SittingName[######]" text to the "Name" "Product Factory text field"
    And I remember "22/02/2022" text as "EC_SITTING_START_DATE" variable
    And I set "EC_SITTING_START_DATE" text to the "Start Date" "Product Factory text field"
    And I remember "10/10/2025" text as "EC_SITTING_END_DATE" variable
    And I set "EC_SITTING_END_DATE" text to the "End Date" "Product Factory text field"
    And I "check" "EC_BODY_NAME" "Product Factory dialog checkbox"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_SITTING_NAME" element

  Scenario: Create Location
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Locations" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "LocationName[######]" text to the "Name" "Product Factory text field"
    And I set "LocationAddress[######]" text to the "Address Line 1" "Product Factory text field"
    And I click on the "Region" "Product Factory dropdown"
    And I click on the "EC_REGION_NAME" "Product Factory dropdown option"
    And I click on the "Financial Dimension" "Product Factory dropdown"
    And I click on the "EC_LOCATION_FD_DESCRIPTION" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_LOCATION_NAME" element

  Scenario: Create Region
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Region" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "RegionName[######]" text to the "Name" "Product Factory text field"
    And I click on the "Financial Dimension" "Product Factory dropdown"
    And I click on the "EC_REGION_FD_DESCRIPTION" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_REGION_NAME" element

  Scenario: Create Session Duration
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Session Durations" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "SessionDurationDescription[######]" text to the "Description" "Product Factory text field"
    And I set "1" text to the "Number of Dates" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_SESSION_DURATION_DESCRIPTION" element

  Scenario: Create Course Type
    When I click on the "Types" "Product Factory navigation item"
    When I click on the "Course Types" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "CourseTypeDescription[######]" text to the "Description" "Product Factory text field"
    And I click on the "VAT Rule" "Product Factory dropdown"
    And I click on the "EC_VAT_RULE_CODE" "Product Factory dropdown option"
    And I click on the "Cost Centre Financial Dimension" "Product Factory dropdown"
    And I click on the "EC_COURSE_TYPE_FD_CODE" "Product Factory dropdown option"
    And I click on the "Project Financial Dimension" "Product Factory dropdown"
    And I click on the "EC_COURSE_TYPE_FD_CODE" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    And I wait for "3" seconds
    Then I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I should see the "EC_COURSE_TYPE_DESCRIPTION" element
    And I click on the "Clear the search text" "element by title"

  Scenario: Create Material Type
    When I click on the "Types" "Product Factory navigation item"
    When I click on the "Material Types" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "MaterialTypeName[######]" text to the "Name" "Product Factory text field"
    And I set "MaterialTypeDescription[######]" text to the "Description" "Product Factory text field"
    And I click on the "Financial Dimension" "Product Factory change button"
    And I click on the "EC_MATERIAL_TYPE_FD_CODE" "Product Factory select button"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_MATERIAL_TYPE_DESCRIPTION" element

  Scenario: Create Programme
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "University Programmes" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "ProgrammeCode[######]" text to the "Code" "Product Factory text field"
    And I set "ProgrammeName[######]" text to the "Name" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_PROGRAMME_NAME" element

  Scenario: Create Programme Cohort
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Programme Cohorts" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I click on the "University Programme" "Product Factory change button"
    And I click on the "EC_PROGRAMME_CODE" "Product Factory select button"
    And I set "~CohortStartDate[TODAY]" text to the "Start Teaching Date" "Product Factory text field"
    And I set "CohortName[######]" text to the "Name" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_COHORT_NAME" element

  Scenario: Create Module Section
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Module Sections" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I click on the "Programme Cohort" "Product Factory change button"
    And I click on the "EC_COHORT_NAME" "Product Factory select button"
    And I set "ModuleSectionName[######]" text to the "Name" "Product Factory text field"
    And I set "~SISTermCode[######]" text to the "SIS Term Code" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_MODULE_SECTION_NAME" element

  Scenario: Create Client
    When I click on the "Miscellaneous" "Product Factory navigation item"
    When I click on the "Clients" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "ClientName[######]" text to the "Name" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_CLIENT_NAME" element

  Scenario: Create Study Mode
    When I click on the "Types" "Product Factory navigation item"
    When I click on the "Study Modes" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "StudyModeName[######]" text to the "Name" "Product Factory text field"
    And I set "StudyModeDescription[######]" text to the "Description" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_STUDY_MODE_NAME" element

  Scenario: Create Vertical
    When I click on the "Miscellaneous" "Product Factory navigation item"
    When I click on the "Verticals" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "VerticalName[######]" text to the "Name" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
#    Then I should see the "EC_VERTICAL_NAME" element

  Scenario: Create Stream
    When I click on the "Miscellaneous" "Product Factory navigation item"
    When I click on the "Streams" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "StreamName[######]" text to the "Name" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_STREAM_NAME" element

  Scenario: Create Deactivation Reason
    When I click on the "Miscellaneous" "Product Factory navigation item"
    When I click on the "Deactivation Reasons" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "DeactivationReasonDescription[######]" text to the "Description" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_DEACTIVATION_REASON_DESCRIPTION" element

  Scenario: Create Pricing Matrix
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Prices" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I wait for "2" seconds
    And I click on the "Body" "Product Factory change button"
    And I click on the "EC_BODY_NAME" "Product Factory change modal option"
    And I click on the "Sitting" "Product Factory change button"
    And I click on the "EC_SITTING_NAME" "Product Factory change modal option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_BODY_NAME" element

    #todo rename to Create Price, since it is more correct
  Scenario: Create Pricing Matrix Full
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Prices" "Product Factory navigation sub item"
    When I click on the "EC_BODY_NAME" "Product Factory edit button"
    Then I click on the "Create" "Product Factory button"
    Then I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory select button"
    And I "check" "EC_REGION_NAME" "Product Factory dialog checkbox"
    And I click on the "Next" button
    And I click on the "EC_PAPER_NAME" "Product Factory dialog checkbox"
    And I click on the "Next" button
    And I set "~PricingMatrixPrice[####]" text to the "Enter a Price (£)" "Product Factory text field"
    And I click on the "Next" button
    And I click on the "Finish" button

  Scenario: Create VAT Rule
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "VAT Rules" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "VatRuleCode[######]" text to the "Code" "Product Factory text field"
    And I set "VatRuleDescription[######]" text to the "Description" "Product Factory text field"
    And I set "~VatRuleRate[70]" text to the "VAT Rate (%)" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_VAT_RULE_CODE" element

  Scenario: Link Body To Level
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Bodies" "Product Factory navigation sub item"
    Then I click on the "EC_BODY_NAME" "Product Factory Link Levels button"
    And I "check" "EC_LEVEL_NAME" "Product Factory dialog checkbox"
    And I click on the "Save" "Product Factory button"

  Scenario: Create Material
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Materials" "Product Factory navigation sub item"
    And I click on the "Create" "Product Factory button"
    And I click on the "BPP Learning Media" "Product Factory button"
    And I click on the "EC_MATERIAL_TYPE_NAME" "Product Factory select button"
    And I set "~Price[####]" text to the "Price (£)" "Product Factory text field"
    And I set "~Cost[####]" text to the "Cost (£)" "Product Factory text field"
    And I set "~Weight[##]" text to the "Weight (kg)" "Product Factory text field"
    And I set "EC_ISBN" text to the "ISBN" "Product Factory text field"
    And I set "From[TODAY]" text to the "Available From" "Product Factory text field"
    And I set "10/10/2022" text to the "Expiry Date" "Product Factory text field"
    And I set "1020" text to the "Edition" "Product Factory text field"
    And I click on the "Learning Media VAT Rule" "Product Factory change button"
    And I click on the "EC_VAT_RULE_CODE" "Product Factory select button"
    And I click on the "Course Material VAT Rule" "Product Factory change button"
    And I click on the "EC_VAT_RULE_CODE" "Product Factory select button"
    And I click on the "Next" "Product Factory button"
    And I click on the "Choose a Body" "button"
    And I click on the "EC_BODY_NAME" "Product Factory select button"
    And I click on the "Next" "Product Factory button"
    And I "check" "EC_LEVEL_NAME" "Product Factory checkbox"
    And I click on the "Next" "Product Factory button"
    And I "check" "EC_SITTING_NAME" "Product Factory checkbox"
    And I click on the "Next" "Product Factory button"
    And I click on the "Add Material Stock Site" "element by title"
    And I click on the "Stock Site" "Product Factory dropdown"
    And I click on the "EC_STOCK_SITE_NAME" "Product Factory dropdown option"
    And I click on the "Production Method" "Product Factory dropdown"
    And I click on the "Managed" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"
    And I wait for "5" seconds

  Scenario: Create Course
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I click on the "Create" "Product Factory button"
    Then I set "EC_PAPER_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_PAPER_NAME" "Product Factory select button" by JS
    And I click on the "EC_LEVEL_NAME" "Product Factory select button"
    And I click on the "EC_SITTING_NAME" "Product Factory select button"
    Then I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field two" from keyboard
    And I click on the "submit" "element by type two"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory select button" by JS
    And I click on the "EC_REGION_NAME" "Product Factory select button"
    And I click on the "Product Factory Number Of Sessions Edit Button" button
    When I set "1" text to the "Number of Sessions" "Product Factory text field"
    And I click on the "Yes" "Product Factory button title"
    And I click on the "Product Factory Number Of Steps Edit Button" button
    When I set "1" text to the "Number of Steps" "Product Factory text field"
    And I click on the "Yes" "Product Factory button title"
    And I click on the "Finish" "Product Factory button"

  Scenario: Create Course Instance
    Given I click on the "Create" "Product Factory button"
    And I click on the "Default Session Duration" "Product Factory dropdown"
    And I click on the "EC_SESSION_DURATION_DESCRIPTION" "Product Factory dropdown option"
    And I click on the "Default Location" "Product Factory dropdown"
    And I click on the "EC_LOCATION_NAME" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"

  Scenario: Clean Database
    Given I am on "MD_COMMON_LINKS_PRODUCTFACTORYDATABASEURLNEW" URL
    When I fill the "Product Factory Database Connect URL Field" field with "bolt://ec2-3-10-141-78.eu-west-2.compute.amazonaws.com:7687"
    Then I fill the "Product Factory Database Username Field" field with "MD_COMMON_LINKS_PRODUCTFACTORYDATABASEUSERNEW"
    And I fill the "Product Factory Database Password Field" field with "MD_COMMON_LINKS_PRODUCTFACTORYDATABASEPASSWORDNEW"
    And I click on the "Product Factory Database Connect Button" button
    When I click on the "Product Factory Database Query Field" button
    And I fill the "Product Factory Database Query Field" field with "MATCH (n) DETACH DELETE n"
    Then I click on the "Product Factory Database Submit Query Button" button

  Scenario: System Settings
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Financial Dimensions" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "FDCode[######]" text to the "Code" "Product Factory text field"
    And I set "FDDescription[######]" text to the "Description" "Product Factory text field"
    And I click on the "Applies To" "Product Factory dropdown"
    And I click on the "Course" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_FD_CODE" element
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I click on the "Entity Dimension" "Product Factory change button"
    And I click on the "EC_FD_CODE" "Product Factory select button"
    And I click on the "Revenue Dimension" "Product Factory change button"
    And I click on the "EC_FD_CODE" "Product Factory select button"
    And I click on the "Save" "Product Factory button"

    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Financial Dimensions" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "FDCode[######]" text to the "Code" "Product Factory text field"
    And I set "FDDescription[####]" text to the "Description" "Product Factory text field"
    And I click on the "Applies To" "Product Factory dropdown"
    And I click on the "Material" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_FD_CODE" element
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Materials" "Product Factory navigation sub item"
    And I click on the "Entity Dimension" "Product Factory change button"
    And I click on the "EC_FD_CODE" "Product Factory select button"
    And I click on the "Revenue Dimension" "Product Factory change button"
    And I click on the "EC_FD_CODE" "Product Factory select button"
    And I click on the "Save" "Product Factory button"

  Scenario: Create CBA Record
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
    And I click on the "Create" "Product Factory button"
    And I click on the "EC_CBA_SESSION_DURATION_DESCRIPTION" "Product Factory select button"
    And I click on the "Region" "Product Factory dropdown"
    And I click on the "EC_REGION_NAME" "element"
    And I click on the "Location" "Product Factory dropdown"
    And I click on the "EC_LOCATION_NAME" "element"
    And I fill the "Product Factory CBA Wizard Date" field with "[TODAY]"
    And I fill the "Product Factory CBA Wizard Start Time" field with "~CBAStartTime[01:00AM]"
    And I click on the "Add Date & Time" "element by title"
    And I click on the "Next" "Product Factory button"
    And I set "1" text to the "Default Capacity" "Product Factory text field"
    And I set "~DefaultInstituteFee[###]" text to the "Default Institute Fee (£)" "Product Factory text field"
    And I click on the "Next" "Product Factory button"
#    Then I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
#    And I click on the "submit" "element by type"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory select button"
    And I click on the "Sitting" "Product Factory dropdown"
    And I click on the "EC_SITTING_NAME" "Product Factory dropdown option"
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "EC_BODY_NAME" "Product Factory dropdown option"
    And I click on the "Paper" "Product Factory dropdown"
    And I click on the "EC_CBA_PAPER_NAME" "Product Factory dropdown option"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"

  Scenario: Create CBA Course
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
    Then I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory edit button"
    And I click on the "Courses" "element"
    When I click on the "Create" "Product Factory button"
#    Then I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
#    And I click on the "submit" "element by type"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory select button"
    And I click on the "Sitting" "Product Factory dropdown"
    And I click on the "EC_SITTING_NAME" "Product Factory dropdown option"
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "EC_BODY_NAME" "Product Factory dropdown option"
    And I click on the "Paper" "Product Factory dropdown"
    And I click on the "EC_CBA_PAPER_NAME" "Product Factory dropdown option"
    And I click on the "Finish" "Product Factory button"

  Scenario: Create Digital Content
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I click on the "Professional Qualifications" "text contained in SPAN element"
    And I click on the "Totara" "Product Factory button"
    And I click on the "Save" "Product Factory button"
    And I wait for "6" seconds
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "EC_BODY_NAME" "Product Factory dropdown option"
    And I click on the "Level" "Product Factory dropdown"
    And I click on the "EC_LEVEL_NAME" "Product Factory dropdown option"
    And I click on the "Paper" "Product Factory dropdown"
    And I click on the "EC_PAPER_NAME" "Product Factory dropdown option"
    And I click on the "Next" "Product Factory button"
    And I "check" "EC_SITTING_NAME" "Product Factory dialog checkbox"
    And I click on the "Next" "Product Factory button"
    Then I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I "check" "EC_COURSE_TYPE_DESCRIPTION" "Product Factory dialog checkbox"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"

  Scenario: Generate ISBN
    Given I am on "https://generate.plus/en/number/isbn" URL
    And I click on the " generate" "button"
    And I capture text data "ISBN Generator Number Field" as "EC_ISBN" variable
    
  Scenario: Keep the Course Activated
    Given I click on the "Activate" "Product Factory button" if "Activate,Product Factory button" "special element is present"
    Given I click on the "Reactivate" "Product Factory button" if "(Deactivated)" "element is present"
    When I click on the "Yes" "Product Factory button" if "Yes,Product Factory button" "special element is present"
    And I should see the "Deactivate" "Product Factory button"

  Scenario: Keep the Course Instance Activated
    And I click on the "EC_LOCATION_NAME" "Product Factory course instance Activate button" if "EC_LOCATION_NAME,Product Factory course instance Activate button" "special element is present"
    And I shouldn't see the "EC_LOCATION_NAME" "Product Factory course instance Delete button"

  Scenario: Edit Course
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory edit button"

  Scenario: Edit Material
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Materials" "Product Factory navigation sub item"
    And I set "EC_MATERIAL_TYPE_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_MATERIAL_TYPE_NAME" "Product Factory edit button"

  Scenario: Populate Course Instance Session Dates
    When I click on the "EC_LOCATION_NAME" "Product Factory course instance sessions dropdown button"
    And I click on the "EC_LOCATION_NAME" "Product Factory Session Dates button"
    And I fill the "Product Factory Session Dates Popup Date Input Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Input Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Input Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"

  Scenario: Populate Course Instance Step Due Dates
    And I click on the "Product Factory Change Course Step Due Date" button
    And I set "[TODAY]" text to the "Due Date" "Product Factory text field"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"
    
  Scenario: Delete All Course Materials
    Given For each "EC_MATERIAL_TYPE_DESCRIPTION" element:
      |I click on the "EC_MATERIAL_TYPE_DESCRIPTION" "Product Factory Material Delete by price button"|
      |I click on the "Yes" "Product Factory button"|
      |I wait for "3" seconds                       |

  Scenario: Create Exam Preparation
    When I click on the "Types" "Product Factory navigation item"
    When I click on the "Exam Preparations" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "ExamPreparationName[######]" text to the "Name" "Product Factory text field"
    And I set "ExamPreparationDescription[######]" text to the "Description" "Product Factory text field"
    And I click on the "Save" "Product Factory button"

  Scenario: Create Stock Site
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Stock Sites" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    And I set "StockSiteName[######]" text to the "Name" "Product Factory text field"
    And I set "StockSiteAddress[######]" text to the "Address Line 1" "Product Factory text field"
    And I set "StockSiteAddressLineTwo[######]" text to the "Address Line 2" "Product Factory text field"
    And I set "StockSiteAddressLineThree[######]" text to the "Address Line 3" "Product Factory text field"
    And I set "StockSiteCity[###]" text to the "City" "Product Factory text field"
    And I click on the "Country" "Product Factory dropdown"
    And I click on the "Albania" "Product Factory dropdown option"
    And I set "~StockSitePostcode[######]" text to the "Postcode" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "EC_STOCK_SITE_NAME" element

  Scenario: Keep Course Available On Website
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I click on the "Additional Filters" "button"
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "[EC_BODY_SHORT_NAME] - [EC_BODY_NAME]" "Product Factory dropdown option"
    And I click on the "Done" "Product Factory button"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory Course Page checkbox"
    And I click on the "Perform Bulk Operation" button
    And I click on the "Make available on website" "element by title" if "Make available on website,element by title" "Product Factory special element is enabled"
    Then Attribute "tabindex" of "Make available on website" "element by title" should have value "-1"

  Scenario: Keep Course Removed From Website
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I click on the "Additional Filters" "button"
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "[EC_BODY_SHORT_NAME] - [EC_BODY_NAME]" "Product Factory dropdown option"
    And I click on the "Done" "Product Factory button"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory Course Page checkbox"
    And I click on the "Perform Bulk Operation" button
    And I click on the "Remove from the website" "element by title" if "Remove from the website,element by title" "Product Factory special element is enabled"
    Then Attribute "tabindex" of "Remove from the website" "element by title" should have value "-1"