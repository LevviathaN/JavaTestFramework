@BuildEmpire @DigitalSite @Filters @Mobile
Feature: Dates & Prices - Filter tweaks - BPP-12913
  As a admin user
  I want to be able to view the "dates & prices" component in the same page with the marketing data
  so that the user can read the information for a particular course and navigate through the available papers.


  @Positive @iPhone @Samsung @Tablet #TC-4960
  Scenario: Verify Course Filters on Dates and Prices Page Mobile
    Given I execute "Log In to Hub as Admin" reusable step replacing some steps
      |4|I click on the "Direct App Login Button" button by JS|
      |5|I wait for "20" seconds|
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/2752/edit" URL

    # Add Dates and Prices Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Dates And Prices" "BPP Digital Admin Sub Menu Item links"
    And I click on the "Body name" "BPP Digital dropdown"
    And I click on the "Institute Chartered Accountants of England & Wales (ICAEW)" "BPP Digital dropdown option"
    And I click on the "Level" "BPP Digital dropdown"
    And I click on the "Professional Level" "BPP Digital dropdown option"
    And I click on the "Save" "element by value"
    And I wait for "3" seconds

    # Verify Papers
    And I am on "http://web-stage-bppdigital.bppuniversity.com/courses/autodatesandprices" URL
    And I should see the "Audit & Assurance" "BPP Digital View Dates and Prices button"
    And I should see the "Financial Accounting and Reporting" "BPP Digital View Dates and Prices button"
    And I should see the "Financial Management" "BPP Digital View Dates and Prices button"
    And I should see the "Tax Compliance" "BPP Digital View Dates and Prices button"

    And I click on the "Audit & Assurance" "BPP Digital View Dates and Prices button"
    And I click on the "Thu 25 Mar 2021" "element"

    # Check Course type filter
    Given I click on the "Filters" button
    And I click on the "Final Mock" "BPP Digital Dates and Prices Course Filter radiobutton"
    Then I click on the "Show " button
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "2"

    Given I click on the "Filters" button
    And I click on the "Final Mock" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I click on the "Taught" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I validate text "CONTAINS=4" to be displayed for "Show " element
    Then I click on the "Show " button
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "4"
    Given I click on the "Filters" button
    And I click on the "Taught" "BPP Digital Dates and Prices Course Filter radiobutton"

    # Check Start date filter
    And I should see the "Mar 2021 (4)" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I should see the "Apr 2021 (1)" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I should see the "Jun 2021 (1)" "BPP Digital Dates and Prices Course Filter radiobutton"

    When I click on the "Mar 2021 (4)" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I validate text "CONTAINS=4" to be displayed for "Show " element
    Then I click on the "Show " button
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "4"

    Given I click on the "Filters" button
    And I click on the "Mar 2021 (4)" "BPP Digital Dates and Prices Course Filter radiobutton"
    When I click on the "Apr 2021 (1)" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I validate text "CONTAINS=1" to be displayed for "Show " element
    Then I click on the "Show " button
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "1"

    Given I click on the "Filters" button
    And I click on the "Apr 2021 (1)" "BPP Digital Dates and Prices Course Filter radiobutton"
    When I click on the "Jun 2021 (1)" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I validate text "CONTAINS=1" to be displayed for "Show " element
    Then I click on the "Show " button
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "1"
    Given I click on the "Filters" button
    And I click on the "Jun 2021 (1)" "BPP Digital Dates and Prices Course Filter radiobutton"

    # Check Study mode filter
    When I click on the "Face-to-face" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I validate text "CONTAINS=6" to be displayed for "Show " element
    Then I click on the "Show " button
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "6"
    Given I click on the "Filters" button
    And I click on the "Face-to-face" "BPP Digital Dates and Prices Course Filter radiobutton"

    # Check Location filter
    When I click on the "London" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I validate text "CONTAINS=6" to be displayed for "Show " element
    Then I click on the "Show " button
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "6"
    Given I click on the "Filters" button
    And I click on the "London" "BPP Digital Dates and Prices Course Filter radiobutton"

    # Check Session times filter
    And I should see the "Weekday (4)" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I should see the "Morning (1)" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I should see the "Afternoon (1)" "BPP Digital Dates and Prices Course Filter radiobutton"

    When I click on the "Weekday (4)" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I validate text "CONTAINS=4" to be displayed for "Show " element
    Then I click on the "Show " button
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "4"

    Given I click on the "Filters" button
    And I click on the "Weekday (4)" "BPP Digital Dates and Prices Course Filter radiobutton"
    When I click on the "Morning (1)" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I validate text "CONTAINS=1" to be displayed for "Show " element
    Then I click on the "Show " button
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "1"

    Given I click on the "Filters" button
    And I click on the "Morning (1)" "BPP Digital Dates and Prices Course Filter radiobutton"
    When I click on the "Afternoon (1)" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I validate text "CONTAINS=1" to be displayed for "Show " element
    Then I click on the "Show " button
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "1"
    Given I click on the "Filters" button
    And I click on the "Afternoon (1)" "BPP Digital Dates and Prices Course Filter radiobutton"

    # Check filters interaction
    And I click on the "Taught" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I validate text "CONTAINS=4" to be displayed for "Show " element
    Then I click on the "Show " button
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "4"

    Given I click on the "Filters" button
    And I should see the "Mar 2021 (3)" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I should see the "Apr 2021 (1)" "BPP Digital Dates and Prices Course Filter radiobutton"
    And I should see the "Jun 2021 (0)" "BPP Digital Dates and Prices Course Filter radiobutton"

    # Delete DnP component in Admin
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/2752/edit" URL
    And I click on the "Dates and prices" "BPP Digital Admin Pages Delete Button for Specific Component name"
    And I wait for "3" seconds