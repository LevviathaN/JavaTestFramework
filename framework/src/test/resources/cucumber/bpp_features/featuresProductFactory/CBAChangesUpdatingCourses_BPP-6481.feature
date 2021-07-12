@ProductFactory @CBA @Deactivation @DoNotRun @Outdated
Feature: CBA - CBA Changes updating CBA Courses - BPP-6481
  As a Product Setter
  I want changes to CBA (Header)
  to Propagate to created/linked CBA courses.

  Background:
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|

    And I remember "AutoDeactivationReasonDescriptionPreventEdit" text as "EC_DEACTIVATION_REASON_DESCRIPTION_PREVENT" variable
    And I remember "AutoDeactivationReasonDescriptionEdit" text as "EC_DEACTIVATION_REASON_DESCRIPTION" variable
    And I remember "23/10/2020" text as "EC_SITTING_START_DATE" variable
    And I remember "10/10/2025" text as "EC_SITTING_END_DATE" variable
    And I remember "AutoStreamNameEdit" text as "EC_STREAM_NAME" variable
    And I remember "AutoBodyFDCodeEdit" text as "EC_BODY_FD_CODE" variable
    And I remember "AutoBodyFDDescriptionEdit" text as "EC_BODY_FD_DESCRIPTION" variable
    And I remember "AutoBodyShortNameEdit" text as "EC_BODY_SHORT_NAME" variable
    And I remember "AutoBodyNameEdit" text as "EC_BODY_NAME" variable
    And I remember "AutoVatRuleCodeEdit" text as "EC_VAT_RULE_CODE" variable
    And I remember "AutoVatRuleDescriptionEdit" text as "EC_VAT_RULE_DESCRIPTION" variable
    And I remember "AutoCourseTypeFDCodeEdit" text as "EC_COURSE_TYPE_FD_CODE" variable
    And I remember "AutoCourseTypeFDDescriptionEdit" text as "EC_COURSE_TYPE_FD_DESCRIPTION" variable
    And I remember "AutoCourseTypeDescriptionEdit" text as "EC_COURSE_TYPE_DESCRIPTION" variable
    And I remember "AutoLocationFDCodeEdit" text as "EC_LOCATION_FD_CODE" variable
    And I remember "AutoLocationFDDescriptionEdit" text as "EC_LOCATION_FD_DESCRIPTION" variable
    And I remember "AutoRegionFDCodeEdit" text as "EC_REGION_FD_CODE" variable
    And I remember "AutoRegionFDDescriptionEdit" text as "EC_REGION_FD_DESCRIPTION" variable
    And I remember "AutoRegionNameEdit" text as "EC_REGION_NAME" variable
    And I remember "AutoLocationNameEdit" text as "EC_LOCATION_NAME" variable
    And I remember "AutoLocationAddressEdit" text as "EC_LOCATION_ADDRESS" variable
    And I remember "AutoLevelNameEdit" text as "EC_LEVEL_NAME" variable
    And I remember "AutoLevelShortNameEdit" text as "EC_LEVEL_SHORT_NAME" variable
    And I remember "EdCBAPprSN" text as "EC_PPR_SN" variable
    And I remember "AutoCBAPaperNameEdit" text as "EC_PAPER_NAME" variable
    And I remember "AutoCBAPaperDescriptionEdit" text as "EC_PAPER_DESCRIPTION" variable
    And I remember "AutoSittingNameEdit" text as "EC_SITTING_NAME" variable
    And I remember "AutoMaterialTypeFDCodeEdit" text as "EC_MATERIAL_TYPE_FD_CODE" variable
    And I remember "AutoMaterialTypeFDDescriptionEdit" text as "EC_MATERIAL_TYPE_FD_DESCRIPTION" variable
    And I remember "AutoMaterialTypeNameEdit" text as "EC_MATERIAL_TYPE_NAME" variable
    And I remember "AutoMaterialTypeDescriptionEdit" text as "EC_MATERIAL_TYPE_DESCRIPTION" variable
    And I remember "AutoCBASessionDurationDescriptionEdit" text as "EC_SESSION_DURATION_DESCRIPTION" variable
    And I remember "AutoClientNameEdit" text as "EC_CLIENT_NAME" variable
    And I remember "2000" text as "EC_PRICE" variable
    And I remember "10" text as "EC_WEIGHT" variable
    And I remember "1000" text as "EC_PRICING_MATRIX_PRICE" variable

    And I remember "AutoSittingNameTwo" text as "EC_SITTING_NAME_TWO" variable
    And I remember "AutoCBASessionDurationDescriptionTwo" text as "EC_SESSION_DURATION_DESCRIPTION_TWO" variable
    And I remember "AutoCourseTypeDescriptionTwo" text as "EC_COURSE_TYPE_DESCRIPTION_TWO" variable
    And I remember "AutoRegionNameTwo" text as "EC_REGION_NAME_TWO" variable
    And I remember "AutoLocationNameTwo" text as "EC_LOCATION_NAME_TWO" variable
    And I remember "AutoLocationAddressTwo" text as "EC_LOCATION_ADDRESS_TWO" variable
    And I remember "AutoClientNameTwo" text as "EC_CLIENT_NAME_TWO" variable


