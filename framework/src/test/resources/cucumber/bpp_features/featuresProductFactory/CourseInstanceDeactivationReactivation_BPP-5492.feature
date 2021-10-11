@ProductFactory @CBA @Deactivation
Feature: Instance Deactivatation & Redirect - BPP-5492
  As a Product Setter
  I want Product Factory to restrict what Instances an Instance can be re-directed to
  so that re-directions are correct.

  Background:
    Given I execute "Log In" reusable step
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
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
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Client" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Digital Content" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Change Instance Capacity" API step with parameters
      |capacity|15|
    And I execute "Get Instance Sessions" API step
    And I execute "Change Session Timings" API step
    And I execute "Get Instance Steps" API step
    And I execute "Change Step Due Date" API step
    And I execute "Calculate Course Price" API step
    Then I execute "Activate Course" API step

    And I execute "Create Instance" API step saving as "SECOND_"
    And I execute "Change Instance Capacity" API step with parameters saving as "SECOND_"
      |reference|EC_SECOND_INSTANCE_REFERENCE|
      |capacity |4                           |
    And I execute "Get Instance Sessions" API step with parameters saving as "SECOND_"
      |instanceReference|EC_SECOND_INSTANCE_REFERENCE|
    And I execute "Change Session Timings Second" API step saving as "SECOND_"
    And I execute "Get Instance Steps" API step with parameters saving as "SECOND_"
      |instanceReference|EC_SECOND_INSTANCE_REFERENCE|
    And I execute "Change Step Due Date Second" API step saving as "SECOND_"
    And I execute "Activate Instance" API step with parameters saving as "SECOND_"
      |reference|EC_SECOND_INSTANCE_REFERENCE|
    And I execute "Create Instance" API step saving as "THIRD_"
    And I execute "Change Instance Capacity" API step with parameters saving as "THIRD_"
      |reference|EC_THIRD_INSTANCE_REFERENCE|
      |capacity |5                           |
    And I execute "Get Instance Sessions" API step with parameters saving as "THIRD_"
      |instanceReference|EC_THIRD_INSTANCE_REFERENCE|
    And I execute "Change Session Timings Third" API step saving as "THIRD_"
    And I execute "Get Instance Steps" API step with parameters saving as "THIRD_"
      |instanceReference|EC_THIRD_INSTANCE_REFERENCE|
    And I execute "Change Step Due Date Third" API step saving as "THIRD_"
    And I execute "Activate Instance" API step with parameters saving as "THIRD_"
      |reference|EC_THIRD_INSTANCE_REFERENCE|
    Then I execute "Create Deactivation Reason" API step

  @Negative @Regression @P1 #TC-3460
  Scenario: Redirect Course Instance to Deactivated One
    And I execute "Activate Instance" API step
    And I execute "Deactivate Instance" API step

    Given I execute "Edit Course" reusable step
    And I click on the "4" "Product Factory course instance Deactivate button"
    And I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    And I click on the "Redirect to Instance" "Product Factory change button"
    And I click on the "Deactivated" "Product Factory select button"
    And I click on the "Confirm Deactivation" "Product Factory button"
    Then I should see the "You have selected a Deactivated Instance for the Redirect. " message

  @Negative @Regression @P1 #TC-3468
  Scenario: Redirect Course Instance to Draft One
    Given I execute "Edit Course" reusable step
    And I click on the "4" "Product Factory course instance Deactivate button"
    And I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    And I click on the "Redirect to Instance" "Product Factory change button"
    And I click on the "Draft" "Product Factory select button"
    And I click on the "Confirm Deactivation" "Product Factory button"
    Then I should see the "You have selected a Draft Instance for the Redirect. " message

  @Negative @Regression @P1 #TC-3469
  Scenario: Redirect Course Instance to One That is used for Redirection
    And I execute "Activate Instance" API step
    And I execute "Deactivate Instance" API step
    And I execute "Deactivate Instance" API step with parameters
      |reference|EC_SECOND_INSTANCE_REFERENCE|
      |redirectInstanceReference|EC_THIRD_INSTANCE_REFERENCE|

    Given I execute "Edit Course" reusable step
    And I click on the "5" "Product Factory course instance Deactivate button"
    And I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    And I click on the "Redirect to Instance" "Product Factory change button"
    And I click on the "Active" "Product Factory select button"
    And I click on the "Confirm Deactivation" "Product Factory button"
    Then I should see the "You are redirecting an Instance which has Instances Redirected to it. " message