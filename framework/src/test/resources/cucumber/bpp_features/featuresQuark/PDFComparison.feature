@Quark
Feature: Quark PDF File Comparison

  @ACCA
  Scenario Outline: <BaseFile> to <QuarkWebPlatformFile> ACCA PDF published comparison
    #Given I am on "http://7.0.12.124/workspace/login.qsp" URL
    #And I fill the "Quark Username" field with "MD_COMMON_CREDENTIALS_QUARKUSER"
    #And I fill the "Direct App Admin Password" field with "MD_COMMON_CREDENTIALS_QUARKUSER"
    Given I am on "http://yzosin:Welcome8%40@7.0.12.124/workspace/login.qsp" URL
    And I wait for "3" seconds
    Then I should see the "Quark Publishing Logo" element
    And I click on the "Quark Home Menu" element
    And I wait for "1" seconds
    Then I doubleclick on the "TEST" "element by title"
    And I doubleclick on the "ACCA ICAEW Regression test packs" "element by title"
    And I doubleclick on the "ACCA" "element by title"
    And I wait for "1" seconds
    Then I hover over the "ACCA Regression Pack_2 QA.xml" "Quark XML File"
    And I perform right mouse click on the "ACCA Regression Pack_2 QA.xml" "Quark XML File"
    And I wait for "3" seconds
    Then I hover over the "Quark Publish" element
    And I hover over the "Quark Publish BPP PDF" element
    Then I click on the "Quark Publish BPP PDF" element
    And I should see the "Quark Generating Output Window" element
    Then I wait for "1" seconds
    And I compare "<BaseFile>" file with "<QuarkWebPlatformFile>" PDF file

    Examples:
      | BaseFile                                       | QuarkWebPlatformFile|
      | ACCA Regression Pack_2 Base.pdf                |  ACCA Regression Pack_2 QA.pdf|

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
      | ICAEW KW REG Workbook_3Base.pdf                    |  ICAEW KW REG Workbook_3.pdf|   ICAEW KW REG Workbook_3.xml |
      | ICAEW KW REG Workbook_4Base.pdf                    |  ICAEW KW REG Workbook_4.pdf|   ICAEW KW REG Workbook_4.xml |
      | ICAEW KW REG Workbook_5Base.pdf                    |  ICAEW KW REG Workbook_5.pdf|   ICAEW KW REG Workbook_5.xml |
      | ICAEW KW REG Workbook_6Base.pdf                    |  ICAEW KW REG Workbook_6.pdf|   ICAEW KW REG Workbook_6.xml |
      | ICAEW KW REG Workbook_7Base.pdf                    |  ICAEW KW REG Workbook_7.pdf|   ICAEW KW REG Workbook_7.xml |
      | ICAEW KW REG Workbook_8Base.pdf                    |  ICAEW KW REG Workbook_8.pdf|   ICAEW KW REG Workbook_8.xml |
      | ICAEW KW REG Workbook_9Base.pdf                    |  ICAEW KW REG Workbook_9.pdf|   ICAEW KW REG Workbook_9.xml |
      | ICAEW KW REG Workbook_10Base.pdf                   |  ICAEW KW REG Workbook_10.pdf|  ICAEW KW REG Workbook_10.xml|
      | ICAEW KW REG Workbook_11Base.pdf                   |  ICAEW KW REG Workbook_11.pdf|  ICAEW KW REG Workbook_11.xml|
      | ICAEW KW REG Workbook_12Base.pdf                   |  ICAEW KW REG Workbook_12.pdf|  ICAEW KW REG Workbook_12.xml|
      | ICAEW KW REG Workbook_13Base.pdf                   |  ICAEW KW REG Workbook_13.pdf|  ICAEW KW REG Workbook_13.xml|


  @ICAEW @QuestionBank
  Scenario Outline: <BaseFile> to <QuarkWebPlatformFile> ICAEW PDF published comparison
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
      | ICAEW QB REG Workbook_1Base.pdf                    |  ICAEW QB REG Workbook_1.pdf|   ICAEW QB REG Workbook_1.xml |
      | ICAEW QB REG Workbook_2Base.pdf                    |  ICAEW QB REG Workbook_2.pdf|   ICAEW QB REG Workbook_2.xml |
      | ICAEW QB REG Workbook_3Base.pdf                    |  ICAEW QB REG Workbook_3.pdf|   ICAEW QB REG Workbook_3.xml |
      | ICAEW QB REG Workbook_4Base.pdf                    |  ICAEW QB REG Workbook_4.pdf|   ICAEW QB REG Workbook_4.xml |
      | ICAEW QB REG Workbook_5Base.pdf                    |  ICAEW QB REG Workbook_5.pdf|   ICAEW QB REG Workbook_5.xml |
      | ICAEW QB REG Workbook_6Base.pdf                    |  ICAEW QB REG Workbook_6.pdf|   ICAEW QB REG Workbook_6.xml |
      | ICAEW QB REG Workbook_7Base.pdf                    |  ICAEW QB REG Workbook_7.pdf|   ICAEW QB REG Workbook_7.xml |
      | ICAEW QB REG Workbook_8Base.pdf                    |  ICAEW QB REG Workbook_8.pdf|   ICAEW QB REG Workbook_8.xml |
      | ICAEW QB REG Workbook_9Base.pdf                    |  ICAEW QB REG Workbook_9.pdf|   ICAEW QB REG Workbook_9.xml |
      | ICAEW QB REG Workbook_10Base.pdf                   |  ICAEW QB REG Workbook_10.pdf|  ICAEW QB REG Workbook_10.xml|
      | ICAEW QB REG Workbook_12Base.pdf                   |  ICAEW QB REG Workbook_12.pdf|  ICAEW QB REG Workbook_12.xml|
      | ICAEW QB REG WORKBOOK_13Base.pdf                   |  ICAEW QB REG WORKBOOK_13.pdf|  ICAEW QB REG WORKBOOK_13.xml|