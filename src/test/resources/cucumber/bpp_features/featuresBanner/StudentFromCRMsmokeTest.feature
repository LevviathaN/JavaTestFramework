@EndToEnd @Smoke
Feature: Student from CRM Smoke Test
  Description

  @Positive #TC-547
  Scenario: Student from CRM to Banner Qualification
    #Create Student
    When I execute "Log In To Salesforce" reusable step
    And I execute "Create Student Account" reusable step
    And I execute "Create Address" reusable step
    And I execute "Get Profile ID" reusable step
    And I execute "Add Qualification" reusable step
    And I click on the "Salesforce Student Accounts link" link by JS
    And I execute "Create Opportunity" reusable step replacing some steps
    |12|I click on the "Salesforce Account Creation Save button" link|
    And I click on the "EC_OPPORTUNITY_NAME" "Salesforce link"
    And I click on the "Product Catalog Items" "Salesforce related new button"
    And I click on the "New" "Salesforce dropdown option"
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
    Then I validate text "EC_QUALIFICATION_SUBJECT" to be displayed for "Banner SOATEST Test Score description" element
    Then Attribute "title" of "Banner SOATEST Test Score Source full name" should have value "EC_QUALIFICATION_INSTITUTION"
    Then I validate text "EC_G" to be displayed for "Banner SOATEST Test Score score number" element
    Then I remember "KW_AUTO_TODAY|MM/DD/YYYY" text as "EC_TODAY" variable
    Then I validate text "EC_TODAY" to be displayed for "Banner SOATEST Test Score date" element
    Then Attribute "title" of "Banner SOATEST Test Score Admission Request" should have value "Qual used for ADM Offer"
#    Then Attribute "aria-checked" of "Banner SOATEST Equivalency Indicator checkbox" should have value "true"
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
#    #Login to Banner and check Qualification
#    And I execute "window.open()" JS code
#    And I switch to window with index "2"
#    When I execute "Log In To Banner" reusable step
#    And I execute "Navigate To Form" reusable step replacing some steps
#      |1|I fill the "Banner Go To Form" field with "SKASPIN"|
#    When I fill the "Banner Id Text" field with "EC_BANNER_ID"
#    Then I click on the "Banner Go" button