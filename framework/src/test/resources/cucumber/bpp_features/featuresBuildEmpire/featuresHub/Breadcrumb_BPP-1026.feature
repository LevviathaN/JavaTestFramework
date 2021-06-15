@BuildEmpire @Hub @Breadcrumb @Tablet
Feature: The Hub - Breadcrumb
  As a user, I expect to see a 'breadcrumb trail' which updates, as I navigate throughout the Hub

  @Positive @iPad #TC-1350
  Scenario: Hub - Breadcrumb
    Given I execute "Log In to Hub as Student" reusable step replacing some steps
      | 2 | I set "AutoAdonisDuarte6846@guerrillamail.info" text to the "Email" "Build Empire text field" |
      | 3 | I set "A@polloGlobal2020" text to the "Password" "Build Empire text field"                    |
    #Breadcrumb for application
    Then I click on the "Direct App My Applications Left Menu Link" element by JS
    And I click on the "Direct App Go To Application" element
    And I should see the "Home" "Build Empire Breadcrumb Tab"
    And I should see the "My Applications" "Build Empire Breadcrumb Tab"
    And I should see the "Chartered Manager Degree Apprenticeship" "Build Empire Breadcrumb Not Clickable Tab"
    And I click on the "Eligibility criteria" "Build Empire application section"
    And I should see the "Eligibility criteria" "Build Empire Breadcrumb Not Clickable Tab"
    Then I click on the "Chartered Manager Degree Apprenticeship" "Build Empire Breadcrumb Tab" by JS
    And I click on the "Personal details" "Build Empire application section"
    And I should see the "Personal details" "Build Empire Breadcrumb Not Clickable Tab"
    Then I click on the "Chartered Manager Degree Apprenticeship" "Build Empire Breadcrumb Tab" by JS
    And I click on the "Yes" "text contained in element"
    And I wait for "1" seconds
    And I click on the "Additional information" "Build Empire application section"
    And I should see the "Additional Information" "Build Empire Breadcrumb Not Clickable Tab"
    Then I click on the "Chartered Manager Degree Apprenticeship" "Build Empire Breadcrumb Tab" if "Chartered Manager Degree Apprenticeship,Build Empire Breadcrumb Tab" "special element is present"
    Then I click on the "Direct App My Applications Left Menu Link" element with JS if "Emergency contact,Build Empire application section" "special element is absent"
    And I click on the "Direct App Go To Application" element if "Emergency contact,Build Empire application section" "special element is absent"
    And I click on the "Emergency contact" "Build Empire application section"
    And I should see the "Emergency contact" "Build Empire Breadcrumb Not Clickable Tab"
    Then I click on the "Chartered Manager Degree Apprenticeship" "Build Empire Breadcrumb Tab" by JS
    And I click on the "Nationality" "Build Empire application section"
    And I should see the "Nationality" "Build Empire Breadcrumb Not Clickable Tab"
    Then I click on the "Chartered Manager Degree Apprenticeship" "Build Empire Breadcrumb Tab" by JS
    And I click on the "Education history" "Build Empire application section"
    And I should see the "Education history" "Build Empire Breadcrumb Not Clickable Tab"
    Then I click on the "Chartered Manager Degree Apprenticeship" "Build Empire Breadcrumb Tab" by JS
    And I click on the "Company" "Build Empire application section"
    And I should see the "Company" "Build Empire Breadcrumb Not Clickable Tab"
    Then I click on the "Chartered Manager Degree Apprenticeship" "Build Empire Breadcrumb Tab" by JS
    And I click on the "Yes" "text contained in element"
    And I wait for "1" seconds
    And I click on the "Apprenticeship Privacy Notice" "Build Empire application section"
    And I should see the "Apprenticeship Privacy Notice" "Build Empire Breadcrumb Not Clickable Tab"
    Then I click on the "Home" "Build Empire Breadcrumb Tab"
    #Breadcrumb for course
    And I click on the "Mini Course for Volodymyr" "Build Empire Homepage My Learning Course"
    And I should see the "My Learning" "Build Empire Breadcrumb Tab"
    And I click on the "SCORM Topic" "Build Empire Course Topic"
    And I should see the "SCORM Topic" "Build Empire Breadcrumb Not Clickable Tab"
    And I should see the "Mini Course for Volodymyr" "Build Empire Breadcrumb Tab"
    Then I click on the "Mini Course for Volodymyr" "Build Empire Breadcrumb Tab"
    And I click on the "Moodle Quiz" "Build Empire Course Topic"
    And I should see the "Moodle Quiz" "Build Empire Breadcrumb Not Clickable Tab"
    #Breadcrumb for help&support
    And I click on the "Direct App Help And Support Left Menu Link" link by JS
    And I should see the "Help & Support" "Build Empire Breadcrumb Not Clickable Tab"
