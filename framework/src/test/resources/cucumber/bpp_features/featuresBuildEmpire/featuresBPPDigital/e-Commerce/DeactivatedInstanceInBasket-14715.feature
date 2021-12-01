@BuildEmpire @DigitalSite @Ecommerce
Feature: Display disable basket item when no (ES) details available
If course is added to basket and the course is republished and no longer available to be booked,
then the course base information (e.g. course type, name) only should display, the course should be grayed out, a alert (red) message should be displayed and the checkout button should be disabled.
Unavailable courses should not contribute to the total basket price.
Unavailable courses need to be removed from the basket before the checkout button is enabled.

  @DeactivateInstance  #TC-5613
  Scenario: eCommerce - Display Disable Basket Item When no ES Details Available
    And I am on "MD_COMMON_LINKS_BPPDIGITALECOMMERCEDEACTIVATEURL" URL
    And I click on the "Paper MVM 1 name" "BPP Digital View Dates and Prices button"
    Then I click on the "1" "BPP Digital Add to Basket Item"
    Then I click on the "8" "BPP Digital Add to Basket Item"
    Then I click on the "9" "BPP Digital Add to Basket Item"
    And I click on the "BPP Digital Header Basket" button by JS
    Then I validate text "3" to be displayed for "Items" "BPP Digital Basket Summary Section"
    And I am on "https://uat-products.bpp.com/courses/edit/f052d387-3722-47c4-9722-6ec7769ab268" URL
    When I click on the "Deactivate" "Product Factory button last"
    Then I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "Deactivation Reason PR OFF" "Product Factory select button"
    And I click on the "Confirm Deactivation" "Product Factory button"
    Then I wait for "190" seconds
    #Check display message on basket page
    And I am on "https://web-stage-bppdigital.bppuniversity.com/basket/#/" URL
    Then I should see the "1 of your chosen courses are no longer available to be booked." "text contained in P element"
    Then I should see the "Remove these courses from your basket before proceeding." "text contained in P element"
    Then I should see the "This course is no longer available to book. Remove this choice from your basket before proceeding." "text contained in P element"
    And Attribute "aria-disabled" of "Proceed to checkout" "button" should have value "true"
    #Reactivate Instance
    And I am on "https://uat-products.bpp.com/courses/edit/f052d387-3722-47c4-9722-6ec7769ab268" URL
    When I click on the "Reactivate" "Product Factory button last"
    And I click on the "Yes" "text contained in SPAN element"
    And I wait for "2" seconds
    When I click on the "Products" "Product Factory navigation item"
    When I click on the "Courses" "Product Factory navigation sub item"
    And I click on the "Additional Filters" "button"
    And I click on the "Body" "Product Factory dropdown"
    And I click on the "Body MVM 1 - Body MVM 1 name" "Product Factory dropdown option"
    And I click on the "Level" "Product Factory dropdown"
    And I click on the "Level MVM 1 - Level MVM 1 name" "Product Factory dropdown option"
    And I click on the "CourseType" "Product Factory dropdown"
    And I click on the "Automation Regression E2E" "Product Factory dropdown option"
    And I set "Paper MVM 1 name" text to the "Paper" "Product Factory text field"
    And I click on the "Sitting" "Product Factory dropdown"
    And I click on the "Sitting MVM 1 (Summer - Autumn 2021) (09/08/2021 - 31/12/2021)" "Product Factory dropdown option"
    And I click on the "Done" "Product Factory button"
    When I click on the "Product Factory Course Page Select All Checkbox" element
    Then I click on the "Perform Bulk Operation" "Product Factory button"
    And I click on the "Make available on website" "element by title"
    Then Attribute "tabindex" of "Make available on website" "element by title" should have value "-1"
    Then I wait for "190" seconds
    And I am on "https://web-stage-bppdigital.bppuniversity.com/basket/#/" URL
    And Attribute "aria-disabled" of "Proceed to checkout" "button" should have value "false"