@ProductFactory @Papers
Feature: Reference Data - Paper - BPP-372
  As a Senior Product Setter
  I need to be able to create Papers
  So that I can use the Paper as part of a course template construction and shared between templates and instances.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @CoveredWithApi #TC-772
  Scenario: Add a New Paper Using a Modal
    Given I execute "Create Paper" reusable step

  @Negative @P2 #TC-771
  Scenario: Submitting Incomplete Paper Fields
    When I click on the "Programme" "Product Factory navigation item"
    When I click on the "Papers" "Product Factory navigation sub item"
    Then I click on the "Create" "Product Factory button"
    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"

  @Negative @P2 #TC-773
  Scenario: Add a Paper Where Description Already Exists
    And I remember "AutoPprSN" text as "EC_PPR_SN" variable
    And I remember "AutoPaperName" text as "EC_PAPER_NAME" variable
    And I remember "AutoPaperDescription" text as "EC_PAPER_DESCRIPTION" variable
    When I execute modified "Create Paper" reusable step
      |4|Replace|I set "EC_PPR_SN" text to the "Short Name" "Product Factory text field"|
      |5|Replace|I set "EC_PAPER_NAME" text to the "Name" "Product Factory text field"|
      |6|Replace|I set "EC_PAPER_DESCRIPTION" text to the "Description" "Product Factory text field"|
      |10|Replace|I should see the "Name must be unique" "message"                                   |
      |11|Delete |                                                                                   |
      |12|Delete |                                                                                   |
      |13|Delete |                                                                                   |
      |14|Delete |                                                                                   |
      |15|Delete |                                                                                   |

  @Negative @P2 #TC-4285
  Scenario: Ability to Search Instance by Paper Short Name
    When I execute "Create Paper" reusable step
    When I execute modified "Create Paper" reusable step
      |4|Replace|I set "PaperLongSN[####]" text to the "Short Name" "Product Factory text field"|
      |5|Replace|I set "EC_PAPER_NAME" text to the "Name" "Product Factory text field"|
      |6|Replace|I set "EC_PAPER_DESCRIPTION" text to the "Description" "Product Factory text field"|
      |10|Replace|I should see the "ShortName has a maximum length of 10 characters" message|
      |11|Delete |I set "EC_PPR_SN" text to the "Short Name" "Product Factory text field"|
      |12|Delete |I click on the "Save" "Product Factory button"|
      |13|Delete |I should see the "Short Name must be unique" "message"|
      |14|Delete |                                                                                   |
      |15|Delete |                                                                                   |
#    When I click on the "Programme" "Product Factory navigation item"
#    When I click on the "Papers" "Product Factory navigation sub item"
#    Then I click on the "Create" "Product Factory button"
#    And I set "EC_PAPER_DESCRIPTION" text to the "Description" "Product Factory text field"
#    Then Attribute "tabindex" of "Save" "Product Factory button" should have value "-1"
#    When I set "PaperLongSN[####]" text to the "Short Name" "Product Factory text field"
#    And I set "PaperName[#####]" text to the "Name" "Product Factory text field"
#    And I click on the "Save" "Product Factory button"
#    Then I should see the "ShortName has a maximum length of 10 characters" message
#    When I set "EC_PPR_SN" text to the "Short Name" "Product Factory text field"
#    And I click on the "Save" "Product Factory button"
#    Then I should see the "Short Name must be unique" "message"