@ProductFactory @Streams @HappyPath
Feature: Reference Data - Streams - BPP-6516
  As a Senior Product Setter
  I want to be able to add and amend Stream reference data
  so that a Stream is stored in PF.

  Background:
    Given I execute "Log In" reusable step
    And I remember "AutoStreamName" text as "EC_AUTO_STREAM_NAME" variable

  @Positive @P1 @CoveredWithApi #TC-2929
  Scenario: Add a New Stream Using a Modal
    And I execute "Create Stream" reusable step

  @Negative @P2 @Amend @CoveredWithApi #TC-2932
  Scenario: Amend a Stream With Name That Already Exists
    And I execute "Create Stream" reusable step
    And I execute "Create Stream" reusable step replacing some steps
      |3|I click on the "EC_STREAM_NAME" "Product Factory edit button"|
      |4|I set "EC_AUTO_STREAM_NAME" text to the "Name" "Product Factory text field"|
      |6|I should see the "Name must be unique" element                             |

  @Negative @P2 @CoveredWithApi #TC-2930
  Scenario: Add a Stream Where Name Already Exists
    And I execute "Create Stream" reusable step replacing some steps
      |4|I set "EC_AUTO_STREAM_NAME" text to the "Name" "Product Factory text field"|
      |6|I should see the "Name must be unique" element                             |

  @Positive @Regression @P1 @Amend @CoveredWithApi #TC-2931
  Scenario: Amend a Stream Using a Modal
    And I execute "Create Stream" reusable step
    And I execute "Create Stream" reusable step replacing some steps
      |3|I click on the "EC_STREAM_NAME" "Product Factory edit button"|
      |4|I set "StreamNameNew[######]" text to the "Name" "Product Factory text field"|
      |6|I should see the "EC_STREAM_NAME_NEW" element|