@Mobile
Feature: The Hub - Law School - Pages - Overview
  Webpages within a Topic should appear as clickable webpages within Topic within VPE

 @Positive @iPad @iPhone @Samsung  #TC-2622, TC-2626
  Scenario: The Hub - Law School - Pages - Overview_Mobile
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "vpecourse@guerillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"        |
    And I wait for "10" seconds
    #Then I click on the "Hub VPE Mobile My Learning Course Automation" element if "Hub VPE Mobile My Learning Course Automation" "element is present"
    #Then I click on the "Hub VPE Mobile IPad My Learning Course Automation" element if "Hub VPE Mobile IPad My Learning Course Automation" "element is present"
    #And I click on the "Hub VPE Mobile Allow Popup" element if "Hub VPE Mobile Allow Popup" "element is present"
    #And I switch to window with index "2"
    And I am on "https://totara-stage-bppdigital.bppuniversity.com/course/view.php?id=227" URL
    And I click on the "Hub VPE Pages-Overview Header" element if "Hub VPE Pages-Overview Header" "element is present"
    And I click on the "Hub VPE Course Mobile Hamburger Menu" button if "Hub VPE Course Mobile Hamburger Menu" "element is present"
    And I click on the "Hub VPE Mobile Pages-Overview Header" button if "Hub VPE Mobile Pages-Overview Header" "element is present"
    And I wait for "5" seconds
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
    And I click on the "Hub VPE Mobile Pages Back Button" element if "Hub VPE Mobile Pages Back Button" "element is present"
    Then I click on the "Hub VPE Pages Back Button" button if "Hub VPE Pages Back Button" "element is present"
    Then I should see the "Read more" "text contained in P element"
    And I switch to window with index "1"