@BuildEmpire @DigitalSite @DatesAndPrices
Feature: Dates & Prices - Display all records for multi location and session timing course instances
  Course instances can occur in multiple locations. The display of location information for a course instance (in the accordian view) needs to be able to accomodate both single and multiple locations as per the attached visuals.
  In terms of data, different locations are stored as seperate sessions in the Elastic Search instances index.
  Additionally, location information can be duplicated across different sessions. Sessions with duplicate location information will contain different timing information for the same location.
  The requirement is to display a unique location only once, with ALL associated timing information alongside this location.
  Where there are multiple different locations, each separate location would display with its timinig information.
  There is a further requirement (not on the visuals) to include a Google pin that links to Google maps passing the address postcode so that individuals can visualise the location.
  The link should open a new browser window/tab. The Google pin should only appear when a postcode exists.

  @Positive @MultipleLocations #TC-5106, 5107, 5108, 5165, 5166, 5167, 5170, 5171
  Scenario:Dates n Prices Multi Location and Session Timings
    Given I execute "Log In to Hub as Admin" reusable step
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/2696/edit" URL
    # Add Dates and Prices Component:
    When I click on the "Add component" "BPP Digital Search Label Button"
    And I click on the "Dates And Prices" "BPP Digital Admin Sub Menu Item links"
    And I click on the "Body name" "BPP Digital dropdown"
    And I click on the "SalesForce CPQ flow atotest (SF CPQ test)" "BPP Digital dropdown option"
    And I click on the "Level" "BPP Digital dropdown"
    And I click on the "SalesForce CPQ flow autotest" "BPP Digital dropdown option"
    And I click on the "Save" "element by value"
    And I wait for "5" seconds
    #Verify single location with single timing and google pin
    And I am on "http://web-stage-bppdigital.bppuniversity.com/about-bpp/autocmsurl36807" URL
    And I should see the "SF CPQ flow test" "BPP Digital View Dates and Prices button"
    And I click on the "SF CPQ flow test" "BPP Digital View Dates and Prices button"
    And I click on the "Thu 3 Jun 2021" "element"
    And I should see the "Thu 3 June" "element"
    And I should see the "10:05 am" "element"
    And I validate text "CONTAINS=Southampton" to be displayed for "BPP Digital Dates and Prices Location For Instance" element
    And I validate text "CONTAINS=Grenville House" to be displayed for "BPP Digital Dates and Prices Location For Instance" element
    And I validate text "CONTAINS=Southampton SO15 1GX" to be displayed for "BPP Digital Dates and Prices Location For Instance" element
    And I validate text "CONTAINS=1" to be displayed for "BPP Digital Dates and Prices Number of Sessions For Multiple Address" element
    And I should see the "https://www.google.com/maps/search/?api=1&query=Southampton" "link address"
    Then I should see the "BPP Digital Dates and Prices Active Instance Google Pin" element
    And I click on the "https://www.google.com/maps/search/?api=1&query=Southampton" "link address"
    Then I switch to window with index "2"
    And I click on the "I agree" "element"
    And I wait for "3" seconds
    Then I should see the "Southampton,Grenville House,,,Southampton,SO15 1GX,GBR" "element by value"
    Then I switch to window with index "1"
    And I click on the "Thu 3 Jun 2021" "element"
    #Verify single location with multiple timing
    And I click on the "Fri 4 Jun 2021" "element"
    And I should see the "Sat 5 June" "element"
    And I should see the "Fri 4 June" "element"
    And I should see the "Mon 7 June" "element"
    And I should see the "Tue 8 June" "element"
    And I should see the "9:25 am" "element"
    And I validate text "CONTAINS=London Waterloo" to be displayed for "BPP Digital Dates and Prices Location For Instance" element
    And I validate text "CONTAINS=London SE1 9NN" to be displayed for "BPP Digital Dates and Prices Location For Instance" element
    And I validate text "CONTAINS=4" to be displayed for "BPP Digital Dates and Prices Number of Sessions For Multiple Address" element
    And I click on the "Fri 4 Jun 2021" "element"
    #Verify multiple sessions with multiple locations and multiple timings
    And I click on the "Tue 15 Jun 2021" "element"
    And I should see the "Tue 15 June" "element"
    And I should see the "Wed 16 June" "element"
    And I should see the "Tue 22 June" "element"
    And I should see the "Wed 23 June" "element"
    And I should see the "9:45 am" "element"
    And I should see the "10:05 am" "element"
    And I validate text "CONTAINS=Nottingham" to be displayed for "BPP Digital Dates and Prices Location For Instance" element
    And I validate text "CONTAINS=Leeds" to be displayed for "BPP Digital Dates and Prices Second Location For Instance" element
    And I validate text "CONTAINS=4" to be displayed for "BPP Digital Dates and Prices Number of Sessions For Multiple Address" element
    And I click on the "Tue 15 Jun 2021" "element"
    #Verify multiple sessions with different locations in the same city
    And I click on the "Sun 27 Jun 2021" "element"
    And I should see the "Sun 27 June" "element"
    And I should see the "Mon 28 June" "element"
    And I should see the "Tue 29 June" "element"
    And I should see the "Wed 30 June" "element"
    And I should see the "9:45 am" "element"
    And I should see the "10:25 am" "element"
    And I validate text "CONTAINS=London King's Cross" to be displayed for "BPP Digital Dates and Prices Location For Instance" element
    And I validate text "CONTAINS=London Waterloo" to be displayed for "BPP Digital Dates and Prices Second Location For Instance" element
    And I validate text "CONTAINS=4" to be displayed for "BPP Digital Dates and Prices Number of Sessions For Multiple Address" element
    And I click on the "Sun 27 Jun 2021" "element"
    #Check no address displayed for Online type of learning
    And I click on the "Sat 5 Jun 2021" "element"
    Then I shouldn't see the "BPP Digital Dates and Prices Location For Instance" element
    Then I shouldn't see the "BPP Digital Dates and Prices Second Location For Instance" element
    #Delete DnP component in Admin
    And I am on "https://admin-stage-bppdigital.bppuniversity.com/admin/cms/pages/2696/edit" URL
    And I wait for "5" seconds
    And I click on the "Dates and prices" "BPP Digital Admin Pages Delete Button for Specific Component name"
    And I wait for "5" seconds