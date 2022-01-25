@ProductFactory @Courses @Materials
Feature: Course Instance - Link Materials restrictions - BPP-1101
  As a Product Setter
  I want to be able to only link Materials to a Course Instance that are allowed by the data rules
  so that I can sell a Course.

  Background:
    Given I generate new ISBN code saving as "EC_ISBN"
    Given I execute "Log In" reusable step
    And I execute "Remember Variables For Creation " reusable step

  @Negative @P1 #TC-1079
  Scenario: Verify Link Materials Restriction Negative
    Given I execute "Create Material Type" reusable step
    Given I execute modified "Create Material" reusable step
      |8|Add|I "check" "Is Course Material" "Product Factory checkbox"|
      |16|Delete|                                                     |
      |17|Delete|                                                     |
#    Then I execute "Create Course" reusable step
#    And I execute "Create Course Instance" reusable step
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    And I click on the "Materials" element
    And I click on the "Add Material" "button"
    Then I shouldn't see the "EC_MATERIAL_TYPE_NAME" element

  @Positive @P1 #TC-1077, TC-1072, TC-1073
  Scenario: Verify Link Materials Restriction Positive
    Given I execute "Create Material Type" reusable step
    And I execute "Create Material" reusable step
#    Then I execute "Create Course" reusable step
#    And I execute "Create Course Instance" reusable step
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    And I click on the "Materials" element
    And I click on the "Add Material" "button"
    Then I should see the "EC_MATERIAL_TYPE_NAME" element

  @Positive @P1 #TC-1063
  Scenario: Verify Already Selected Material Is Not Displayed In Dropdown
    Given I execute "Create Material Type" reusable step
    Given I execute "Create Material" reusable step
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    And I click on the "Materials" element
    And I click on the "Add Material" "button"
    Then I "check" "EC_MATERIAL_TYPE_NAME" "Product Factory checkbox"
    And I click on the "Save" "button"
    And I click on the "Add Material" "button"
    Then I shouldn't see the "EC_MATERIAL_TYPE_NAME" element

  @Negative @P1 @CoveredWithApi @NeedToBeUI #TC-1075
  Scenario: Add Expired Material
    Given I execute "Create Material Type" reusable step
    Given I execute "Create Material" reusable step replacing some steps
      |11|I set "10/10/2019" text to the "Expiry Date" "Product Factory text field"|
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I set "EC_BODY_SHORT_NAME" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    And I click on the "EC_BODY_SHORT_NAME" "Product Factory edit button"
    And I click on the "Materials" element
    And I click on the "Add Material" "button"
    Then I shouldn't see the "EC_MATERIAL_TYPE_NAME" element