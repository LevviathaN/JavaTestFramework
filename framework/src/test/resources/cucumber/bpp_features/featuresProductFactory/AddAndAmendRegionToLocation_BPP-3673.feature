@ProductFactory @Locations @Region
Feature: Add/Amend Region to Location - BPP-3673
  As a Senior Product Setter
  I need to be able to set a Price Region against a Location

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 @CoveredWithApi #TC-1869
  Scenario: Creating New Location without and with a Region record
    And I remember "AutoLocationFDCode" text as "EC_LOCATION_FD_CODE" variable
    And I remember "AutoLocationFDDescription" text as "EC_LOCATION_FD_DESCRIPTION" variable
    And I remember "AutoRegionFDCode" text as "EC_REGION_FD_CODE" variable
    And I remember "AutoRegionFDDescription" text as "EC_REGION_FD_DESCRIPTION" variable
    And I remember "AutoRegionName" text as "EC_REGION_NAME" variable
    And I execute modified "Create Location" reusable step
      |6|Delete||
      |7|Delete||
      |10|Add|Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"|
      |11|Add|I click on the "Region" "Product Factory dropdown"                           |
      |12|Add|I click on the "EC_REGION_NAME" "Product Factory dropdown option"            |

  @Positive @Regression @P1 #TC-1870
  Scenario: Edit Location that is not in use
    And I remember "AutoLocationFDCode" text as "EC_LOCATION_FD_CODE" variable
    And I remember "AutoLocationFDDescription" text as "EC_LOCATION_FD_DESCRIPTION" variable
    And I remember "AutoRegionFDCode" text as "EC_REGION_FD_CODE" variable
    And I remember "AutoRegionFDDescription" text as "EC_REGION_FD_DESCRIPTION" variable
    And I remember "AutoRegionName" text as "EC_REGION_NAME" variable
    And I remember "AutoRegionNameTwo" text as "EC_REGION_NAME_TWO" variable
    And I execute "Create Location" reusable step
    And I execute modified "Create Location" reusable step
      |3|Replace|I click on the "EC_LOCATION_NAME" "Product Factory edit button"|
      |4|Replace|I set "LocationNameWithNewRegion[#####]" text to the "Name" "Product Factory text field"|
      |7|Replace|I click on the "EC_REGION_NAME_TWO" "Product Factory dropdown option"                   |
      |11|Replace|I should see the "EC_LOCATION_NAME_WITH_NEW_REGION" element                            |
    And I shouldn't see the "The Location is already linked to one or more Prices, so you cannot change the Region" element
    And I shouldn't see the "The Location is already linked to one or more Sessions, so you cannot change the Region" element

  @Positive @Regression @P1 @CoveredWithAPI #TC-1871
  Scenario: Edit Location that is in use
    And I remember "AutoLocationFDCode" text as "EC_LOCATION_FD_CODE" variable
    And I remember "AutoLocationFDDescription" text as "EC_LOCATION_FD_DESCRIPTION" variable
    And I remember "AutoRegionFDCode" text as "EC_REGION_FD_CODE" variable
    And I remember "AutoRegionFDDescription" text as "EC_REGION_FD_DESCRIPTION" variable
    And I remember "AutoRegionName" text as "EC_REGION_NAME" variable
    And I remember "AutoRegionNameTwo" text as "EC_REGION_NAME_TWO" variable
    And I remember "AutoLocationName" text as "EC_LOCATION_NAME" variable
    And I remember "AutoLocationAddress" text as "EC_LOCATION_ADDRESS" variable
    And I remember "AutoLevelName" text as "EC_LEVEL_NAME" variable
    And I remember "AutoPprSN" text as "EC_PPR_SN" variable
    And I remember "AutoPaperName" text as "EC_PAPER_NAME" variable
    And I remember "AutoPaperDescription" text as "EC_PAPER_DESCRIPTION" variable
    And I remember "AutoSittingName" text as "EC_SITTING_NAME" variable
    And I remember "AutoMaterialTypeFDCode" text as "EC_MATERIAL_TYPE_FD_CODE" variable
    And I remember "AutoMaterialTypeFDDescription" text as "EC_MATERIAL_TYPE_FD_DESCRIPTION" variable
    And I remember "AutoMaterialTypeName" text as "EC_MATERIAL_TYPE_NAME" variable
    And I remember "AutoMaterialTypeDescription" text as "EC_MATERIAL_TYPE_DESCRIPTION" variable
    And I remember "AutoSessionDurationDescription" text as "EC_SESSION_DURATION_DESCRIPTION" variable
    And I remember "AutoSessionDurationDescriptionTwoDates" text as "EC_SESSION_DURATION_DESCRIPTION_TWO_DATES" variable
    And I remember "AutoClientName" text as "EC_CLIENT_NAME" variable
    And I remember "2000" text as "EC_PRICE" variable
    And I remember "10" text as "EC_WEIGHT" variable
    And I execute modified "Create Location" reusable step
      |3|Replace|I click on the "EC_LOCATION_NAME" "Product Factory edit button"|
      |4|Replace|I set "LocationNameWithNewRegion[#####]" text to the "Name" "Product Factory text field"|
      |7|Replace|I click on the "EC_REGION_NAME_TWO" "Product Factory dropdown option"                   |
      |11|Delete|I should see the "EC_LOCATION_NAME_WITH_NEW_REGION" element                            |
    And I should see the "The Location is already linked to one or more Sessions, so you cannot change the Region" element
    And I should see the "The Location is already linked to one or more Instances, so you cannot change the Region" element