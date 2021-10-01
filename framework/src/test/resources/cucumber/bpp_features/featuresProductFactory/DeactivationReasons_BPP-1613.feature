@ProductFactory @DeactivationReasons @HappyPath
Feature: Reference Data - Course Deactivation Reasons - BPP-1613
  As a Senior Product Setter
  I want to be able to create, view and amend Course Deactivation Reasons records
  so that they can be associated to the audit when deactivating Courses.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 @CoveredWithApi #TC-975
  Scenario: Add a New Deactivation Reason Using a Modal
    Given I execute "Create Deactivation Reason" reusable step

  @Negative @P2 @CoveredWithApi #TC-977
  Scenario: Add a Deactivation Reason Where Description Already Exists
    And I remember "AutoDeactivationReasonDescription" text as "EC_DEACTIVATION_REASON_DESCRIPTION" variable
    When I execute "Create Deactivation Reason" reusable step replacing some steps
      |4|I set "EC_DEACTIVATION_REASON_DESCRIPTION" text to the "Description" "Product Factory text field"|
      |6|I should see the "Description must be unique" "message"                                          |

  @Positive @Regression @P1 @Amend @CoveredWithApi #TC-978
  Scenario: Amend a Deactivation Reason Using a Modal
    Given I execute "Create Deactivation Reason" reusable step
    When I execute "Create Deactivation Reason" reusable step replacing some steps
      |3|I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory edit button"|
      |4|I set "DeactivationReasonDescriptionNew[####]" text to the "Description" "Product Factory text field"|
      |6|I should see the "EC_DEACTIVATION_REASON_DESCRIPTION_NEW" element                                    |