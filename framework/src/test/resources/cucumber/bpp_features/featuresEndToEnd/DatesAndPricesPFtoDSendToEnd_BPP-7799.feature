@ProductFactoryUAT @DigitalSite
Feature: Ability for Course / Paper etc to be published from Product Factory into BPP.com / The Hub and viewable as an Admin within The Hub
  As a Hub Admin,
  After items were published to Web from Product Factory,
  I should be able to view them

  Background:
    # Time for session
    Given I transform "[TIMENOW-PLUS-1DAYS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd" pattern saving value as "EC_FTF_START_DATE"
    Given I transform "[TIMENOW-PLUS-2DAYS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd" pattern saving value as "EC_FTF_END_DATE"
    Given I transform "[TIMENOW-PLUS-3DAYS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd" pattern saving value as "EC_OCL_START_DATE"
    Given I transform "[TIMENOW-PLUS-4DAYS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd" pattern saving value as "EC_OCL_END_DATE"
    Given I transform "[TIMENOW-PLUS-5DAYS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd" pattern saving value as "EC_OC_START_DATE"
    Given I transform "[TIMENOW-PLUS-6DAYS]" date with pattern "yyyy-MM-dd HH:mm" to another "yyyy-MM-dd" pattern saving value as "EC_OC_END_DATE"
    Given I transform "EC_FTF_START_DATE" date with pattern "yyyy-MM-dd" to another "E d MMM yyyy" pattern saving value as "EC_FTF_SESSION_START_DATE"
    Given I transform "EC_FTF_END_DATE" date with pattern "yyyy-MM-dd" to another "E d MMM yyyy" pattern saving value as "EC_FTF_SESSION_END_DATE"
    Given I transform "EC_OCL_START_DATE" date with pattern "yyyy-MM-dd" to another "E d MMM yyyy" pattern saving value as "EC_OCL_SESSION_START_DATE"
    Given I transform "EC_OCL_END_DATE" date with pattern "yyyy-MM-dd" to another "E d MMM yyyy" pattern saving value as "EC_OCL_SESSION_END_DATE"
    Given I transform "EC_OC_START_DATE" date with pattern "yyyy-MM-dd" to another "E d MMM yyyy" pattern saving value as "EC_OC_SESSION_START_DATE"
    Given I transform "EC_OC_END_DATE" date with pattern "yyyy-MM-dd" to another "E d MMM yyyy" pattern saving value as "EC_OC_SESSION_END_DATE"
    Given I transform "EC_FTF_SESSION_START_DATE" date with pattern "E d MMM yyyy" to another "EEE d MMMM" pattern saving value as "EC_FTF_SESSION_START_DATE_U"
    Given I transform "EC_FTF_SESSION_END_DATE" date with pattern "E d MMM yyyy" to another "EEE d MMMM" pattern saving value as "EC_FTF_SESSION_END_DATE_U"
    Given I transform "EC_OCL_SESSION_START_DATE" date with pattern "E d MMM yyyy" to another "EEE d MMMM" pattern saving value as "EC_OCL_SESSION_START_DATE_U"
    Given I transform "EC_OCL_SESSION_END_DATE" date with pattern "E d MMM yyyy" to another "EEE d MMMM" pattern saving value as "EC_OCL_SESSION_END_DATE_U"
    Given I transform "EC_OC_SESSION_START_DATE" date with pattern "E d MMM yyyy" to another "EEE d MMMM" pattern saving value as "EC_OC_SESSION_START_DATE_U"
    Given I transform "EC_OC_SESSION_END_DATE" date with pattern "E d MMM yyyy" to another "EEE d MMMM" pattern saving value as "EC_OC_SESSION_END_DATE_U"
    Given I transform "[TIMENOW-PLUS-1HOURS]" date with pattern "MM-dd-yyyy HH:mm" to another "HH:mm" pattern saving value as "EC_FTF_SESSION_ONE_START_TIME"
    Given I transform "[TIMENOW-PLUS-2HOURS]" date with pattern "MM-dd-yyyy HH:mm" to another "HH:mm" pattern saving value as "EC_FTF_SESSION_ONE_END_TIME"
    Given I transform "[TIMENOW-PLUS-2HOURS]" date with pattern "MM-dd-yyyy HH:mm" to another "HH:mm" pattern saving value as "EC_FTF_SESSION_TWO_START_TIME"
    Given I transform "[TIMENOW-PLUS-3HOURS]" date with pattern "MM-dd-yyyy HH:mm" to another "HH:mm" pattern saving value as "EC_FTF_SESSION_TWO_END_TIME"
    Given I transform "[TIMENOW-PLUS-3HOURS]" date with pattern "MM-dd-yyyy HH:mm" to another "HH:mm" pattern saving value as "EC_OCL_SESSION_ONE_START_TIME"
    Given I transform "[TIMENOW-PLUS-4HOURS]" date with pattern "MM-dd-yyyy HH:mm" to another "HH:mm" pattern saving value as "EC_OCL_SESSION_ONE_END_TIME"
    Given I transform "[TIMENOW-PLUS-4HOURS]" date with pattern "MM-dd-yyyy HH:mm" to another "HH:mm" pattern saving value as "EC_OCL_SESSION_TWO_START_TIME"
    Given I transform "[TIMENOW-PLUS-5HOURS]" date with pattern "MM-dd-yyyy HH:mm" to another "HH:mm" pattern saving value as "EC_OCL_SESSION_TWO_END_TIME"
    Given I transform "[TIMENOW-PLUS-5HOURS]" date with pattern "MM-dd-yyyy HH:mm" to another "HH:mm" pattern saving value as "EC_OC_SESSION_ONE_START_TIME"
    Given I transform "[TIMENOW-PLUS-6HOURS]" date with pattern "MM-dd-yyyy HH:mm" to another "HH:mm" pattern saving value as "EC_OC_SESSION_ONE_END_TIME"
    Given I transform "[TIMENOW-PLUS-6HOURS]" date with pattern "MM-dd-yyyy HH:mm" to another "HH:mm" pattern saving value as "EC_OC_SESSION_TWO_START_TIME"
    Given I transform "[TIMENOW-PLUS-7HOURS]" date with pattern "MM-dd-yyyy HH:mm" to another "HH:mm" pattern saving value as "EC_OC_SESSION_TWO_END_TIME"
    Given I transform "EC_FTF_SESSION_ONE_START_TIME" date with pattern "HH:mm" to another "h:m a" pattern saving value as "EC_FTF_SESSION_ONE_START_TIME_U"
    Given I transform "EC_FTF_SESSION_ONE_END_TIME" date with pattern "HH:mm" to another "h:m a" pattern saving value as "EC_FTF_SESSION_ONE_END_TIME_U"
    Given I transform "EC_FTF_SESSION_TWO_START_TIME" date with pattern "HH:mm" to another "h:m a" pattern saving value as "EC_FTF_SESSION_TWO_START_TIME_U"
    Given I transform "EC_FTF_SESSION_TWO_END_TIME" date with pattern "HH:mm" to another "h:m a" pattern saving value as "EC_FTF_SESSION_TWO_END_TIME_U"
    Given I transform "EC_OCL_SESSION_ONE_START_TIME" date with pattern "HH:mm" to another "h:m a" pattern saving value as "EC_OCL_SESSION_ONE_START_TIME_U"
    Given I transform "EC_OCL_SESSION_ONE_END_TIME" date with pattern "HH:mm" to another "h:m a" pattern saving value as "EC_OCL_SESSION_ONE_END_TIME_U"
    Given I transform "EC_OCL_SESSION_TWO_START_TIME" date with pattern "HH:mm" to another "h:m a" pattern saving value as "EC_OCL_SESSION_TWO_START_TIME_U"
    Given I transform "EC_OCL_SESSION_TWO_END_TIME" date with pattern "HH:mm" to another "h:m a" pattern saving value as "EC_OCL_SESSION_TWO_END_TIME_U"
    Given I transform "EC_OC_SESSION_ONE_START_TIME" date with pattern "HH:mm" to another "h:m a" pattern saving value as "EC_OC_SESSION_ONE_START_TIME_U"
    Given I transform "EC_OC_SESSION_ONE_END_TIME" date with pattern "HH:mm" to another "h:m a" pattern saving value as "EC_OC_SESSION_ONE_END_TIME_U"
    Given I transform "EC_OC_SESSION_TWO_START_TIME" date with pattern "HH:mm" to another "h:m a" pattern saving value as "EC_OC_SESSION_TWO_START_TIME_U"
    Given I transform "EC_OC_SESSION_TWO_END_TIME" date with pattern "HH:mm" to another "h:m a" pattern saving value as "EC_OC_SESSION_TWO_END_TIME_U"
    # Face-to-face: 50461261-be24-4354-a30c-eac5e145542d
    Given I remember "50461261-be24-4354-a30c-eac5e145542d" text as "EC_COURSE_REFERENCE_ONE" variable
    # Online Classroom Live: 35e519f8-207d-495e-a2bb-8dda3c1e7964
    Given I remember "35e519f8-207d-495e-a2bb-8dda3c1e7964" text as "EC_COURSE_REFERENCE_TWO" variable
    # Online Classroom: d2adc14d-16d5-4c1c-8444-5fa153380864
    Given I remember "d2adc14d-16d5-4c1c-8444-5fa153380864" text as "EC_COURSE_REFERENCE_THREE" variable
    # First Location: e29494d2-e80d-4e77-8a0e-e55c9f134f9c
    Given I remember "e29494d2-e80d-4e77-8a0e-e55c9f134f9c" text as "EC_FIRST_LOCATION" variable
    # Second Location: 993f3be0-c84d-4be1-b567-6b3235710fe7
    Given I remember "993f3be0-c84d-4be1-b567-6b3235710fe7" text as "EC_SECOND_LOCATION" variable
    # Online First Location: cd978283-e79d-4699-ba88-0c310d694405
    Given I remember "cd978283-e79d-4699-ba88-0c310d694405" text as "EC_ONLINE_FIRST_LOCATION" variable
    # Online Second Location: 69ef185d-4feb-4895-9510-982c83cc08b9
    Given I remember "69ef185d-4feb-4895-9510-982c83cc08b9" text as "EC_ONLINE_SECOND_LOCATION" variable
    # Sitting Reference: 279d79bd-bd05-4883-a42a-0053785b302b
    Given I remember "279d79bd-bd05-4883-a42a-0053785b302b" text as "EC_SITTING_REFERENCE" variable
    # Body Reference: 9259b6e8-2f0e-481e-804a-f2a6980b4813
    Given I remember "9259b6e8-2f0e-481e-804a-f2a6980b4813" text as "EC_BODY_REFERENCE" variable
    # Financial Dimension: 2c444287-8ed9-45ac-bbf8-c80f8ff0d451
    Given I remember "2c444287-8ed9-45ac-bbf8-c80f8ff0d451" text as "EC_LOCATION_FINANCIAL_DIMENSION_REFERENCE" variable
    # Region: 4db29810-2b44-47ff-b545-669dde8766fc
    Given I remember "4db29810-2b44-47ff-b545-669dde8766fc" text as "EC_REGION_REFERENCE" variable
    # Material Type: fc79f6f2-06cc-466a-ae52-a23d2a34f7db
    Given I remember "fc79f6f2-06cc-466a-ae52-a23d2a34f7db" text as "EC_MATERIAL_TYPE_REFERENCE" variable
    # Material Type Financial Dimension: b99df031-e77a-42a2-86ed-21411b1592f0
    Given I remember "b99df031-e77a-42a2-86ed-21411b1592f0" text as "EC_MATERIAL_TYPE_FINANCIAL_DIMENSION_REFERENCE" variable


  @EndToEnd #TC-6135
  Scenario: Verify the Published Course is Successfully Transferred From PF to the BPP Website
    Given I execute "Log In" reusable step
    And I wait for "3" seconds
    And I execute "return localStorage.getItem('product-factory-react-token')" JS code and saving value as "EC_AUTH_TOKEN_PF_UAT"
