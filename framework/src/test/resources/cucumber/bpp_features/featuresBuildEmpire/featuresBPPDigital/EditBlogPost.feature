@BuildEmpire @DigitalSite @EditBlogPost
Feature: BPP Digital Edit Blog Post

  Background:
    Given I execute "Log In to Hub as Admin" reusable step

  @Positive #TC-3631
  Scenario: Edit Blog Post
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
    When I am on "https://web-stage-bppdigital.bppuniversity.com/insights/EC_AUTO_URL" URL
    Then I validate text "EC_AUTO_BLOG_POST" to be displayed for "BPP Digital Breadcrumb Level Three" element
    And I validate text "Topic 1" to be displayed for "BPP Digital Blog Post Topic name" element
    And I remember "[TIMENOW-MMMMd,yyyy]" text as "EC_CURRENT_DATE" variable
    And I validate text "EC_CURRENT_DATE" to be displayed for "BPP Digital Blog Post Topic date" element
    Then Attribute "alt" of "BPP Digital Blog Post Image Content" should have value "tree"
    Then I wait for "2" seconds
    When I execute "Log In to Hub as Admin" reusable step
    #Create Second Item
    When I execute "Admin Hub Navigate to Blog Posts" reusable step
    When I click on the "Add" "BPP Digital Admin Page Button"
    And I set "AutoBlogPostTwo[#####]" text to the "Title *" "BPP Digital Mandatory input field"
    And I set "AutoUrlTwo[#####]" text to the "URL path *" "BPP Digital Mandatory input field"
    And I set "MetaDescriptionTwo[####]" text to the "Meta description *" "BPP Digital Mandatory input field"
    And I set "SummaryTwo[####]" text to the "Summary *" "BPP Digital Mandatory input field"
    And I select "Article" from "Content type *" "BPP Digital Mandatory select field"
    And I select "Apprenticeships" from "Topics" "BPP Digital Mandatory select field"
    And I select "Law" from "Schools/Professions" "BPP Digital Mandatory select field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Blog Post was successfully created." "BPP Digital Admin Alert Message"
    #Validate Title Scenario #1
    And I execute "Search for Blog Post" reusable step
    Then I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Edit Button for Specific name"
    When I set "" text to the "Title *" "BPP Digital Mandatory input field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I validate text "Title can't be blank" to be displayed for "BPP Digital Validation Error message" element
    #Validate Url Path Scenario #2
    When I click on the "Blog Posts" "BPP Digital Admin Breadcrumb item"
    And I execute "Search for Blog Post" reusable step
    Then I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Edit Button for Specific name"
    When I set "EC_AUTO_URL_TWO" text to the "URL path *" "BPP Digital Mandatory input field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I validate text "Path has already been taken" to be displayed for "BPP Digital Validation Error message" element
    #Validate Meta Description Scenario #3
    When I click on the "Blog Posts" "BPP Digital Admin Breadcrumb item"
    And I execute "Search for Blog Post" reusable step
    Then I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Edit Button for Specific name"
    When I set "" text to the "Meta description *" "BPP Digital Mandatory input field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I validate text "Meta description can't be blank" to be displayed for "BPP Digital Validation Error message" element
    #Validate Summary Scenario #4
    When I click on the "Blog Posts" "BPP Digital Admin Breadcrumb item"
    And I execute "Search for Blog Post" reusable step
    Then I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Edit Button for Specific name"
    When I set "" text to the "Summary *" "BPP Digital Mandatory input field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I validate text "Summary can't be blank" to be displayed for "BPP Digital Validation Error message" element
    #Validate Content Type Scenario #5
    When I click on the "Blog Posts" "BPP Digital Admin Breadcrumb item"
    And I execute "Search for Blog Post" reusable step
    Then I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Edit Button for Specific name"
    And I select "Article" from "Content type *" "BPP Digital Mandatory select field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Blog Post was successfully updated." "BPP Digital Admin Alert Message"
    #Validate Topic Change Scenario #7
    And I execute "Search for Blog Post" reusable step
    Then I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Edit Button for Specific name"
    And I select "Apprenticeships" from "Topics" "BPP Digital Mandatory select field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Blog Post was successfully updated." "BPP Digital Admin Alert Message"
    #Validate School/Professions Change Scenario #8
    And I execute "Search for Blog Post" reusable step
    Then I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Edit Button for Specific name"
    And I select "Accountancy and Tax" from "Schools/Professions" "BPP Digital Mandatory select field"
    And I click on the "Save" "BPP Digital Admin Value attribute button"
    Then I should see the "Blog Post was successfully updated." "BPP Digital Admin Alert Message"
    #Delete Image
    And I execute "Search for Blog Post" reusable step
    Then I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Edit Button for Specific name"
    When I click on the "Images" "BPP Digital Admin Pages Delete Button for Specific Component name"
    #Validateon Web Page without image
    When I execute "Log Out from Hub Admin" reusable step
    And I am on "https://web-stage-bppdigital.bppuniversity.com/insights/EC_AUTO_URL" URL
    Then I validate text "EC_AUTO_BLOG_POST" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I validate text "Apprenticeships" to be displayed for "BPP Digital Blog Post Topic name" element
    Then I validate text "EC_CURRENT_DATE" to be displayed for "BPP Digital Blog Post Topic date" element
    Then I shouldn't see the "BPP Digital Blog Post Image Content" element
    #Data Clean Up
    When I execute "Log In to Hub as Admin" reusable step
    And I execute "Admin Hub Navigate to Blog Posts" reusable step
    And I execute "Search for Blog Post" reusable step
    And I click on the "EC_AUTO_BLOG_POST" "BPP Digital Admin Delete Button for Specific name"
    Then I should see the "Blog Post was successfully removed." "BPP Digital Admin Alert Message"
    And I execute "Search for Blog Post" reusable step replacing some steps
      |1|I fill the "BPP Digital Filter by title search field" field with "EC_AUTO_BLOG_POST_TWO"|
      |3|I should see the "EC_AUTO_BLOG_POST_TWO" element|
    And I click on the "EC_AUTO_BLOG_POST_TWO" "BPP Digital Admin Delete Button for Specific name"
    Then I should see the "Blog Post was successfully removed." "BPP Digital Admin Alert Message"