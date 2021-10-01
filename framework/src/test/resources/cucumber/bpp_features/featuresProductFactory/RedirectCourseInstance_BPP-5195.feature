@ProductFactory @Courses @Redirect @Deactivate
Feature: Course Instance - Redirect Instance - BPP-5195
  As a Product Setter
  I want to optionally be able to select a instance to redirect to when deactivating an instance
  so that the new instance in available.

  Background:
    Given I execute "Generate ISBN" reusable step
    Given I execute "Log In" reusable step
    And I execute "Remember Variables For Creation Three" reusable step
    And I execute "Remember Variables Two" reusable step

  @Positive @P1 @NeedToBeUI #TC-2539
  Scenario: Redirecting to another Instance
    Given I execute "Edit Course" reusable step
    And For each "Product Factory Course Instance Delete" element:
      |I click on the "FOR_ITEM" element|
      |I click on the "Yes" "Product Factory button"|
    And I execute "Keep the Course Activated" reusable step
    Then I should see the "(Active)" element
    And I click on the "Deactivate" "Product Factory button"
    And I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    And I click on the "Redirect to Course" "Product Factory change button"
    Then I set "EC_COURSE_TYPE_DESCRIPTION_TWO" text to the "Search" "Product Factory text field" from keyboard
    And I click on the "submit" "element by type two"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory select button"
    And I click on the "Confirm Deactivation" "Product Factory button"
    And I click on the "Yes" "Product Factory button" if "Yes,Product Factory button" "special element is present"
    And I should see the "Reactivate" "Product Factory button"

  @Positive @P1 @CoveredWithApi #TC-2542
  Scenario: Redirecting the Instance to itself
    Given I execute modified "Create Course" reusable step
      |14|Replace|I set "3" text to the "Number of Sessions" "Product Factory text field"|
    And I execute "Keep the Course Activated" reusable step
    Then I should see the "(Active)" element
    And I click on the "Deactivate" "Product Factory button"
    And I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION_PREVENT" "Product Factory select button"
    And I click on the "Redirect to Course" "Product Factory change button"
    And I click on the "3" "Product Factory select button"
    And I click on the "Confirm Deactivation" "Product Factory button"
    And I click on the "Yes" "Product Factory button" if "Yes,Product Factory button" "special element is present"
    And I should see the "Reactivate" "Product Factory button"

  @Positive @P1 @CoveredWithApi #TC-2544
  Scenario: Deactivate without redirection
    Given I execute "Create Course" reusable step
    And I execute "Keep the Course Activated" reusable step
    Then I should see the "(Active)" element
    And I click on the "Deactivate" "Product Factory button"
    And I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION_PREVENT" "Product Factory select button"
    And I click on the "Confirm Deactivation" "Product Factory button"
    And I click on the "Yes" "Product Factory button" if "Yes,Product Factory button" "special element is present"
    And I should see the "Reactivate" "Product Factory button"


  @Positive @P1 #TC-2545
  Scenario: Reactivate after redirection
    Given I execute "Create Course" reusable step
    And I execute "Keep the Course Activated" reusable step
    Then I should see the "(Active)" element
    And I click on the "Deactivate" "Product Factory button"
    And I click on the "Deactivation Reason" "Product Factory change button"
    And I click on the "EC_DEACTIVATION_REASON_DESCRIPTION" "Product Factory select button"
    And I click on the "Redirect to Course" "Product Factory change button"
    And I click on the "EC_COURSE_TYPE_DESCRIPTION_TWO" "Product Factory select button"
    And I click on the "Confirm Deactivation" "Product Factory button"
    And I click on the "Yes" "Product Factory button" if "Yes,Product Factory button" "special element is present"
    And I click on the "Reactivate" "Product Factory button"
    And I click on the "Yes" "Product Factory button" if "Yes,Product Factory button" "special element is present"
    And I should see the "Deactivate" "Product Factory button"