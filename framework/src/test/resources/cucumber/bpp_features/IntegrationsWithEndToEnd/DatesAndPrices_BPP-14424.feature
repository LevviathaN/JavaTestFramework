@BuildEmpire @DigitalSite @DatesAndPrices
Feature: Following UAT of Dates & Prices, a requirement change exists to hide session timings and the start time (keep the start date) for Online Classroom course instances.
  This is because for the prospective learning interested in applying for a Online Classroom the session times are of no relevance, as the course can be taken at any time.
  Session times are recorded in Product Factory for internal BPP Revenue Recognition purposes.
  It is recognised that removing the session timings for Online Classroom course instance will create additional signifcant white space on the left hand side of the accordian view.
  We have NO visuals designs for this scenario. We are expecting specification of additional static text to be placed in this white space.
  Loreum Ipsum text can be used temporarily.
  NOTE: This change ONLY applies to Online Classroom course instances, and not Online Classroom Live course instances.

  @Positive @OnlineClassroom @Filter @Tooltip #TC-5348, 5347, 5349, 5350, 5351, 5353
  Scenario:Dates n Prices Pluralisation and Hide Session Timings
    Given I execute "Log In to Hub as Admin" reusable step
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/1560/edit" URL
    # Add Dates and Prices Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Dates And Prices" "BPP Digital Admin Sub Menu Item links"
    And I click on the "Body name" "BPP Digital dropdown"
    And I click on the "Chartered Institute of Management Accountants (CIMA)" "BPP Digital dropdown option"
    And I click on the "Level" "BPP Digital dropdown"
    And I click on the "Certificate in Business Accounting" "BPP Digital dropdown option"
    And I click on the "Save" "element by value"
    And I wait for "5" seconds
    #Verify text displayed for Online type of learning
    And I am on "http://web-stage-bppdigital.bppuniversity.com/about-bpp/autodatesthree" URL
    And I should see the "BA1 Fundamentals of Business Economics" "BPP Digital View Dates and Prices button"
    And I click on the "BA1 Fundamentals of Business Economics" "BPP Digital View Dates and Prices button"
    #Commented this part due to data changes in PF by UAT users....
    #Check Start Date dropdown options
    #Then I click on the "Start date" "BPP Digital Dates and Prices Filter By"
    #And I should see the "May 2021" "BPP Digital Dates and Prices Start date filter option"
    #And I should see the "Jul 2021" "BPP Digital Dates and Prices Start date filter option"
    #And I should see the "Aug 2021" "BPP Digital Dates and Prices Start date filter option"
    #Then I click on the "May 2021" "BPP Digital Dates and Prices Start date filter option"
    #And I should see the "Thu 20 May 2021" "element"
    #Then I shouldn't see the "Tue 20 Jul 2021" "element"
    #Then I shouldn't see the "Tue 17 Aug 2021" "element"
    #Then I click on the "Start date" "BPP Digital Dates and Prices Filter By"
    #Then I click on the "May 2021" "BPP Digital Dates and Prices Start date filter option"
    #Then I should see the "Tue 20 Jul 2021" "element"
    #Then I should see the "Tue 17 Aug 2021" "element"
    #And I should see the "Thu 20 May 2021" "element"
    #Then I click on the "Start date" "BPP Digital Dates and Prices Filter By"
    #Then I click on the "Jul 2021" "BPP Digital Dates and Prices Start date filter option"
    #Then I shouldn't see the "Thu 20 May 2021" "element"
    #Then I shouldn't see the "Tue 17 Aug 2021" "element"
    #And I hover over the "Location" "BPP Digital Dates and Prices Filter By"
    #Then I should see the "Tue 20 Jul 2021" "element"
    #Then I click on the "Start date" "BPP Digital Dates and Prices Filter By"
    #Then I click on the "Jul 2021" "BPP Digital Dates and Prices Start date filter option"
    #Then I should see the "Tue 17 Aug 2021" "element"
    #And I should see the "Thu 20 May 2021" "element"
    #Then I should see the "Tue 20 Jul 2021" "element"
    #And I shouldn't see the "Syllabus" "BPP Digital Dates and Prices Filter By"
    #Check text in tooltips
    When I click on the "BPP Digital Dates and Prices Course Type Tooltip" element
    Then I should see the "BPP Digital Dates and Prices Tooltip Content" element
    Then I should see the "INTEGRATED" "contained in P element"
    Then I should see the "TAUGHT" "contained in P element"
    Then I should see the "REVISION" "contained in P element"
    Then I should see the "A combination of Taught and Revision phases" "contained in P element"
    #Validate pluralisation is removed
    Then I click on the "BPP Digital Dates and Prices Papers dropdown" element
    And I hover over the "BA3 Fundamentals of Financial Accounting" "BPP Digital dropdown item"
    And I click on the "BA3 Fundamentals of Financial Accounting" "BPP Digital dropdown item"
    And I wait for "3" seconds
    And I click on the "Mon 20 Sep 2021" "element" by JS
    And I validate text "CONTAINS=5 Weekday" to be displayed for "BPP Digital Dates and Prices Number of Sessions For Multiple Address" element
    And I click on the "Mon 20 Sep 2021" "element" by JS
    #Delete DnP component in Admin
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/1560/edit" URL
    And I wait for "3" seconds
    And I click on the "Dates and prices" "BPP Digital Admin Pages Delete Button for Specific Component name"
    And I wait for "5" seconds