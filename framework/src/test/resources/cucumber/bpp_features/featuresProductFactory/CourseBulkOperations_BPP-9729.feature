@ProductFactory @Courses @BulkOperations @HappyPath
Feature: Bulk Operation -Course List Page - multiple selection for Bulk Publish/Deactivation - BPP-9729
  As a Product Setter
  I want to be able to be able make a multiple selection of the Course list
  so that a bulk operation can be applied to them.

  @Positive @P1 @NeedToBeUI #TC-4013
  Scenario: Multiple Selection For Course Bulk Operations
    Given I execute "Log In" reusable step
    Given I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"

    #Verify 'Perform Bulk Operation' button is disabled if there is no selected Courses
    Then Attribute "tabindex" of "Perform Bulk Operation" "Product Factory button" should have value "-1"

    #Verify 'Perform Bulk Operation' button is disabled if there is no Courses on the page
    And I set "NoCourse" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I wait for "5" seconds
    Then Attribute "tabindex" of "Perform Bulk Operation" "Product Factory button" should have value "-1"
    Then I click on the "Clear the search text" "element by title"

    #Verify 'Perform Bulk Operation' button is active if there is one or more courses selected
    And I set "AutoBodyShortName" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I wait for "5" seconds
    When I click on the "AutoBodyShortName" "Product Factory Course Page checkbox"
    And I set "AutoBodyShortNameTwo" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I wait for "5" seconds
    When I click on the "AutoBodyShortNameTwo" "Product Factory Course Page checkbox"
    Then Attribute "tabindex" of "Perform Bulk Operation" "Product Factory button" should have value "0"

  @Positive @P1 @NeedToBeUI #TC-4140, TC-4217, TC-4219, TC-4220, TC-4237
  Scenario: Multiple Status Selection For Course Bulk Operations

    #Create Reference data for courses creation
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
    Given I execute "Create Study Mode" API step
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
    And I execute "Create Session Duration" API step
    And I execute "Create Stream" API step

    Given I execute "Log In" reusable step

    #Create Draft Course
    And I execute "Create Course" API step saving as "SECOND_"

    #Create Activated Course
    And I execute "Create Course" API step
    And I execute "Calculate Course Price" API step
    Then I execute "Activate Course" API step

    #Create Deactivated Course
    And I execute "Create Course" API step
    Then I execute "Activate Course" API step
    Then I execute "Create Deactivation Reason" API step
    And I execute "Deactivate Course" API step

    #Create Permanently Deactivated Course
    And I execute "Create Course" API step
    And I execute "Calculate Course Price" API step
    Then I execute "Activate Course" API step
    Then I execute "Create Deactivation Reason" API step with parameters saving as "PREVENT_"
      |preventReactivation|true|
    And I execute "Deactivate Course" API step with parameters
      |deactivationReasonReference|EC_PREVENT_DEACTIVATION_REASON_REFERENCE|

    #Navigate to Courses Page
    Given I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"

    #Verify warning message is displayed after you click on 'Perform bulk action' button with multistatus course selection (TC-4140)
    And I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I wait for "5" seconds
    When I click on the "Product Factory Course Page Select All Checkbox" element
    Then I click on the "Perform Bulk Operation" "Product Factory button"
    Then I should see the "Bulk Operation not allowed on mixed Course or Instance statuses" message

    #Verify that Publish, Activate and Deactivate buttons on the top of the page (TC-4140)
    Then Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"
    Then Attribute "tabindex" of "Activate" "Product Factory button" should have value "-1"
    Then Attribute "tabindex" of "Deactivate" "Product Factory button" should have value "-1"

    #Verify that Activate button becomes active if all courses deselected, except DRAFT one (TC-4237)
    When I click on the "ACTIVE" "Product Factory Course Bulk Operation Page checkbox by Status"
    Then I click on the "Yes" "Product Factory button"
    And I wait for "3" seconds
    And For each "DEACTIVATED" "Product Factory Course Bulk Operation Page checkbox by Status":
      |I click on the "FOR_ITEM" element            |
      |I click on the "Yes" "Product Factory button"|
      |I wait for "3" seconds                       |
    Then Attribute "tabindex" of "Activate" "Product Factory button" should have value "0"
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"
    And Attribute "tabindex" of "Deactivate" "Product Factory button" should have value "-1"

    #Verify that Deactivate button becomes active if all courses deselected, except ACTIVE one (TC-4217)
    When I click on the "DRAFT" "Product Factory Course Bulk Operation Page checkbox by Status"
    Then I click on the "Yes" "Product Factory button"
    And I wait for "3" seconds
    When I click on the "ACTIVE" "Product Factory Course Bulk Operation Page checkbox by Status"
    Then I click on the "Yes" "Product Factory button"
    And I wait for "3" seconds
    And Attribute "tabindex" of "Deactivate" "Product Factory button" should have value "0"
    Then Attribute "tabindex" of "Activate" "Product Factory button" should have value "-1"
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"

    #Verify that Reactivate button becomes active if all courses deselected, except DEACTIVATED one (TC-4219)
    When I click on the "ACTIVE" "Product Factory Course Bulk Operation Page checkbox by Status"
    Then I click on the "Yes" "Product Factory button"
    And I wait for "3" seconds
    When I click on the "DEACTIVATED" "Product Factory Course Bulk Operation Page checkbox by Status"
    Then I click on the "Yes" "Product Factory button"
    And I wait for "3" seconds
    And Attribute "tabindex" of "Reactivate" "Product Factory button" should have value "0"
    Then Attribute "tabindex" of "Deactivate" "Product Factory button" should have value "-1"
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"

    #Verify that Reactivate button becomes active if all courses deselected, except PERMANENTLY DEACTIVATED one (TC-4220)
    And For each "DEACTIVATED" "Product Factory Course Bulk Operation Page checkbox by Status":
      |I click on the "FOR_ITEM" element            |
      |I click on the "Yes" "Product Factory button"|
      |I wait for "3" seconds                       |
    And Attribute "tabindex" of "Activate" "Product Factory button" should have value "-1"
    Then Attribute "tabindex" of "Deactivate" "Product Factory button" should have value "-1"
    And Attribute "tabindex" of "Publish" "Product Factory button" should have value "-1"
    And I should see the "Reactivation not allowed due to the Deactivation Reason(s) selected" message