@EndToEnd @Smoke @Banner
Feature: Student from CRM Smoke Test
  Description

  @Positive @Qualification #TC-547
  Scenario: Student from CRM to Banner Qualification
    #Create Student
    When I execute "Log In To Salesforce" reusable step
    And I execute "Create Student Account" reusable step replacing some steps
    |7|I fill the "Salesforce Student Last Name" field with "Qualification[LASTNAME]"|
    And I execute "Create Address" reusable step
    And I execute "Get Profile ID" reusable step
    And I execute "Add Qualification" reusable step
    And I click on the "Salesforce Student Accounts link" link by JS
    And I execute "Create Opportunity" reusable step
    And I click on the "EC_OPPORTUNITY_NAME" "Salesforce link"
    And I click on the "Product Catalog Items" "Salesforce cases status option"
    And I click on the "Salesforce New Case Button" button
    And I fill the "Salesforce Offering Text Field" field with "MD_COMMON_VALIDDATA_SFOFFERING"
    And I click on the "Salesforce Search" button
    And I "check" "Salesforce Offering Checkbox" checkbox
    And I click on the "Salesforce Add Products" button
    Then I execute "Submit Application" reusable step
    #Login to Banner and check Qualification
    And I execute "window.open()" JS code
    And I switch to window with index "2"
    When I execute "Log In To Banner" reusable step
    And I execute "Navigate To Form" reusable step replacing some steps
    |1|I fill the "Banner Go To Form" field with "SOATEST"|
    When I fill the "Banner Id Text" field with "EC_BANNER_ID"
    Then I click on the "Banner Go" button
    Then I validate text "Law & Society" to be displayed for "Banner SOATEST Test Score description" element
    Then Attribute "title" of "Banner SOATEST Test Score Source full name" should have value "EC_QUALIFICATION_INSTITUTION"
    Then I validate text "EC_G" to be displayed for "Banner SOATEST Test Score score number" element
    Then I remember "KW_AUTO_TODAY|DD/MM/YYYY" text as "EC_TODAY" variable
    Then I validate text "EC_TODAY" to be displayed for "Banner SOATEST Test Score date" element
    Then Attribute "title" of "Banner SOATEST Test Score Admission Request" should have value "Qual used for ADM Offer"
#   Then Attribute "aria-checked" of "Banner SOATEST Equivalency Indicator checkbox" should have value "true"
    #Second page for SOATEST form
    Then I click on the "Banner SOATEST Test Scores second tab" element
    Then Attribute "title" of "Banner SOATEST Status filed value" should have value "EC_STATUS"
    Then I click on the "Banner SOATEST Test Scores third tab" element
    Then Attribute "title" of "Banner SOATEST SAT Essay ID filed value" should have value "EC_TARIFF_POINT"

