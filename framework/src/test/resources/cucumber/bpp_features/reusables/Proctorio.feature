Feature: Proctorio
  Submit

  @Proctorio
  Scenario Outline: Submit <username>
    When I am on "https://my.bpp.com/vle/" URL
    When I click on the "Proctorio Login Link" element
    And I click on the "Proctorio Special Accounts" element
    And I fill the "Proctorio Username Field" field with "<username>"
    And I fill the "Proctorio Password Field" field with "<password>"
    And I click on the "Proctorio Login Button" element
    And I click on the "Proctorio Test" element
    And I click on the "Proctorio Yes" element
    And I click on the "Proctorio Account" element
    And I click on the "Proctorio Logout" element

    Examples:
      | username               | password     |
      | proctorio-loadtest1477 | Password1!!! |
      | proctorio-loadtest1478 | Password1!!! |
      | proctorio-loadtest1479 | Password1!!! |
      | proctorio-loadtest1480 | Password1!!! |
      | proctorio-loadtest1481 | Password1!!! |
      | proctorio-loadtest1482 | Password1!!! |
      | proctorio-loadtest1483 | Password1!!! |
      | proctorio-loadtest1484 | Password1!!! |
      | proctorio-loadtest1485 | Password1!!! |
      | proctorio-loadtest1486 | Password1!!! |
      | proctorio-loadtest1487 | Password1!!! |
      | proctorio-loadtest1488 | Password1!!! |
      | proctorio-loadtest1489 | Password1!!! |
      | proctorio-loadtest1490 | Password1!!! |
      | proctorio-loadtest1491 | Password1!!! |
      | proctorio-loadtest1492 | Password1!!! |
      | proctorio-loadtest1493 | Password1!!! |
      | proctorio-loadtest1494 | Password1!!! |
      | proctorio-loadtest1495 | Password1!!! |
      | proctorio-loadtest1496 | Password1!!! |
      | proctorio-loadtest1497 | Password1!!! |
      | proctorio-loadtest1498 | Password1!!! |
      | proctorio-loadtest1499 | Password1!!! |