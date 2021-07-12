@BuildEmpire @Hub @VPE @Smoke
Feature: The Hub - Law School - Pages - Overview
  Webpages within a Topic should appear as clickable webpages within Topic within VPE

  @Positive @Pages #TC-2617, TC-2618, TC-2619, TC-2620, TC-2989, TC-2623, TC-2624, TC-2625
  Scenario: The Hub - Law School - Pages - Overview
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "vpecourse@guerillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I wait for "1" seconds
    And I should see the "VPE Course Automation" "Build Empire My Learning Right Block Course name"
    Then I click on the "VPE Course Automation" "Build Empire My Learning Right Block Course name"
    And I switch to window with index "2"
    And I click on the "Hub VPE Pages-Overview Header" element
    Then I should see the "Automation Page" "text contained in P element"
    And I should see the "Created for automated scripts. PLEASE DO NOT AMEND!" "text contained in element"
    Then I should see the "Hub VPE Page Thumbnail" element
    And Attribute "alt" of "Hub VPE Page Thumbnail" should have value "Green Sea Turtle grazing seagrass.jpg"
    Then I should see the "Read more" "text contained in P element"
    And I click on the "Read more" "text contained in P element"
    Then I should see the "Automation Page Content" "text contained in element"
    And I should see the "Hub VPE Page Thumbnail" element
    Then I should see the "HEADER 1" "element"
    Then I should see the "HEADER 2" "element"
    Then I click on the "Hub VPE Pages Back Button" button
    Then I should see the "Read more" "text contained in P element"
    And I switch to window with index "1"
    When I execute "Log Out from Hub Student" reusable step