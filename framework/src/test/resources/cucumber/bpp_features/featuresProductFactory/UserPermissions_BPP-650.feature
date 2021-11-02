@ProductFactory @UserPermissions
Feature: Apply user permissions to frontend features - BPP-650
  As a User,
  I want different features of the frontend application to be hidden or disabled when I does not have specific permission to access those features,
  so that they can be associated to the audit when deactivating Courses.

  @Positive @Regression @P1 @HappyPath #TC-680, TC-681
  Scenario: Validate User Permissions
    Given I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|

    When I click on the "Programme" "Product Factory navigation item"
    And I click on the "Bodies" "Product Factory navigation sub item"
    Then I shouldn't see the "Product Factory Edit Button" element
    And I should see the "Short Name" element
    And I should see the "Name" element

    When I click on the "Programme" "Product Factory navigation item"
    And I click on the "Levels" "Product Factory navigation sub item"
    Then I shouldn't see the "Product Factory Edit Button" element
    And I should see the "Short Name" element
    And I should see the "Name" element

    When I click on the "Programme" "Product Factory navigation item"
    And I click on the "Papers" "Product Factory navigation sub item"
    Then I shouldn't see the "Product Factory Edit Button" element
    And I should see the "Name" element
    And I should see the "Body" element

    When I click on the "Delivery" "Product Factory navigation item"
    And I click on the "Sittings" "Product Factory navigation sub item"
    Then I shouldn't see the "Product Factory Edit Button" element
    And I should see the "Name" element
    And I should see the "Start Date" element
    And I should see the "End Date" element

    When I click on the "Delivery" "Product Factory navigation item"
    And I click on the "Region" "Product Factory navigation sub item"
    Then I shouldn't see the "Product Factory Edit Button" element
    And I should see the "Name" element

    When I click on the "Delivery" "Product Factory navigation item"
    And I click on the "Locations" "Product Factory navigation sub item"
    Then I shouldn't see the "Product Factory Edit Button" element
    And I should see the "Name" element
    And I should see the "Address" element

    When I click on the "Delivery" "Product Factory navigation item"
    And I click on the "Session Durations" "Product Factory navigation sub item"
    Then I shouldn't see the "Product Factory Edit Button" element
    And I should see the "Description" element
    And I should see the "Number of Dates" element

    When I click on the "Types" "Product Factory navigation item"
    And I click on the "Material Types" "Product Factory navigation sub item"
    Then I shouldn't see the "Product Factory Edit Button" element
    And I should see the "Name" element
    And I should see the "Description" element

    When I click on the "Types" "Product Factory navigation item"
    And I click on the "Course Types" "Product Factory navigation sub item"
    Then I shouldn't see the "Product Factory Edit Button" element
    And I should see the "Description" element

    When I click on the "Miscellaneous" "Product Factory navigation item"
    And I click on the "Clients" "Product Factory navigation sub item"
    Then I shouldn't see the "Product Factory Edit Button" element
    And I should see the "Name" element

    When I click on the "Miscellaneous" "Product Factory navigation item"
    And I click on the "Deactivation Reasons" "Product Factory navigation sub item"
    Then I shouldn't see the "Product Factory Edit Button" element
    And I should see the "Description" element

    When I click on the "Financials" "Product Factory navigation item"
    And I click on the "Prices" "Product Factory navigation sub item"
    Then I shouldn't see the "Product Factory Edit Button" element
    And I should see the "Body" element
    And I should see the "Sitting" element

    When I click on the "Financials" "Product Factory navigation item"
    And I click on the "VAT Rules" "Product Factory navigation sub item"
    Then I shouldn't see the "Product Factory Edit Button" element
    And I should see the "Code" element
    And I should see the "Description" element

    When I click on the "Financials" "Product Factory navigation item"
    Then I shouldn't see the "Financial Dimensions" "Product Factory navigation sub item"