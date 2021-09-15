@BuildEmpire @DigitalSite @DatesAndPrices
Feature: Dates & Prices - Dates and Prices 'pods' (front-end) component
  As a admin user
  I want to be able to view the "dates & prices" component in the same page with the marketing data
  so that the user can read the information for a particular course and navigate through the available papers.

  @Positive @AddComponent #TC-4850, TC-4939, TC-4825
  Scenario: Add Dates n Prices Component to CMS Page
    Given I execute "Log In to Hub as Admin" reusable step
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
    And I should see the "Fri 19 Nov 2021" "element"
    And I should see the "Fri 26 Nov 2021" "element"

    # Log in to Product Factory UAT
    Given I execute "Log In" reusable step

    # Amend Body
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Bodies" "Product Factory navigation sub item"
    And I click on the "ICAEW" "Product Factory edit button"
    And I set "ICAEWU" text to the "Short Name" "Product Factory text field"
    And I set "Institute Chartered Accountants of England & Wales Updated" text to the "Name" "Product Factory text field"
    And I click on the "Save" "Product Factory button"
    And I wait for "180" seconds

    # Find Course in Product factory
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I click on the "Additional Filters" "button"
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "ICAEWU - Institute Chartered Accountants of England & Wales Updated" "Product Factory dropdown option"
    And I click on the "Level" "Product Factory dropdown"
    And I click on the "Professional Level - Professional Level" "Product Factory dropdown option"
    And I click on the "CourseType" "Product Factory dropdown"
    And I click on the "Revision - OCR Live" "Product Factory dropdown option"
    And I set "Financial Management" text to the "Paper" "Product Factory text field"
    And I click on the "Done" "Product Factory button"
    And I click on the "ICAEWU" "Product Factory edit button"

    # Amend first session date of the instance
    And I click on the "Online" "Product Factory course instance sessions dropdown button"
    And I click on the "Online" "Product Factory Session Dates button"
    And I fill the "Product Factory Session Dates Popup Date Input Field" field with "16/03/2021"
    And I click on the "Next" "Product Factory button"
    And I click on the "Next" "Product Factory button"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"
    And I click on the "Online" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"
    And I wait for "150" seconds
    Then I should scroll to the "bottom" of the page

    # Delete DnP component in Admin
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/2752/edit" URL
    And I wait for "150" seconds
    And I click on the "Dates and prices" "BPP Digital Admin Pages Delete Button for Specific Component name"
    And I wait for "3" seconds
    
    # Verify Body Name changed in Admin
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Dates And Prices" "BPP Digital Admin Sub Menu Item links"
    And I click on the "Body name" "BPP Digital dropdown"
    Then I should see the "Institute Chartered Accountants of England & Wales Updated (ICAEWU)" "BPP Digital dropdown option"

    # Verify absence of papers
    And I click on the "Body name" "BPP Digital dropdown"
    And I click on the "TBFN HRV (TBSN HRV)" "BPP Digital dropdown option"
    And I click on the "Level" "BPP Digital dropdown"
    And I click on the "LFN HRV 2" "BPP Digital dropdown option"
    And I click on the "Save" "element by value"
    And I wait for "3" seconds
    And I am on "http://web-stage-bppdigital.bppuniversity.com/courses/autodatesandprices" URL
    Then I should see the "No papers are available at this time." "exact element"

    # Delete DnP component in Admin
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/2752/edit" URL
    And I click on the "Dates and prices" "BPP Digital Admin Pages Delete Button for Specific Component name"
    And I wait for "3" seconds

    # Revert body name changes in Product Factory
    Given I am on "MD_COMMON_LINKS_PRODUCTFACTORYURLNEW" URL
    Given I click on the "Sign in with Auth0" element if "Sign in with Auth0" "element is present"
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Bodies" "Product Factory navigation sub item"
    And I click on the "ICAEWU" "Product Factory edit button"
    And I set "ICAEW" text to the "Short Name" "Product Factory text field"
    And I set "Institute Chartered Accountants of England & Wales" text to the "Name" "Product Factory text field"
    And I click on the "Save" "Product Factory button"

    # Find Course in Product factory
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I click on the "Additional Filters" "button"
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "ICAEW - Institute Chartered Accountants of England & Wales" "Product Factory dropdown option"
    And I click on the "Level" "Product Factory dropdown"
    And I click on the "Professional Level - Professional Level" "Product Factory dropdown option"
    And I click on the "CourseType" "Product Factory dropdown"
    And I click on the "Revision - OCR Live" "Product Factory dropdown option"
    And I set "Financial Management" text to the "Paper" "Product Factory text field"
    And I click on the "Done" "Product Factory button"
    And I click on the "ICAEW" "Product Factory edit button"

    # Revert Course Instance session dates changes in Product Factory
    And I click on the "Online" "Product Factory course instance sessions dropdown button"
    And I click on the "Online" "Product Factory Session Dates button"
    And I fill the "Product Factory Session Dates Popup Date Input Field" field with "17/03/2021"
    And I click on the "Next" "Product Factory button"
    And I click on the "Next" "Product Factory button"
    And I click on the "Next" "Product Factory button"
    And I click on the "Finish" "Product Factory button"
    And I click on the "Online" "Product Factory course instance Publish button"
    And I click on the "Yes" "Product Factory button"

  @Positive @CourseFilters #TC-4940
  Scenario: Verify Course Filters on Dates and Prices Page
    Given I execute "Log In to Hub as Admin" reusable step
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
    And I click on the "Mon 1 Nov 2021" "element"
    # Check Course type filter
    When I click on the "Course type" element
    And I validate text "CONTAINS=2" to be displayed for "Taught" element
    And I click on the "Taught" element
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "2"
    And I click on the "Taught" element
    # Check Start date filter
    When I click on the "Start date" element
    And I should see the "Sep 2021 (1)" element
    And I should see the "Oct 2021 (1)" element
    And I click on the "Sep 2021 (1)" element
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "1"
    And I click on the "Sep 2021 (1)" element
    # Check Study mode filter
    When I click on the "Study mode" element
    And I validate text "CONTAINS=8" to be displayed for "Face-to-face" element
    When I click on the "Face-to-face" element
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "8"
    And I click on the "Face-to-face" element
    # Check Location filter
    When I click on the "Location" element
    And I validate text "CONTAINS=6" to be displayed for "London" element
    When I click on the "London" element
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "6"
    And I click on the "London" element
    # Check Session times filter
    When I click on the "Session times" element
    And I should see the "Weekday (12)" element
    And I should see the "Flexible (1)" element
    When I click on the "Weekday (12)" element
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "12"
    And I click on the "Weekday (12)" element
    When I click on the "Flexible (1)" element
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "1"
    And I click on the "Flexible (1)" element
    # Check filters interaction
    When I click on the "Course type" element
    And I click on the "Taught" element
    Then I should see the "BPP Digital Dates and Prices Course Instance entry" element in quantity of "2"
    When I click on the "Start date" element
    And I should see the "Sep 2021 (1)" element
    And I should see the "Oct 2021 (1)" element
    # Delete DnP component in Admin
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/2752/edit" URL
    And I click on the "Dates and prices" "BPP Digital Admin Pages Delete Button for Specific Component name"
    And I wait for "3" seconds