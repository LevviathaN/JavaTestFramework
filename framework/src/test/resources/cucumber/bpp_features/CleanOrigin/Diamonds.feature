@CleanOrigin @FiltersValidation
Feature: Filters Validation
  As an user
  I want to make sure that diamond price on pdp and plp is the same


  @Positive @Regression @P1 @Run
  Scenario Outline: Verify All Diamonds Price <title>
    Given I am on "https://www.cleanorigin.com/diamonds/" URL
    And I wait for "5" seconds

    #prepare variables
    And I remember "0" text as "EC_DIAMOND_COUNTER" variable
    And I remember "<startDiamond>" text as "EC_GENERAL_DIAMOND_COUNTER" variable
    And I remember "<startPage>" text as "EC_GENERAL_PAGE_COUNTER" variable
    And I remember "1" text as "EC_PAGE_NUMBER" variable

    #clear filters
    And I click on the "Round" "Diamonds Listing Page Filter Item"
    And I wait for "3" seconds

    #load all page
    And I should scroll to the "bottom" of the page
    And I should scroll to the "top" of the page

    #click trough to desired page
    Then I execute steps until "EC_PAGE_NUMBER,EC_GENERAL_PAGE_COUNTER" "first value is equal or greater"
      |I click on the "Diamonds Listing Page Next Page Button" element|
      |I wait for "3" seconds                                         |
      |I capture text data "Diamonds Listing Page Current Page Text" as "EC_PAGE_NUMBER" variable|

    #main validation loop
    Then I execute steps until "EC_GENERAL_DIAMOND_COUNTER,<diamondsPerRun>" "first value is greater"
      |Counter "EC_DIAMOND_COUNTER" "increment"|
      |Counter "EC_GENERAL_DIAMOND_COUNTER" "increment"|
      |I click on the "Diamonds Listing Page Next Page Button" element if "EC_DIAMOND_COUNTER,<diamondsPerPage>" "first value is greater"|
      |Counter "EC_GENERAL_PAGE_COUNTER" "increment" if "EC_DIAMOND_COUNTER,<diamondsPerPage>" "first value is greater"|
      |I wait for "5" seconds if "EC_DIAMOND_COUNTER,<diamondsPerPage>" "first value is greater"                       |
      |Counter "EC_DIAMOND_COUNTER" "reset" if "EC_DIAMOND_COUNTER,<diamondsPerPage>" "first value is greater"|
      |I capture text data "EC_DIAMOND_COUNTER" "Diamonds Listing Page Item Price By Index" as "EC_PLP_PRICE" variable|
      |I open "Diamonds Listing Page View Product Button" link in new tab by index "EC_DIAMOND_COUNTER"|
      |I wait for "3" seconds                                                                          |
      |I capture text data "Diamonds Details Page Price" as "EC_PDP_PRICE" variable|
      |I verify that "EC_PLP_PRICE" element "equal" to "EC_PDP_PRICE" element|
      |I switch to window with index "1"                                     |

    #temporary step for soft assertions
    And I assert all

    #debug examples
