@CleanOrigin @SearchValidation
Feature: Search Validation
  As an user
  I want to be able to search items on the website

  @Positive @Regression @P1
  Scenario Outline: Search Validation
    Given I execute "Log In To Clean Origin" reusable step
    And I click on the "search" "element by id"
    And I set "<searchRequest>" text to the "search" "element by id"
    And I press "ENTER" for "search" "element by id"
    And I wait for "3" seconds
    And I should see the "xpath=<elementToValidate>" element

    Examples:
      |searchRequest|elementToValidate|
      |32574-14kt Rose Gold|//a[@class='product-item-link'][contains(.,'Tinsley Petite Pave Dome Pendant')]|
      |LMP1006.50-14kt Yellow Gold|//a[@class='product-item-link'][contains(.,'1/2ct Solitaire Pendant')]|
      |Earrings|//a[@class='product-item-link'][contains(.,'Earrings')]|
      |Bracelet|//a[@class='product-item-link'][contains(.,'Bracelet')]|
      |Pendant|//a[@class='product-item-link'][contains(.,'Pendant')]|
      |Band|//a[@class='product-item-link'][contains(.,'Isabella Band')]|
      |Bridal Set|//a[@class='product-item-link'][contains(.,'Marquise Bridal Set')]|
      |Diamonds|//a[@class='product-item-link'][contains(.,'Chrissy Diamond Ring')]|
      |Ring|//a[@class='product-item-link'][contains(.,'Frances Ring')]    |
      |Vintage|//a[@class='product-item-link'][contains(.,'Vintage Solitaire Ring')]  |
      |COCBSHY1OG|//div[contains(.,'Cushion Lab Created Diamond is the only product matching your')][contains(.,'COCBSHY1OG')]|