#  @Positive #TC-547
#  Scenario: Student from CRM to Banner Non Demographic
#    #Create Student
#    When I execute "Log In To Salesforce" reusable step
#    And I execute "Create Student Account" reusable step with some additional steps
#    |13|I click on the "Ethnic Code Select" "Salesforce dropdown field"|
#    |14|I click on the "10~ White" "Salesforce dropdown field option"|
#    |15|I click on the "Gender Identity" "Salesforce dropdown field"|
#    |16|I click on the "01~ Yes" "Salesforce dropdown field option"|
#    |17|I click on the "Religion" "Salesforce dropdown field"|
#    |18|I click on the "02~ Buddhist" "Salesforce dropdown field option"|
#    |19|I click on the "Sexual Orientation" "Salesforce dropdown field"|
#    |20|I click on the "01~ Bisexual" "Salesforce dropdown field option"|
#    |21|I capture text data "Salesforce Student Creation Capture Ethnic Code" as "EC_ETHNIC_CODE" variable|
#    |22|I capture text data "Salesforce Student Creation Capture Gender Identity" as "EC_GENDER_IDENTITY" variable|
#    |23|I capture text data "Salesforce Student Creation Capture Religion" as "EC_RELIGION" variable|
#    |24|I capture text data "Salesforce Student Creation Capture Sexual Orientation" as "EC_SEXUAL_ORIENTATION" variable|
#    And I execute "Create Address" reusable step
#    And I execute "Get Profile ID" reusable step
#    And I execute "Create Opportunity" reusable step
#    And I click on the "EC_OPPORTUNITY_NAME" "Salesforce link"
#    And I click on the "Product Catalog Items" "Salesforce related new button"
#    And I click on the "New" "Salesforce dropdown option"
#    And I fill the "Salesforce Offering Text Field" field with "MD_COMMON_VALIDDATA_SFOFFERING"
#    And I click on the "Salesforce Search" button
#    And I "check" "Salesforce Offering Checkbox" checkbox
#    And I click on the "Salesforce Add Products" button
#    Then I execute "Submit Application" reusable step
#    #Login to Banner
#    And I execute "window.open()" JS code
#    And I switch to window with index "2"
#    When I execute "Log In To Banner" reusable step
#    And I execute "Navigate To Form" reusable step replacing some steps
#      |1|I fill the "Banner Go To Form" field with "SKASPIN"|
#    When I fill the "Banner Id Text" field with "EC_BANNER_ID"
#    Then I click on the "Banner Go" button

  @Positive @Identification #TC-547
  Scenario: Student from CRM to Banner Identification Update
    #Create Student
    When I execute "Log In To Salesforce" reusable step
    And I execute "Create Student Account" reusable step
    And I wait for "3" seconds
    And I execute "Create Address" reusable step
    And I execute "Get Profile ID" reusable step
    And I execute "Create Opportunity" reusable step
    And I click on the "EC_OPPORTUNITY_NAME" "Salesforce link"
    And I click on the "Product Catalog Items" "Salesforce cases status option"
    And I click on the "Salesforce New Case Button" button
    And I fill the "Salesforce Offering Text Field" field with "MD_COMMON_VALIDDATA_SFOFFERING"
    And I click on the "Salesforce Search" button
    And I "check" "Salesforce Offering Checkbox" checkbox
    And I click on the "Salesforce Add Products" button
    Then I execute "Submit Application" reusable step
    #Login to Banner
    And I execute "window.open()" JS code
    And I switch to window with index "2"
    When I execute "Log In To Banner" reusable step
    And I execute "Navigate To Form" reusable step replacing some steps
      |1|I fill the "Banner Go To Form" field with "SPAIDEN"|
    When I fill the "Banner Id Text" field with "EC_BANNER_ID"
    Then I click on the "Banner Go" button
    And I wait for "2" seconds
    #Current Identification block
    Then Attribute "title" of "Banner SPAIDEN Last Name filed value" should have value "EC_AUTO_LASTNAME"
    Then Attribute "title" of "Banner SPAIDEN First Name filed value" should have value "EC_AUTO_FIRSTNAME"
    And I switch to window with index "1"
    #Edit Student
    And I click on the "Salesforce Quotes Edit" button
    And I wait for "2" seconds
    And I set "Updated[FIRSTNAME]" text to the "First Name" "Salesforce text field"
    Then  I fill the "Salesforce Student Last Name" field with "Updated[LASTNAME]"
    And I click on the "Salesforce Account Edit Save button" button
    And I wait for "15" seconds
    #Login to Banner
    And I execute "window.open()" JS code
    And I switch to window with index "2"
    And I am on "http://bpp-sis-admin-test.apolloglobal.int/applicationNavigator/seamless" URL
    Given I am on "MD_COMMON_LINKS_BPPBANNERURL" URL
    And I click on the "Banner Application Navigator" link
    And I execute "Navigate To Form" reusable step replacing some steps
      |1|I fill the "Banner Go To Form" field with "SPAIDEN"|
    When I fill the "Banner Id Text" field with "EC_BANNER_ID"
    Then I click on the "Banner Go" button
    And I wait for "2" seconds
    #Current Identification block
    Then Attribute "title" of "Banner SPAIDEN Last Name filed value" should have value "EC_UPDATED_LASTNAME"
    Then Attribute "title" of "Banner SPAIDEN First Name filed value" should have value "EC_UPDATED_FIRSTNAME"
    #Alternate Identification
    When I click on the "Banner SPAIDEN Alternate Identification tab" link
    Then Attribute "title" of "Banner SPAIDEN Alternate Last Name filed value" should have value "EC_AUTO_LASTNAME"
    Then Attribute "title" of "Banner SPAIDEN Alternate First Name filed value" should have value "EC_AUTO_FIRSTNAME"

  @Positive @Address #TC-547
  Scenario: Student from CRM to Banner Address Update
    #Create Student
    When I execute "Log In To Salesforce" reusable step
    Then I remember "KW_AUTO_ZIPCODE|#####" text as "EC_BILLING_ZIP_CODE" variable
    Then I remember "KW_AUTO_ZIPCODE|#####" text as "EC_MAILING_ZIP_CODE" variable
    Then I remember "KW_AUTO_STREET" text as "EC_BILLING_STREET_ONE" variable
    Then I remember "KW_AUTO_STREET" text as "EC_BILLING_STREET_TWO" variable
    Then I remember "KW_AUTO_STREET" text as "EC_BILLING_STREET_THREE" variable
    Then I remember "KW_AUTO_STREET" text as "EC_BILLING_STREET_FOUR" variable
    Then I remember "KW_AUTO_STREET" text as "EC_MAILING_STREET" variable
    And I execute "Create Student Account" reusable step
    And I wait for "3" seconds
    #Create Address
    And I click on the "Salesforce Addresses Quick Link Tab" button
    And I wait for "1" seconds
    And I click on the "Salesforce Student Account Pages New button" button
    And I click on the "Address Type" "Salesforce dropdown field" by JS
    And I click on the "Billing" "option"
    And I set "EC_BILLING_STREET_ONE" text to the "Address Line 1" "Salesforce text field label"
    And I set "EC_BILLING_STREET_TWO" text to the "Address Line 2" "Salesforce text field label"
    And I set "EC_BILLING_STREET_THREE" text to the "Address Line 3" "Salesforce text field label"
    And I set "EC_BILLING_STREET_FOUR" text to the "Address Line 4" "Salesforce text field label"
    And I set "Manchester" text to the "City" "Salesforce text field label"
    And I set "EC_BILLING_ZIP_CODE" text to the "Zip/Postal Code" "Salesforce text field label"
    And I set "United Kingdom" text to the "Country" "Salesforce search field"
    Then I wait for "1" seconds
    And I click on the "Kingdom" "option" by JS
    And I click on the "Salesforce Account Creation Save button" element
    Then I should see the " was created." message
    And I wait for "3" seconds
    #Create Second Address
    And I execute "Create Address" reusable step replacing some steps
      |5|I click on the "Mailing" "option"|
      |6|I set "EC_MAILING_STREET" text to the "Address Line 1" "Salesforce text field label"|
      |7|I set "Boston" text to the "City" "Salesforce text field label"|
      |8|I set "EC_MAILING_ZIP_CODE" text to the "Zip/Postal Code" "Salesforce text field label"|
      |10|I set "United States" text to the "Country" "Salesforce search field"|
      |12|I click on the "States" "option" by JS|
    And I wait for "10" seconds
    And I execute "Get Profile ID" reusable step
    And I execute "Create Opportunity" reusable step
    And I click on the "EC_OPPORTUNITY_NAME" "Salesforce link"
    And I click on the "Product Catalog Items" "Salesforce cases status option"
    And I click on the "Salesforce New Case Button" button
    And I fill the "Salesforce Offering Text Field" field with "MD_COMMON_VALIDDATA_SFOFFERING"
    And I click on the "Salesforce Search" button
    And I "check" "Salesforce Offering Checkbox" checkbox
    And I click on the "Salesforce Add Products" button
    Then I execute "Submit Application" reusable step
   #Login to Banner
    And I execute "window.open()" JS code
    And I switch to window with index "2"
    When I execute "Log In To Banner" reusable step
    And I execute "Navigate To Form" reusable step replacing some steps
      |1|I fill the "Banner Go To Form" field with "SPAIDEN"|
    When I fill the "Banner Id Text" field with "EC_BANNER_ID"
    Then I click on the "Banner Go" button
    And I wait for "2" seconds
    #Verify Billing Address block
    When I click on the "Banner SPAIDEN Address tab" link
    Then Attribute "title" of "Banner SPAIDEN Address Type field value" should have value "Billing"
    Then Attribute "title" of "Banner SPAIDEN Street Line One field value" should have value "EC_BILLING_STREET_ONE"
    Then Attribute "title" of "Banner SPAIDEN Street Line Two field value" should have value "EC_BILLING_STREET_TWO"
    Then Attribute "title" of "Banner SPAIDEN Street Line Three field value" should have value "EC_BILLING_STREET_THREE"
    Then Attribute "title" of "Banner SPAIDEN Street Line Four field value" should have value "EC_BILLING_STREET_FOUR"
    Then Attribute "title" of "Banner SPAIDEN City field value" should have value "Manchester"
    Then Attribute "title" of "Banner SPAIDEN ZIP Code field value" should have value "EC_BILLING_ZIP_CODE"
    Then Attribute "title" of "Banner SPAIDEN Nation field value" should have value "United Kingdom"
    #Change Billing Address block
    And I fill the "Banner SPAIDEN Street Line One field value" field with "StreetOne[####]"
    And I fill the "Banner SPAIDEN Street Line Two field value" field with "StreetTwo[####]"
    And I fill the "Banner SPAIDEN Street Line Three field value" field with "StreetThree[####]"
    And I fill the "Banner SPAIDEN Street Line Four field value" field with "StreetFour[####]"
    And I fill the "Banner SPAIDEN City field value" field with "Toronto"
    And I fill the "Banner SPAIDEN ZIP Code field value" field with "ZIP[###]"
    And I fill the "Banner SPAIDEN Nation field" field with "ALB"
    And I press "MD_COMMON_KEYBOARD_ENTER" for "Banner SPAIDEN Nation field"
    Then I click on the "Banner Save" button
    #Verify Mailing Address block
    When I click on the "Banner Next Page" element
    Then Attribute "title" of "Banner SPAIDEN Address Type field value" should have value "Mailing"
    Then Attribute "title" of "Banner SPAIDEN Street Line One field value" should have value "EC_MAILING_STREET"
    Then Attribute "title" of "Banner SPAIDEN City field value" should have value "Boston"
    Then Attribute "title" of "Banner SPAIDEN ZIP Code field value" should have value "EC_MAILING_ZIP_CODE"
    #Then Attribute "title" of "Banner SPAIDEN Nation field value" should have value "Canada"
    #Verify Address in CRM (Billing)
    And I switch to window with index "1"
    And I wait for "3" seconds
    And I click on the "Salesforce Account Related Tab" link by JS
    And I click on the "/Addresses__r/view" "link address" by JS
    And I click on the "Salesforce Address Type First Link" element
    Then I should see the "EC_STREET_ONE" element
    Then I should see the "EC_STREET_TWO" element
    Then I should see the "EC_STREET_THREE" element
    Then I should see the "EC_STREET_FOUR" element
    Then I should see the "Albania" element
    Then I should see the "EC_ZIP" element