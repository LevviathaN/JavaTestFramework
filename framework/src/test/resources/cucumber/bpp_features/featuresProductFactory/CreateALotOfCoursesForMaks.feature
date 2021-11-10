@ProductFactory @Courses @DataGeneration
Feature: Create 150 Course Instances
  Data generation scenario for Maksym Moroziuk

  Background:
    Given I execute "Log In" reusable step
    And I execute "Remember Variables " reusable step

  @Positive @150Courses
  Scenario Outline: Create 150 Course Instances <counter>
    #Create Digital content
    Given I execute "Create Digital Content" reusable step
    Then I should see the "EC_BODY_SHORT_NAME" element

    #Create course
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I click on the "Create" "Product Factory button"
    And I click on the "EC_PAPER_DESCRIPTION" "Product Factory select button"
    And I click on the "EC_LEVEL_NAME" "Product Factory select button"
    And I click on the "EC_SITTING_NAME" "Product Factory select button"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION" "Product Factory select button"
    And I click on the "EC_REGION_NAME" "Product Factory select button"
    When I click on the "Finish" "Product Factory button"
    Then I should see the "Number of Sessions must be Greater than 0" message
    And I click on the "Product Factory Number Of Sessions Edit Button" button
    When I fill the "Product Factory Number Of Sessions Edit Field" field with "<sessions>"
    And I click on the "Save" "Product Factory button"
    And I click on the "Finish" "Product Factory button"

    #Create instance 1
    Then I click on the "Create" "Product Factory button"
    And I validate text "CONTAINS=4" to be displayed for ": " element
    And I click on the "Default Session Duration" "Product Factory dropdown"
    And I click on the "EC_SESSION_DURATION_DESCRIPTION" "Product Factory dropdown option"
    And I click on the "Default Location" "Product Factory dropdown"
    And I click on the "EC_LOCATION_NAME" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"

    #Create instance 2
    Then I click on the "Create" "Product Factory button"
    And I validate text "CONTAINS=4" to be displayed for ": " element
    And I click on the "Default Session Duration" "Product Factory dropdown"
    And I click on the "EC_SESSION_DURATION_DESCRIPTION_TWO" "Product Factory dropdown option"
    And I click on the "Default Location" "Product Factory dropdown"
    And I click on the "EC_LOCATION_NAME" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"

    #Create instance 3
    Then I click on the "Create" "Product Factory button"
    And I validate text "CONTAINS=4" to be displayed for ": " element
    And I click on the "Default Session Duration" "Product Factory dropdown"
    And I click on the "EC_SESSION_DURATION_DESCRIPTION_THREE" "Product Factory dropdown option"
    And I click on the "Default Location" "Product Factory dropdown"
    And I click on the "EC_LOCATION_NAME" "Product Factory dropdown option"
    And I click on the "Save" "Product Factory button"

    #Set session dates for both sessions of instance 1
    When I click on the "EC_SESSION_DURATION_DESCRIPTION" "Product Factory course instance sessions dropdown button"
    And I click on the "EC_SESSION_DURATION_DESCRIPTION" "Product Factory Session Dates button"
    And I fill the "Product Factory Session Dates Popup Date Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I fill the "Product Factory Session Dates Popup Date Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I fill the "Product Factory Session Dates Popup Date Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I fill the "Product Factory Session Dates Popup Date Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"
    Then I click on the "EC_SESSION_DURATION_DESCRIPTION" "Product Factory course instance sessions dropdown button"

    #Set session dates for both sessions of instance 2
    When I click on the "EC_SESSION_DURATION_DESCRIPTION_TWO" "Product Factory course instance sessions dropdown button"
    And I click on the "EC_SESSION_DURATION_DESCRIPTION_TWO" "Product Factory Session Dates button"
    And I fill the "Product Factory Session Dates Popup Date Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I fill the "Product Factory Session Dates Popup Date Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I fill the "Product Factory Session Dates Popup Date Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I fill the "Product Factory Session Dates Popup Date Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"
    Then I click on the "EC_SESSION_DURATION_DESCRIPTION_TWO" "Product Factory course instance sessions dropdown button"

    #Set session dates for both sessions of instance 3
    When I click on the "EC_SESSION_DURATION_DESCRIPTION_THREE" "Product Factory course instance sessions dropdown button"
    And I click on the "EC_SESSION_DURATION_DESCRIPTION_THREE" "Product Factory Session Dates button"
    And I fill the "Product Factory Session Dates Popup Date Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I fill the "Product Factory Session Dates Popup Date Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I fill the "Product Factory Session Dates Popup Date Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I fill the "Product Factory Session Dates Popup Date Field" field with "EC_SITTING_START_DATE"
    And I fill the "Product Factory Session Dates Popup Start Time Field" field with "03:00AM"
    And I fill the "Product Factory Session Dates Popup End Time Field" field with "04:00AM"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"
    Then I click on the "EC_SESSION_DURATION_DESCRIPTION_THREE" "Product Factory course instance sessions dropdown button"

    #Activate course and instances
    Then I click on the "Activate" "Product Factory button"
    And I should see the "Deactivate" "Product Factory button"
    And I click on the "EC_SESSION_DURATION_DESCRIPTION" "Product Factory course instance Activate button"
    And I shouldn't see the "EC_SESSION_DURATION_DESCRIPTION" "Product Factory course instance Delete button"
    And I click on the "EC_SESSION_DURATION_DESCRIPTION_TWO" "Product Factory course instance Activate button"
    And I shouldn't see the "EC_SESSION_DURATION_DESCRIPTION_TWO" "Product Factory course instance Delete button"
    And I click on the "EC_SESSION_DURATION_DESCRIPTION_THREE" "Product Factory course instance Activate button"
    And I shouldn't see the "EC_SESSION_DURATION_DESCRIPTION_THREE" "Product Factory course instance Delete button"

    Examples:
    |sessions|counter|
    |4       |1      |
    |4       |2      |
    |4       |3      |
    |4       |4      |
    |4       |5      |
    |4       |6      |
    |4       |7      |
    |4       |8      |
    |4       |9      |
    |4       |10     |
    |4       |11     |
    |4       |12     |
    |4       |13     |
    |4       |14     |
    |4       |15     |
    |4       |16     |
    |4       |17     |
    |4       |18     |
    |4       |19     |
    |4       |20     |
    |4       |21     |
    |4       |22     |
    |4       |23     |
    |4       |24     |
    |4       |25     |
    |4       |26     |
    |4       |27     |
    |4       |28     |
    |4       |29     |
    |4       |30     |
    |4       |31     |
    |4       |32     |
    |4       |33     |
    |4       |34     |
    |4       |35     |
    |4       |36     |
    |4       |37     |
    |4       |38     |
    |4       |39     |
    |4       |40     |
    |4       |41     |
    |4       |42     |
    |4       |43     |
    |4       |44     |
    |4       |45     |
    |4       |46     |
    |4       |47     |
    |4       |48     |
    |4       |49     |
    |4       |50     |
    |4       |51     |
    |4       |52     |
    |4       |53     |
    |4       |54     |
    |4       |55     |
    |4       |56     |
    |4       |57     |
    |4       |58     |
    |4       |59     |
    |4       |60     |
    |4       |61     |
    |4       |62     |
    |4       |63     |
    |4       |64     |
    |4       |65     |
    |4       |66     |
    |4       |67     |
    |4       |68     |
    |4       |69     |
    |4       |70     |
    |4       |71     |
    |4       |72     |
    |4       |73     |
    |4       |74     |
    |4       |75     |
    |4       |76     |
    |4       |77     |
    |4       |78     |
    |4       |79     |
    |4       |80     |
    |4       |81     |
    |4       |82     |
    |4       |83     |
    |4       |84     |
    |4       |85     |
    |4       |86     |
    |4       |87     |
    |4       |88     |
    |4       |89     |
    |4       |90     |
    |4       |91     |
    |4       |92     |
    |4       |93     |
    |4       |94     |
    |4       |95     |
    |4       |96     |
    |4       |97     |
    |4       |98     |
    |4       |99     |
    |4       |100    |
    |4       |101    |
    |4       |102    |
    |4       |103    |
    |4       |104    |
    |4       |105    |
    |4       |106    |
    |4       |107    |
    |4       |108    |
    |4       |109    |
    |4       |110    |
    |4       |111    |
    |4       |112    |
    |4       |113    |
    |4       |114    |
    |4       |115    |
    |4       |116    |
    |4       |117    |
    |4       |118    |
    |4       |119    |
    |4       |120    |
    |4       |121    |
    |4       |122    |
    |4       |123    |
    |4       |124    |
    |4       |125    |
    |4       |126    |
    |4       |127    |
    |4       |128    |
    |4       |129    |
    |4       |130    |
    |4       |131    |
    |4       |132    |
    |4       |133    |
    |4       |134    |
    |4       |135    |
    |4       |136    |
    |4       |137    |
    |4       |138    |
    |4       |139    |
    |4       |140    |
    |4       |141    |
    |4       |142    |
    |4       |143    |
    |4       |144    |
    |4       |145    |
    |4       |146    |
    |4       |147    |
    |4       |148    |
    |4       |149    |
    |4       |150    |