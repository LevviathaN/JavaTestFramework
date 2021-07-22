@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @ISBN
  Scenario: Generate new ISBN
    Then I generate new ISBN code saving as "EC_ISBN"

  @ChangeMaterialFinancialDimension #Only once. If Material is created will cause an error: Material have already created, so you cannot change the Course Financial Dimensions
  Scenario: Attach Financial Dimension to Material
    Then I create Financial Dimensions with Dimension Type of "LEGALENTITY" and Target "MATERIAL" saving as "EC_FD"
    Then I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "MATERIAL" saving as "EC_FD"
    Then I change Material Financial Dimension saving as "EC_MATERIAL"

  @ChangeCourseFinancialDimension #Only once. If Course is created will cause an error: Courses have already created, so you cannot change the Course Financial Dimensions
  Scenario: Attach Financial Dimension to Course
    Then I create Financial Dimensions with Dimension Type of "LEGALENTITY" and Target "COURSE" saving as "EC_FD"
    Then I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSE" saving as "EC_FD"
    Then I change Course Financial Dimension saving as "EC_COURSE"

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Course Type item
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Material Type item
    Then I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "MATERIALTYPE" saving as "EC_MATERIAL_TYPE"

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Location item
    Then I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Body item
    Then I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"

  @FinancialDimension #TC-1532
  Scenario: Create Financial Dimensions record Region item
    Then I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"

  @VatRule #TC-1340
  Scenario: Create Vat Rule
    Then I create new Vat Rule saving as "EC_VAT_RULE"

  @ExamPreparation #TC-4692
  Scenario: Create Exam Preparation
    Then I create new Exam Preparation saving as "EC_EXAM_PREPARATION"

  @StudyMode #TC-4793
  Scenario: Create Study Mode
    Then I create new Study Mode saving as "EC_STUDY_MODE"

  @CourseType #TC-701
  Scenario: Create Course Type
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    Then I create new Course Type saving as "EC_COURSE_TYPE"

  @CourseType @Update #TC-1546
  Scenario: Update Course Type
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    Then I execute "Create Course Type" API step
    And I execute "Update Course Type" API step

  @Vertical #TC-4811
  Scenario: Create Vertical
    When I create new Vertical saving as "EC_VERTICAL"

  @Body @Update #TC-1545
  Scenario: Update Body
    When I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I execute "Create Vertical" API step
    Then I execute "Create Body" API step
    And I execute "Update Body" API step

  @Body #TC-743
  Scenario: Create Body
    When I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create new Vertical saving as "EC_VERTICAL"
    Then I create new Body saving as "EC_BODY"

  @Sitting #TC-835
  Scenario: Create Sitting
    When I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    Then I create new Sitting saving as "EC_SITTING"

  @Paper #TC-772
  Scenario: Create Paper
    When I create new Paper with CBA "false" saving as "EC_PAPER"
    When I create new Paper with CBA "true" saving as "EC_PAPER"

  @Level #TC-746
  Scenario: Create Level
    When I create new Level saving as "EC_LEVEL"

  @LinkBodyToLevel #TC-703
  Scenario: Link Body to Levels
    When I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Level saving as "EC_LEVEL"
    Then I link Body to Levels

  @ChangePaperBody #TC-697
  Scenario: Change Paper Body
    When I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    Then I change Paper Body

  @LinkPaperToLevel #TC-716
  Scenario: Link Paper to Levels
    When I create new Level saving as "EC_LEVEL"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    Then I link Paper to Levels

  @Region #TC-1875
  Scenario: Create Region
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    Then I create new Region saving as "EC_REGION"
    
  @Location #TC-775
  Scenario: Create Location
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I execute "Create Region" API step
    And I execute "Create Location" API step

  @Location @Update #TC-832
  Scenario: Update Location
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Update Location" API step

  @SessionDuration #TC-811
  Scenario: Create Session Duration
    Then I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"

  @PricingMatrix #TC-981
  Scenario: Create Pricing Matrix
    When I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_FD"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    Then I create new Pricing Matrix saving as "EC_PRICING_MATRIX"

  @Prices #TC-1032
  Scenario: Create Prices
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Pricing Matrix saving as "EC_PRICING_MATRIX"
    Then I create new Prices saving as "EC_PRICES"

  @DigitalContent #TC-3148
  Scenario: Create Digital Content
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    Then I create new Digital Content with Content Type "PROFESSIONALQUALIFICATIONS" and Target Platform "TOTARA" saving as "EC_DIGITAL_CONTENT"
    
  @UniversityProgrammes #TC-5387
  Scenario: Create University Programmes
    Then I create new University Programmes saving as "EC_UNIVERSITY_PROGRAMME"

  @ProgrammeCohorts #TC-5391
  Scenario: Create Programme Cohorts
    When I create new University Programmes saving as "EC_UNIVERSITY_PROGRAMME"
    Then I create new Programme Cohorts saving as "EC_PROGRAMME_COHORT"

  @ModuleSection #TC-5407
  Scenario: Create Module Sections
    When I create new University Programmes saving as "EC_UNIVERSITY_PROGRAMME"
    And I create new Programme Cohorts saving as "EC_PROGRAMME_COHORT"
    Then I create new Module Sections with Timetabled checkbox set as "true" and Group Requirements set as "true" saving as "EC_MODULE_SECTIONS"

  @StockSite
  Scenario: Create Stock Site
    Then I create new Stock Site saving as "EC_STOCK_SITE"

  @MaterialType #TC-1435
  Scenario: Create Material Type
    When I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "MATERIALTYPE" saving as "EC_MATERIAL_TYPE"
    Then I create new Material Type with all Checkboxes "true"  saving as "EC_MATERIAL_TYPE"

  @Clients #TC-919
  Scenario: Create Clients
    Then I create new Clients saving as "EC_CLIENTS"

  @Clients @Update #TC-1548
  Scenario: Update Clients
    Given I execute "Create Client" API step
    Then I execute "Update Client" API step

  @Streams #TC-2929
  Scenario: Create Streams
    Then I create new Streams saving as "EC_STREAM"

  @DeactivationReason #TC-975
  Scenario: Create Deactivation Reason
    Then I create new Deactivation Reason with all Checkboxes "true" saving as "EC_DEACTIVATION_REASON"

  @Course
  Scenario: Create Course
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Region saving as "EC_REGION"
    Then I create new Course saving as "EC_COURSE"

  @Instance
  Scenario: Create Instance
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Course saving as "EC_COURSE"
    And I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"
    Then I create new Instance saving as "EC_INSTANCE" and saving new session as "EC_SESSION"

  @InstanceCapacity
  Scenario: Change Instance Capacity
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Course saving as "EC_COURSE"
    And I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"
    And I create new Streams saving as "EC_STREAM"
    And I create new Instance saving as "EC_INSTANCE" and saving new session as "EC_SESSION"
    Then I change Instance Capacity with Capacity "15" saving as "EC_INSTANCE"

  @InstanceSessions
  Scenario: Get Instance Sessions
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Course saving as "EC_COURSE"
    And I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"
    And I create new Streams saving as "EC_STREAM"
    And I create new Instance saving as "EC_INSTANCE" and saving new session as "EC_SESSION"
    And I change Instance Capacity with Capacity "15" saving as "EC_INSTANCE"
    Then I get Instance Sessions saving as "EC_SESSION_TIMING"

  @SessionTimings
  Scenario: Change Session Timings
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Course saving as "EC_COURSE"
    And I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"
    And I create new Streams saving as "EC_STREAM"
    And I create new Instance saving as "EC_INSTANCE" and saving new session as "EC_SESSION"
    And I change Instance Capacity with Capacity "15" saving as "EC_INSTANCE"
    And I get Instance Sessions saving as "EC_SESSION_TIMING"
    Then I change Session Timings saving as "EC_SESSION"

  @InstanceSteps
  Scenario: Get Instance Steps
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Course saving as "EC_COURSE"
    And I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"
    And I create new Streams saving as "EC_STREAM"
    And I create new Instance saving as "EC_INSTANCE" and saving new session as "EC_SESSION"
    And I change Instance Capacity with Capacity "15" saving as "EC_INSTANCE"
    And I get Instance Sessions saving as "EC_SESSION_TIMING"
    And I change Session Timings saving as "EC_SESSION"
    Then I get Instance Steps saving as "EC_STEP"

  @ChangeInstanceSteps  
  Scenario: Change Instance Steps
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Course saving as "EC_COURSE"
    And I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"
    And I create new Streams saving as "EC_STREAM"
    And I create new Instance saving as "EC_INSTANCE" and saving new session as "EC_SESSION"
    And I change Instance Capacity with Capacity "15" saving as "EC_INSTANCE"
    And I get Instance Sessions saving as "EC_SESSION_TIMING"
    And I change Session Timings saving as "EC_SESSION"
    And I get Instance Steps saving as "EC_STEP"
    Then I change Instance Steps saving as "EC_STEP"

  @CalculatePrice  
  Scenario: Calculate Course Price
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"
    And I create new Pricing Matrix saving as "EC_PRICING_MATRIX"
    And I create new Prices saving as "EC_PRICES"
    And I create new Digital Content with Content Type "PROFESSIONALQUALIFICATIONS" and Target Platform "TOTARA" saving as "EC_DIGITAL_CONTENT"
    And I create new Course saving as "EC_COURSE"
    Then I calculate Course Price saving as "EC_PRICE"

  @ActivateCourse
  Scenario: Activate Course
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Digital Content with Content Type "PROFESSIONALQUALIFICATIONS" and Target Platform "TOTARA" saving as "EC_DIGITAL_CONTENT"
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Course saving as "EC_COURSE"
    And I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"
    And I create new Streams saving as "EC_STREAM"
    And I create new Instance saving as "EC_INSTANCE" and saving new session as "EC_SESSION"
    And I change Instance Capacity with Capacity "15" saving as "EC_INSTANCE"
    And I get Instance Sessions saving as "EC_SESSION_TIMING"
    And I change Session Timings saving as "EC_SESSION"
    And I get Instance Steps saving as "EC_STEP"
    And I change Instance Steps saving as "EC_STEP"
    And I create new Pricing Matrix saving as "EC_PRICING_MATRIX"
    And I create new Prices saving as "EC_PRICES"
    And I calculate Course Price saving as "EC_PRICE"
    Then I activate Course saving as "EC_COURSE_ACTIVATION"

  @ActivateInstance
  Scenario: Activate Instance
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Digital Content with Content Type "PROFESSIONALQUALIFICATIONS" and Target Platform "TOTARA" saving as "EC_DIGITAL_CONTENT"
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Course saving as "EC_COURSE"
    And I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"
    And I create new Streams saving as "EC_STREAM"
    And I create new Instance saving as "EC_INSTANCE" and saving new session as "EC_SESSION"
    And I change Instance Capacity with Capacity "15" saving as "EC_INSTANCE"
    And I get Instance Sessions saving as "EC_SESSION_TIMING"
    And I change Session Timings saving as "EC_SESSION"
    And I get Instance Steps saving as "EC_STEP"
    And I change Instance Steps saving as "EC_STEP"
    And I create new Pricing Matrix saving as "EC_PRICING_MATRIX"
    And I create new Prices saving as "EC_PRICES"
    And I calculate Course Price saving as "EC_PRICE"
    And I activate Course saving as "EC_COURSE_ACTIVATION"
    Then I activate Instance saving as "EC_INSTANCE_ACTIVATION"

  @CourseBulkOperation
  Scenario: Create Course Bulk Operation
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Digital Content with Content Type "PROFESSIONALQUALIFICATIONS" and Target Platform "TOTARA" saving as "EC_DIGITAL_CONTENT"
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Course saving as "EC_COURSE"
    And I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"
    And I create new Streams saving as "EC_STREAM"
    And I create new Instance saving as "EC_INSTANCE" and saving new session as "EC_SESSION"
    And I change Instance Capacity with Capacity "15" saving as "EC_INSTANCE"
    And I get Instance Sessions saving as "EC_SESSION_TIMING"
    And I change Session Timings saving as "EC_SESSION"
    And I get Instance Steps saving as "EC_STEP"
    And I change Instance Steps saving as "EC_STEP"
    And I create new Pricing Matrix saving as "EC_PRICING_MATRIX"
    And I create new Prices saving as "EC_PRICES"
    And I calculate Course Price saving as "EC_PRICE"
    And I activate Course saving as "EC_COURSE_ACTIVATION"
    And I activate Instance saving as "EC_INSTANCE_ACTIVATION"
    Then I create Course Bulk Operation saving as "EC_COURSE_BULK_OPERATION"

  @BulkWebPublishing #TC-685
  Scenario: Execute Bulk Web Publishing
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Digital Content with Content Type "PROFESSIONALQUALIFICATIONS" and Target Platform "TOTARA" saving as "EC_DIGITAL_CONTENT"
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Course saving as "EC_COURSE"
    And I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"
    And I create new Streams saving as "EC_STREAM"
    And I create new Instance saving as "EC_INSTANCE" and saving new session as "EC_SESSION"
    And I change Instance Capacity with Capacity "15" saving as "EC_INSTANCE"
    And I get Instance Sessions saving as "EC_SESSION_TIMING"
    And I change Session Timings saving as "EC_SESSION"
    And I get Instance Steps saving as "EC_STEP"
    And I change Instance Steps saving as "EC_STEP"
    And I create new Pricing Matrix saving as "EC_PRICING_MATRIX"
    And I create new Prices saving as "EC_PRICES"
    And I calculate Course Price saving as "EC_PRICE"
    And I activate Course saving as "EC_COURSE_ACTIVATION"
    And I activate Instance saving as "EC_INSTANCE_ACTIVATION"
    And I create Course Bulk Operation saving as "EC_COURSE_BULK_OPERATION"
    Then I execute Bulk Web Publishing with publish to WEB "true" saving course as "EC_COURSE" and instance as "EC_INSTANCE"

  @Instance
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
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I execute "Create Course" API step
    And I execute "Create Session Duration" API step
    And I execute "Create Instance" API step

  @CBA
  Scenario: Create CBA Course Instance
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Exam Preparation" API step
    And I execute "Create Study Mode" API step
    And I execute "Create Course Type" API step
    And I create new Paper with CBA "true" saving as "EC_PAPER"
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Region" API step
    And I execute "Create Location" API step
    And I create new Session Duration with Allowed for CBA "true" saving as "EC_SESSION_DURATION"
    And I execute "Create Instance Group" API step
    And I execute "Create Courses" API step

  @Material
  Scenario: Create Material
    When I generate new ISBN code saving as "EC_ISBN"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "MATERIALTYPE" saving as "EC_MATERIAL_TYPE"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Vat Rule saving as "EC_VAT_RULE_TWO"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Stock Site saving as "EC_STOCK_SITE"
    And I create new Material Type with all Checkboxes "true"  saving as "EC_MATERIAL_TYPE"
    Then I create new Material with Checkboxes set to "false" saving as "EC_MATERIAL"

  @CourseMaterial
  Scenario: Create Course Material
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "MATERIALTYPE" saving as "EC_MATERIAL_TYPE"
    And I generate new ISBN code saving as "EC_ISBN"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Vat Rule saving as "EC_VAT_RULE_TWO"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Digital Content with Content Type "PROFESSIONALQUALIFICATIONS" and Target Platform "TOTARA" saving as "EC_DIGITAL_CONTENT"
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Course saving as "EC_COURSE"
    And I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"
    And I create new Streams saving as "EC_STREAM"
    And I create new Instance saving as "EC_INSTANCE" and saving new session as "EC_SESSION"
    And I change Instance Capacity with Capacity "15" saving as "EC_INSTANCE"
    And I get Instance Sessions saving as "EC_SESSION_TIMING"
    And I change Session Timings saving as "EC_SESSION"
    And I get Instance Steps saving as "EC_STEP"
    And I change Instance Steps saving as "EC_STEP"
    And I create new Pricing Matrix saving as "EC_PRICING_MATRIX"
    And I create new Prices saving as "EC_PRICES"
    And I calculate Course Price saving as "EC_PRICE"
    And I create new Stock Site saving as "EC_STOCK_SITE"
    And I create new Material Type with all Checkboxes "true"  saving as "EC_MATERIAL_TYPE"
    And I create new Material with Checkboxes set to "true" saving as "EC_MATERIAL"
    Then I create new Course Material

  @UpdateCourseMaterial
  Scenario: Create Course Material
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "MATERIALTYPE" saving as "EC_MATERIAL_TYPE"
    And I generate new ISBN code saving as "EC_ISBN"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Vat Rule saving as "EC_VAT_RULE_TWO"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Digital Content with Content Type "PROFESSIONALQUALIFICATIONS" and Target Platform "TOTARA" saving as "EC_DIGITAL_CONTENT"
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Course saving as "EC_COURSE"
    And I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"
    And I create new Streams saving as "EC_STREAM"
    And I create new Instance saving as "EC_INSTANCE" and saving new session as "EC_SESSION"
    And I change Instance Capacity with Capacity "15" saving as "EC_INSTANCE"
    And I get Instance Sessions saving as "EC_SESSION_TIMING"
    And I change Session Timings saving as "EC_SESSION"
    And I get Instance Steps saving as "EC_STEP"
    And I change Instance Steps saving as "EC_STEP"
    And I create new Pricing Matrix saving as "EC_PRICING_MATRIX"
    And I create new Prices saving as "EC_PRICES"
    And I calculate Course Price saving as "EC_PRICE"
    And I create new Stock Site saving as "EC_STOCK_SITE"
    And I create new Material Type with all Checkboxes "true"  saving as "EC_MATERIAL_TYPE"
    And I create new Material with Checkboxes set to "true" saving as "EC_MATERIAL"
    And I create new Course Material
    Then I update new Course Material with Delivery set to "CLASSROOM"

  @LinkClientsToCourse
  Scenario: Link Clients to Course
    When I create Financial Dimensions with Dimension Type of "PROJECT" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_PROJECT"
    And I create Financial Dimensions with Dimension Type of "COSTCENTRE" and Target "COURSETYPE" saving as "EC_COURSE_TYPE_COST_CENTRE"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "BODY" saving as "EC_BODY"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "REGION" saving as "EC_REGION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "LOCATION" saving as "EC_LOCATION"
    And I create Financial Dimensions with Dimension Type of "PRODUCT" and Target "MATERIALTYPE" saving as "EC_MATERIAL_TYPE"
    And I generate new ISBN code saving as "EC_ISBN"
    And I create new Vertical saving as "EC_VERTICAL"
    And I create new Body saving as "EC_BODY"
    And I create new Sitting saving as "EC_SITTING"
    And I create new Vat Rule saving as "EC_VAT_RULE"
    And I create new Vat Rule saving as "EC_VAT_RULE_TWO"
    And I create new Exam Preparation saving as "EC_EXAM_PREPARATION"
    And I create new Study Mode saving as "EC_STUDY_MODE"
    And I create new Course Type saving as "EC_COURSE_TYPE"
    Then I create new Clients saving as "EC_CLIENTS"
    And I create new Paper with CBA "false" saving as "EC_PAPER"
    And I create new Level saving as "EC_LEVEL"
    And I link Body to Levels
    And I change Paper Body
    And I link Paper to Levels
    And I create new Digital Content with Content Type "PROFESSIONALQUALIFICATIONS" and Target Platform "TOTARA" saving as "EC_DIGITAL_CONTENT"
    And I create new Region saving as "EC_REGION"
    And I create new Location saving as "EC_LOCATION"
    And I create new Course saving as "EC_COURSE"
    And I create new Session Duration with Allowed for CBA "false" saving as "EC_SESSION_DURATION"
    And I create new Streams saving as "EC_STREAM"
    And I create new Instance saving as "EC_INSTANCE" and saving new session as "EC_SESSION"
    And I change Instance Capacity with Capacity "15" saving as "EC_INSTANCE"
    And I get Instance Sessions saving as "EC_SESSION_TIMING"
    And I change Session Timings saving as "EC_SESSION"
    And I get Instance Steps saving as "EC_STEP"
    And I change Instance Steps saving as "EC_STEP"
    And I create new Pricing Matrix saving as "EC_PRICING_MATRIX"
    And I create new Prices saving as "EC_PRICES"
    And I calculate Course Price saving as "EC_PRICE"
    And I create new Stock Site saving as "EC_STOCK_SITE"
    And I create new Material Type with all Checkboxes "true"  saving as "EC_MATERIAL_TYPE"
    And I create new Material with Checkboxes set to "true" saving as "EC_MATERIAL"
    And I create new Course Material
    And I update new Course Material with Delivery set to "CLASSROOM"
    Then I link Clients to Course