#                                                       ONE
    And I execute "Search Course" API step with parameters saving as "FTF_COURSE_"
      |courseReference|EC_COURSE_REFERENCE_ONE|
    And I execute "Get Course Instances" API step with parameters saving as "FTF_INSTANCE_"
      |courseReference|EC_COURSE_REFERENCE_ONE|
    And I execute "Get Instance Sessions" API step with parameters saving as "FTF_SESSIONS_FIRST_"
      |instanceReference|EC_FTF_INSTANCE_GET_COURSE_INSTANCES_REFERENCE|
#                                                       TWO
    And I execute "Search Course" API step with parameters saving as "OCL_COURSE_"
      |courseReference|EC_COURSE_REFERENCE_TWO|
    And I execute "Get Course Instances" API step with parameters saving as "OCL_INSTANCE_"
      |courseReference|EC_COURSE_REFERENCE_TWO|
    And I execute "Get Instance Sessions" API step with parameters saving as "OCL_SESSIONS_FIRST_"
      |instanceReference|EC_OCL_INSTANCE_GET_COURSE_INSTANCES_REFERENCE|
#                                                       THREE
    And I execute "Search Course" API step with parameters saving as "OC_COURSE_"
      |courseReference|EC_COURSE_REFERENCE_THREE|
    And I execute "Get Course Instances" API step with parameters saving as "OC_INSTANCE_"
      |courseReference|EC_COURSE_REFERENCE_THREE|
    And I execute "Get Instance Sessions" API step with parameters saving as "OC_SESSIONS_FIRST_"
      |instanceReference|EC_OC_INSTANCE_GET_COURSE_INSTANCES_REFERENCE|
