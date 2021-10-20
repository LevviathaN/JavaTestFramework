@ProductFactory @Ordering
Feature: Cypher Builder - Support for ordering - BPP-624
  As a Product Setter
  I want to see items on PLPs sorted in alphabetic order
  So that I can navigate trough them easily

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 #TC-1276
  Scenario Outline: Verify Alphabetic Ordering on <type> Page

    When I click on the "<category>" "Product Factory navigation item"
    When I click on the "<type>" "Product Factory navigation sub item"
    And I set "<search>" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I validate text "<first>" to be displayed for "<column>" "Product Factory First PLP Row Text By Column Number"
    Then I validate text "<second>" to be displayed for "<column>" "Product Factory Second PLP Row Text By Column Number"
    Then I validate text "<third>" to be displayed for "<column>" "Product Factory Third PLP Row Text By Column Number"

    Examples:
    |category |type        |search                |first                 |second                |third                 |column|
    |Programme|Bodies      |OrderingBodyName      |BOrderingBodyShortName|COrderingBodyShortName|DOrderingBodyShortName|1     |
    |Programme|Papers      |OrderingBodyName      |BOrderingPaperName    |COrderingPaperName    |DOrderingPaperName    |1     |
    |Delivery |Sittings    |BOrderingBodyShortName|BOrderingSittingName  |COrderingSittingName  |DOrderingSittingName  |1     |
    |Types    |Course Types|BOrderingBodyShortName|BOrderingSittingName  |COrderingSittingName  |DOrderingSittingName  |1     |