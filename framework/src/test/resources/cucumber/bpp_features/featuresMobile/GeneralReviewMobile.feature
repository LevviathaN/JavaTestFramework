@Mobile
Feature: BPP Digital General Review

  Background:
    Given I am on "MD_COMMON_LINKS_BPPDIGITALINDEXURL" URL

  @Positive @iPad #TC-2266
  Scenario: General Review_Mobile
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
    #Law
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Law" "BPP Digital Explore Our Subjects item link"
    Then I validate text "CONTAINS=Law" to be displayed for "BPP Digital Breadcrumb Level Three" element
    #Accountancy
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Accountancy & Tax" "BPP Digital Explore Our Subjects item link"
    Then I validate text "CONTAINS=Accountancy" to be displayed for "BPP Digital Breadcrumb Level Three" element
    #Technology
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Technology" "BPP Digital Explore Our Subjects item link"
    Then I validate text "CONTAINS=Innovation and Technology" to be displayed for "BPP Digital Breadcrumb Level Three" element
    #Data
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Data" "BPP Digital Explore Our Subjects item link"
    Then I validate text "CONTAINS=Data" to be displayed for "BPP Digital Breadcrumb Level Three" element
    #Nursing
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Nursing" "BPP Digital Explore Our Subjects item link"
    Then I validate text "CONTAINS=Nursing and Healthcare" to be displayed for "BPP Digital Breadcrumb Level Three" element
    #Financial Services
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Financial Services" "BPP Digital Explore Our Subjects item link"
    Then I validate text "CONTAINS=Financial Services" to be displayed for "BPP Digital Breadcrumb Level Three" element
    #View all
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "View all" "BPP Digital Explore Our Subjects item link"
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Courses" to be displayed for "BPP Digital Site Page Header" element
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Professional Qualifications" "BPP Digital Qualifications at Every Level item link"
    Then I validate text "CONTAINS=Professional Qualifications" to be displayed for "BPP Digital Breadcrumb Level Three" element
    And I wait for "3" seconds
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Master's & Undergraduate Degrees" "BPP Digital Qualifications at Every Level item link"
    Then I validate text "Degree Courses" to be displayed for "BPP Digital Breadcrumb Level Three" element
    And I wait for "3" seconds
    #Login Existing User
    And I should scroll to the "top" of the page
    When I click on the "BPP Digital Login link" element
    And I wait for "3" seconds
    Then I click on the "BPP Digital Register Link on Login Page" button by JS
    And I fill the "Direct App Admin Email" field with "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINUSER"
    And I fill the "Direct App Admin Password" field with "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINPASSWORD"
    And I click on the "Direct App Login Button" button
    Then I wait for "5" seconds
    #Validate Created Profession (Should be created in Professions with name 'Automation General Review Profession Page')
    Given I am on "MD_COMMON_LINKS_BPPDIGITALINDEXURL" URL
    When I fill the "BPP Digital Find a Course Search Field" field with "Automation General Review Profession Page"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Find a Course Search Field"
    Then I validate text "Automation General Review Profession Page" to be displayed for "BPP Digital Section First Article name" element
    #Validate Main Menu Items
    #Law
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I click on the "Law" "BPP Digital Mobile Second Expandable Menu"
    Then I validate text "CONTAINS=Law" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "1" seconds
    #Management
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    #And I click on the "Digital Site Mobile Hamburger Courses" button by JS
    And I click on the "Management" "BPP Digital Mobile Second Expandable Menu"
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Business" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "1" seconds
    #Innovation and Technology
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Innovation & Technology" "BPP Digital Mobile Second Expandable Menu"
    Then I validate text "CONTAINS=Innovation and Technology" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "1" seconds
    #Financial Services
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Financial Services" "BPP Digital Mobile Second Expandable Menu"
    Then I validate text "CONTAINS=Financial Services" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "1" seconds
    #Governance, Risk and Compliance
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Governance, Risk & Compliance" "BPP Digital Mobile Second Expandable Menu"
    Then I validate text "CONTAINS=Governance, Risk and Compliance" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "1" seconds
    #Nursing and Healthcare
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Nursing & Healthcare" "BPP Digital Mobile Second Expandable Menu"
    Then I validate text "CONTAINS=Nursing and Healthcare" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "1" seconds
    #Human Resources
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Human Resources" "BPP Digital Mobile Second Expandable Menu"
    Then I validate text "CONTAINS=Human Resources" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "1" seconds
    #Insolvency
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Insolvency" "BPP Digital Mobile Second Expandable Menu"
    Then I validate text "CONTAINS=Insolvency" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "1" seconds
    #Chiropractic
    And I click on the "Digital Site Mobile Hamburger Menu" button by JS
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Chiropractic" "BPP Digital Mobile Second Expandable Menu"
    Then I validate text "CONTAINS=Chiropractic" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "1" seconds
    #Psychology
    And I click on the "Digital Site Mobile Hamburger Menu" button by JS
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Psychology" "BPP Digital Mobile Second Expandable Menu"
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Psychology" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "1" seconds
    #View all courses
    And I click on the "Digital Site Mobile Hamburger Menu" button by JS
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "View all courses" "BPP Digital Mobile Second Expandable Menu"
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Courses" to be displayed for "BPP Digital Breadcrumb Level Two" element
    Then I wait for "1" seconds
    #About Us
    Given I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp" URL
    And I wait for "1" seconds
    Then I validate text "CONTAINS=About Us" to be displayed for "BPP Digital Breadcrumb Level Two" element
    Then I wait for "2" seconds
    #Our People
    Given I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/our-people" URL
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Our People" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #BPP University
    Given I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/bpp-university" URL
    And I wait for "1" seconds
    Then I validate text "CONTAINS=BPP University" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #Locations
    Given I am on "https://web-stage-bppdigital.bppuniversity.com/about-bpp/locations" URL
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Locations" to be displayed for "BPP Digital Breadcrumb Level Three" element
    Then I wait for "2" seconds
    #Events
    And I click on the "Digital Site Mobile Hamburger Menu" button by JS
    When I click on the "Digital Site Mobile Hamburger Events" element
    Then I validate text "CONTAINS=Events" to be displayed for "BPP Digital Breadcrumb Level Two" element
    Then I wait for "2" seconds
    #Contact us
    When I click on the "Contact us" "BPP Digital Student Applications Menu link"
    Then I wait for "4" seconds
    Then I validate text "CONTAINS=Contact Us" to be displayed for "BPP Digital Breadcrumb Level Two" element

  @Mobile @iPhone
  Scenario: General Review_Mobile
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
    #Law
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Law" "BPP Digital Explore Our Subjects item link"
    And I wait for "1" seconds
    #Accountancy
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Accountancy & Tax" "BPP Digital Explore Our Subjects item link"
    #Technology
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Technology" "BPP Digital Explore Our Subjects item link"
    #Nursing
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Nursing" "BPP Digital Explore Our Subjects item link"
    #Financial Services
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Financial Services" "BPP Digital Explore Our Subjects item link"
    #View all
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "View all" "BPP Digital Explore Our Subjects item link"
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Courses" to be displayed for "BPP Digital Site Left Side Page Header" element
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Professional Qualifications" "BPP Digital Qualifications at Every Level item link"
    Then I validate text "CONTAINS=Professional Qualifications" to be displayed for "Digital Site Mobile Page Heading" element
    And I wait for "3" seconds
    When I click on the "Digital Site Mobile BPP Logo" link
    And I click on the "Master's & Undergraduate Degrees" "BPP Digital Qualifications at Every Level item link"
    Then I wait for "1" seconds
    Then I validate text "CONTAINS=Degrees" to be displayed for "Digital Site Mobile Page Heading" element
    And I wait for "2" seconds
    When I click on the "Digital Site Mobile BPP Logo" link
    And I wait for "3" seconds
    #Login Existing User
    And I should scroll to the "top" of the page
    When I click on the "BPP Digital Login link" element
    And I wait for "3" seconds
    Then I click on the "BPP Digital Register Link on Login Page" button by JS
    And I fill the "Direct App Admin Email" field with "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINUSER"
    And I fill the "Direct App Admin Password" field with "MD_COMMON_CREDENTIALS_BUILDEMPIRENEILADMINPASSWORD"
    And I click on the "Direct App Login Button" button
    Then I wait for "5" seconds
    #Validate Created Profession (Should be created in Professions with name 'Automation General Review Profession Page')
    Given I am on "MD_COMMON_LINKS_BPPDIGITALINDEXURL" URL
    When I fill the "BPP Digital Find a Course Search Field" field with "Automation General Review Profession Page"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "BPP Digital Find a Course Search Field"
    Then I validate text "Automation General Review Profession Page" to be displayed for "BPP Digital Section First Article name" element
    #Validate Main Menu Items
    #Management
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Management" "BPP Digital Mobile Second Expandable Menu"
    Then I wait for "1" seconds
    Then I validate text "CONTAINS=Business and Management" to be displayed for "Digital Site Mobile Page Courses Heading" element
    Then I wait for "1" seconds
    #Innovation and Technology
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Innovation & Technology" "BPP Digital Mobile Second Expandable Menu"
    Then I wait for "1" seconds
    Then I validate text "CONTAINS=Innovation and Technology" to be displayed for "Digital Site Mobile Page Courses Heading" element
    Then I wait for "1" seconds
    #Financial Services
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Financial Services" "BPP Digital Mobile Second Expandable Menu"
    Then I wait for "1" seconds
    Then I validate text "CONTAINS=Financial Services" to be displayed for "Digital Site Mobile Page Courses Heading" element
    Then I wait for "1" seconds
    #Governance, Risk and Compliance
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Governance, Risk & Compliance" "BPP Digital Mobile Second Expandable Menu"
    Then I wait for "1" seconds
    Then I validate text "CONTAINS=Governance, Risk and Compliance" to be displayed for "Digital Site Mobile Page Courses Heading" element
    Then I wait for "1" seconds
    #Nursing and Healthcare
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Nursing & Healthcare" "BPP Digital Mobile Second Expandable Menu"
    Then I wait for "1" seconds
    Then I validate text "CONTAINS=Nursing and Healthcare" to be displayed for "Digital Site Mobile Page Courses Heading" element
    Then I wait for "1" seconds
    #Human Resources
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Human Resources" "BPP Digital Mobile Second Expandable Menu"
    Then I wait for "1" seconds
    Then I validate text "CONTAINS=Human Resources" to be displayed for "Digital Site Mobile Page Courses Heading" element
    Then I wait for "1" seconds
    #Insolvency
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Insolvency" "BPP Digital Mobile Second Expandable Menu"
    Then I wait for "1" seconds
    Then I validate text "CONTAINS=Insolvency" to be displayed for "Digital Site Mobile Page Courses Heading" element
    Then I wait for "1" seconds
    #Chiropractic
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Chiropractic" "BPP Digital Mobile Second Expandable Menu"
    Then I wait for "1" seconds
    Then I validate text "CONTAINS=Chiropractic" to be displayed for "Digital Site Mobile Page Courses Heading" element
    Then I wait for "1" seconds
    #Psychology
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Psychology" "BPP Digital Mobile Second Expandable Menu"
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Psychology" to be displayed for "Digital Site Mobile Page Courses Heading" element
    Then I wait for "1" seconds
    #View all courses
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Courses" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "View all courses" "BPP Digital Mobile Second Expandable Menu"
    And I wait for "1" seconds
    Then I validate text "CONTAINS=Courses" to be displayed for "BPP Digital Site Page Header" element
    Then I wait for "1" seconds
    #Working with businesses
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Business" "BPP Digital Study expandable link"
    And I wait for "2" seconds
    And I click on the "Working with businesses" "BPP Digital Mobile Second Expandable Menu"
    Then I wait for "1" seconds
    Then I validate text "CONTAINS=Unleash the potential in your business" to be displayed for "Digital Site Mobile Page Heading" element
    Then I wait for "2" seconds
    #About Us
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "About Us" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "About Us" "BPP Digital Mobile Second Expandable Menu"
    Then I wait for "1" seconds
    Then I validate text "CONTAINS=About Us" to be displayed for "Digital Site Mobile Page Heading" element
    Then I wait for "2" seconds
    #Our People
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "About Us" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Our People" "BPP Digital Mobile Second Expandable Menu"
    Then I wait for "1" seconds
    Then I validate text "CONTAINS=Our People" to be displayed for "Digital Site Mobile Page Heading" element
    Then I wait for "2" seconds
    #BPP University
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "About Us" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "About BPP University" "BPP Digital Mobile Second Expandable Menu"
    Then I wait for "1" seconds
    Then I validate text "CONTAINS=About BPP University" to be displayed for "Digital Site Mobile Page Heading" element
    Then I wait for "2" seconds
    #Locations
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "About Us" "BPP Digital Study expandable link"
    And I wait for "1" seconds
    And I click on the "Study Centre Locations" "BPP Digital Mobile Second Expandable Menu"
    Then I wait for "2" seconds
    #Events
    And I click on the "Digital Site Mobile Hamburger Menu" element
    When I click on the "Digital Site Mobile Hamburger Events" element
    Then I wait for "1" seconds
    Then I validate text "CONTAINS=Events" to be displayed for "Digital Site Mobile Page Events Heading" element
    Then I wait for "2" seconds
    #Contact us
    When I click on the "Contact us" "BPP Digital Student Applications Menu link"
    Then I wait for "3" seconds
    Then I validate text "CONTAINS=Contact Us" to be displayed for "Digital Site Mobile Page Heading" element