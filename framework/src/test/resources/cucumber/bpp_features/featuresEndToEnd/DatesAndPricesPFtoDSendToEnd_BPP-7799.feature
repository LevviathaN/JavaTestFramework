@ProductFactory  @DigitalSite
Feature: Ability for Course / Paper etc to be published from Product Factory into BPP.com / The Hub and viewable as an Admin within The Hub
  As a Hub Admin,
  After items were published to Web from Product Factory,
  I should be able to view them

  Background:
    # Face-to-face: 50461261-be24-4354-a30c-eac5e145542d
    Given I remember "50461261-be24-4354-a30c-eac5e145542d" text as "EC_COURSE_REFERENCE_ONE" variable
    # Online Classroom Live: 35e519f8-207d-495e-a2bb-8dda3c1e7964
    Given I remember "35e519f8-207d-495e-a2bb-8dda3c1e7964" text as "EC_COURSE_REFERENCE_TWO" variable
    # Online Classroom: d2adc14d-16d5-4c1c-8444-5fa153380864
    Given I remember "d2adc14d-16d5-4c1c-8444-5fa153380864" text as "EC_COURSE_REFERENCE_THREE" variable

  @EndToEnd #TC-6135
  Scenario: Verify the Published Course is Successfully Transferred From PF to the BPP Website
    Given I execute "Log In" reusable step
    And I wait for "3" seconds
    And I execute "return localStorage.getItem('product-factory-react-token')" JS code and saving value as "EC_AUTH_TOKEN_PF_UAT"
    #                                                   ONE
    And I execute "Search Course" API step with parameters saving as "FTF_COURSE_"
      |courseReference|EC_COURSE_REFERENCE_ONE|
    And I execute "Get Course Instances" API step with parameters saving as "FTF_INSTANCE_"
      |courseReference|EC_COURSE_REFERENCE_ONE|
    And I execute "Get Instance Sessions" API step with parameters saving as "FTF_SESSIONS_FIRST_"
      |instanceReference|EC_FTF_INSTANCE_GET_COURSE_INSTANCES_REFERENCE|
    #                                                   TWO
    And I execute "Search Course" API step with parameters saving as "OCL_COURSE_"
      |courseReference|EC_COURSE_REFERENCE_TWO|
    And I execute "Get Course Instances" API step with parameters saving as "OCL_INSTANCE_"
      |courseReference|EC_COURSE_REFERENCE_TWO|
    And I execute "Get Instance Sessions" API step with parameters saving as "OCL_SESSIONS_FIRST_"
      |instanceReference|EC_OCL_INSTANCE_GET_COURSE_INSTANCES_REFERENCE|
    #                                                   THREE
    And I execute "Search Course" API step with parameters saving as "OC_COURSE_"
      |courseReference|EC_COURSE_REFERENCE_THREE|
    And I execute "Get Course Instances" API step with parameters saving as "OC_INSTANCE_"
      |courseReference|EC_COURSE_REFERENCE_THREE|
    And I execute "Get Instance Sessions" API step with parameters saving as "OC_SESSIONS_FIRST_"
      |instanceReference|EC_OC_INSTANCE_GET_COURSE_INSTANCES_REFERENCE|
    #                                                   Publish to WEB
    Then I execute "Create Course Bulk Operation" API step with parameters
      |courseReferences|EC_COURSE_REFERENCE_ONE,EC_COURSE_REFERENCE_TWO,EC_COURSE_REFERENCE_THREE|
    Then I execute "Bulk Web Publish" API step
    #                                                   Web Site
    Then I am on "https://web-stage-bppdigital.bppuniversity.com/automation-pf-to-ds" URL
    And I should see the "First Automation Paper" element
    Then I should see the "View and buy courses" "BPP Digital Profile button"
    And I click on the "View and buy courses" "BPP Digital Profile button"
    And I wait for "190" seconds
    And Browser performs "Refresh" command
    And I click on the "View and buy courses" "BPP Digital Profile button"
    #                                                         ONE
    And I validate text "CONTAINS=TAUGHT" to be displayed for "1" "BPP Digital Course Type from Product Factory"
    And I validate text "CONTAINS=FIRST AUTOMATION ECOMMERCE" to be displayed for "1" "BPP Digital Syllabus from Product Factory"
    And I validate text "CONTAINS=2 Weekday sessions starting" to be displayed for "1" "BPP Digital Course Start from Product Factory"
    Given I transform "EC_FTF_INSTANCE_GET_COURSE_INSTANCES_START_DATE" date with pattern "yyyy-MM-dd" to another "E d MMM yyyy" pattern saving value as "EC_FTF_INSTANCE_START_DATE"
    And I validate text "CONTAINS=EC_FTF_INSTANCE_START_DATE" to be displayed for "1" "BPP Digital Course Start from Product Factory"
    And I validate text "CONTAINS=Face-to-Face" to be displayed for "1" "BPP Digital Study Type from Product Factory"
    And I validate text "CONTAINS=EC_FTF_INSTANCE_GET_COURSE_INSTANCES_DEFAULT_LOCATION_NAME" to be displayed for "1" "BPP Digital Study Type from Product Factory"
    And I validate text "Inc. VAT" to be displayed for "1" "BPP Digital Inc Vat from Product Factory"
    And I validate text "CONTAINS=£13,320" to be displayed for "1" "BPP Digital Price with Vat from Product Factory"
    And I should see the "1" "BPP Digital Add to Basket button from Product Factory"
    #                                                         TWO
    And I validate text "CONTAINS=TAUGHT" to be displayed for "2" "BPP Digital Course Type from Product Factory"
    And I validate text "CONTAINS=FIRST AUTOMATION ECOMMERCE" to be displayed for "2" "BPP Digital Syllabus from Product Factory"
    And I validate text "CONTAINS=2 Weekday sessions starting" to be displayed for "2" "BPP Digital Course Start from Product Factory"
    Given I transform "EC_OCL_INSTANCE_GET_COURSE_INSTANCES_START_DATE" date with pattern "yyyy-MM-dd" to another "E d MMM yyyy" pattern saving value as "EC_OCL_INSTANCE_START_DATE"
    And I validate text "CONTAINS=EC_OCL_INSTANCE_START_DATE" to be displayed for "2" "BPP Digital Course Start from Product Factory"
    And I validate text "CONTAINS=EC_OCL_COURSE_SEARCH_COURSE_COURSE_TYPE_DESCRIPTION" to be displayed for "2" "BPP Digital Study Type from Product Factory"
    And I validate text "CONTAINS=EC_OCL_INSTANCE_GET_COURSE_INSTANCES_DEFAULT_LOCATION_NAME" to be displayed for "2" "BPP Digital Study Type from Product Factory"
    And I validate text "Inc. VAT" to be displayed for "2" "BPP Digital Inc Vat from Product Factory"
    And I validate text "CONTAINS=£1,440" to be displayed for "2" "BPP Digital Price with Vat from Product Factory"
    And I should see the "2" "BPP Digital Add to Basket button from Product Factory"
    #                                                         THREE
    And I validate text "CONTAINS=TAUGHT" to be displayed for "3" "BPP Digital Course Type from Product Factory"
    And I validate text "CONTAINS=FIRST AUTOMATION ECOMMERCE" to be displayed for "3" "BPP Digital Syllabus from Product Factory"
    And I validate text "CONTAINS=Pre-recorded sessions" to be displayed for "3" "BPP Digital Course Start from Product Factory"
    Given I transform "EC_OC_INSTANCE_GET_COURSE_INSTANCES_START_DATE" date with pattern "yyyy-MM-dd" to another "E d MMM yyyy" pattern saving value as "EC_OC_INSTANCE_START_DATE"
    And I validate text "CONTAINS=EC_OC_INSTANCE_START_DATE" to be displayed for "3" "BPP Digital Course Start from Product Factory"
    And I validate text "CONTAINS=EC_OC_COURSE_SEARCH_COURSE_COURSE_TYPE_DESCRIPTION" to be displayed for "3" "BPP Digital Study Type from Product Factory"
    And I validate text "CONTAINS=EC_OC_INSTANCE_GET_COURSE_INSTANCES_DEFAULT_LOCATION_NAME" to be displayed for "3" "BPP Digital Study Type from Product Factory"
    And I validate text "Inc. VAT" to be displayed for "3" "BPP Digital Inc Vat from Product Factory"
    And I validate text "CONTAINS=£2,520" to be displayed for "3" "BPP Digital Price with Vat from Product Factory"
    And I should see the "3" "BPP Digital Add to Basket button from Product Factory"
    #                                                         Expand First
    And I click on the "1" "BPP Digital Expand paper course arrow from Product Factory"
    And I validate text "CONTAINS=London (1 Weekday sessions)" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=Sat 1 May (10:00 am - 12:00 pm)" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=First Automation Location" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=First Automation Address, Second Automation Address, Third Automation Address" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=London E1 7AA" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=View on map" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=Birmingham (1 Weekday sessions)" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=Wed 1 December (10:00 am - 12:00 pm)" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=Second Automation Location" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=Fourth Automation Address, Fifth Automation Address, Sixth Automation Address" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=Birmingham B4" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=View on map" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=First Automation Material Type (1)" to be displayed for "1" "BPP Digital Course Coverage from Product Factory"
    And I click on the "1" "BPP Digital Expand paper course arrow from Product Factory"
    #                                                         Expand Second
    And I click on the "2" "BPP Digital Expand paper course arrow from Product Factory"
    And I validate text "CONTAINS=London (2 Weekday sessions)" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=Sun 19 December (11:11 am - 10:22 pm)" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=Mon 27 December (10:00 am - 8:00 pm)" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=Online Classroom Live" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=Interactive live online sessions at scheduled times utilising the premium Adobe Connect software." to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=First Automation Material Type (1)" to be displayed for "1" "BPP Digital Course Coverage from Product Factory"
    And I click on the "2" "BPP Digital Expand paper course arrow from Product Factory"
    #                                                         Expand Third
    And I click on the "3" "BPP Digital Expand paper course arrow from Product Factory"
    And I validate text "CONTAINS=Online on demand learning" to be displayed for "1" "BPP Digital Course Timing and Address from Product Factory"
    And I validate text "CONTAINS=Study pre-recorded classes online at a time and place that fits your busy lifestyle, with the structure and support to keep you motivated and ensure your exam success." to be displayed for "1" "BPP Digital Course Timing and Address from Product Factory"
    And I validate text "CONTAINS=First Automation Material Type (1)" to be displayed for "1" "BPP Digital Course Coverage from Product Factory"
    #                                                         Unpublish to web
    Then I execute "Bulk Web Publish" API step with parameters
      |makeAvailable|false|