#                                                      Update
    And I execute "Update Sitting" API step with parameters
      |reference|EC_SITTING_REFERENCE|
    And I execute "Update Location" API step with parameters saving as "FIRST_LOCATION_"
      |reference|EC_FIRST_LOCATION|
    And I execute "Update Location" API step with parameters saving as "SECOND_LOCATION_"
      |reference|EC_SECOND_LOCATION|
    And I execute "Update Location" API step with parameters saving as "ONLINE_FIRST_LOCATION_"
      |reference|EC_ONLINE_FIRST_LOCATION|
    And I execute "Update Location" API step with parameters saving as "ONLINE_SECOND_LOCATION_"
      |reference|EC_ONLINE_SECOND_LOCATION|
    And I execute "Update Material Type" API step saving as "NEW_MATERIAL_TYPE_"
#                                                       Session # 1 Face to Face
    And I execute "Change Session Timings" API step with parameters saving as "FTF_SESSIONS_TIMING_ONE_"
      |sessionReference|EC_FTF_INSTANCE_GET_COURSE_INSTANCES_SESSIONS_REFERENCE|
      |sessionTimingReference|EC_FTF_SESSIONS_FIRST_GET_INSTANCE_SESSIONS_TIMINGS_REFERENCE|
      |sessionDate|EC_FTF_START_DATE|
      |startTime|EC_FTF_SESSION_ONE_START_TIME|
      |endTime  |EC_FTF_SESSION_ONE_END_TIME|
