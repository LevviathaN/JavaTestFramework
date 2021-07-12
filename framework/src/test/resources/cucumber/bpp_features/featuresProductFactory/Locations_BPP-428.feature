@ProductFactory @Locations @HappyPath
Feature: Reference Data - Location - BPP-428
  As a Senior Product Setter
  I need to be able to create Locations specifying the Name (unique) and the Address text box.

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoLocationFDDescription" text as "EC_LOCATION_FD_DESCRIPTION" variable
    And I remember "AutoRegionName" text as "EC_REGION_NAME" variable

  @Positive @Regression @P1 #TC-775
  Scenario: Add a New Location Using a Modal
    Given I execute modified "Create Location" reusable step
      |6|Add|I set "LocationAddressLineTwo[######]" text to the "Address Line 2" "Product Factory text field"|
      |7|Add|I set "LocationAddressLineThree[######]" text to the "Address Line 3" "Product Factory text field"|
      |8|Add|I set "City[###]" text to the "City" "Product Factory text field"                                 |
      |9|Add|I click on the "Country" "Product Factory dropdown"|
      |10|Add|I click on the "Albania" "Product Factory dropdown option"|
      |11|Add|I set "~Postcode[######]" text to the "Postcode" "Product Factory text field"|

  @Negative @P2 #TC-774
  Scenario: Submitting Incomplete Location Fields
    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Locations" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

  @Negative @P2 #TC-776
  Scenario: Add a Location Where Name Already Exists
    Given I remember "AutoLocationName" text as "EC_LOCATION_NAME" variable
    Given I execute modified "Create Location" reusable step
      |4|Replace|I set "EC_LOCATION_NAME" text to the "Name" "Product Factory text field"|
      |11|Replace|I should see the "Name must be unique" "message"                       |

  @Positive @Regression @P1 #TC-4180
  Scenario: Add a New Location Populate Only Mandatory Fields
    Given I execute modified "Create Location" reusable step
      |5|Delete||