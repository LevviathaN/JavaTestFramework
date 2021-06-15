@ProductFactory @CBA @Deactivation
Feature: CBA - Publish changes - BPP-3210
  As a Product Setter
  when I am editing a non-draft CBA, with unpublished changes,
  I want the ability to Publish the CBA and the associated Courses, Instances

  Background:
    Given I execute "Remember Variables For Creation " reusable step
    And I remember "AutoSittingNameTwo" text as "EC_SITTING_NAME_TWO" variable
    And I remember "AutoCBASessionDurationDescriptionTwo" text as "EC_SESSION_DURATION_DESCRIPTION_TWO" variable
    And I remember "AutoCourseTypeDescriptionTwo" text as "EC_COURSE_TYPE_DESCRIPTION_TWO" variable
    And I remember "AutoRegionNameTwo" text as "EC_REGION_NAME_TWO" variable
    And I remember "AutoLocationNameTwo" text as "EC_LOCATION_NAME_TWO" variable
    And I remember "AutoLocationAddressTwo" text as "EC_LOCATION_ADDRESS_TWO" variable

  @Positive @Regression @P1 #TC-3106
  Scenario: Publish CBA Changes Validation
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    And I execute "Create CBA Record" reusable step
    When I click on the "Activate" "Product Factory button"
    Then I should see the "(Active)" element
    Then I should see the "Published" message
    And I should see the "Deactivate" "Product Factory button"
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"
    #Some edit options are no longer available, so they were removed

    #edit Capacity
    And I click on the "edit" "text contained in SPAN element"
    And I set "2" text to the "EC_LOCATION_NAME" "Product Factory text field"
    And I click on the "Yes" "element by title"
    Then I should see the "2" element
    And I should see the "Unpublished changes" message
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "0"
    And I click on the "Publish" "Product Factory button two"
    And I click on the "Yes" "Product Factory button"
    Then I should see the "Published" message
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"

    Then I click on the "Courses" element
    Then I click on the "EC_BODY_SHORT_NAME" "Product Factory CBA Course Institute Fee edit button"
    And I set "~UpdatedInstituteFee[###]" text to the "EC_BODY_SHORT_NAME" "Product Factory CBA Course Institute Fee input field"
    And I click on the "Yes" "Product Factory button title"
    Then I should see the "[EC_UPDATED_INSTITUTE_FEE]" element
    And I should see the "Unpublished changes" message
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "0"
    And I click on the "Publish" "Product Factory button"
    And I click on the "Yes" "Product Factory button"
    Then I should see the "Published" message
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"

    And I click on the "Clients" element
    And I click on the "Edit" "Product Factory button"
    And I "check" "EC_CLIENT_NAME" "Product Factory checkbox"
    And I click on the "Save" "Product Factory button"
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "0"
    And I click on the "Publish" "Product Factory button"
    And I click on the "Yes" "Product Factory button"
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"


  @Positive @Regression @P1 #TC-3110
  Scenario: Publish CBA Changes Validation Additional Scenarios
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    And I execute "Create CBA Record" reusable step
    When I click on the "Activate" "Product Factory button"
    Then I should see the "(Active)" element
    Then I should see the "Published" message
    And I should see the "Deactivate" "Product Factory button"
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"

    And I click on the "edit" "text contained in SPAN element"
    And I set "2" text to the "EC_LOCATION_NAME" "Product Factory text field"
    And I click on the "Cancel" "element by title"
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"

    Then I click on the "Courses" element
    Then I click on the "EC_BODY_SHORT_NAME" "Product Factory CBA Course Institute Fee edit button"
    And I set "~UpdatedInstituteFee[###]" text to the "EC_BODY_SHORT_NAME" "Product Factory CBA Course Institute Fee input field"
    And I click on the "Cancel" "element by title"
    Then I shouldn't see the "[EC_UPDATED_INSTITUTE_FEE]" element
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"

    #Amending all at once has no sense now.