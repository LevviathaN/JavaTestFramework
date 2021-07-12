@BuildEmpire @DigitalSite @BlogPost
Feature: BPP Digital Create Archive Publish and Delete a Blog Post

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive @Smoke #TC-3630
  Scenario: Create Archive Publish and Delete a Blog Post
    When I execute "Admin Hub Navigate to Blog Posts" reusable step
    And I execute "Create Blog Post" reusable step
    And I execute "Search for Blog Post" reusable step
    When I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Edit Button for Specific name"
    And I execute "Add Image Component To CMS or Blog Post page" reusable step
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Blog Post was successfully updated." "BPP Digital Admin Alert Message"
    When I wait for "2" seconds
    And I execute "Search for Blog Post" reusable step
    When I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Edit Button for Specific name"
    And I execute "Publish a CMS or Blog Post page" reusable step
    Then I execute "Log Out from Hub Admin" reusable step
    When I am on "https://web-stage-bppdigital.bppuniversity.com/insights/<EC_AUTO_URL>" URL
    Then I validate text "EC_AUTO_BLOG_POST" to be displayed for "BPP Digital Breadcrumb Level Three" element
    And I validate text "Topic 1" to be displayed for "BPP Digital Blog Post Topic name" element
    And I remember "[TIMENOW-MMMMd,yyyy]" text as "EC_CURRENT_DATE" variable
    And I validate text "EC_CURRENT_DATE" to be displayed for "BPP Digital Blog Post Topic date" element
    Then Attribute "alt" of "BPP Digital Blog Post Image Content" should have value "tree"
    Then I wait for "2" seconds
    When I execute "Log In to Hub as Admin" reusable step
    And I execute "Admin Hub Navigate to Blog Posts" reusable step
    And I execute "Search for Blog Post" reusable step
    When I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Edit Button for Specific name"
    When I execute "Archive a CMS or Blog Post page" reusable step
    Then I click on the "Blog Posts" "BPP Digital Admin Breadcrumb item"
    And I execute "Search for Blog Post" reusable step
    And I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Delete Button for Specific name"
    Then I should see the "Blog Post was successfully removed." "BPP Digital Admin Alert Message"