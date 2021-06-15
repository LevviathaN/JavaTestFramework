@ProductFactory @Courses @Materials @MaterialDeliveryDefaults
Feature: Abilit to specify Material Delivery Defaults during Product Setup - BPP-8226
  As a Salesforce User creating a Booking
  I would like the Delivery Address for each Material to be auto-filled in based on the Material Delivery Defaults set in Product Factory
  So that I don't have to remember to update the Delivery Address each time

  Background:
    Given I execute "Generate ISBN" reusable step
    Given I execute "Log In" reusable step
    And I execute "Remember Variables " reusable step

  @Positive @P1 #TC-3556
  Scenario: Verify Ability to specify Material Delivery Default during Product Setup
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    And I click on the "Materials" element
    And I click on the "Add Material" "button"
    Then I "check" "EC_MATERIAL_TYPE_NAME" "Product Factory checkbox"
    And I click on the "Save" "button"
    Then I click on the "Material Delivery Default" "Product Factory dropdown"
    When I click on the "Student" element
    Then I should see the "Student" element
    And I click on the "2000" "Product Factory Material Delete by price button"
    And I click on the "Yes" "Product Factory button"
    And I wait for "4" seconds

  @Negative @P1 #TC-3557
  Scenario: Verify Not Selected Material Delivery Default during Product Setup
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    And I click on the "Materials" element
    #precondition
    Given For each "EC_MATERIAL_TYPE_DESCRIPTION" element:
      |I click on the "EC_MATERIAL_TYPE_DESCRIPTION" "Product Factory Material Delete button"|
      |I click on the "Yes" "Product Factory button"|
      |I wait for "3" seconds                       |

    And I click on the "Add Material" "button"
    Then I "check" "EC_MATERIAL_TYPE_NAME" "Product Factory checkbox"
    And I click on the "Save" "button"
    When I click on the "Activate" "Product Factory button" if "Activate,Product Factory button" "special element is present"
    When I click on the "Publish" "Product Factory button" if "Publish,Product Factory button" "special element is present"
    When I click on the "Yes" "Product Factory button" if "Yes,Product Factory button" "special element is present"
    Then I should see the "The Material Delivery Default has not been set for all Course Materials" message
    Then I click on the "No" "Product Factory button" if "No,Product Factory button" "special element is present"
    #cleanup
    Given For each "EC_MATERIAL_TYPE_DESCRIPTION" element:
      |I click on the "EC_MATERIAL_TYPE_DESCRIPTION" "Product Factory Material Delete button"|
      |I click on the "Yes" "Product Factory button"|
      |I wait for "3" seconds                       |

  @Negative @P1 #TC-3558
  Scenario: Edit Course With Selected Material Delivery Default
    And I remember "23/10/2020" text as "EC_SITTING_START_DATE" variable
    And I remember "10/10/2025" text as "EC_SITTING_END_DATE" variable
    And I execute "Edit Course" reusable step
#    And I execute "Populate Course Instance Session Dates" reusable step
    Then I execute "Keep the Course Activated" reusable step
    And I execute "Keep the Course Instance Activated" reusable step
    And I click on the "Materials" element
    #precondition
    Given For each "EC_MATERIAL_TYPE_DESCRIPTION" element:
      |I click on the "EC_MATERIAL_TYPE_DESCRIPTION" "Product Factory Material Delete button"|
      |I click on the "Yes" "Product Factory button"|
      |I wait for "3" seconds                       |
    And I click on the "Add Material" "button"
    Then I "check" "EC_MATERIAL_TYPE_NAME" "Product Factory checkbox"
    And I click on the "Save" "button"
    Then I click on the "Material Delivery Default" "Product Factory dropdown"
    When I click on the "Student" "element by data value"
    When I click on the "Publish" "Product Factory button"
    And I click on the "Yes" "Product Factory button"
    Then I shouldn't see the "The Material Delivery Default has not been set for all Course Materials" message
    #cleanup
    Given For each "EC_MATERIAL_TYPE_DESCRIPTION" element:
      |I click on the "EC_MATERIAL_TYPE_DESCRIPTION" "Product Factory Material Delete button"|
      |I click on the "Yes" "Product Factory button"|
      |I wait for "3" seconds                       |

  @Negative @P1 #TC-3559
  Scenario: Edit Course Without Selecting Material Delivery Default
    And I remember "23/10/2020" text as "EC_SITTING_START_DATE" variable
    And I remember "10/10/2025" text as "EC_SITTING_END_DATE" variable
    And I execute "Edit Course" reusable step
    And I execute "Populate Course Instance Session Dates" reusable step
    And I execute "Populate Course Instance Step Due Dates" reusable step
    And I click on the "Materials" element
    Given For each "EC_MATERIAL_TYPE_DESCRIPTION" element:
      |I click on the "EC_MATERIAL_TYPE_DESCRIPTION" "Product Factory Material Delete button"|
      |I click on the "Yes" "Product Factory button"|
      |I wait for "3" seconds                       |
    Then I execute "Keep the Course Activated" reusable step
    And I click on the "Add Material" "button"
    Then I "check" "EC_MATERIAL_TYPE_NAME" "Product Factory checkbox"
    And I click on the "Save" "button"
    And I wait for "3" seconds
    When I click on the "Publish" "Product Factory button"
    And I click on the "Yes" "Product Factory button"
    Then I should see the "The Material Delivery Default has not been set for all Course Materials" message
    Then I click on the "No" "Product Factory button" if "No,Product Factory button" "special element is present"
    Given For each "EC_MATERIAL_TYPE_DESCRIPTION" element:
      |I click on the "EC_MATERIAL_TYPE_DESCRIPTION" "Product Factory Material Delete button"|
      |I click on the "Yes" "Product Factory button"|
      |I wait for "3" seconds                       |