#    Examples:
#      |title         |startPage|startDiamond|diamondsPerRun|diamondsPerPage|
#      |0 to 250      |3        |0           |3             |5              |
#      |250 to 500    |3        |0           |5             |5              |


    Examples:
      |title         |startPage|startDiamond|diamondsPerRun|diamondsPerPage|
      |0 to 250      |1        |0           |250           |50             |
      |250 to 500    |6        |0           |250           |50             |
      |500 to 750    |11       |0           |250           |50             |
      |750 to 1000   |16       |0           |250           |50             |
      |1000 to 1250  |21       |0           |250           |50             |
      |1250 to 1500  |26       |0           |250           |50             |
      |1500 to 1750  |31       |0           |250           |50             |
      |1750 to 2000  |36       |0           |250           |50             |
      |2000 to 2250  |41       |0           |250           |50             |
      |2250 to 2500  |46       |0           |250           |50             |
      |2500 to 2750  |51       |0           |250           |50             |
      |2750 to 3000  |56       |0           |250           |50             |
      |3000 to 3250  |61       |0           |250           |50             |
      |3250 to 3500  |66       |0           |250           |50             |
      |3500 to 3750  |71       |0           |250           |50             |
      |3750 to 4000  |76       |0           |250           |50             |
      |4000 to 4250  |81       |0           |250           |50             |
      |4250 to 4500  |86       |0           |250           |50             |
      |4500 to 4750  |91       |0           |250           |50             |
      |4750 to 5000  |96       |0           |250           |50             |
      |5000 to 5250  |101      |0           |250           |50             |
      |5250 to 5500  |106      |0           |250           |50             |
      |5500 to 5750  |111      |0           |250           |50             |
      |5750 to 6000  |116      |0           |250           |50             |
      |6000 to 6250  |121      |0           |250           |50             |
      |6250 to 6500  |126      |0           |250           |50             |
      |6500 to 6750  |131      |0           |250           |50             |
      |6750 to 7000  |136      |0           |250           |50             |
      |7000 to 7250  |141      |0           |250           |50             |
      |7250 to 7500  |146      |0           |250           |50             |
      |7500 to 7750  |151      |0           |250           |50             |
      |7750 to 8000  |156      |0           |250           |50             |
      |8000 to 8250  |161      |0           |250           |50             |
      |8250 to 8500  |166      |0           |250           |50             |
      |8500 to 8750  |171      |0           |250           |50             |
      |8750 to 9000  |176      |0           |250           |50             |
      |9000 to 9250  |181      |0           |250           |50             |
      |9250 to 9500  |186      |0           |250           |50             |
      |9500 to 9750  |191      |0           |250           |50             |
      |9750 to 10000 |196      |0           |250           |50             |
      |10000 to 10250|201      |0           |250           |50             |
      |10250 to 10500|206      |0           |250           |50             |
      |10500 to 10750|211      |0           |250           |50             |
      |10750 to 11000|216      |0           |250           |50             |
      |11000 to 11250|221      |0           |250           |50             |
      |11250 to 11500|226      |0           |250           |50             |
      |11500 to 11750|231      |0           |250           |50             |
      |11750 to 12000|236      |0           |250           |50             |
      |12000 to 12250|241      |0           |250           |50             |
      |12250 to 12500|246      |0           |250           |50             |
      |12500 to 12750|251      |0           |250           |50             |
      |12750 to 13000|256      |0           |250           |50             |
      |13000 to 13250|261      |0           |250           |50             |
      |13250 to 13500|266      |0           |250           |50             |
      |13500 to 13750|271      |0           |250           |50             |
      |13750 to 14000|276      |0           |250           |50             |
      |14000 to 14250|281      |0           |250           |50             |
      |14250 to 14500|286      |0           |250           |50             |
      |14500 to 14750|291      |0           |250           |50             |
      |14750 to 15000|296      |0           |250           |50             |
      |15000 to 15250|301      |0           |250           |50             |
      |15250 to 15500|306      |0           |250           |50             |
      |15500 to 15750|311      |0           |250           |50             |
      |15750 to 16000|316      |0           |250           |50             |
      |16000 to 16250|321      |0           |250           |50             |
      |16250 to 16500|326      |0           |250           |50             |
      |16500 to 16750|331      |0           |250           |50             |
      |16750 to 17000|336      |0           |250           |50             |
      |17000 to 17250|341      |0           |250           |50             |
      |17250 to 17500|346      |0           |250           |50             |
      |17500 to 17750|351      |0           |250           |50             |
      |17750 to 18000|356      |0           |250           |50             |
      |18000 to 18250|361      |0           |250           |50             |
      |18250 to 18500|366      |0           |250           |50             |
      |18500 to 18750|371      |0           |250           |50             |
      |18750 to 19000|376      |0           |250           |50             |
      |19000 to 19250|381      |0           |250           |50             |
      |19250 to 19500|386      |0           |250           |50             |
      |19500 to 19750|391      |0           |250           |50             |
      |19750 to 20000|396      |0           |250           |50             |
      |20000 to 20250|401      |0           |250           |50             |
      |20250 to 20500|406      |0           |250           |50             |
      |20500 to 20750|411      |0           |250           |50             |
      |20750 to 21000|416      |0           |250           |50             |
      |21000 to 21250|421      |0           |250           |50             |
      |21250 to 21500|426      |0           |250           |50             |
      |21500 to 21750|431      |0           |250           |50             |
      |21750 to 22000|436      |0           |250           |50             |
      |22000 to 22250|441      |0           |250           |50             |
      |22250 to 22500|446      |0           |250           |50             |
      |22500 to 22750|451      |0           |250           |50             |
      |22750 to 23000|456      |0           |250           |50             |
      |23000 to 23250|461      |0           |250           |50             |
      |23250 to 23500|466      |0           |250           |50             |
      |23500 to 23750|471      |0           |250           |50             |
      |23750 to 24000|476      |0           |250           |50             |
      |24000 to 24250|481      |0           |250           |50             |
      |24250 to 24500|486      |0           |250           |50             |
      |24500 to 24750|491      |0           |250           |50             |
      |24750 to 25000|496      |0           |250           |50             |
      |25000 to 25250|501      |0           |250           |50             |
      |25250 to 25500|506      |0           |250           |50             |
      |25500 to 25750|511      |0           |250           |50             |
      |25750 to 26000|516      |0           |250           |50             |
      |26000 to 26250|521      |0           |250           |50             |
      |26250 to 26500|526      |0           |250           |50             |
      |26500 to 26750|531      |0           |250           |50             |
      |26750 to 27000|536      |0           |250           |50             |
      |27000 to 27250|541      |0           |250           |50             |
      |27250 to 27500|546      |0           |250           |50             |
      |27500 to 27750|551      |0           |250           |50             |
      |27750 to 28000|556      |0           |250           |50             |
      |28000 to 28250|561      |0           |250           |50             |
      |28250 to 28500|566      |0           |250           |50             |
      |28500 to 28750|571      |0           |250           |50             |
      |28750 to 29000|576      |0           |250           |50             |
      |29000 to 29250|581      |0           |250           |50             |
      |29250 to 29500|586      |0           |250           |50             |
      |29500 to 29750|591      |0           |250           |50             |
      |29750 to 30000|596      |0           |250           |50             |

