@ProductFactory @CBA @Deactivation
Feature: CBA - deactivation/reactivation - BPP-3211
  As a Product Setter
  when I am editing a CBA
  I want the ability to deactivate the CBA (and the associated Courses).

  Background:
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Given I execute "Remember Variables For Creation " reusable step

    And I remember "AutoSittingNameTwo" text as "EC_SITTING_NAME_TWO" variable
    And I remember "AutoCBASessionDurationDescriptionTwo" text as "EC_SESSION_DURATION_DESCRIPTION_TWO" variable
    And I remember "AutoCourseTypeDescriptionTwo" text as "EC_COURSE_TYPE_DESCRIPTION_TWO" variable
    And I remember "AutoRegionNameTwo" text as "EC_REGION_NAME_TWO" variable
    And I remember "AutoLocationNameTwo" text as "EC_LOCATION_NAME_TWO" variable
    And I remember "AutoLocationAddressTwo" text as "EC_LOCATION_ADDRESS_TWO" variable

  @Positive @Regression @P1 #TC-3119
  Scenario: Deactivate CBA Course With Prevent Reactivation Option On
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
    Then I set "EC_REGION_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_REGION_NAME" "Product Factory edit button"
    And I shouldn't see the "Sitting" "Product Factory edit button"
    And I shouldn't see the "Session Duration" "Product Factory edit button"
    And I shouldn't see the "Location" "Product Factory edit button"
    And I shouldn't see the "Course Type" "Product Factory edit button"
    When I click on the "Activate" "Product Factory button" if "Activate,Product Factory button" "special element is present"
    When I click on the "Reactivate" "Product Factory button" if "Reactivate,Product Factory button" "special element is present"
    When I click on the "Yes" "Product Factory button" if "Yes,Product Factory button" "special element is present"
    Then I should see the "(Active)" element
    And I click on the "Deactivate" "Product Factory button"
    And I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_PREVENT_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    And I click on the "Confirm Deactivation" "Product Factory button"
    And Attribute "tabindex" of "Reactivate" "Product Factory button" should have value "-1"

  @Positive @Regression @P1 #TC-3118, TC-3121 (This one is not actual, due to CBA is no longer linked to courses page)
  Scenario: Deactivate CBA Course With Prevent Reactivation Option Off
    And I execute "Create CBA Record" reusable step
    When I click on the "Activate" "Product Factory button"
    Then I should see the "(Active)" element
    Then I should see the "Published" message
    And I should see the "Deactivate" "Product Factory button"
    And I click on the "Deactivate" "Product Factory button"
    And I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    And I click on the "Confirm Deactivation" "Product Factory button"
    And Attribute "tabindex" of "Reactivate" "Product Factory button" should have value "0"
    And I click on the "Reactivate" "Product Factory button"
    And I click on the "Yes" "Product Factory button"
    Then I should see the "Deactivate" "Product Factory button"