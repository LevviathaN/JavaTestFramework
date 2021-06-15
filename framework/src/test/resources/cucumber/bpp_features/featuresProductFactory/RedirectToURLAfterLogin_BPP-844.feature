@ProductFactory @Redirect
Feature: Redirect to Requested URL after Authentication - BPP-844

  @Positive @Regression @P1 #TC-3445
  Scenario: Redirect to URL after Authentication - Senior Product Setter
    Given I execute "Log In" reusable step
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Bodies" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Bodies" element

    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Levels" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Levels" element

    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Papers" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Papers" element

    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Sittings" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Sittings" element

    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Region" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Regions" element

    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Locations" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Locations" element

    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Session Durations" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Session Durations" element

    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Digital Content" element

    When I click on the "Types" "Product Factory navigation item"
    When I click on the "Material Types" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Material Types" element

    When I click on the "Types" "Product Factory navigation item"
    When I click on the "Course Types" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Course Types" element

    When I click on the "Miscellaneous" "Product Factory navigation item"
    When I click on the "Clients" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Clients" element
#todo temporary fix

#    When I click on the "Miscellaneous" "Product Factory navigation item"
#    When I click on the "Deactivation Reasons" "Product Factory navigation sub item"
#    Then I capture current URL as "EC_SAVED_URL" variable
#    When I click on the "exit_to_app" button
#    And I execute "Log In" reusable step replacing some steps
#      |1|I am on "EC_SAVED_URL" URL|
#    Then I should see the "Deactivation Reasons" element

  @Positive @Regression @P1 #TC-3445
  Scenario: Redirect to URL after Authentication 2 - Senior Product Setter
    Given I execute "Log In" reusable step
    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Prices" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Pricing Matrices" element

    When I click on the "Miscellaneous" "Product Factory navigation item"
    When I click on the "Streams" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Streams" element

    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "VAT Rules" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "VAT Rules" element

    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Financial Dimensions" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Financial Dimensions" element

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Materials" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Materials" element

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Courses" element

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "CBAs" element

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Create Material" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Create Material" element

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Create Course" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Create Course" element

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Create CBA" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
    Then I should see the "Create CBA" element

#  @Positive @Regression @P1 #TC-3445
#  Scenario Outline: Redirect to <submenu> URL after Authentication - Senior Product Setter
#    Given I execute "Log In" reusable step
#    When I click on the "<menu>" "Product Factory navigation item"
#    When I click on the "<submenu>" "Product Factory navigation sub item"
#    Then I capture current URL as "EC_SAVED_URL" variable
#    When I click on the "exit_to_app" button
#    And I execute "Log In" reusable step replacing some steps
#      |1|I am on "EC_SAVED_URL" URL|
#    Then I should see the "<validate>" element
#
#    Examples:
#    |menu|submenu|validate|
#    |Programme|Bodies|Bodies|
#    |Programme|Levels|Levels|
#    |Programme|Papers|Papers|
#    |Delivery|Sittings|Sittings|
#    |Delivery|Region|Regions|
#    |Delivery|Locations|Locations|
#    |Delivery|Session Durations|Session Durations|
#    |Delivery|Digital Content|Digital Content|
#    |Types   |Material Types |Material Types |
#    |Types   |Course Types   |Course Types   |
#    |Miscellaneous|Clients   |Clients   |
#    |Miscellaneous|Streams   |Streams   |
#    |Miscellaneous|Deactivation Reasons|Deactivation Reasons|
#    |Financials   |Prices              |Pricing Matrices|
#    |Financials   |VAT Rules           |VAT Rules           |
#    |Financials   |Financial Dimensions|Financial Dimensions|
#    |Products     |Materials           |Materials           |
#    |Products     |Courses             |Courses             |
#    |Products     |CBAs                |CBAs                |
#    |Products     |Create Material     |Create Material     |
#    |Products     |Create Course       |Create Course       |
#    |Products     |Create CBA          |Create CBA          |

  @Positive @Regression @P1 #TC-3446
  Scenario: Redirect to URL after Authentication - Simple Product Setter
    Given I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Bodies" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Bodies" element

    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Levels" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Levels" element

    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Papers" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Papers" element

    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Sittings" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Sittings" element

    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Region" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Regions" element

    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Locations" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Locations" element

    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Session Durations" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Session Durations" element

    When I click on the "Delivery" "Product Factory navigation item"
    When I click on the "Digital Content" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Digital Content" element

    When I click on the "Types" "Product Factory navigation item"
    When I click on the "Material Types" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Material Types" element

    When I click on the "Types" "Product Factory navigation item"
    When I click on the "Course Types" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Course Types" element

    When I click on the "Miscellaneous" "Product Factory navigation item"
    When I click on the "Clients" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Clients" element


  @Positive @Regression @P1 #TC-3446
  Scenario: Redirect to URL after Authentication 2 - Simple Product Setter
    Given I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    When I click on the "Miscellaneous" "Product Factory navigation item"
    When I click on the "Deactivation Reasons" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Deactivation Reasons" element

    When I click on the "Miscellaneous" "Product Factory navigation item"
    When I click on the "Streams" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Streams" element

    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "Prices" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Pricing Matrices" element

    When I click on the "Financials" "Product Factory navigation item"
    When I click on the "VAT Rules" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "VAT Rules" element

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Materials" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Materials" element

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Courses" element

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "CBAs" element

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Create Material" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Create Material" element

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Create Course" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Create Course" element

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Create CBA" "Product Factory navigation sub item"
    Then I capture current URL as "EC_SAVED_URL" variable
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_SAVED_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "Create CBA" element

