@ProductFactory @Courses @Deactivation
Feature: Course Deactivatation & Redirect Rules - BPP-5491
  As a Product Setter
  I want Product Factory to restrict what Course an Course can be re-directed to
  so that re-directions are correct.

  Background:
    And I execute "Log In" reusable step replacing some steps
      |3|I fill the "Product Factory Email" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPRODUCTSETTER"|
      |4|I fill the "Product Factory Password" field with "MD_COMMON_CREDENTIALS_PRODUCTFACTORYJUNIORPSPASSWORD"|
    Given I execute "Remember Variables For Creation " reusable step
    Given I execute "Remember Variables Two" reusable step
    Given I execute "Remember Variables Three" reusable step

  @Positive @Regression @P1 #TC-3671
  Scenario: Redirect Course to Deactivated One

    #Deactivate first course and redirect it to the second one
    Given I execute "Edit Course" reusable step
    And I execute "Keep the Course Activated" reusable step
    When I click on the "Deactivate" "Product Factory button"
    Then I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    Then I click on the "Redirect to Course" "Product Factory change button"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory select button"
    Then I click on the "Confirm Deactivation" "Product Factory button"
    And I click on the "Yes" "Product Factory button" if "Yes,Product Factory button" "element is present"

    #Deactivate third course and redirect it to the first one (that is deactivated)
    Given I execute "Edit Course" reusable step replacing some steps
      |3|I set "EC_COURSE_TYPE_DESCRIPTION_THREE" text to the "Search" "Product Factory text field" from keyboard|
      |5|I click on the "EC_COURSE_TYPE_DESCRIPTION_THREE" "Product Factory edit button"                         |
    And I execute "Keep the Course Activated" reusable step
    When I click on the "Deactivate" "Product Factory button"
    Then I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    Then I click on the "Redirect to Course" "Product Factory change button"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory select button"
    Then I click on the "Confirm Deactivation" "Product Factory button"
    Then I should see the "You have selected a Deactivated Course for the Redirect. " message

  @Positive @Regression @P1 #TC-3673
  Scenario: Verify Circle Deactivation Restriction

    #Deactivate first course and redirect it to the second one
    Given I execute "Edit Course" reusable step
    And I execute "Keep the Course Activated" reusable step
    When I click on the "Deactivate" "Product Factory Edit Course button"
    Then I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    Then I click on the "Redirect to Course" "Product Factory change button"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory select button"
    Then I click on the "Confirm Deactivation" "Product Factory button"
    And I click on the "Yes" "Product Factory button" if "Yes,Product Factory button" "element is present"

    #Deactivate second course and redirect it to the third one
    Given I execute "Edit Course" reusable step replacing some steps
      |3|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
      |5|I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory edit button"                         |
    And I execute "Keep the Course Activated" reusable step
    When I click on the "Deactivate" "Product Factory Edit Course button"
    Then I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    Then I click on the "Redirect to Course" "Product Factory change button"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION_THREE" "Product Factory select button"
    Then I click on the "Confirm Deactivation" "Product Factory button"
    And I click on the "Yes" "Product Factory button" if "Yes,Product Factory button" "element is present"

    #Deactivate third course and redirect it to the first one (that is deactivated)
    Given I execute "Edit Course" reusable step replacing some steps
      |3|I set "EC_COURSE_TYPE_DESCRIPTION_THREE" text to the "Search" "Product Factory text field" from keyboard|
      |5|I click on the "EC_COURSE_TYPE_DESCRIPTION_THREE" "Product Factory edit button"                         |
    And I execute "Keep the Course Activated" reusable step
    When I click on the "Deactivate" "Product Factory button"
    Then I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    Then I click on the "Redirect to Course" "Product Factory change button"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory select button"
    And I click on the "Confirm Deactivation" "Product Factory button"
    Then I should see the "You have selected a Deactivated Course for the Redirect. " message

  @Positive @Regression @P1 #TC-3674
  Scenario: Redirect Course to a Draft One

    #Deactivate first course and redirect it to the second one
    Given I execute "Edit Course" reusable step
    And I execute "Keep the Course Activated" reusable step
    When I click on the "Deactivate" "Product Factory button"
    Then I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    Then I click on the "Redirect to Course" "Product Factory change button"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory select button"
    Then I click on the "Confirm Deactivation" "Product Factory button"
    And I click on the "Yes" "Product Factory button" if "Yes,Product Factory button" "element is present"

    #Deactivate third course and redirect it to the first one (that is deactivated)
    Given I execute "Edit Course" reusable step replacing some steps
      |3|I set "EC_COURSE_TYPE_DESCRIPTION_THREE" text to the "Search" "Product Factory text field" from keyboard|
      |5|I click on the "EC_COURSE_TYPE_DESCRIPTION_THREE" "Product Factory edit button"                         |
    And I execute "Keep the Course Activated" reusable step
    When I click on the "Deactivate" "Product Factory button"
    Then I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    Then I click on the "Redirect to Course" "Product Factory change button"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory select button"
    Then I click on the "Confirm Deactivation" "Product Factory button"
    Then I should see the "You have selected a Deactivated Course for the Redirect. " message

  @Positive @Regression @P1 #TC-3676
  Scenario: Redirect Course to Permanently Deactivated One

    # Create Course fo permanent deactivation
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
    And I execute "Calculate Course Price" API step
    Then I execute "Activate Course" API step
    And I execute "Create Course" API step saving as "SECOND_"
    And I execute "Create Deactivation Reason" API step with parameters saving as "PREVENT_"
      |preventReactivation|true|
    And I execute "Deactivate Course" API step with parameters
      |deactivationReasonReference|EC_PREVENT_DEACTIVATION_REASON_REFERENCE|

    #Deactivate third course and redirect it to the first one (that is deactivated)
    Given I execute "Edit Course" reusable step replacing some steps
      |3|I set "EC_COURSE_TYPE_DESCRIPTION_THREE" text to the "Search" "Product Factory text field" from keyboard|
      |5|I click on the "EC_COURSE_TYPE_DESCRIPTION_THREE" "Product Factory edit button"                         |
    And I execute "Keep the Course Activated" reusable step
    When I click on the "Deactivate" "Product Factory button"
    Then I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    Then I click on the "Redirect to Course" "Product Factory change button"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory select button"
    Then I click on the "Confirm Deactivation" "Product Factory button"
    Then I should see the "You have selected a Deactivated Course for the Redirect. " message

  @Positive @Regression @P1 #TC-3675
  Scenario: Deactivate Course that is Used For Redirection

    #Deactivate first course and redirect it to the second one
    Given I execute "Edit Course" reusable step
    And I execute "Keep the Course Activated" reusable step
    When I click on the "Deactivate" "Product Factory Edit Course button"
    Then I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    Then I click on the "Redirect to Course" "Product Factory change button"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory select button"
    Then I click on the "Confirm Deactivation" "Product Factory button"
    And I click on the "Yes" "Product Factory button" if "Yes,Product Factory button" "element is present"

    #Deactivate second course and redirect it to the third one
    Given I execute "Edit Course" reusable step replacing some steps
      |3|I set "EC_COURSE_TYPE_DESCRIPTION_THREE" text to the "Search" "Product Factory text field" from keyboard|
      |5|I click on the "EC_COURSE_TYPE_DESCRIPTION_THREE" "Product Factory edit button"                         |
    And I execute "Keep the Course Activated" reusable step

    Given I execute "Edit Course" reusable step replacing some steps
      |3|I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard|
      |5|I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory edit button"                         |
    And I execute "Keep the Course Activated" reusable step
    When I click on the "Deactivate" "Product Factory Edit Course button"
    Then I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    Then I click on the "Redirect to Course" "Product Factory change button"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION_THREE" "Product Factory select button"
    Then I click on the "Confirm Deactivation" "Product Factory button"
    And I click on the "Yes" "Product Factory button" if "Yes,Product Factory button" "element is present"
    Then I should see the "You are redirecting a Course which has Courses redirected to it. " message