#    Examples:
#      |title         |startPage|startDiamond|diamondsPerRun|diamondsPerPage|
#      |0 to 500      |1        |0           |500           |50             |
#      |500 to 1000   |11       |0           |500           |50             |
#      |1000 to 1500  |21       |0           |500           |50             |
#      |1500 to 2000  |31       |0           |500           |50             |
#      |2000 to 2500  |41       |0           |500           |50             |
#      |2500 to 3000  |51       |0           |500           |50             |
#      |3000 to 3500  |61       |0           |500           |50             |
#      |3500 to 4000  |71       |0           |500           |50             |
#      |4000 to 4500  |81       |0           |500           |50             |
#      |4500 to 5000  |91       |0           |500           |50             |
#      |5000 to 5500  |101      |0           |500           |50             |
#      |5500 to 6000  |111      |0           |500           |50             |
#      |6000 to 6500  |121      |0           |500           |50             |
#      |6500 to 7000  |131      |0           |500           |50             |
#      |7000 to 7500  |141      |0           |500           |50             |
#      |7500 to 8000  |151      |0           |500           |50             |
#      |8000 to 8500  |161      |0           |500           |50             |
#      |8500 to 9000  |171      |0           |500           |50             |
#      |9000 to 9500  |181      |0           |500           |50             |
#      |9500 to 10000 |191      |0           |500           |50             |
#      |10000 to 10500|201      |0           |500           |50             |
#      |10500 to 11000|211      |0           |500           |50             |
#      |11000 to 11500|221      |0           |500           |50             |
#      |11500 to 12000|231      |0           |500           |50             |
#      |12000 to 12500|241      |0           |500           |50             |
#      |12500 to 13000|251      |0           |500           |50             |
#      |13000 to 13500|261      |0           |500           |50             |
#      |13500 to 14000|271      |0           |500           |50             |
#      |14000 to 14500|281      |0           |500           |50             |
#      |14500 to 15000|291      |0           |500           |50             |
#      |15000 to 15500|301      |0           |500           |50             |
#      |15500 to 16000|311      |0           |500           |50             |
#      |16000 to 16500|321      |0           |500           |50             |
#      |16500 to 17000|331      |0           |500           |50             |
#      |17000 to 17500|341      |0           |500           |50             |
#      |17500 to 18000|351      |0           |500           |50             |
#      |18000 to 18500|361      |0           |500           |50             |
#      |18500 to 19000|371      |0           |500           |50             |
#      |19000 to 19500|381      |0           |500           |50             |
#      |19500 to 20000|391      |0           |500           |50             |
#      |20000 to 20500|401      |0           |500           |50             |
#      |20500 to 21000|411      |0           |500           |50             |
#      |21000 to 21500|421      |0           |500           |50             |
#      |21500 to 22000|431      |0           |500           |50             |
#      |22000 to 22500|441      |0           |500           |50             |
#      |22500 to 23000|451      |0           |500           |50             |
#      |23000 to 23500|461      |0           |500           |50             |
#      |23500 to 24000|471      |0           |500           |50             |
#      |24000 to 24500|481      |0           |500           |50             |
#      |24500 to 25000|491      |0           |500           |50             |
#      |25000 to 25500|501      |0           |500           |50             |
#      |25500 to 26000|511      |0           |500           |50             |
#      |26000 to 26500|521      |0           |500           |50             |
#      |26500 to 27000|531      |0           |500           |50             |
#      |27000 to 27500|541      |0           |500           |50             |
#      |27500 to 28000|551      |0           |500           |50             |
#      |28000 to 28500|561      |0           |500           |50             |
#      |28500 to 29000|571      |0           |500           |50             |
#      |29000 to 29500|581      |0           |500           |50             |
#      |29500 to 30000|591      |0           |500           |50             |

