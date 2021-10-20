@ProductFactory @Ordering
Feature: Cypher Builder - Support for ordering - BPP-624
  As a Product Setter
  I want to see items on PLPs sorted in alphabetic order
  So that I can navigate trough them easily

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 #TC-1276, TC-1277
  Scenario Outline: Verify <type> Ordering on <data> Page

    When I click on the "<category>" "Product Factory navigation item"
    When I click on the "<data>" "Product Factory navigation sub item"
    And I set "<search>" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type"
    Then I validate text "<first>" to be displayed for "<column>" "Product Factory First PLP Row Text By Column Number"
    Then I validate text "<second>" to be displayed for "<column>" "Product Factory Second PLP Row Text By Column Number"
    Then I validate text "<third>" to be displayed for "<column>" "Product Factory Third PLP Row Text By Column Number"

    Examples:
    |type      |category |data        |search                |first                 |second                |third                 |column|
    |Alphabetic|Programme|Bodies      |OrderingBodyName      |BOrderingBodyShortName|COrderingBodyShortName|DOrderingBodyShortName|1     |
    |Alphabetic|Programme|Papers      |OrderingBodyName      |BOrderingPaperName    |COrderingPaperName    |DOrderingPaperName    |1     |
    |Alphabetic|Delivery |Sittings    |BOrderingBodyShortName|BOrderingSittingName  |COrderingSittingName  |DOrderingSittingName  |1     |
    |Alphabetic|Types    |Course Types|BOrderingBodyShortName|BOrderingSittingName  |COrderingSittingName  |DOrderingSittingName  |1     |
    |Numeric   |Programme|Bodies      |NumericBodyName       |1OrderingBodyShortName|2OrderingBodyShortName|3OrderingBodyShortName|1     |
    |Numeric   |Programme|Papers      |NumericBodyName       |1OrderingPaperName    |2OrderingPaperName    |3OrderingPaperName    |1     |
    |Numeric   |Delivery |Sittings    |1OrderingBodyShortName|1OrderingSittingName  |2OrderingSittingName  |3OrderingSittingName  |1     |
    |Numeric   |Types    |Course Types|1OrderingBodyShortName|1OrderingSittingName  |2OrderingSittingName  |3OrderingSittingName  |1     |