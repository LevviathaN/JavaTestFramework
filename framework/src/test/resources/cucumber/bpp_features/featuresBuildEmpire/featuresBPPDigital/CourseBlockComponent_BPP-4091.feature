@BuildEmpire @DigitalSite @CourseBlock
Feature: As an admin, I expect the ability to add a "course block" component,
  so this can be used by BPP

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive #TC-2075, TС-2638, TC-2577, TC-2522
  Scenario: Course Block Component
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Create CMS Page" reusable step
     #Add Courses Block Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Courses Block" "BPP Digital Admin Sub Menu Item links"
    And I "check" "Undergraduate" "BPP Digital Admin Mandatory checkbox"
    And I "check" "Law" "BPP Digital Admin Mandatory checkbox"
    And I "check" "Accountancy and Tax" "BPP Digital Admin Mandatory checkbox"
    And I set "CMS Courses Block" text to the "Html" "BPP Digital Mandatory input field"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    And I "check" "LLB (Hons)" "BPP Digital Admin Mandatory checkbox"
    And I "check" "BSc (Hons) Accounting and Finance" "BPP Digital Admin Mandatory checkbox"
    Then I click on the "Save" "BPP Digital Admin Value attribute button"
    When I should scroll to the "top" of the page
    Then I execute "Publish a CMS or Blog Post page" reusable step
    And I wait for "2" seconds
    When I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/<EC_AUTO_CMS_URL>" URL
    And I click on the "Subject" "element"
    And I should see the "Business" element
    And I should see the "Accountancy and Tax" element
    Then I should see the "CMS Courses Block" "BPP Digital Web Site CMS Anchors ID"
    And I click on the "Accountancy and Tax" element
    And I should see the "BSc (Hons) Accounting and Finance" element
    When I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages" URL
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    And I click on the "BPP Digital Edit Form Button" element
    #Add Clean Up Component
    When I execute "Admin Hub Navigate to CMS Pages" reusable step
    And I execute "Search for CMS Page" reusable step
    When I click on the "EC_AUTO_CMS_PAGE" "BPP Digital Admin Edit Button for Specific name"
    When I click on the "BPP Digital CMS Page Archive Button" button
    And I click on the "No, just archive" "BPP Digital Admin Page Button"
    Then I should see the "Page successfully archived." "BPP Digital Admin Alert Message"
    And I click on the "BPP Digital CMS Page Delete Button" button
    Then I should see the "CMS Page was successfully removed." "BPP Digital Admin Alert Message"