@Mobile
Feature: BPP Accordion Items
  As a tablet/mobile user, I expect accordion items to be styled as indicated in BPP designs

  @Positive @iPad #TC-2059, TC-2060
  Scenario: Accordion Items_Mobile
    Given I am on "https://web-stage-bppdigital.bppuniversity.com/locations/thetestpage" URL
    And I wait for "10" seconds
    And I hover over the "BPP Digital Accordion Mobile Item" element
    Then Сss "margin-bottom" of "BPP Digital Accordion Mobile Item" should have value "80px"