#  @Positive @Regression @P1 #TC-3446
#  Scenario Outline: Redirect to <submenu> URL after Authentication - Simple Product Setter
#    Given I execute "Log In" reusable step replacing some steps
#      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
#      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
#    When I click on the "<menu>" "Product Factory navigation item"
#    When I click on the "<submenu>" "Product Factory navigation sub item"
#    Then I capture current URL as "EC_BODIES_URL" variable
#    When I click on the "exit_to_app" button
#    And I execute "Log In" reusable step replacing some steps
#      |1|I am on "EC_BODIES_URL" URL|
#    Then I should see the "<validate>" element
#
#    Examples:
#      |menu|submenu|validate|
#      |Programme|Bodies|Bodies|
#      |Programme|Levels|Levels|
#      |Programme|Papers|Papers|
#      |Delivery|Sittings|Sittings|
#      |Delivery|Region|Regions|
#      |Delivery|Locations|Locations|
#      |Delivery|Session Durations|Session Durations|
#      |Delivery|Digital Content|Digital Content|
#      |Types   |Material Types |Material Types |
#      |Types   |Course Types   |Course Types   |
#      |Miscellaneous|Clients   |Clients   |
#      |Miscellaneous|Streams   |Streams   |
#      |Miscellaneous|Deactivation Reasons|Deactivation Reasons|
#      |Financials   |Prices              |Pricing Matrices|
#      |Financials   |VAT Rules           |VAT Rules           |
#      |Products     |Materials           |Materials           |
#      |Products     |Courses             |Courses             |
#      |Products     |CBAs                |CBAs                |
#      |Products     |Create Material     |Create Material     |
#      |Products     |Create Course       |Create Course       |
#      |Products     |Create CBA          |Create CBA          |

  @Negative @Regression @P1 #TC-3447
  Scenario: Redirect to Requested URL after Authentication - Simple Product Setter Restrictions
    Given I execute "Log In" reusable step
    When I execute "Create Body Financial Dimension" reusable step
    And I click on the "EC_BODY_FD_CODE" "Product Factory edit button"
    Then I capture current URL as "EC_BODIES_URL" variable
    When I click on the "exit_to_app" button
    Given I execute "Log In" reusable step replacing some steps
      |1|I am on "EC_BODIES_URL" URL|
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Then I should see the "PAGE FORBIDDEN" message