#                                                       Session # 2 Face to Face
    And I execute "Change Session Timings" API step with parameters saving as "FTF_SESSIONS_TIMING_TWO_"
      |sessionReference|EC_FTF_INSTANCE_GET_COURSE_INSTANCES_SESSIONS_REFERENCE_COPY|
      |sessionTimingReference|EC_FTF_SESSIONS_FIRST_GET_INSTANCE_SESSIONS_TIMINGS_REFERENCE_COPY|
      |sessionDate|EC_FTF_END_DATE|
      |startTime|EC_FTF_SESSION_TWO_START_TIME|
      |endTime  |EC_FTF_SESSION_TWO_END_TIME|
#                                                       Session # 1 Online Classroom Live
    And I execute "Change Session Timings" API step with parameters saving as "OCL_SESSIONS_TIMING_ONE_"
      |sessionReference|EC_OCL_INSTANCE_GET_COURSE_INSTANCES_SESSIONS_REFERENCE|
      |sessionTimingReference|EC_OCL_SESSIONS_FIRST_GET_INSTANCE_SESSIONS_TIMINGS_REFERENCE|
      |sessionDate|EC_OCL_START_DATE|
      |startTime|EC_OCL_SESSION_ONE_START_TIME|
      |endTime  |EC_OCL_SESSION_ONE_END_TIME|
