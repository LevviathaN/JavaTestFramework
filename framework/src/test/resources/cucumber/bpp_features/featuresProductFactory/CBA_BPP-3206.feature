@ProductFactory @CBA @HappyPath
Feature: CBA - Create Courses and Instances - BPP-3206
  As a Product Setter
  I want to be able to amend create Courses with a single Instance for a CBA record

  Background:
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Given I execute "Remember Variables For Creation " reusable step

    Given I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_PROJECT_"
      |dimensionType|PROJECT   |
      |target       |COURSETYPE|
    And I execute "Create Financial Dimension" API step with parameters saving as "COURSE_TYPE_COST_CENTRE_"
      |dimensionType|COSTCENTRE|
      |target       |COURSETYPE|
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step

    And I execute "Create Course Type" API step with parameters saving as "CBA1_"
      |isCba|true|
      |description|$Auto[CBA1CourseTypeDescription]###|
    And I execute "Create Course Type" API step with parameters saving as "CBA2_"
      |isCba|true|
      |description|$Auto[CBA2CourseTypeDescription]###|

    And I execute "Create Course Type" API step with parameters saving as "1_"
      |description|$Auto[1CourseTypeDescription]###|
    And I execute "Create Course Type" API step with parameters saving as "2_"
      |description|$Auto[2CourseTypeDescription]###|

  @Positive @Regression @P1 @CoveredWithAPI @NeedToBeUI #TC-3000
  Scenario: Create New CBA Record
    Given I execute modified "Create CBA Record" reusable step
      |16|Add|I should see the "EC_CBA1_COURSE_TYPE_DESCRIPTION" "Product Factory select button"|
      |17|Add|I should see the "EC_CBA2_COURSE_TYPE_DESCRIPTION" "Product Factory select button"|
      |18|Add|I shouldn't see the "EC_1_COURSE_TYPE_DESCRIPTION" "Product Factory select button"|
      |19|Add|I shouldn't see the "EC_2_COURSE_TYPE_DESCRIPTION" "Product Factory select button"|
    And I wait for "2" seconds
    When I click on the "Clients" "Product Factory button"
    And I click on the "Edit" "Product Factory button"
    And I "check" "EC_CLIENT_NAME" "Product Factory checkbox"
    And I click on the "Save" "Product Factory button"
    Then I wait for "7" seconds
    When I click on the "Activate" "Product Factory button"
    Then I should see the "(Active)" element
    And I should see the "Deactivate" "Product Factory button"


