@BuildEmpire @DigitalSite @Smoke
Feature: BPP Digital Create and Edit Blog Topic

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive @Smoke #TC-3627
  Scenario: Create and Edit Blog Topic
    When I execute "Admin Hub Navigate to Blog Topics" reusable step
    And I execute "Create Blog Topic" reusable step
    And I execute "Admin Hub Navigate to Blog Posts" reusable step
    And I execute "Create Blog Post" reusable step replacing some steps
      |7|I select "EC_AUTO_BLOG_TOPIC" from "Topics" "BPP Digital Mandatory select field"|
    And I execute "Search for Blog Post" reusable step
    When I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Edit Button for Specific name"
    And I execute "Publish a CMS or Blog Post page" reusable step
    Then I execute "Log Out from Hub Admin" reusable step
    When I am on "https://web-stage-bppdigital.bppuniversity.com/insights/<EC_AUTO_URL>" URL
    Then I validate text "EC_AUTO_BLOG_POST" to be displayed for "BPP Digital Breadcrumb Level Three" element
    And I validate text "EC_AUTO_BLOG_TOPIC" to be displayed for "BPP Digital Blog Post Topic name" element
    And I remember "[TIMENOW-MMMMd,yyyy]" text as "EC_CURRENT_DATE" variable
    And I validate text "EC_CURRENT_DATE" to be displayed for "BPP Digital Blog Post Topic date" element
    When I execute "Log In to Hub as Admin" reusable step
    And I execute "Admin Hub Navigate to Blog Posts" reusable step
    And I execute "Search for Blog Post" reusable step
    And I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Delete Button for Specific name"
    Then I should see the "Blog Post was successfully removed." "BPP Digital Admin Alert Message"
    When I execute "Admin Hub Navigate to Blog Topics" reusable step
    And I click on the "EC_AUTO_BLOG_TOPIC" "BPP Digital Admin Delete Button for Specific name"
    Then I should see the "Blog Topic was successfully removed." "BPP Digital Admin Alert Message"