#                                                       Session # 2 Online Classroom Live
    And I execute "Change Session Timings" API step with parameters saving as "OCL_SESSIONS_TIMING_TWO_"
      |sessionReference|EC_OCL_INSTANCE_GET_COURSE_INSTANCES_SESSIONS_REFERENCE_COPY|
      |sessionTimingReference|EC_OCL_SESSIONS_FIRST_GET_INSTANCE_SESSIONS_TIMINGS_REFERENCE_COPY|
      |sessionDate|EC_OCL_END_DATE|
      |startTime|EC_OCL_SESSION_TWO_START_TIME|
      |endTime  |EC_OCL_SESSION_TWO_END_TIME|
#                                                       Session # 1 Online Classroom
    And I execute "Change Session Timings" API step with parameters saving as "OC_SESSIONS_TIMING_ONE_"
      |sessionReference|EC_OC_INSTANCE_GET_COURSE_INSTANCES_SESSIONS_REFERENCE|
      |sessionTimingReference|EC_OC_SESSIONS_FIRST_GET_INSTANCE_SESSIONS_TIMINGS_REFERENCE|
      |sessionDate|EC_OC_START_DATE|
      |startTime|EC_OC_SESSION_ONE_START_TIME|
      |endTime  |EC_OC_SESSION_ONE_END_TIME|
#                                                       Session # 2 Online Classroom
    And I execute "Change Session Timings" API step with parameters saving as "OC_SESSIONS_TIMING_TWO_"
      |sessionReference|EC_OC_INSTANCE_GET_COURSE_INSTANCES_SESSIONS_REFERENCE_COPY|
      |sessionTimingReference|EC_OC_SESSIONS_FIRST_GET_INSTANCE_SESSIONS_TIMINGS_REFERENCE_COPY|
      |sessionDate|EC_OC_END_DATE|
      |startTime|EC_OC_SESSION_TWO_START_TIME|
      |endTime  |EC_OC_SESSION_TWO_END_TIME|
#                                                       Publish to WEB
    Then I execute "Create Course Bulk Operation" API step with parameters
      |courseReferences|EC_COURSE_REFERENCE_ONE,EC_COURSE_REFERENCE_TWO,EC_COURSE_REFERENCE_THREE|
    Then I execute "Bulk Web Publish" API step
#                                                       Web Site
    Then I am on "https://web-stage-bppdigital.bppuniversity.com/automation-pf-to-ds" URL
    And I should see the "First Automation Paper" element
    Then I should see the "View and buy courses" "BPP Digital Profile button"
    And I click on the "View and buy courses" "BPP Digital Profile button"
    And I wait for "190" seconds
    And Browser performs "Refresh" command
    And I click on the "View and buy courses" "BPP Digital Profile button"
