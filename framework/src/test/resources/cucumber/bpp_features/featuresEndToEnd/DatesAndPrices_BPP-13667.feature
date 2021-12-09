@BuildEmpire @DigitalSite @DatesAndPrices
Feature: Most course instances have the learning material named VLE.
As part of UAT of the Dates & Prices work business stakeholders have requested that this leanring material is NOT displayed to users of the website.

Given_ a course instance exists in Product Factory
and is published for display to the website
when the course instances includes the learning material VLE
then I expect all other learning materials to display
and the any named VLE to be hidden

  @Positive @VLEDoNotDisplay #TC-5105,6650
  Scenario:Dates n Prices Hide VLE Learning Material
    Given I execute "Log In to Hub as Admin" reusable step
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/2805/edit" URL
    # Add Dates and Prices Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Dates And Prices" "BPP Digital Admin Sub Menu Item links"
    And I click on the "Body name" "BPP Digital dropdown"
    And I click on the "SalesForce CPQ flow atotest (SF CPQ test)" "BPP Digital dropdown option"
    And I click on the "Level" "BPP Digital dropdown"
    And I click on the "SalesForce CPQ flow autotest" "BPP Digital dropdown option"
    And I click on the "Save" "element by value"
    And I wait for "5" seconds
    #Verify VLE material is not displayed
    And I am on "https://web-stage-bppdigital.bppuniversity.com/datesvle" URL
    And I should see the "SF CPQ flow test" "BPP Digital View Dates and Prices button"
    And I click on the "SF CPQ flow test" "BPP Digital View Dates and Prices button"
    Then I click on the "Location" "BPP Digital Dates and Prices Filter By"
    Then I click on the "London Waterloo" "BPP Digital Dates and Prices Location filter option"
    And I click on the "Fri 4 Jun 2021" "element"
    Then I shouldn't see the "VLE" "contained in P element"
    And I should see the "Audit of Banks" "contained in P element"
    And I click on the "Fri 4 Jun 2021" "element"
    And I click on the "Tue 22 Jun 2021" "element"
    Then I shouldn't see the "VLE" "contained in P element"
    And I should see the "Audit of Banks" "contained in P element"
    And I click on the "Tue 22 Jun 2021" "element"
    And I click on the "Sun 27 Jun 2021" "element"
    Then I shouldn't see the "VLE" "contained in P element"
    And I should see the "Audit of Banks" "contained in P element"
    Then I click on the "Location" "BPP Digital Dates and Prices Filter By"
    Then I click on the "London Waterloo" "BPP Digital Dates and Prices Location filter option"
    Then I click on the "11" "BPP Digital Add to Basket Item"
    And I click on the "BPP Digital Header Basket" button by JS
    #Perform session amount validation. Part for D&P page will be completed after resolving https://jira.bpp.com/browse/BPP-18624
    Then I should see the "4 Evenings sessions starting" "text contained in P element"
    And I click on the "4 Evenings sessions starting" "text contained in P element"
    And I should see the "London (2 Evenings sessions)" "element the last"
    And I should see the "London (2 Evenings sessions)" "element the first"
    #Delete DnP component in Admin
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/2805/edit" URL
    And I wait for "5" seconds
    And I click on the "Dates and prices" "BPP Digital Admin Pages Delete Button for Specific Component name"
    And I wait for "5" seconds