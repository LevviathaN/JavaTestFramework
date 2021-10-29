@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @CBA @NeedToBeUi #TC-3000
  Scenario: Create New CBA Record
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT   |
      |target       |REGION|
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT   |
      |target       |LOCATION|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step with parameters saving as "CBA_"
      |isCba|true|
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step with parameters
      |isCba|true|
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Session Duration" API step with parameters
      |allowedForCba|true|
    And I execute "Create Instance Group" API step
    And I execute "Create Courses" API step

  @CBA @Update #TC-2650
  Scenario: Update CBA Course Institution Fee
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT   |
      |target       |REGION|
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT   |
      |target       |LOCATION|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step with parameters saving as "CBA_"
      |isCba|true|
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step with parameters
      |isCba|true|
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Session Duration" API step with parameters
      |allowedForCba|true|
    And I execute "Create Instance Group" API step
    And I execute "Create Courses" API step
    And I execute "Change Course Institution Fee" API step with parameters
      |instituteFee|250|

  @CBA @Update #TC-2768
  Scenario: Update CBA Course Institution Fee Additional Scenarios
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT   |
      |target       |REGION|
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT   |
      |target       |LOCATION|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step with parameters saving as "CBA_"
      |isCba|true|
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step with parameters
      |isCba|true|
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Session Duration" API step with parameters
      |allowedForCba|true|
    And I execute "Create Instance Group" API step
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Create Courses" API step with parameters
      |defaultInstituteFee|~DefaultInstitutionFee[####]|
    And I execute "Get Instance Name" API step
    And I verify that "EC_INSTANCE_NAME_RESULT_INSTITUTE_FEE" element is equal to "EC_DEFAULT_INSTITUTION_FEE" element
    And I execute "Change Course Institution Fee" API step with parameters
      |instituteFee|~InstitutionFeeChanged[####]|
    And I verify that "EC_CHANGE_COURSE_INSTITUTION_FEE_INSTITUTE_FEE" element is equal to "EC_INSTITUTION_FEE_CHANGED" element
    And I verify that "EC_PRICE" element is equal to "EC_PRICES_PRICES_VALUE" element
    And I execute "Change Price" API step
    And I execute "Get Instance Name" API step saving as "SECOND_"
    And I verify that "EC_UPDATED_PRICE" element is equal to "EC_SECOND_GET_INSTANCE_NAME_RESULT_PRICE" element
    And I execute "Change Course Institution Fee" API step with parameters saving as "SECOND_"
      |instituteFee|0|
    And I execute "Change Price" API step with parameters saving as "SECOND_"
      |newPrice|0|
    And I execute "Get Instance Name" API step saving as "THIRD_"
    And I verify that "EC_THIRD_GET_INSTANCE_NAME_RESULT_PRICE" element is equal to "0" element
    And I verify that "EC_THIRD_GET_INSTANCE_NAME_RESULT_INSTITUTE_FEE" element is equal to "0" element

  @CBA #TC-3119
  Scenario: Deactivate CBA Course With Prevent Reactivation Option On
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT   |
      |target       |REGION|
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT   |
      |target       |LOCATION|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step with parameters saving as "CBA_"
      |isCba|true|
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step with parameters
      |isCba|true|
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Session Duration" API step with parameters
      |allowedForCba|true|
    And I execute "Create Instance Group" API step
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Create Courses" API step
    And I execute "Create Deactivation Reason" API step with parameters saving as "PREVENT_"
      |preventReactivation|false|
    And I execute "Create Instances" API step
    And I execute "Activate Instance Group" API step
    And I execute "Activate Instances" API step
    And I execute "Activate Courses" API step
    And I execute "Deactivate Instance Group" API step with parameters
      |deactivationReasonReference|EC_PREVENT_DEACTIVATION_REASON_REFERENCE|
    And I execute "Deactivate Instances" API step with parameters
      |deactivationReasonReference|EC_PREVENT_DEACTIVATION_REASON_REFERENCE|
    And I execute "Deactivate Courses" API step with parameters
      |deactivationReasonReference|EC_PREVENT_DEACTIVATION_REASON_REFERENCE|
    And I execute "Activate Instance Group" API step
    And I execute "Activate Instances" API step
    And I execute "Activate Courses" API step

  #TODO: Verify test after BPP-17463  is fixed
  @CBA #TC-3118, TC-3121
  Scenario: Deactivate CBA Course With Prevent Reactivation Option Off
    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I execute "Create Financial Dimension" API step with parameters saving as "REGION_"
      |dimensionType|PRODUCT   |
      |target       |REGION|
    And I execute "Create Financial Dimension" API step with parameters saving as "LOCATION_"
      |dimensionType|PRODUCT   |
      |target       |LOCATION|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step with parameters saving as "CBA_"
      |isCba|true|
    Given I execute "Create Study Mode" API step
    And I execute "Create Paper" API step with parameters
      |isCba|true|
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Session Duration" API step with parameters
      |allowedForCba|true|
    And I execute "Create Instance Group" API step
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Create Courses" API step
    And I execute "Create Deactivation Reason" API step with parameters saving as "PREVENT_"
      |preventReactivation|true|
    And I execute "Create Instances" API step
    And I execute "Activate Instance Group" API step
    And I execute "Activate Instances" API step
    And I execute "Activate Courses" API step
    And I execute "Deactivate Instance Group" API step with parameters
      |deactivationReasonReference|EC_PREVENT_DEACTIVATION_REASON_REFERENCE|
    And I execute "Deactivate Instances" API step with parameters
      |deactivationReasonReference|EC_PREVENT_DEACTIVATION_REASON_REFERENCE|
    And I execute "Deactivate Courses" API step with parameters
      |deactivationReasonReference|EC_PREVENT_DEACTIVATION_REASON_REFERENCE|
    And I execute negative "Activate Instance Group" API step with error name "asfsfaffsaaf" and parameters
      |reference|EC_INSTANCE_GROUP_REFERENCE|
    And I execute negative "Activate Instances" API step with error name "asfsfaffsaaf" and parameters
      |reference|EC_INSTANCE_GROUP_REFERENCE|
    And I execute negative "Activate Courses" API step with error name "asfsfaffsaaf" and parameters
      |reference|EC_INSTANCE_GROUP_REFERENCE|