#                                                        ONE
    And I validate text "CONTAINS=EC_FTF_SESSION_START_DATE" to be displayed for "1" "BPP Digital Course Start from Product Factory"
    And I validate text "CONTAINS=TAUGHT" to be displayed for "1" "BPP Digital Course Type from Product Factory"
    And I validate text "CONTAINS=EC_UPDATED_ECOMMERCE_NAME" to be displayed for "1" "BPP Digital Syllabus from Product Factory"
    And I validate text "CONTAINS=2 Weekday sessions starting" to be displayed for "1" "BPP Digital Course Start from Product Factory"
    And I validate text "CONTAINS=EC_FTF_SESSION_START_DATE" to be displayed for "1" "BPP Digital Course Start from Product Factory"
    And I validate text "CONTAINS=Face-to-Face" to be displayed for "1" "BPP Digital Study Type from Product Factory"
    And I validate text "CONTAINS=EC_FIRST_LOCATION_UPDATE_LOCATION_NAME" to be displayed for "1" "BPP Digital Study Type from Product Factory"
    And I validate text "Inc. VAT" to be displayed for "1" "BPP Digital Inc Vat from Product Factory"
    And I validate text "CONTAINS=£13,320" to be displayed for "1" "BPP Digital Price with Vat from Product Factory"
    And I should see the "1" "BPP Digital Add to Basket button from Product Factory"
#                                                         TWO
    And I validate text "CONTAINS=TAUGHT" to be displayed for "2" "BPP Digital Course Type from Product Factory"
    And I validate text "CONTAINS=EC_UPDATED_ECOMMERCE_NAME" to be displayed for "2" "BPP Digital Syllabus from Product Factory"
    And I validate text "CONTAINS=2 Weekday sessions starting" to be displayed for "2" "BPP Digital Course Start from Product Factory"
    And I validate text "CONTAINS=EC_OCL_SESSION_START_DATE" to be displayed for "2" "BPP Digital Course Start from Product Factory"
    And I validate text "CONTAINS=EC_OCL_COURSE_SEARCH_COURSE_COURSE_TYPE_DESCRIPTION" to be displayed for "2" "BPP Digital Study Type from Product Factory"
    And I validate text "CONTAINS=EC_BULK_WEB_PUBLISH_COURSES_INSTANCES_INSTANCE_DEFAULT_LOCATION_NAME" to be displayed for "2" "BPP Digital Study Type from Product Factory"
    And I validate text "Inc. VAT" to be displayed for "2" "BPP Digital Inc Vat from Product Factory"
    And I validate text "CONTAINS=£1,440" to be displayed for "2" "BPP Digital Price with Vat from Product Factory"
    And I should see the "2" "BPP Digital Add to Basket button from Product Factory"
#                                                         THREE
    And I validate text "CONTAINS=TAUGHT" to be displayed for "3" "BPP Digital Course Type from Product Factory"
    And I validate text "CONTAINS=EC_UPDATED_ECOMMERCE_NAME" to be displayed for "3" "BPP Digital Syllabus from Product Factory"
    And I validate text "CONTAINS=Pre-recorded sessions" to be displayed for "3" "BPP Digital Course Start from Product Factory"
    And I validate text "CONTAINS=EC_OC_SESSION_START_DATE" to be displayed for "3" "BPP Digital Course Start from Product Factory"
    And I validate text "CONTAINS=EC_OC_COURSE_SEARCH_COURSE_COURSE_TYPE_DESCRIPTION" to be displayed for "3" "BPP Digital Study Type from Product Factory"
    And I validate text "CONTAINS=EC_BULK_WEB_PUBLISH_COURSES_INSTANCES_INSTANCE_DEFAULT_LOCATION_NAME_COPY" to be displayed for "3" "BPP Digital Study Type from Product Factory"
    And I validate text "Inc. VAT" to be displayed for "3" "BPP Digital Inc Vat from Product Factory"
    And I validate text "CONTAINS=£2,520" to be displayed for "3" "BPP Digital Price with Vat from Product Factory"
    And I should see the "3" "BPP Digital Add to Basket button from Product Factory"
