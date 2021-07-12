@GeneralReview
Feature: BPP Digital General Review

  Background:
    Given I am on "MD_COMMON_LINKS_BPPDIGITALINDEXURL" URL

  @Positive @NotRun #TC-2266
  Scenario: General Review
    When I fill the "BPP Digital Find a Course Search Field" field with "Law"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Find a Course Search Field"
    Then I validate text "Law" to be displayed for "BPP Digital Find a Course Search Field Total Results Search Field" element
    Then I validate text "CONTAINS=results" to be displayed for "BPP Digital Find a Course Search Field Total Results" element
    And I capture text data "BPP Digital Find a Course Search Field Total Results" as "EC_RESULTS" variable
    When I click on the "Courses" "BPP Digital Search Label Button"
    Then I validate text "Courses" to be displayed for "BPP Digital Find a Course Search Field Total Results Header" element
    When I click on the "Professional Development Courses" "BPP Digital Search Label Button"
    Then I validate text "Professional Development Courses" to be displayed for "BPP Digital Find a Course Search Field Total Results Header" element
    When I click on the "News and Insights" "BPP Digital Search Label Button"
    Then I validate text "News and Insights" to be displayed for "BPP Digital Find a Course Search Field Total Results Header" element
    When I click on the "Other pages..." "BPP Digital Search Label Button"
    Then I validate text "Other pages..." to be displayed for "BPP Digital Find a Course Search Field Total Results Header" element
    When I click on the "Clear all" "BPP Digital Search Label Button"
    And I wait for "3" seconds
    Then I validate text "EC_RESULTS" to be displayed for "BPP Digital Find a Course Search Field Total Results" element
    And I wait for "3" seconds
    #Explore our subjects block:
    #Law removed as there is a broken URL
    #When I click on the "BPP Digital Breadcrumb Level One" link
    #And I click on the "Law" "BPP Digital Explore Our Subjects item link"
    #Then I validate text "CONTAINS=Law" to be displayed for "BPP Digital Breadcrumb Level Three" element
    #Accountancy
    When I click on the "BPP Digital Breadcrumb Level One" link
    And I click on the "Accountancy & Tax" "BPP Digital Explore Our Subjects item link"
    Then I validate text "CONTAINS=Accountancy" to be displayed for "BPP Digital Breadcrumb Level Three" element
    #Technology
    When I click on the "BPP Digital Breadcrumb Level One" link
    And I click on the "Technology" "BPP Digital Explore Our Subjects item link"
    Then I validate text "CONTAINS=Innovation and Technology" to be displayed for "BPP Digital Breadcrumb Level Three" element
    #Data
    When I click on the "BPP Digital Breadcrumb Level One" link
    And I click on the "Data" "BPP Digital Explore Our Subjects item link"
    Then I validate text "CONTAINS=Data" to be displayed for "BPP Digital Breadcrumb Level Three" element
    #Nursing
    When I click on the "BPP Digital Breadcrumb Level One" link
    And I click on the "Nursing" "BPP Digital Explore Our Subjects item link"
    Then I validate text "CONTAINS=Nursing and Healthcare" to be displayed for "BPP Digital Breadcrumb Level Three" element
    #Financial Services
    When I click on the "BPP Digital Breadcrumb Level One" link
    And I click on the "Financial Services" "BPP Digital Explore Our Subjects item link"
    Then I validate text "CONTAINS=Financial Services" to be displayed for "BPP Digital Breadcrumb Level Three" element
    #View all
    When I click on the "BPP Digital Breadcrumb Level One" link
    And I click on the "View all" "BPP Digital Explore Our Subjects item link"
    Then I validate text "CONTAINS=Courses" to be displayed for "BPP Digital Site Page Header" element
    When I click on the "BPP Digital Breadcrumb Level One" link
    And I click on the "Professional Qualifications" "BPP Digital Qualifications at Every Level item link"
    Then I validate text "Professional Qualifications" to be displayed for "BPP Digital Breadcrumb Level Three" element
    And I wait for "3" seconds
    When I click on the "BPP Digital Breadcrumb Level One" link
    And I click on the "Master's & Undergraduate Degrees" "BPP Digital Qualifications at Every Level item link"
    Then I validate text "Degree Courses" to be displayed for "BPP Digital Breadcrumb Level Three" element
    And I wait for "3" seconds
    When I click on the "BPP Digital Breadcrumb Level One" link
    And I click on the "Professional Development" "BPP Digital Qualifications at Every Level item link"
    And I wait for "3" seconds
    #Login Existing User
    And I should scroll to the "top" of the page
    When I click on the "BPP Digital Login link" element
    And I wait for "3" seconds
    Then I click on the "BPP Digital Register Link on Login Page" button by JS
    And I fill the "Direct App Admin Email" field with "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINUSER"
    And I fill the "Direct App Admin Password" field with "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINPASSWORD"
    And I click on the "Direct App Login Button" button
    And I should see the "Direct App My Applications Left Menu Link" element
    Then I wait for "3" seconds
    Then I execute "Log Out from Hub Student" reusable step
    #Validate Created Profession (Should be created in Professions with name 'Automation General Review Profession Page')
    Given I am on "MD_COMMON_LINKS_BPPDIGITALINDEXURL" URL
    When I fill the "BPP Digital Find a Course Search Field" field with "Automation General Review Profession Page"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Find a Course Search Field"
    Then I validate text "Automation General Review Profession Page" to be displayed for "BPP Digital Section First Article name" element
    #Validate Main Menu Items
    #Law
    When I click on the "Courses" "BPP Digital Study expandable link"
    #And I click on the "Courses" "BPP Digital Courses Menu Item links"
    And I click on the "Law" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Law" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #Innovation and Technology
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "2" seconds
    Then I hover over the "Innovation & Technology" "BPP Digital Student Applications Menu link"
    And I click on the "Innovation & Technology" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Innovation and Technology" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #Financial Services
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I click on the "Financial Services" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Financial Services" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #Governance, Risk and Compliance
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I click on the "Governance, Risk & Compliance" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Governance, Risk and Compliance" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #Nursing and Healthcare
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I click on the "Nursing & Healthcare" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Nursing and Healthcare" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #Human Resources
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I click on the "Human Resources" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Human Resources" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #Tax
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I click on the "Tax" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Tax" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #Insolvency
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I click on the "Insolvency" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Insolvency" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #Chiropractic
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I click on the "Chiropractic" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Chiropractic" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #Psychology
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I click on the "Psychology" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Psychology" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #View all courses
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I click on the "View all courses" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Courses" to be displayed for "BPP Digital Breadcrumb Level Two" element
    Then I wait for "2" seconds
    #Business main menu link
    #Working with businesses
    When I click on the "Business" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Working with businesses" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Business" to be displayed for "BPP Digital Breadcrumb Level Two" element
    Then I wait for "2" seconds
    #Industries
    When I click on the "Business" "BPP Digital Study expandable link"
    And I click on the "Industries" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Industries" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #Our Services
    When I click on the "Business" "BPP Digital Study expandable link"
    And I click on the "Our Services" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Our services" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #About Us
    When I click on the "About Us" "BPP Digital Study expandable link"
    And I click on the "About Us" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=About Us" to be displayed for "BPP Digital Breadcrumb Level Two" element
    Then I wait for "2" seconds
    #Our People
    When I click on the "About Us" "BPP Digital Study expandable link"
    And I click on the "Our People" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Our People" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #BPP University
    When I click on the "About Us" "BPP Digital Study expandable link"
    And I click on the "About BPP University" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=BPP University" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #Locations
    When I click on the "About Us" "BPP Digital Study expandable link"
    And I click on the "Study Centre Locations" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Locations" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #Events
    When I click on the "Events" "BPP Digital Student Applications Menu link"
    Then I validate text "CONTAINS=Events" to be displayed for "BPP Digital Breadcrumb Level Two" element
    Then I wait for "2" seconds
    #Contact us
    When I click on the "Contact us" "BPP Digital Student Applications Menu link"
    Then I wait for "4" seconds
    Then I validate text "CONTAINS=Contact Us" to be displayed for "BPP Digital Breadcrumb Level Two" element