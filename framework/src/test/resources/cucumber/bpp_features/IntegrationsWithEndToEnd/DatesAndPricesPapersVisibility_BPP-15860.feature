@BuildEmpire @DatesAndPrices
Feature: Dates & Prices - Verify visibility of Papers with inactive Courses
  As a PF admin user
  I have set the paper with course instances that are NOT AVAILABLE on WEB
  so as a result I would not expect this paper to appear within the D&P component on the Website for public users.

  @Positive #Blocked by BPP-15860!!!
  Scenario: Verify Papers Without Active Courses Are Not Displayed On Website
    Given I execute "Remember Variables " reusable step

    Given I execute "Log In" reusable step
    When I execute "Keep Course Available On Website" reusable step
    And I wait for "120" seconds

    Given I execute "Log In to Hub as Admin" reusable step
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/3028/edit" URL
    And I wait for "120" seconds

    # Add Dates and Prices Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Dates And Prices" "BPP Digital Admin Sub Menu Item links"
    And I click on the "Body name" "BPP Digital dropdown"
    And I click on the "AutoBodyName (AutoBodyShortName)" "BPP Digital dropdown option"
    And I click on the "Level" "BPP Digital dropdown"
    And I click on the "AutoLevelName" "BPP Digital dropdown option"
    And I click on the "Save" "element by value"
    And I wait for "3" seconds

    # Verify Papers present
    And I am on "https://web-stage-bppdigital.bppuniversity.com/datesandpricesfour" URL
    And I should see the "AutoPaperName" "BPP Digital View Dates and Prices button"

    # Log in to Product Factory UAT
    Given I am on "MD_COMMON_LINKS_PRODUCTFACTORYURLNEW" URL
    Given I click on the "Sign in with Auth0" element if "Sign in with Auth0" "element is present"
    Then I execute "Keep Course Removed From Website" reusable step
    And I wait for "180" seconds

    # Verify Papers absent
    And I am on "https://web-stage-bppdigital.bppuniversity.com/datesandpricesfour" URL
    And I wait for "180" seconds
    And I shouldn't see the "AutoPaperName" "BPP Digital View Dates and Prices button"

    # Delete DnP component in Admin
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/3028/edit" URL
    And I click on the "Dates and prices" "BPP Digital Admin Pages Delete Button for Specific Component name"
    And I wait for "3" seconds