@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @Course
  Scenario: Create Course
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
    And I execute "Create Course Type" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Course" API step

  @Instance #TC-696
  Scenario: Create Course Instance
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
    And I execute "Create Course Type" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Instance" API step

  @InstanceCapacity @StreamToCourseInstance
  Scenario: Add a Stream to Course Instance
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
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I debug
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Change Instance Capacity" API step with parameters
      |capacity|15|

  @InstanceSessions
  Scenario: Get Instance Sessions
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
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Change Instance Capacity" API step with parameters
      |capacity|15|
    And I execute "Get Instance Sessions" API step

  @SessionTimings
  Scenario: Change Session Timings
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
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Change Instance Capacity" API step with parameters
      |capacity|15|
    And I execute "Get Instance Sessions" API step
    And I execute "Change Session Timings" API step

  @InstanceSteps
  Scenario: Get Instance Steps
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
    And I generate new ISBN code saving as "EC_ISBN"
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Change Instance Capacity" API step with parameters
      |capacity|15|
    And I execute "Get Instance Sessions" API step
    And I execute "Change Session Timings" API step
    And I execute "Get Instance Steps" API step

  @CourseStepDueDate #TC-5354
  Scenario: Set Course Step Due Dates
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
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
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

  @CourseStepNumber #TC-5333
  Scenario: Edit Course Number of Steps
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
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Stream" API step
    And I execute "Create Instance" API step
    And I execute "Update Instance" API step with parameters
    |numberOfSteps|5|

  @CourseWithoutSteps #TC-
  Scenario: Create Course Without Number of Steps
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
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Course" API step with parameters
    |numberOfSteps|0|

  @ActivateCourse
  Scenario: Activate Course
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

  @ActivateInstance
  Scenario: Activate Instance
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
    And I execute "Activate Instance" API step

  @CourseBulkOperation
  Scenario: Create Course Bulk Operation
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
    And I execute "Activate Instance" API step
    Then I execute "Create Course Bulk Operation" API step

  @BulkWebPublishing #TC-685
  Scenario: Execute Bulk Web Publishing
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
    And I execute "Activate Instance" API step
    And I debug
    Then I execute "Create Course Bulk Operation" API step
    Then I execute "Bulk Web Publish" API step

  @CourseMaterial
  Scenario: Create Course Material
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
    And I generate new ISBN code saving as "EC_ISBN"
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
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
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Calculate Course Price" API step
    And I execute "Create Stock Site" API step
    And I execute "Create Material Type" API step
    And I execute "Create Material" API step
    Then I execute "Create Course Materials" API step

  @UpdateCourseMaterial
  Scenario: Update Course Material
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
    And I generate new ISBN code saving as "EC_ISBN"
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
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
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Calculate Course Price" API step
    And I execute "Create Stock Site" API step
    And I execute "Create Material Type" API step
    And I execute "Create Material" API step
    Then I execute "Create Course Materials" API step
    And I execute "Update Course Material" API step

  @LinkClientsToCourse
  Scenario: Link Clients to Course
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
    And I generate new ISBN code saving as "EC_ISBN"
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
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Calculate Course Price" API step
    And I execute "Create Stock Site" API step
    And I execute "Create Material Type" API step
    And I execute "Create Material" API step
    And I execute "Create Course Materials" API step
    And I execute "Update Course Material" API step
    Then I execute "Link Course To Clients" API step

    #TODO: Verify test after BPP-17225 is fixed;
  @CourseMaterial  #TC-1075
  Scenario: Add Expired Material
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
    And I generate new ISBN code saving as "EC_ISBN"
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
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
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Calculate Course Price" API step
    And I execute "Create Stock Site" API step
    And I execute "Create Material Type" API step
    And I execute "Create Material" API step with parameters
      |availableDate|2019-01-01|
      |expiryDate   |2020-01-01|
    Then I execute negative "Create Course Materials" API step with expected error "<string>"