#    Examples:
#      |title         |startPage|startDiamond|diamondsPerRun|diamondsPerPage|
#      |0 to 1000     |1        |0           |1000          |50             |
#      |1000 to 2000  |11       |0           |1000          |50             |
#      |2000 to 3000  |21       |0           |1000          |50             |
#      |3000 to 4000  |31       |0           |1000          |50             |
#      |4000 to 5000  |41       |0           |1000          |50             |
#      |5000 to 6000  |51       |0           |1000          |50             |
#      |6000 to 7000  |61       |0           |1000          |50             |
#      |7000 to 8000  |71       |0           |1000          |50             |
#      |8000 to 9000  |81       |0           |1000          |50             |
#      |9000 to 10000 |91       |0           |1000          |50             |
#      |10000 to 11000|101      |0           |1000          |50             |
#      |11000 to 12000|111      |0           |1000          |50             |
#      |12000 to 13000|121      |0           |1000          |50             |
#      |13000 to 14000|131      |0           |1000          |50             |
#      |14000 to 15000|141      |0           |1000          |50             |
#      |15000 to 16000|151      |0           |1000          |50             |
#      |16000 to 17000|161      |0           |1000          |50             |
#      |17000 to 18000|171      |0           |1000          |50             |
#      |18000 to 19000|181      |0           |1000          |50             |
#      |19000 to 20000|191      |0           |1000          |50             |
#      |20000 to 21000|201      |0           |1000          |50             |
#      |21000 to 22000|211      |0           |1000          |50             |
#      |22000 to 23000|221      |0           |1000          |50             |
#      |23000 to 24000|231      |0           |1000          |50             |
#      |24000 to 25000|241      |0           |1000          |50             |
#      |25000 to 26000|251      |0           |1000          |50             |
#      |26000 to 27000|261      |0           |1000          |50             |
#      |27000 to 28000|271      |0           |1000          |50             |
#      |28000 to 29000|281      |0           |1000          |50             |
#      |29000 to 30000|291      |0           |1000          |50             |