#    Given I execute "Log In" reusable step
#    When I execute "Create Body Financial Dimension" reusable step
#    And I execute "Create Body" reusable step
#    And I execute "Create VAT Rule" reusable step
#    And I execute "Create Sitting" reusable step
#    And I execute "Create Sitting" reusable step replacing some steps
#      |4|I set "SittingNameTwo[######]" text to the "Name" "Product Factory text field"|
#    And I execute "Create Session Duration" reusable step with some additional steps
#      |6|I "check" "Allowed for CBA" "Product Factory checkbox"|
#    When I click on the "Delivery" "Product Factory navigation item"
#    When I click on the "Session Durations" "Product Factory navigation sub item"
#    Then I click on the "Create" "Product Factory button"
#    And I set "SessionDurationDescriptionTwo[######]" text to the "Description" "Product Factory text field"
#    And I set "1" text to the "Number of Dates" "Product Factory text field"
#    And I "check" "Allowed for CBA" "Product Factory checkbox"
#    And I click on the "Save" "Product Factory button"
#    And I execute "Create Course Type Financial Dimension" reusable step
#    And I execute "Create Course Type" reusable step
#    And I execute "Create Course Type" reusable step replacing some steps
#      |4|I set "CourseTypeDescriptionTwo[######]" text to the "Description" "Product Factory text field"|
#      |13|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard |
#      |15|I should see the "EC_COURSE_TYPE_DESCRIPTION_TWO" element                                     |
#    And I execute "Create Location Financial Dimension" reusable step
#    And I execute "Create Region Financial Dimension" reusable step
#    And I execute "Create Region" reusable step
#    And I execute "Create Region" reusable step replacing some steps
#      |4|I set "RegionNameTwo[######]" text to the "Name" "Product Factory text field"|
#      |8|I should see the "EC_REGION_NAME" element                                    |
#    And I execute "Create Location" reusable step
#    And I execute "Create Location" reusable step replacing some steps
#      |4|I set "LocationNameTwo[######]" text to the "Name" "Product Factory text field"|
#      |5|I set "LocationAddressTwo[######]" text to the "Address Line 1" "Product Factory text field"|
#      |7|I click on the "EC_REGION_NAME_TWO" "Product Factory dropdown option"                |
#    And I execute "Create Client" reusable step
#    And I execute "Create Client" reusable step replacing some steps
#      |4|I set "ClientNameTwo[######]" text to the "Name" "Product Factory text field"|
#      |6|I should see the "EC_CLIENT_NAME_TWO" element|
#    And I execute "Create Level" reusable step
#    And I execute "Create Paper" reusable step with some additional steps
#      |5|I "check" "CBA Paper?" "Product Factory checkbox"|
#      |6|I set "1" text to the "Time in Hours" "Product Factory text field"|
#    And I execute "Link Body To Level" reusable step
#    And I execute "Link Body To Paper" reusable step
#    And I execute "Link Paper To Level" reusable step
#    And I execute "Create Pricing Matrix" reusable step
#    And I execute "Create Pricing Matrix Full" reusable step
#    And I execute "Create Digital Content" reusable step

  @Positive @Regression @P1 #TC-2934
  Scenario: CBA Changes Updating Course Validation
    And I execute "Create Deactivation Reason" reusable step with some additional steps
      |5|I click on the "Prevent Reactivation" "Product Factory checkbox"|
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    And I execute "Create CBA Record" reusable step
    And I execute "Create CBA Course" reusable step

    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
    Then I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory edit button"
    When I click on the "Activate" "Product Factory button" if "Activate,Product Factory button" "special element is present"
    Then I should see the "(Active)" element
    Then I should see the "Published" message
    And I should see the "Deactivate" "Product Factory button"
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"

    And I set "01/08/2025" text to the "Date" "Product Factory text field"
    And I click on the "Edit CBA" element
    Then I should see the "Date updated on CBA Course Sessions." element
    And I should see the "Unpublished changes" message
