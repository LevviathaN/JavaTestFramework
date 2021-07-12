Feature: UAT Test Data Generation
  As a member of BPP Automation team
  I Want to be able to create reference data sets on UAT Product Factory environment
  In order to test integration between Product Factory and Digital Website

  @Runn
  Scenario Outline: Create Basic Reference Data in UAT
    Given I am on "https://generate.plus/en/number/isbn" URL
    And I click on the " generate" "button"
    And I capture text data "ISBN Generator Number Field" as "EC_ISBN" variable
    Given I am on "MD_COMMON_LINKS_PRODUCTFACTORYURLNEW" URL
    When I click on the "Sign in with Auth0" button
    And I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYUSER"
    And I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYPASSWORD"
    And I click on the "Product Factory Login" button

#    Body creation
    When I execute "Create Body Financial Dimension" reusable step replacing some steps
      |4|I set "$Auto[BodyFDCode]<varName>" text to the "Code" "Product Factory text field"|
      |5|I set "$Auto[BodyFDDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Create Vertical" reusable step replacing some steps
      |4|I set "$Auto[VerticalName]<varName>" text to the "Name" "Product Factory text field"|
    And I execute "Create Body" reusable step replacing some steps
      |4|I set "$Auto[BodyShortName]<varName>" text to the "Short Name" "Product Factory text field"|
      |5|I set "$Auto[BodyName]<varName>" text to the "Name" "Product Factory text field"|
#    Level creation
    And I execute "Create Level" reusable step replacing some steps
      |4|I set "$Auto[LevelShortName]<varName>" text to the "Short Name" "Product Factory text field"|
      |5|I set "$Auto[LevelName]<varName>" text to the "Name" "Product Factory text field"|
#    Paper creation
    And I execute "Create Paper" reusable step replacing some steps
      |4|I set "$At[PprSN]<shortVar>" text to the "Short Name" "Product Factory text field"|
      |5|I set "$Auto[PaperName]<varName>" text to the "Name" "Product Factory text field"|
      |6|I set "$Auto[PaperDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Link Body To Level" reusable step
    And I execute "Link Body To Paper" reusable step
    And I execute "Link Paper To Level" reusable step
#    Create data for Course: Course Type
    And I execute "Create VAT Rule" reusable step replacing some steps
      |4|I set "$Auto[VatRuleCode]<varName>" text to the "Code" "Product Factory text field"|
      |5|I set "$Auto[VatRuleDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Create Course Type Financial Dimension" reusable step replacing some steps
      |4|I set "$Auto[CourseTypeFDCode]<varName>" text to the "Code" "Product Factory text field"|
      |5|I set "$Auto[CourseTypeFDDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Create Course Type" reusable step replacing some steps
      |4|I set "$Auto[CourseTypeDescription]<varName>" text to the "Description" "Product Factory text field"|
#    Create data for Course: Location
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
#    Create data for Course: Sitting
    And I execute "Create Sitting" reusable step replacing some steps
      |4|I set "$Auto[SittingName]<varName>" text to the "Name" "Product Factory text field"|
#    Create Price
    And I execute "Create Pricing Matrix" reusable step
    And I execute "Create Pricing Matrix Full" reusable step replacing some steps
      |12|I set "~PricingMatrixPrice[1000]" text to the "Enter a Price (£)" "Product Factory text field"|
#    Create Material
    And I execute "Create Material Type Financial Dimension" reusable step replacing some steps
      |4|I set "$Auto[MaterialTypeFDCode]<varName>" text to the "Code" "Product Factory text field"|
      |5|I set "$Auto[MaterialTypeFDDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Create Material Type" reusable step replacing some steps
      |4|I set "$Auto[MaterialTypeName]<varName>" text to the "Name" "Product Factory text field"|
      |5|I set "$Auto[MaterialTypeDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Create Stock Site" reusable step replacing some steps
      |4|I set "$Auto[StockSiteName]<varName>" text to the "Name" "Product Factory text field"|
    And I execute "Create Material" reusable step replacing some steps
      |6|I set "~Price[2000]" text to the "Price (£)" "Product Factory text field"|
      |8|I set "~Weight[10]" text to the "Weight (kg)" "Product Factory text field"|
#    Create Course and its instance
    And I execute "Create Session Duration" reusable step replacing some steps
      |4|I set "$Auto[SessionDurationDescription]<varName>" text to the "Description" "Product Factory text field"|
    And I execute "Create Digital Content" reusable step
    And I execute "Create Stream" reusable step replacing some steps
      |4|I set "$Auto[StreamName]<varName>" text to the "Name" "Product Factory text field"|
    Then I execute "Create Course" reusable step
    And I execute "Create Course Instance" reusable step


    Examples:
      |type        |varName     |ecName       |shortVar|shortEc|
      |            |            |             |        |       |