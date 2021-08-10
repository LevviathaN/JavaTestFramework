@ProductFactory @Bodies @Amend
Feature: Amend Reference Data - Body - BPP-624
  As a Senior Product Setter
  I need to search for and Amend a Body (Professional Body / Awarding Body)
  So that I can associate new Courses to that Body

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoBodyFDCode" text as "EC_BODY_FD_CODE" variable
    And I remember "AutoBodyFDDescription" text as "EC_BODY_FD_DESCRIPTION" variable
    And I remember "AutoBodyShortName" text as "EC_BODY_SHORT_NAME" variable
    And I remember "AutoBodyName" text as "EC_BODY_NAME" variable
    And I remember "AutoVerticalName" text as "EC_VERTICAL_NAME" variable

  @Positive @Regression @P1 @CoveredWithApi #TC-1545
  Scenario: Amend a Body Using a Modal
    Given I execute "Create Body" reusable step

  @Negative @P2 #TC-814
  Scenario: Amend Submitting Incomplete Body Fields
    Given I execute modified "Create Body" reusable step
      |4|Replace|I set "" text to the "Short Name" "Product Factory text field"|
      |5|Replace|I set "" text to the "Name" "Product Factory text field"      |
      |10|Replace|Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"|
      |11|Delete |                                                                              |

  @Negative @P2 @CoveredWithApi #TC-820
  Scenario: Amend a Body Where Short Name Already Exists
    And I remember "AutoBodyShortNameTwo" text as "EC_BODY_SHORT_NAME_TWO" variable
    And I remember "AutoBodyNameTwo" text as "EC_BODY_NAME_TWO" variable
    Given I execute modified "Create Body" reusable step
      |3|Replace|I click on the "EC_BODY_NAME" "Product Factory edit button"|
      |4|Replace|I set "EC_BODY_SHORT_NAME_TWO" text to the "Short Name" "Product Factory text field"|
      |5|Replace|I set "EC_BODY_NAME_TWO" text to the "Name" "Product Factory text field"      |
      |6|Delete |                                                                              |
      |7|Delete |                                                                              |
      |11|Replace|I should see the "Short Name must be unique" "message"|