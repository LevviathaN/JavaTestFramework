@Quark
Feature: Quark PDF File Comparison

  @ACCA @Automation
  Scenario Outline: <BaseFile> to <QuarkWebPlatformFile> ACCA PDF published comparison
    #Given I am on "http://yzosin:Welcome10%40@7.0.12.124/workspace/login.qsp" URL
    Then I execute "Quark New Platform Login" reusable step
    And I click on the "Quark Home Menu" element
    And I wait for "1" seconds
    Then I doubleclick on the "TEST" "element by title"
    And I doubleclick on the "Automation Test Files" "element by title"
    And I doubleclick on the "ACCA Files" "element by title"
    And I wait for "1" seconds
    Then I hover over the "<QuarkWebPlatformXML>" "Quark XML File"
    And I perform right mouse click on the "<QuarkWebPlatformXML>" "Quark XML File"
    And I wait for "3" seconds
    Then I perform right mouse click "Quark Publish" button
    Then I click on the "Quark Publish BPP PDF" element by JS
    And I should see the "Quark Generating Output Window" element
    Then I wait for "400" seconds
    And I compare "<BaseFile>" file with "<QuarkWebPlatformFile>" PDF file

    Examples:
      | BaseFile                                              | QuarkWebPlatformFile|                           QuarkWebPlatformXML|
      |Automation One File - ACCA FQPBase.pdf                 | Automation One File - ACCA FQP.pdf              |Automation One File - ACCA FQP.xml |
      |Automation Two File - ACCA ActivitiesBase.pdf          | Automation Two File - ACCA Activities.pdf       |Automation Two File - ACCA Activities.xml |
      |Automation Three File - ACCA TYLBase.pdf               | Automation Three File - ACCA TYL.pdf            |Automation Three File - ACCA TYL.xml |
      |Automation Four File - ACCA IllustrationBase.pdf       | Automation Four File - ACCA Illustration.pdf    |Automation Four File - ACCA Illustration.xml |
      |Automation Five File - ACCA Illustartions 1Base.pdf    | Automation Five File - ACCA Illustrations 1.pdf |Automation Five File - ACCA Illustrations 1.xml |
      |Automation Six file - ACCA Illustrations 2Base.pdf     | Automation Six file - ACCA Illustrations 2.pdf  |Automation Six file - ACCA Illustrations 2.xml |
      |Automation Seven File - FQP1Base.pdf                   | Automation Seven File - FQP1.pdf                |Automation Seven File - FQP1.xml |
      |Automation Eight File - FQP2Base.pdf                   | Automation Eight File - FQP2.pdf                |Automation Eight File - FQP2.xml |
      |Automation 9 - Group Scenario (FQP)Base.pdf            | Automation 9 - Group Scenario (FQP).pdf         |Automation 9 - Group Scenario (FQP).xml |
      |Automation 10 - Group Scenario (KC)Base.pdf            | Automation 10 - Group Scenario (KC).pdf         |Automation 10 - Group Scenario (KC).xml |
      |Automation 11 - Group Requirement (FQP)Base.pdf        | Automation 11 - Group Requirement (FQP).pdf     |Automation 11 - Group Requirement (FQP).xml |
      |Automation 12 - Group Requirement (KC)Base.pdf         | Automation 12 - Group Requirement (KC).pdf      |Automation 12 - Group Requirement (KC).xml |
      |Automation 13 - Group Debrief (FQP)Base.pdf            | Automation 13 - Group Debrief (FQP).pdf         |Automation 13 - Group Debrief (FQP).xml |
      |Automation 14 - Group Debrief (KC)Base.pdf             | Automation 14 - Group Debrief (KC).pdf          |Automation 14 - Group Debrief (KC).xml |
      |Automation 15 - FITB (FQP)Base.pdf                     | Automation 15 - FITB (FQP).pdf                  |Automation 15 - FITB (FQP).xml |
      |Automation 16 - FITB (KC)Base.pdf                      | Automation 16 - FITB (KC).pdf                   |Automation 16 - FITB (KC).xml |
      |Automation 17 - MCQ_MRQ (FQP)Base.pdf                  | Automation 17 - MCQ/MRQ (FQP).pdf               |Automation 17 - MCQ/MRQ (FQP).xml|
      |Automation 18 - MCQ_MRQ (KC)Base.pdf                   | Automation 18 - MCQ/MRQ (KC).pdf                |Automation 18 - MCQ/MRQ (KC).xml|

  @CIMA @Automation
  Scenario Outline: <BaseFile> to <QuarkWebPlatformFile> ACCA PDF published comparison
    Then I execute "Quark New Platform Login" reusable step
    And I click on the "Quark Home Menu" element
    And I wait for "1" seconds
    Then I doubleclick on the "TEST" "element by title"
    And I doubleclick on the "Automation Test Files" "element by title"
    And I doubleclick on the "CIMA Files" "element by title"
    And I wait for "2" seconds
    Then I hover over the "<QuarkWebPlatformXML>" "Quark XML File"
    And I perform right mouse click on the "<QuarkWebPlatformXML>" "Quark XML File"
    And I wait for "3" seconds
    Then I perform right mouse click "Quark Publish" button
    Then I click on the "Quark Publish BPP PDF" element by JS
    And I should see the "Quark Generating Output Window" element
    Then I wait for "320" seconds
    And I compare "<BaseFile>" file with "<QuarkWebPlatformFile>" PDF file

    Examples:
      | BaseFile                                        | QuarkWebPlatformFile|                    QuarkWebPlatformXML|
      |CIMA Automation 21 - FQPBase.pdf                 |CIMA Automation 21.pdf                    |CIMA Automation 21.xml |
      |CIMA Automation 22- ActivitiesBase.pdf           |CIMA Automation 22- Activities.pdf        |CIMA Automation 22- Activities.xml |
      |CIMA Automation 23 - TYLBase.pdf                 |CIMA Automation 23 - TYL.pdf               |CIMA Automation 23 - TYL.xml |
      |CIMA Automation 24 - Illustration1Base.pdf       |CIMA Automation 24 - Illustration1.pdf    |CIMA Automation 24 - Illustration1.xml |
      |CIMA Automation 25 - Illustration2Base.pdf       |CIMA Automation 25 - Illustration2.pdf    |CIMA Automation 25 - Illustration2.xml |
      |CIMA Automation 26 - FQP2Base.pdf                |CIMA Automation 26 - FQP2.pdf             |CIMA Automation 26 - FQP2.xml |
      |CIMA Automation 27 - Group Scenario- FQPBase.pdf |CIMA Automation 27 - Group Scenario- FQP.pdf |CIMA Automation 27 - Group Scenario- FQP.xml |
      |CIMA Automation 28 - Group Scenario KCBase.pdf   |CIMA Automation 28 - Group Scenario KC.pdf|CIMA Automation 28 - Group Scenario KC.xml |
      |CIMA Automation 29 - Group Reg. FQPBase.pdf      |CIMA Automation 29 - Group Reg. FQP.pdf   |CIMA Automation 29 - Group Reg. FQP.xml |
      |CIMA Automation 30 - Group Req. KCBase.pdf       |CIMA Automation 30 - Group Req. KC.pdf    |CIMA Automation 30 - Group Req. KC.xml |
      |CIMA Automation 31 - Group Debrief - FQPBase.pdf |CIMA Automation 31 - Group Debrief - FQP.pdf |CIMA Automation 31 - Group Debrief - FQP.xml |
      |CIMA Automation 32 - Group Debrief KCBase.pdf    |CIMA Automation 32 - Group Debrief KC.pdf |CIMA Automation 32 - Group Debrief KC.xml |
      |CIMA Automation 33- FITB -FQBase.pdf             |CIMA Automation 33- FITB -FQ.pdf          |CIMA Automation 33- FITB -FQ.xml |
      |CIMA Automation 34 - FITB KCBase.pdf             |CIMA Automation 34 - FITB KC.pdf          |CIMA Automation 34 - FITB KC.xml |
      |CIMA Automation 35 - MCQ FQPBase.pdf             |CIMA Automation 35 - MCQ FQP.pdf          |CIMA Automation 35 - MCQ FQP.xml |
      |CIMA Automation 36 MCQ_MRQ KCBase.pdf            |CIMA Automation 36 MCQ/MRQ KC.pdf         |CIMA Automation 36 MCQ/MRQ KC.xml |


  @ICAEW @KW
  Scenario Outline: <BaseFile> to <QuarkWebPlatformFile> ICAEW PDF published comparison
    Given I am on "http://yzosin:Welcome9%40@7.0.12.124/workspace/login.qsp" URL
    And I wait for "3" seconds
    Then I should see the "Quark Publishing Logo" element
    And I click on the "Quark Home Menu" element
    And I wait for "1" seconds
    Then I doubleclick on the "TEST" "element by title"
    And I doubleclick on the "ACCA ICAEW Regression test packs" "element by title"
    And I doubleclick on the "ICAEW" "element by title"
    And I doubleclick on the "Workbook" "element by title"
    And I wait for "1" seconds
    Then I hover over the "<QuarkWebPlatformXML>" "Quark XML File"
    And I perform right mouse click on the "<QuarkWebPlatformXML>" "Quark XML File"
    And I wait for "3" seconds
    Then I hover over the "Quark Publish" element
    And I hover over the "Quark Publish ICAEW PDF" element
    Then I click on the "Quark Publish ICAEW PDF" element
    And I should see the "Quark Generating Output Window" element
    Then I wait for "150" seconds
    And I compare "<BaseFile>" file with "<QuarkWebPlatformFile>" PDF file

    Examples:
      | BaseFile                                           | QuarkWebPlatformFile|           QuarkWebPlatformXML|
      | ICAEW KW REG Workbook_1Base.pdf                    |  ICAEW KW REG Workbook_1.pdf|   ICAEW KW REG Workbook_1.xml |
      | ICAEW KW REG Workbook_2Base.pdf                    |  ICAEW KW REG Workbook_2.pdf|   ICAEW KW REG Workbook_2.xml |


  @ICAEW @QuestionBank
  Scenario Outline: <BaseFile> to <QuarkWebPlatformFile> ICAEW PDF published comparison
    #Given I am on "http://7.0.12.124/workspace/login.qsp" URL
    #And I fill the "Quark Username" field with "MD_COMMON_CREDENTIALS_QUARKUSER"
    #And I fill the "Direct App Admin Password" field with "MD_COMMON_CREDENTIALS_QUARKUSER"
    Given I am on "http://yzosin:Welcome9%40@7.0.12.124/workspace/login.qsp" URL
    And I wait for "3" seconds
    Then I should see the "Quark Publishing Logo" element
    And I click on the "Quark Home Menu" element
    And I wait for "1" seconds
    Then I doubleclick on the "TEST" "element by title"
    And I doubleclick on the "ACCA ICAEW Regression test packs" "element by title"
    And I doubleclick on the "ICAEW" "element by title"
    And I doubleclick on the "Question Bank" "element by title"
    And I wait for "1" seconds
    Then I hover over the "<QuarkWebPlatformXML>" "Quark XML File"
    And I perform right mouse click on the "<QuarkWebPlatformXML>" "Quark XML File"
    And I wait for "3" seconds
    Then I hover over the "Quark Publish" element
    And I hover over the "Quark Publish QB PDF" element
    Then I click on the "Quark Publish QB PDF" element
    #And I should see the "Quark Generating Output Window" element
    Then I wait for "180" seconds
    And I compare "<BaseFile>" file with "<QuarkWebPlatformFile>" PDF file

    Examples:
      | BaseFile                                           | QuarkWebPlatformFile|           QuarkWebPlatformXML|
