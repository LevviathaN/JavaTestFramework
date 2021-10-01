@PF-API
Feature: Product Factory API Data Creation
  As an Admin I should be able to create items in PF using API

  @Material @NeedToBeUi #TC-918
  Scenario: Create Material Wizard
    Given I generate new ISBN code saving as "EC_ISBN"
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Stock Site" API step
    And I execute "Create Material Type" API step
    And I execute "Create Material" API step

  @Material @Update @NeedToBeUi #TC-1432
  Scenario: Amend Material Using Modal
    Given I generate new ISBN code saving as "EC_ISBN"
    And I execute "Create Financial Dimension" API step with parameters saving as "BODY_"
      |dimensionType|PRODUCT   |
      |target       |BODY|
    And I execute "Create Financial Dimension" API step with parameters saving as "MATERIAL_TYPE_"
      |dimensionType|PRODUCT     |
      |target       |MATERIALTYPE|
    And I execute "Create Vertical" API step
    And I execute "Create Body" API step
    And I execute "Create Sitting" API step
    And I execute "Create Vat Rule" API step
    And I execute "Create Vat Rule" API step saving as "SECOND_"
    And I execute "Create Paper" API step
    And I execute "Create Level" API step
    And I execute "Link Body To Levels" API step
    And I execute "Change Paper Body" API step
    And I execute "Link Paper To Levels" API step
    And I execute "Create Stock Site" API step
    And I execute "Create Material Type" API step
    And I execute "Create Material" API step
    And I execute "Change Material Publisher" API step
    And I execute "Change Material Basic Properties" API step
    And I execute "Change Material Body Paper Level Sitting" API step
    And I execute "Delete Material Stock Site" API step
    And I execute "Create Material Stock Site" API step
    And I execute "Update Material Stock Site" API step
