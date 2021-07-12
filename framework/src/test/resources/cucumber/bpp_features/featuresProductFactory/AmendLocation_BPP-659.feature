@ProductFactory @Locations @Amend
Feature: Amend Reference Data - Location - BPP-659
  As a Senior Product Setter
  I need to be able to amend Locations specifying the Name (unique) and the Address text box.

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoLocationFDCodeTwo" text as "EC_LOCATION_FD_CODE_TWO" variable
    And I remember "AutoLocationFDDescriptionTwo" text as "EC_LOCATION_FD_DESCRIPTION_TWO" variable
    And I remember "AutoRegionFDCode" text as "EC_REGION_FD_CODE" variable
    And I remember "AutoRegionFDDescription" text as "EC_REGION_FD_DESCRIPTION" variable
    And I remember "AutoLocationNameEdit" text as "EC_LOCATION_NAME" variable
    And I remember "AutoLocationAddressEdit" text as "EC_LOCATION_ADDRESS" variable


  @Positive @P1 #TC-832
  Scenario: Amend Location
    Then I execute "Create Region" reusable step replacing some steps
      |4|I set "RegionNameTwo[######]" text to the "Name" "Product Factory text field"|
      |8|I should see the "EC_REGION_NAME_TWO" element                                |
    When I execute modified "Create Location" reusable step
      |4|Replace|I set "LocationNameTwo[######]" text to the "Name" "Product Factory text field"|
      |5|Replace|I set "LocationAddressTwo[######]" text to the "Address Line 1" "Product Factory text field"|
      |7|Replace|I click on the "EC_REGION_NAME_TWO" "Product Factory dropdown option"|
      |9|Replace|I click on the "EC_LOCATION_FD_DESCRIPTION_TWO" "Product Factory dropdown option"|
      |11|Replace|I should see the "EC_LOCATION_NAME_TWO" "element"|