#    When I click on the "Products" "Product Factory navigation item"
#    When I click on the "Courses" "Product Factory navigation sub item"
#    And I set "EC_BODY_SHORT_NAME" text to the "Body" "Product Factory text field"
#    And I click on the "Search" "Product Factory button"
#    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
#    And I should see the "01/09/2025" element
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
    Then I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory edit button"

    And I click on the "Default Institute Fee (£)" "Product Factory edit button"
    And I set "~UpdatedInstituteFee[###]" text to the "Default Institute Fee (£)" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    And I click on the "Yes" "Product Factory button"
    And I should see the "Institute Fees Updated on CBA Courses." message
    Then I should see the "[EC_UPDATED_INSTITUTE_FEE].00" element in quantity of "2"
    And I should see the "Unpublished changes" message

    And I click on the "Capacity" "Product Factory edit button"
    And I set "2" text to the "Capacity" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "Capacity updated on Course Instances." message
    Then I should see the "2" element
    And I should see the "Unpublished changes" message
#    When I click on the "Products" "Product Factory navigation item"
#    When I click on the "Courses" "Product Factory navigation sub item"
#    And I set "EC_BODY_SHORT_NAME" text to the "Body" "Product Factory text field"
#    And I click on the "Search" "Product Factory button"
#    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
#    And I should see the "2" element
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
    Then I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory edit button"

    And I click on the "Clients" element
    And I click on the "Edit" "Product Factory button"
    And I "check" "EC_CLIENT_NAME_TWO" "Product Factory checkbox"
    And I "check" "EC_CLIENT_NAME" "Product Factory checkbox"
    And I click on the "Save" "Product Factory button"
    And I should see the "Clients updated on CBA Courses." message
    And I should see the "Unpublished changes" message
#    When I click on the "Products" "Product Factory navigation item"
#    When I click on the "Courses" "Product Factory navigation sub item"
#    And I set "EC_BODY_SHORT_NAME" text to the "Body" "Product Factory text field"
#    And I click on the "Search" "Product Factory button"
#    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
#    And I click on the "Clients" element
#    And I should see the "EC_CLIENT_NAME_TWO" element
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "CBAs" "Product Factory navigation sub item"
    Then I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory edit button"


  @Positive @Regression @P1 @Runn #TC-2936
  Scenario: CBA Changes Updating Course Validation Additional Scenarios
    And I execute "Create Deactivation Reason" reusable step with some additional steps
      |5|I click on the "Prevent Reactivation" "Product Factory checkbox"|
    When I click on the "exit_to_app" button
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    And I execute "Create CBA Record" reusable step
    And I execute "Create CBA Course" reusable step

    Then I click on the "CBAs" "Product Factory button title"
    Then I set "EC_COURSE_TYPE_DESCRIPTION" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory edit button"
    When I click on the "Activate" "Product Factory button"
    Then I should see the "(Active)" element
    Then I should see the "Published" message
    And I should see the "Deactivate" "Product Factory button"
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"

    #Amending all at once
    And I set "01/09/2025" text to the "Date" "Product Factory text field"
    And I click on the "Edit CBA" element
    Then I should see the "Date updated on CBA Course Sessions." element

    And I click on the "Capacity" "Product Factory edit button"
    And I set "2" text to the "Capacity" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    Then I should see the "Capacity updated on Course Instances." message

#    When I click on the "Products" "Product Factory navigation item"
#    When I click on the "Courses" "Product Factory navigation sub item"
#    And I set "EC_BODY_SHORT_NAME" text to the "Body" "Product Factory text field"
#    And I click on the "Search" "Product Factory button"
#    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
#
#    And I should see the "01/09/2025" element
#    And I should see the "2" element