@BuildEmpire @DigitalSite @DatesAndPrices
Feature: Dates & Prices - Add HTML field to D&P component and enable component within Grids - BPP-14787


  @Positive @Grid #TC-5474
  Scenario: Add Dates n Prices Component Inside Grid Component
    Given I execute "Log In to Hub as Admin" reusable step
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/2752/edit" URL

    # Add Grid Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Grid" "BPP Digital Admin Sub Menu Item links"
    And I click on the "Save" "element by value"
    And I wait for "3" seconds

    # Add Dates and Prices Component to Grid:
    When I click on the "Edit" "text contained in A element"
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Dates And Prices" "BPP Digital Admin Sub Menu Item links"
    And I click on the "Body name" "BPP Digital dropdown"
    And I click on the "Institute Chartered Accountants of England & Wales (ICAEW)" "BPP Digital dropdown option"
    And I click on the "Level" "BPP Digital dropdown"
    And I click on the "Professional Level" "BPP Digital dropdown option"
    And I click on the "Save" "element by value"
    And I wait for "3" seconds
    And I click on the "Save" "element by value"
    And I wait for "3" seconds

    # Verify Papers
    And I am on "http://web-stage-bppdigital.bppuniversity.com/courses/autodatesandprices" URL
    And I should see the "Audit & Assurance" "BPP Digital View Dates and Prices button"
    And I should see the "Financial Accounting and Reporting" "BPP Digital View Dates and Prices button"
    And I should see the "Financial Management" "BPP Digital View Dates and Prices button"
    And I should see the "Tax Compliance" "BPP Digital View Dates and Prices button"

    And I click on the "Financial Management" "BPP Digital View Dates and Prices button"
    And I click on the "Wed 17 Mar 2021" "element"
    And I should see the "Wed 17 March" "element"
    And I should see the "Thu 18 March" "element"
    And I should see the "Fri 19 March" "element"
    And I should see the "Mon 22 March" "element"
    And I validate text "CONTAINS=4" to be displayed for "BPP Digital Dates and Prices Number of Sessions field" element
    And I wait for "3" seconds

    # Verify Paper Filters: TC-4939
    And I hover over the "BPP Digital Dates and Prices Papers dropdown" button
    And I click on the "Tax Compliance" "BPP Digital dropdown item"
    And I should see the "Thu 25 Mar 2021" "element"
    And I should see the "Tue 30 Mar 2021" "element"
    And I should see the "Sat 15 May 2021" "element"

    # Delete Grid component in Admin
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/2752/edit" URL
    And I click on the "Grid" "BPP Digital Admin Pages Delete Button for Specific Component name"
    And I wait for "3" seconds


  @Positive #TC-5473
  Scenario: Add Dates n Prices Component With HTML Field
    Given I execute "Log In to Hub as Admin" reusable step
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/2752/edit" URL

    # Add Dates and Prices Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Dates And Prices" "BPP Digital Admin Sub Menu Item links"
    And I click on the "Body name" "BPP Digital dropdown"
    And I click on the "Institute Chartered Accountants of England & Wales (ICAEW)" "BPP Digital dropdown option"
    And I click on the "Level" "BPP Digital dropdown"
    And I click on the "Professional Level" "BPP Digital dropdown option"
    And I set "testHtmlId" text to the "Html" "BPP Digital Mandatory input field"
    And I click on the "Save" "element by value"
    And I wait for "3" seconds

    # Verify HTML Id of CMS Component
    And I am on "http://web-stage-bppdigital.bppuniversity.com/courses/autodatesandprices" URL
    And I should see the "testHtmlId" "element by id"

    # Delete DnP component in Admin
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/2752/edit" URL
    And I wait for "3" seconds
    And I click on the "Dates and prices" "BPP Digital Admin Pages Delete Button for Specific Component name"
    And I wait for "3" seconds