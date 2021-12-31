@BuildEmpire @DigitalSite @DatesAndPrices
Feature: Dates & Prices - Add HTML field to D&P component and enable component within Grids - BPP-14787


  @Positive @InsideGrid #TC-5474, 6471
  Scenario: Add Dates n Prices Component Inside Grid Component
    Given I execute "Log In to Hub as Admin" reusable step
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/3028/edit" URL
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
    And I am on "https://web-stage-bppdigital.bppuniversity.com/datesandpricesfour" URL
    And I should see the "Audit & Assurance" "BPP Digital View Dates and Prices button"
    And I should see the "Financial Accounting and Reporting" "BPP Digital View Dates and Prices button"
    And I should see the "Financial Management" "BPP Digital View Dates and Prices button"
    And I should see the "Tax Compliance" "BPP Digital View Dates and Prices button"
    And I click on the "Financial Management" "BPP Digital View Dates and Prices button"
    And I click on the "Fri 26 Nov 2021" "element"
    Then I validate text "Inc. VAT" to be displayed for "price-inc-vat" "element by class first"
    And Сss "font-weight" of "BPP Digital Dates and Prices Type And Location Row" should have value "700"
    And I should see the "Fri 26 November" "element"
    And I should see the "Fri 26 November" "element"
    And I should see the "Fri 3 December" "element"
    And I validate text "CONTAINS=3" to be displayed for "BPP Digital Dates and Prices Number of Sessions field" element
    And I wait for "3" seconds
    # Verify Paper Filters: TC-4939
    And I click on the "Financial Management" "BPP Digital View Dates and Prices button"
    And I click on the "Tax Compliance" "BPP Digital View Dates and Prices button"
    And I should see the "Wed 3 Nov 2021" "element"
    And I should see the "Mon 16 Aug 2021" "element"
    # Delete Grid component in Admin
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/3028/edit" URL
    And I click on the "Grid" "BPP Digital Admin Pages Delete Button for Specific Component name"
    And I wait for "3" seconds


  @Positive @HTML #TC-5473, 6673
  Scenario: Add Dates n Prices Component With HTML Field
    Given I execute "Log In to Hub as Admin" reusable step
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/3028/edit" URL
    # Add Dates and Prices Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Dates And Prices" "BPP Digital Admin Sub Menu Item links"
    And I click on the "Body name" "BPP Digital dropdown"
    And I click on the "Apprenticeship (Apprenticeship)" "BPP Digital dropdown option"
    And I click on the "Level" "BPP Digital dropdown"
    And I click on the "Level 3" "BPP Digital dropdown option"
    And I set "testHtmlId" text to the "Html" "BPP Digital Mandatory input field"
    And I click on the "Save" "element by value"
    And I wait for "3" seconds
    # Verify HTML Id of CMS Component
    And I am on "https://web-stage-bppdigital.bppuniversity.com/datesandpricesfour" URL
    And I should see the "testHtmlId" "element by id"
    #Check no address displayed for Online type of learning
    And I click on the "Data Technician" "BPP Digital View Dates and Prices button"
    And I click on the "Tue 3 Aug 2021" "element the last"
    And I should see the "Exam sitting" element
    Then I validate text "CONTAINS=EXAM SITTING" to be displayed for "BPP Digital Dates and Prices Syllabus" element
    Then I shouldn't see the "BPP Digital Dates and Prices Location For Instance" element
    Then I shouldn't see the "BPP Digital Dates and Prices Second Location For Instance" element
    # Delete DnP component in Admin
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/3028/edit" URL
    And I wait for "3" seconds
    And I click on the "Dates and prices" "BPP Digital Admin Pages Delete Button for Specific Component name"
    And I wait for "3" seconds