#                                                         Expand First
    And I click on the "1" "BPP Digital Expand paper course arrow from Product Factory"
    And I validate text "CONTAINS=EC_FIRST_LOCATION_UPDATE_LOCATION_CITY" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=(1 Weekday sessions)" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_FTF_SESSION_START_DATE_U" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_FTF_SESSION_ONE_START_TIME_U" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_FTF_SESSION_ONE_END_TIME_U" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_FIRST_LOCATION_UPDATE_LOCATION_NAME" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_FIRST_LOCATION_UPDATE_LOCATION_ADDRESS_LINE1" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_FIRST_LOCATION_UPDATE_LOCATION_ADDRESS_LINE2" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_FIRST_LOCATION_UPDATE_LOCATION_ADDRESS_LINE3" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_FIRST_LOCATION_UPDATE_LOCATION_POSTCODE" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=View on map" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_SECOND_LOCATION_UPDATE_LOCATION_CITY" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=(1 Weekday sessions)" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_FTF_SESSION_END_DATE_U" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_FTF_SESSION_TWO_START_TIME_U" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_FTF_SESSION_TWO_END_TIME_U" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_SECOND_LOCATION_UPDATE_LOCATION_NAME" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_SECOND_LOCATION_UPDATE_LOCATION_ADDRESS_LINE1" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_SECOND_LOCATION_UPDATE_LOCATION_ADDRESS_LINE2" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_SECOND_LOCATION_UPDATE_LOCATION_ADDRESS_LINE3" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_SECOND_LOCATION_UPDATE_LOCATION_POSTCODE" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=View on map" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_NEW_MATERIAL_TYPE_MATERIAL_TYPE_NAME" to be displayed for "1" "BPP Digital Course Coverage from Product Factory"
    And I click on the "1" "BPP Digital Expand paper course arrow from Product Factory"
    And I wait for "2" seconds
#                                                         Expand Second
    And I click on the "2" "BPP Digital Expand paper course arrow from Product Factory"
    And I validate text "CONTAINS=EC_ONLINE_SECOND_LOCATION_UPDATE_LOCATION_CITY" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=(2 Weekday sessions)" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_OCL_SESSION_START_DATE_U" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_OCL_SESSION_ONE_START_TIME_U" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_OCL_SESSION_ONE_END_TIME_U" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_OCL_SESSION_END_DATE_U" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_OCL_SESSION_TWO_START_TIME_U" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_OCL_SESSION_TWO_END_TIME_U" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=Online Classroom Live" to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=Interactive live online sessions at scheduled times utilising the premium Adobe Connect software." to be displayed for "1" "BPP Digital Row Courses from Product Factory"
    And I validate text "CONTAINS=EC_NEW_MATERIAL_TYPE_MATERIAL_TYPE_NAME" to be displayed for "1" "BPP Digital Course Coverage from Product Factory"
    And I click on the "2" "BPP Digital Expand paper course arrow from Product Factory"
    And I wait for "2" seconds
#                                                         Expand Third
    And I click on the "3" "BPP Digital Expand paper course arrow from Product Factory"
    And I validate text "CONTAINS=Online on demand learning" to be displayed for "1" "BPP Digital Course Timing and Address from Product Factory"
    And I validate text "CONTAINS=Study pre-recorded classes online at a time and place that fits your busy lifestyle, with the structure and support to keep you motivated and ensure your exam success." to be displayed for "1" "BPP Digital Course Timing and Address from Product Factory"
    And I validate text "CONTAINS=EC_NEW_MATERIAL_TYPE_MATERIAL_TYPE_NAME" to be displayed for "1" "BPP Digital Course Coverage from Product Factory"
#                                                         Unpublish to web
    Then I execute "Bulk Web Publish" API step with parameters
      |makeAvailable|false|