#    Then I execute negative "Create Course Materials" API step with error name "safsasf" and parameters
#      |materialReferences|EC_MATERIAL_REFERENCE|

  #TODO: Merge with UI. Add validation about "here" link that highlights second instance. Fix second json files.
  @RedirectInstance @API-UI-COMBO
  Scenario: Redirecting to another Instance
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
    And I execute "Activate Instance" API step
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
    Then I execute "Create Deactivation Reason" API step
    And I execute "Deactivate Instance" API step

  @RedirectInstance #TC-2542
  Scenario: Redirecting the Instance to itself
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
    And I execute "Activate Instance" API step
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
    Then I execute "Create Deactivation Reason" API step
    And I execute negative "Deactivate Instance" API step with error name "A Instance cannot be redirected to itself" and parameters
      |redirectInstanceReference|EC_INSTANCE_REFERENCE|

  @RedirectInstance #TC-
  Scenario: Deactivate without redirection
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
    And I execute "Activate Instance" API step
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
    Then I execute "Create Deactivation Reason" API step
    And I execute negative "Deactivate Instance" API step with error name "Variable `$command` got invalid value." and parameters
      |redirectInstanceReference||

  @Course @Deactivation #TC-
  Scenario: Verify Circle Deactivation Restriction
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
    And I execute "Create Course Type" API step
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Digital Content" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Pricing Matrix" API step
    And I execute "Create Prices" API step
    And I execute "Create Course" API step
    And I execute "Create Vertical" API step saving as "SECOND_"
    And I execute "Create Body" API step with parameters saving as "SECOND_"
      |verticalReference|EC_SECOND_VERTICAL_REFERENCE|
    And I execute "Create Sitting" API step with parameters saving as "SECOND_"
      |bodyReferences|EC_SECOND_BODY_REFERENCE|
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Exam Preparation" API step saving as "SECOND_"
    And I execute "Create Study Mode" API step saving as "SECOND_"
    And I execute "Create Course Type" API step with parameters saving as "SECOND_"
      |vatRuleReference|EC_SECOND_VAT_RULE_REFERENCE|
      |examPreparationReference|EC_SECOND_EXAM_PREPARATION_REFERENCE|
      |studyModeReference|EC_SECOND_STUDY_MODE_REFERENCE|
    And I execute "Create Paper" API step saving as "SECOND_"
    And I execute "Create Level" API step saving as "SECOND_"
    And I execute "Link Body To Levels" API step with parameters
      |bodyReference|EC_SECOND_BODY_REFERENCE|
      |levelReferences|EC_SECOND_LEVEL_REFERENCE|
    And I execute "Change Paper Body" API step with parameters
      |paperReference|EC_SECOND_PAPER_REFERENCE|
      |bodyReference|EC_SECOND_BODY_REFERENCE|
    And I execute "Link Paper To Levels" API step with parameters
      |paperReference|EC_SECOND_PAPER_REFERENCE|
      |levelReferences|EC_SECOND_LEVEL_REFERENCE|
    And I execute "Create Digital Content" API step with parameters saving as "SECOND_"
      |bodyReference|EC_SECOND_BODY_REFERENCE|
      |paperReference|EC_SECOND_PAPER_REFERENCE|
      |levelReference|EC_SECOND_LEVEL_REFERENCE|
      |sittingReferences|EC_SECOND_SITTING_REFERENCE|
      |courseTypeReferences|EC_SECOND_COURSE_TYPE_REFERENCE|
    And I execute "Create Region" API step saving as "SECOND_"
    And I execute "Create Location" API step with parameters saving as "SECOND_"
      |regionReference|EC_SECOND_REGION_REFERENCE|
    And I execute "Create Pricing Matrix" API step with parameters saving as "SECOND_"
      |bodyReference|EC_SECOND_BODY_REFERENCE|
      |sittingReference|EC_SECOND_SITTING_REFERENCE|
    And I execute "Create Prices" API step with parameters
      |pricingMatrixReference|EC_SECOND_PRICING_MATRIX_REFERENCE|
      |courseTypeReference|EC_SECOND_COURSE_TYPE_REFERENCE|
      |paperReferences|EC_SECOND_PAPER_REFERENCE|
      |regionReferences|EC_SECOND_REGION_REFERENCE|
      |value|12000|
    And I execute "Create Course" API step with parameters saving as "SECOND_"
      |paperReference|EC_SECOND_PAPER_REFERENCE|
      |levelReference|EC_SECOND_LEVEL_REFERENCE|
      |sittingReference|EC_SECOND_SITTING_REFERENCE|
      |courseTypeReference|EC_SECOND_COURSE_TYPE_REFERENCE|
      |regionReference|EC_SECOND_REGION_REFERENCE|
    Then I execute "Create Deactivation Reason" API step
    Then I execute "Activate Course" API step
    Then I execute "Activate Course" API step with parameters
      |reference|EC_SECOND_COURSE_REFERENCE|
    Then I execute "Deactivate Course" API step
    Then I execute negative "Deactivate Course" API step with error name "Cannot redirect to Course" and parameters
      |reference|EC_SECOND_COURSE_REFERENCE|
      |redirectCourseReference|EC_COURSE_REFERENCE|