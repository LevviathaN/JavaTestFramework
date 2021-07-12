@BDOpportunities
Feature: Update Tiers in BD Opportunities
  As a Salesforce user that manages clients
  I want to to be able to select 'tiers' on my opportunities that reflect accurate verticals and products
  So that I can measure client pipeline accurately


  @Positive #TC-4239, TC-3808, TC-3822, TC-3823, TC-4241
  Scenario Outline: Validate Tier Values Combination <t4> (<num>)
    Given I execute "Log In To Salesforce" reusable step replacing some steps
      |2|I fill the "Salesforce Username" field with "MD_COMMON_CREDENTIALS_SALESFORCECPQUSER"|
      |3|I fill the "Salesforce Password" field with "MD_COMMON_CREDENTIALS_SALESFORCECPQPASSWORD"|
    Given I am on "https://bpp-13fd3e55182--noahqa.lightning.force.com/lightning/r/Opportunity/006g000000LL<url>/view" URL
    And I wait for "5" seconds
    And I click on the "Details" button
    And I wait for "10" seconds
    And I execute "window.scrollBy(0, 500);" JS code

    When I click on the "Tier 1" "Salesforce Inframe select" if "<t1>" "value is not empty"
    And I click on the "<t1>" "Salesforce Inframe select option" if "<t1>" "value is not empty"

    When I click on the "Tier 2" "Salesforce Inframe select" if "<t2>" "value is not empty"
    And I should see "Tier 2" "Salesforce Inframe select options" in quantity of "<t2noo>"
    And I click on the "<t2>" "Salesforce Inframe select option" if "<t2>" "value is not empty"

    When I click on the "Tier 3" "Salesforce Inframe select" if "<t3>" "value is not empty"
    And I should see "Tier 3" "Salesforce Inframe select options" in quantity of "<t3noo>"
    And I click on the "<t3>" "Salesforce Inframe select option" if "<t3>" "value is not empty"

    When I click on the "Tier 4" "Salesforce Inframe select" if "<t4>" "value is not empty"
    And I should see "Tier 4" "Salesforce Inframe select options" in quantity of "<t4noo>"
    And I click on the "<t4>" "Salesforce Inframe select option" if "<t4>" "value is not empty"

    Then I click on the "Salesforce Save Tiers button" element
    And I click on the "Details" button
    And I wait for "5" seconds
    And I validate text "<t1>" to be displayed for "Salesforce Opportunity Tier 1 field" element if "<t1>" "value is not empty"
    And I validate text "<t2>" to be displayed for "Salesforce Opportunity Tier 2 field" element if "<t2>" "value is not empty"
    And I validate text "<t3>" to be displayed for "Salesforce Opportunity Tier 3 field" element if "<t3>" "value is not empty"
    And I validate text "<t4>" to be displayed for "Salesforce Opportunity Tier 4 field" element if "<t4>" "value is not empty"


    Examples:
    |url   |num|t1                                 |t2               |t3                                   |t4                                                               |t2noo|t3noo|t4noo|
    |yfSAAT|1  |Accountancy and Tax                |Apprenticeship   |PQ                                   |Accountancy / Taxation Professional - Level 7 (ACCA)             |4 |3 |18|
    |zQ8AAL|2  |Accountancy and Tax                |Apprenticeship   |PQ                                   |Accountancy / Taxation Professional - Level 7 (ATT/CTA)          |4 |3 |18|
    |zQIAA1|3  |Accountancy and Tax                |Apprenticeship   |PQ                                   |Accountancy / Taxation Professional - Level 7 (CIMA)             |4 |3 |18|
    |zQNAA1|4  |Accountancy and Tax                |Apprenticeship   |PQ                                   |Accountancy / Taxation Professional - Level 7 (CTA)              |4 |3 |18|
    |zQXAA1|5  |Accountancy and Tax                |Apprenticeship   |PQ                                   |Accountancy / Taxation Professional - Level 7 (ICAEW ACA/CTA)    |4 |3 |18|
    |yfSAAT|6  |Accountancy and Tax                |Apprenticeship   |PQ                                   |Accountancy / Taxation Professional - Level 7 (ICAEW)            |4 |3 |18|
    |zQ8AAL|7  |Accountancy and Tax                |Apprenticeship   |PQ                                   |Advanced Diploma in Accounting - Level 3                         |4 |3 |18|
    |zQIAA1|8  |Accountancy and Tax                |Apprenticeship   |PQ                                   |Assistant Accountant - Level 3                                   |4 |3 |18|
    |zQNAA1|9  |Accountancy and Tax                |Apprenticeship   |PQ                                   |Foundation Certificate in Accounting - Level 2                   |4 |3 |18|
    |zQXAA1|10 |Accountancy and Tax                |Apprenticeship   |PQ                                   |Junior Management Consultant - Level 4                           |4 |3 |18|
    |yfSAAT|11 |Accountancy and Tax                |Apprenticeship   |PQ                                   |Professional Accounting / Taxation Technician - Level 4          |4 |3 |18|
    |zQ8AAL|12 |Accountancy and Tax                |Apprenticeship   |PQ                                   |Professional Diploma in Accounting - Level 4 (AAT)               |4 |3 |18|
    |zQIAA1|13 |Accountancy and Tax                |Apprenticeship   |PQ                                   |Professional Diploma in Accounting - Level 4 (ACCA)              |4 |3 |18|
    |zQNAA1|14 |Accountancy and Tax                |Apprenticeship   |PQ                                   |Professional Diploma in Accounting - Level 4 (ATT)               |4 |3 |18|
    |zQXAA1|15 |Accountancy and Tax                |Apprenticeship   |PQ                                   |Professional Diploma in Accounting - Level 4 (CFAB)              |4 |3 |18|
    |yfSAAT|16 |Accountancy and Tax                |Apprenticeship   |PQ                                   |Professional Diploma in Accounting - Level 4 (CIMA)              |4 |3 |18|
    |zQ8AAL|17 |Accountancy and Tax                |Apprenticeship   |PQ                                   |Professional Diploma in Accounting - Level 4 (ICAEW)             |4 |3 |18|
    |zQIAA1|18 |Accountancy and Tax                |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Accountancy (Scotland) – SCQF Level 5                            |4 |3 |4 |
    |zQNAA1|19 |Accountancy and Tax                |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Accountancy (Scotland) – SCQF Level 6                            |4 |3 |4 |
    |zQXAA1|20 |Accountancy and Tax                |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Accountancy (Scotland) – SCQF Level 8                            |4 |3 |4 |
    |yfSAAT|21 |Accountancy and Tax                |Bespoke          |                                     |                                                                 |4 |1 |1 |
    |zQ8AAL|22 |Accountancy and Tax                |Public Non-Apps  |PQ                                   |AAT                                                              |4 |2 |10|
    |zQIAA1|23 |Accountancy and Tax                |Public Non-Apps  |PQ                                   |ACCA                                                             |4 |2 |10|
    |zQNAA1|24 |Accountancy and Tax                |Public Non-Apps  |PQ                                   |ATT                                                              |4 |2 |10|
    |zQXAA1|25 |Accountancy and Tax                |Public Non-Apps  |PQ                                   |CIMA                                                             |4 |2 |10|
    |yfSAAT|26 |Accountancy and Tax                |Public Non-Apps  |PQ                                   |CPA                                                              |4 |2 |10|
    |zQ8AAL|27 |Accountancy and Tax                |Public Non-Apps  |PQ                                   |CTA                                                              |4 |2 |10|
    |zQIAA1|28 |Accountancy and Tax                |Public Non-Apps  |PQ                                   |FIA                                                              |4 |2 |10|
    |zQNAA1|29 |Accountancy and Tax                |Public Non-Apps  |PQ                                   |ICAEW                                                            |4 |2 |10|
    |zQXAA1|30 |Accountancy and Tax                |Public Non-Apps  |PQ                                   |ICAS                                                             |4 |2 |10|
    |yfSAAT|31 |Actuarial Education                |Apprenticeship   |ActEd                                |Actuarial Technician - Level 4                                   |3 |2 |3 |
    |zQ8AAL|32 |Actuarial Education                |Apprenticeship   |ActEd                                |Actuary - Level 7                                                |3 |2 |3 |
    |zQIAA1|33 |Actuarial Education                |Public Non-Apps  |ActEd                                |Acturial Education                                               |3 |2 |2 |
    |zQNAA1|34 |Banking/Insurance/FS               |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Advanced Credit Controller / Debt Collection Specialist - Level 3|2 |4 |13|
    |zQXAA1|35 |Banking/Insurance/FS               |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Financial Services Customer Adviser - Level 2                    |2 |4 |13|
    |yfSAAT|36 |Banking/Insurance/FS               |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Insurance Practitioner - Level 3                                 |2 |4 |13|
    |zQ8AAL|37 |Banking/Insurance/FS               |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Insurance Professional - Level 4                                 |2 |4 |13|
    |zQIAA1|38 |Banking/Insurance/FS               |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Investment Operations Administrator - Level 2                    |2 |4 |13|
    |zQNAA1|39 |Banking/Insurance/FS               |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Investment Operations Specialist - Level 4                       |2 |4 |13|
    |zQXAA1|40 |Banking/Insurance/FS               |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Investment Operations Technician - Level 3                       |2 |4 |13|
    |yfSAAT|41 |Banking/Insurance/FS               |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Mortgage Adviser - Level 3                                       |2 |4 |13|
    |zQ8AAL|42 |Banking/Insurance/FS               |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Senior Financial Services Customer Adviser - Level 3             |2 |4 |13|
    |zQIAA1|43 |Banking/Insurance/FS               |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Providing Financial Services (Scotland) – SCQF Level 5           |2 |4 |13|
    |zQNAA1|44 |Banking/Insurance/FS               |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Providing Financial Services (Scotland) – SCQF Level 6           |2 |4 |13|
    |zQXAA1|45 |Banking/Insurance/FS               |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Financial Services Administrator - Level 3                       |2 |4 |13|
    |yfSAAT|46 |Banking/Insurance/FS               |Apprenticeship   |PQ (FS, Level 6/7)                   |Financial Services Professional - Level 6                        |2 |4 |5 |
    |zQ8AAL|47 |Banking/Insurance/FS               |Apprenticeship   |PQ (FS, Level 6/7)                   |Relationship Manager (Banking) - Level 6                         |2 |4 |5 |
    |zQIAA1|48 |Banking/Insurance/FS               |Apprenticeship   |PQ (FS, Level 6/7)                   |Senior Insurance Professional - Level 6                          |2 |4 |5 |
    |zQNAA1|49 |Banking/Insurance/FS               |Apprenticeship   |PQ (FS, Level 6/7)                   |Senior Investment / Commercial Banking Professional - Level 7    |2 |4 |5 |
    |zQXAA1|50 |Banking/Insurance/FS               |Apprenticeship   |School of Business (Level 6/7)       |Chartered Manager - Level 6                                      |2 |4 |2 |
    |yfSAAT|51 |Banking / Insurance / FS           |Bespoke          |                                     |                                                                 |3 |1 |1 |
    |zQ8AAL|52 |Banking / Insurance / FS           |Public Non-Apps  |PQ (FS)                              |Chartered Financial Analyst (CFA)                                |3 |2 |6 |
    |zQIAA1|53 |Banking / Insurance / FS           |Public Non-Apps  |PQ (FS)                              |Chartered Insurance institute (CII)                              |3 |2 |6 |
    |zQNAA1|54 |Banking / Insurance / FS           |Public Non-Apps  |PQ (FS)                              |CISI                                                             |3 |2 |6 |
    |zQXAA1|55 |Banking / Insurance / FS           |Public Non-Apps  |PQ (FS)                              |Investment Management Certificate (IMC)                          |3 |2 |6 |
    |yfSAAT|56 |Banking / Insurance / FS           |Public Non-Apps  |PQ (FS)                              |IOC                                                              |3 |2 |6 |
    |zQ8AAL|57 |DTS / MSC in Data Analytics        |Apprenticeship   |School of Technology (Level 6/7)     |BSc Digital and Technology Solutions - Level 6                   |3 |2 |3 |
    |zQIAA1|58 |DTS / MSC in Data Analytics        |Apprenticeship   |School of Technology (Level 6/7)     |MSc Applied Data Analytics                                       |3 |2 |3 |
    |zQNAA1|59 |DTS / MSC in Data Analytics        |Public Non-Apps  |School of Technology                 |MSc Applied Data Analytics                                       |3 |2 |2 |
    |zQXAA1|60 |GDA / wrap                         |Bespoke          |School of Business                   |Graduate Diploma in Accountancy                                  |2 |2 |2 |
    |yfSAAT|61 |Health                             |Apprenticeship   |School of Nursing                    |Nursing Associate - Level 5                                      |4 |2 |3 |
    |zQ8AAL|62 |Health                             |Apprenticeship   |School of Nursing                    |Registered Nurse - degree (NMC 2010) - Level 6                   |4 |2 |3 |
    |zQIAA1|63 |Health                             |Bespoke          |                                     |                                                                 |4 |1 |1 |
    |zQNAA1|64 |Health                             |Public Non-Apps  |School of Health                     |Health School PD                                                 |4 |3 |7 |
    |zQXAA1|65 |Health                             |Public Non-Apps  |School of Health                     |Masters in Chiropractors                                         |4 |3 |7 |
    |yfSAAT|66 |Health                             |Public Non-Apps  |School of Health                     |Mentorship                                                       |4 |3 |7 |
    |zQ8AAL|67 |Health                             |Public Non-Apps  |School of Health                     |MSc Healthcare Leadership                                        |4 |3 |7 |
    |zQIAA1|68 |Health                             |Public Non-Apps  |School of Health                     |MSc Psychology                                                   |4 |3 |7 |
    |zQNAA1|69 |Health                             |Public Non-Apps  |School of Health                     |Post Graduate Certificate in Health Service                      |4 |3 |7 |
    |zQXAA1|70 |Health                             |Public Non-Apps  |School of Nursing                    |BSc Nursing                                                      |4 |3 |3 |
    |yfSAAT|71 |Health                             |Public Non-Apps  |School of Nursing                    |Nursing Conversion                                               |4 |3 |3 |
    |zQ8AAL|72 |HR / Management / Business Admin   |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Associate Project Manager - Level 4                              |3 |3 |12|
    |zQIAA1|73 |HR / Management / Business Admin   |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Business Administrator - Level 3                                 |3 |3 |12|
    |zQNAA1|74 |HR / Management / Business Admin   |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|HR Consultant / Partner - Level 5                                |3 |3 |12|
    |zQXAA1|75 |HR / Management / Business Admin   |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|HR Support - Level 3                                             |3 |3 |12|
    |yfSAAT|76 |HR / Management / Business Admin   |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Improvement Leader - Level 6                                     |3 |3 |12|
    |zQ8AAL|77 |HR / Management / Business Admin   |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Improvement Practitioner - Level 4                               |3 |3 |12|
    |zQIAA1|78 |HR / Management / Business Admin   |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Improvement Specialist - Level 5                                 |3 |3 |12|
    |zQNAA1|79 |HR / Management / Business Admin   |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Operations / Departmental Manager - Level 5                      |3 |3 |12|
    |zQXAA1|80 |HR / Management / Business Admin   |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Team Leader / Supervisor - Level 3                               |3 |3 |12|
    |yfSAAT|81 |HR / Management / Business Admin   |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Business Administration (Scotland) – SCQF Level 6                |3 |3 |12|
    |zQ8AAL|82 |HR / Management / Business Admin   |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Coaching Professional Level 5                                    |3 |3 |12|
    |zQIAA1|83 |HR / Management / Business Admin   |Bespoke          |                                     |                                                                 |3 |1 |1 |
    |zQNAA1|84 |International                      |Bespoke          |                                     |                                                                 |3 |3 |1 |
    |zQXAA1|85 |International                      |Bespoke          |School of Technology                 |Big Data & Analytics                                             |3 |3 |10|
    |yfSAAT|86 |International                      |Bespoke          |School of Technology                 |Business Applications & Customer Experience                      |3 |3 |10|
    |zQ8AAL|87 |International                      |Bespoke          |School of Technology                 |Cyber Security                                                   |3 |3 |10|
    |zQIAA1|88 |International                      |Bespoke          |School of Technology                 |Digital Innovation, Entrepreneurship and Disruption              |3 |3 |10|
    |zQNAA1|89 |International                      |Bespoke          |School of Technology                 |Digital Leadership & Digital Skills                              |3 |3 |10|
    |zQXAA1|90 |International                      |Bespoke          |School of Technology                 |Ethical & Legal Issues in Big Data & Artificial Intelligence     |3 |3 |10|
    |yfSAAT|91 |International                      |Bespoke          |School of Technology                 |Financial Crime                                                  |3 |3 |10|
    |zQ8AAL|92 |International                      |Bespoke          |School of Technology                 |Governance Risk & Compliance                                     |3 |3 |10|
    |zQIAA1|93 |International                      |Bespoke          |School of Technology                 |Infrastructure Connectivity & Cloud                              |3 |3 |10|
    |zQNAA1|94 |International                      |Bespoke          |PD                                   |Accountancy & Tax                                                |3 |3 |15|
    |zQXAA1|95 |International                      |Bespoke          |PD                                   |Exec Ed                                                          |3 |3 |15|
    |yfSAAT|96 |International                      |Bespoke          |PD                                   |Finance for Non Finance                                          |3 |3 |15|
    |zQ8AAL|97 |International                      |Bespoke          |PD                                   |Finance for Non Finance Package                                  |3 |3 |15|
    |zQIAA1|98 |International                      |Bespoke          |PD                                   |Financial Services                                               |3 |3 |15|
    |zQNAA1|99 |International                      |Bespoke          |PD                                   |Higher Rights                                                    |3 |3 |15|
    |zQXAA1|100|International                      |Bespoke          |PD                                   |ICAS                                                             |3 |3 |15|
    |yfSAAT|101|International                      |Bespoke          |PD                                   |Insolvency                                                       |3 |3 |15|
    |zQ8AAL|102|International                      |Bespoke          |PD                                   |Law CPD                                                          |3 |3 |15|
    |zQIAA1|103|International                      |Bespoke          |PD                                   |Law PSC                                                          |3 |3 |15|
    |zQNAA1|104|International                      |Bespoke          |PD                                   |Leadership & Professional Development                            |3 |3 |15|
    |zQXAA1|105|International                      |Bespoke          |PD                                   |Other                                                            |3 |3 |15|
    |yfSAAT|106|International                      |Bespoke          |PD                                   |QLTS                                                             |3 |3 |15|
    |zQ8AAL|107|International                      |Bespoke          |PD                                   |Tax Subscription                                                 |3 |3 |15|
    |zQIAA1|108|International                      |Public Non-Apps  |PD                                   |Accountancy & Tax                                                |3 |5 |15|
    |zQNAA1|109|International                      |Public Non-Apps  |PD                                   |Exec Ed                                                          |3 |5 |15|
    |zQXAA1|110|International                      |Public Non-Apps  |PD                                   |Finance for Non Finance                                          |3 |5 |15|
    |yfSAAT|111|International                      |Public Non-Apps  |PD                                   |Finance for Non Finance Package                                  |3 |5 |15|
    |zQ8AAL|112|International                      |Public Non-Apps  |PD                                   |Financial Services                                               |3 |5 |15|
    |zQIAA1|113|International                      |Public Non-Apps  |PD                                   |Higher Rights                                                    |3 |5 |15|
    |zQNAA1|114|International                      |Public Non-Apps  |PD                                   |ICAS                                                             |3 |5 |15|
    |zQXAA1|115|International                      |Public Non-Apps  |PD                                   |Insolvency                                                       |3 |5 |15|
    |yfSAAT|116|International                      |Public Non-Apps  |PD                                   |Law CPD                                                          |3 |5 |15|
    |zQ8AAL|117|International                      |Public Non-Apps  |PD                                   |Law PSC                                                          |3 |5 |15|
    |zQIAA1|118|International                      |Public Non-Apps  |PD                                   |Leadership & Professional Development                            |3 |5 |15|
    |zQNAA1|119|International                      |Public Non-Apps  |PD                                   |Other                                                            |3 |5 |15|
    |zQXAA1|120|International                      |Public Non-Apps  |PD                                   |QLTS                                                             |3 |5 |15|
    |yfSAAT|121|International                      |Public Non-Apps  |PD                                   |Tax Subscription                                                 |3 |5 |15|
    |zQ8AAL|122|International                      |Public Non-Apps  |Romania BPP                          |PQ OCR Live                                                      |3 |5 |2 |
    |zQIAA1|123|International                      |Public Non-Apps  |Poland BPP                           |PQ OCR Live                                                      |3 |5 |2 |
    |zQNAA1|124|International                      |Public Non-Apps  |Channel Islands                      |FIA                                                              |3 |5 |9 |
    |zQXAA1|125|International                      |Public Non-Apps  |Channel Islands                      |ICSA                                                             |3 |5 |9 |
    |yfSAAT|126|International                      |Public Non-Apps  |Channel Islands                      |ACCA                                                             |3 |5 |9 |
    |zQ8AAL|127|International                      |Public Non-Apps  |Channel Islands                      |Chartered Financial Analyst (CFA)                                |3 |5 |9 |
    |zQIAA1|128|International                      |Public Non-Apps  |Channel Islands                      |CILT                                                             |3 |5 |9 |
    |zQNAA1|129|International                      |Public Non-Apps  |Channel Islands                      |CISI                                                             |3 |5 |9 |
    |zQXAA1|130|International                      |Public Non-Apps  |Channel Islands                      |ICAEW                                                            |3 |5 |9 |
    |yfSAAT|131|International                      |Public Non-Apps  |Channel Islands                      |PD                                                               |3 |5 |9 |
    |zQ8AAL|132|Law                                |Apprenticeship   |Law School                           |Paralegal - Level 3                                              |3 |2 |3 |
    |zQIAA1|133|Law                                |Apprenticeship   |Law School                           |Solicitor - Level 7                                              |3 |2 |3 |
    |zQNAA1|134|Law                                |Public Non-Apps  |Law School                           |Academic LLMs                                                    |3 |2 |6 |
    |zQXAA1|135|Law                                |Public Non-Apps  |Law School                           |BTC                                                              |3 |2 |6 |
    |yfSAAT|136|Law                                |Public Non-Apps  |Law School                           |LPC                                                              |3 |2 |6 |
    |zQ8AAL|137|Law                                |Public Non-Apps  |Law School                           |pGDL                                                             |3 |2 |6 |
    |zQIAA1|138|Law                                |Public Non-Apps  |Law School                           |STC                                                              |3 |2 |6 |
    |zQNAA1|139|Other                              |Apprenticeship   |                                     |                                                                 |8 |1 |1 |
    |zQXAA1|140|Other                              |Bespoke          |                                     |                                                                 |8 |1 |1 |
    |yfSAAT|141|Other                              |Other            |                                     |                                                                 |8 |1 |1 |
    |zQ8AAL|142|Other                              |Public Non-Apps  |                                     |                                                                 |8 |1 |1 |
    |zQIAA1|143|Other Technology Products          |Apprenticeship   |School of Technology                 |Cyber Security Technologist - Level 4                            |4 |3 |7 |
    |zQNAA1|144|Other Technology Products          |Apprenticeship   |School of Technology                 |Data Analyst - Level 4                                           |4 |3 |7 |
    |zQXAA1|145|Other Technology Products          |Apprenticeship   |School of Technology                 |Infrastructure Technician - Level 3                              |4 |3 |7 |
    |yfSAAT|146|Other Technology Products          |Apprenticeship   |School of Technology                 |Network Engineer - Level 4                                       |4 |3 |7 |
    |zQ8AAL|147|Other Technology Products          |Apprenticeship   |School of Technology                 |Software Developer - Level 4                                     |4 |3 |7 |
    |zQIAA1|148|Other Technology Products          |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|IT Professional (Scotland) – SCQF Level 6                        |4 |3 |3 |
    |zQNAA1|149|Other Technology Products          |Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|IT Professional (Scotland) – SCQF Level 8                        |4 |3 |3 |
    |zQXAA1|150|Other Technology Products          |Bespoke          |                                     |                                                                 |4 |1 |1 |
    |yfSAAT|151|Other Technology Products          |Key Skills Series|School of Technology                 |Advanced Data and Audit Analytics                                |4 |2 |17|
    |zQ8AAL|152|Other Technology Products          |Key Skills Series|School of Technology                 |Big Data & Analytics                                             |4 |2 |17|
    |zQIAA1|153|Other Technology Products          |Key Skills Series|School of Technology                 |Big Data and Analytics Fundamentals                              |4 |2 |17|
    |zQNAA1|154|Other Technology Products          |Key Skills Series|School of Technology                 |Business Applications & Customer Experience                      |4 |2 |17|
    |zQXAA1|155|Other Technology Products          |Key Skills Series|School of Technology                 |Cyber Security                                                   |4 |2 |17|
    |yfSAAT|156|Other Technology Products          |Key Skills Series|School of Technology                 |Cybersecurity Essentials for Accountants                         |4 |2 |17|
    |zQ8AAL|157|Other Technology Products          |Key Skills Series|School of Technology                 |Digital Accountant Programme                                     |4 |2 |17|
    |zQIAA1|158|Other Technology Products          |Key Skills Series|School of Technology                 |Digital Innovation, Entrepreneurship and Disruption              |4 |2 |17|
    |zQNAA1|159|Other Technology Products          |Key Skills Series|School of Technology                 |Digital Lawyer Programme                                         |4 |2 |17|
    |zQXAA1|160|Other Technology Products          |Key Skills Series|School of Technology                 |Digital Leadership & Digital Skills                              |4 |2 |17|
    |yfSAAT|161|Other Technology Products          |Key Skills Series|School of Technology                 |Digital Nursing Programme                                        |4 |2 |17|
    |zQ8AAL|162|Other Technology Products          |Key Skills Series|School of Technology                 |Ethical & Legal Issues in Big Data & Artificial Intelligence     |4 |2 |17|
    |zQIAA1|163|Other Technology Products          |Key Skills Series|School of Technology                 |Financial Crime                                                  |4 |2 |17|
    |zQNAA1|164|Other Technology Products          |Key Skills Series|School of Technology                 |Governance Risk & Compliance                                     |4 |2 |17|
    |zQXAA1|165|Other Technology Products          |Key Skills Series|School of Technology                 |Infrastructure Connectivity & Cloud                              |4 |2 |17|
    |yfSAAT|166|Other Technology Products          |Key Skills Series|School of Technology                 |Other Future Skills Series                                       |4 |2 |17|
    |zQ8AAL|167|Professional Development           |Bespoke          |PD                                   |Accountancy & Tax                                                |4 |2 |15|
    |zQIAA1|168|Professional Development           |Bespoke          |PD                                   |Exec Ed                                                          |4 |2 |15|
    |zQNAA1|169|Professional Development           |Bespoke          |PD                                   |Finance for Non Finance                                          |4 |2 |15|
    |zQXAA1|170|Professional Development           |Bespoke          |PD                                   |Finance for Non Finance Package                                  |4 |2 |15|
    |yfSAAT|171|Professional Development           |Bespoke          |PD                                   |Financial Services                                               |4 |2 |15|
    |zQ8AAL|172|Professional Development           |Bespoke          |PD                                   |Higher Rights                                                    |4 |2 |15|
    |zQIAA1|173|Professional Development           |Bespoke          |PD                                   |ICAS                                                             |4 |2 |15|
    |zQNAA1|174|Professional Development           |Bespoke          |PD                                   |Insolvency                                                       |4 |2 |15|
    |zQXAA1|175|Professional Development           |Bespoke          |PD                                   |Law CPD                                                          |4 |2 |15|
    |yfSAAT|176|Professional Development           |Bespoke          |PD                                   |Law PSC                                                          |4 |2 |15|
    |zQ8AAL|177|Professional Development           |Bespoke          |PD                                   |Leadership & Professional Development                            |4 |2 |15|
    |zQIAA1|178|Professional Development           |Bespoke          |PD                                   |Other                                                            |4 |2 |15|
    |zQNAA1|179|Professional Development           |Bespoke          |PD                                   |QLTS                                                             |4 |2 |15|
    |zQXAA1|180|Professional Development           |Bespoke          |PD                                   |Tax Subscription                                                 |4 |2 |15|
    |yfSAAT|181|Professional Development           |Public Non-Apps  |PD                                   |Accountancy & Tax                                                |4 |2 |15|
    |zQ8AAL|182|Professional Development           |Public Non-Apps  |PD                                   |Exec Ed                                                          |4 |2 |15|
    |zQIAA1|183|Professional Development           |Public Non-Apps  |PD                                   |Finance for Non Finance                                          |4 |2 |15|
    |zQNAA1|184|Professional Development           |Public Non-Apps  |PD                                   |Finance for Non Finance Package                                  |4 |2 |15|
    |zQXAA1|185|Professional Development           |Public Non-Apps  |PD                                   |Financial Services                                               |4 |2 |15|
    |yfSAAT|186|Professional Development           |Public Non-Apps  |PD                                   |Higher Rights                                                    |4 |2 |15|
    |zQ8AAL|187|Professional Development           |Public Non-Apps  |PD                                   |ICAS                                                             |4 |2 |15|
    |zQIAA1|188|Professional Development           |Public Non-Apps  |PD                                   |Insolvency                                                       |4 |2 |15|
    |zQNAA1|189|Professional Development           |Public Non-Apps  |PD                                   |Law CPD                                                          |4 |2 |15|
    |zQXAA1|190|Professional Development           |Public Non-Apps  |PD                                   |Law PSC                                                          |4 |2 |15|
    |yfSAAT|191|Professional Development           |Public Non-Apps  |PD                                   |Leadership & Professional Development                            |4 |2 |15|
    |zQ8AAL|192|Professional Development           |Public Non-Apps  |PD                                   |Other                                                            |4 |2 |15|
    |zQIAA1|193|Professional Development           |Public Non-Apps  |PD                                   |QLTS                                                             |4 |2 |15|
    |zQNAA1|194|Professional Development           |Public Non-Apps  |PD                                   |Tax Subscription                                                 |4 |2 |15|
    |zQXAA1|205|Professional Development           |Key Skills Series|PD                                   |Capability Analysis                                              |4 |2 |2 |
    |yfSAAT|195|Risk / Compliance / Financial Crime|Apprenticeship   |Apprenticeship School (Level 2/3/4/5)|Compliance / Risk Officer - Level 3                              |3 |3 |2 |
    |zQ8AAL|196|Risk / Compliance / Financial Crime|Apprenticeship   |PQ (FS, Level 6/7)                   |Senior Compliance / Risk Specialist - Level 6                    |3 |3 |2 |
    |zQIAA1|197|Risk / Compliance / Financial Crime|Bespoke          |                                     |                                                                 |3 |1 |1 |
    |zQNAA1|198|UG / PG                            |Bespoke          |                                     |                                                                 |3 |1 |1 |
    |zQXAA1|199|UG / PG                            |Public Non-Apps  |School of Business                   |Academic and careers skills                                      |3 |2 |7 |
    |yfSAAT|200|UG / PG                            |Public Non-Apps  |School of Business                   |ACCA Professional Level                                          |3 |2 |7 |
    |zQ8AAL|201|UG / PG                            |Public Non-Apps  |School of Business                   |Advanced Diploma in Accounting Finance (ACCA Route)              |3 |2 |7 |
    |zQIAA1|202|UG / PG                            |Public Non-Apps  |School of Business                   |BSc Accounting and Finance                                       |3 |2 |7 |
    |zQNAA1|203|UG / PG                            |Public Non-Apps  |School of Business                   |MSc Accounting and Finance (Advanced Diploma Route)              |3 |2 |7 |
    |zQXAA1|204|UG / PG                            |Public Non-Apps  |School of Business                   |MSc Management                                                   |3 |2 |7 |
    |yfSAAT|205|Other Technology Products          |Apprenticeship   |School of Technology                 |Data Technician - Level 3                                        |4 |3 |7 |
    |zQ8AAL|206|HR / Management / Business Admin   |Apprenticeship   |School of Business (Level 6/7)       |Chartered Manager - Level 6                                      |3 |3 |2 |

  @Positive #TC-4242, TC-4247
  Scenario Outline: Validate Tier Five and Six Values Combination <t5> <t6>
    Given I execute "Log In To Salesforce" reusable step replacing some steps
      |2|I fill the "Salesforce Username" field with "MD_COMMON_CREDENTIALS_SALESFORCECPQUSER"|
      |3|I fill the "Salesforce Password" field with "MD_COMMON_CREDENTIALS_SALESFORCECPQPASSWORD"|
    Given I am on "https://bpp-13fd3e55182--noahqa.lightning.force.com/lightning/r/Opportunity/006g000000LL<url>/view" URL
    And I wait for "5" seconds
    And I click on the "Details" button
    And I wait for "10" seconds
    And I execute "window.scrollBy(0, 500);" JS code

    When I click on the "Tier 1" "Salesforce Inframe select" if "<t1>" "value is not empty"
    And I click on the "<t1>" "Salesforce Inframe select option" if "<t1>" "value is not empty"

    When I click on the "Tier 2" "Salesforce Inframe select" if "<t2>" "value is not empty"
    And I click on the "<t2>" "Salesforce Inframe select option" if "<t2>" "value is not empty"

    When I click on the "Tier 3" "Salesforce Inframe select" if "<t3>" "value is not empty"
    And I click on the "<t3>" "Salesforce Inframe select option" if "<t3>" "value is not empty"

    When I click on the "Tier 4" "Salesforce Inframe select" if "<t4>" "value is not empty"
    And I click on the "<t4>" "Salesforce Inframe select option" if "<t4>" "value is not empty"

    When I click on the "Tier 5" "Salesforce Inframe select" if "<t5>" "value is not empty"
    And I should see "Tier 5" "Salesforce Inframe select options" in quantity of "<t5noo>"
    And I click on the "<t5>" "Salesforce Inframe select option" if "<t5>" "value is not empty"

    When I click on the "Tier 6" "Salesforce Inframe select" if "<t6>" "value is not empty"
    And I should see "Tier 6" "Salesforce Inframe select options" in quantity of "<t6noo>"
    And I click on the "<t6>" "Salesforce Inframe select option" if "<t6>" "value is not empty"

    Then I click on the "Salesforce Save Tiers button" element
    And I click on the "Details" button
    And I wait for "5" seconds
    And I validate text "<t1>" to be displayed for "Salesforce Opportunity Tier 1 field" element if "<t1>" "value is not empty"
    And I validate text "<t2>" to be displayed for "Salesforce Opportunity Tier 2 field" element if "<t2>" "value is not empty"
    And I validate text "<t3>" to be displayed for "Salesforce Opportunity Tier 3 field" element if "<t3>" "value is not empty"
    And I validate text "<t4>" to be displayed for "Salesforce Opportunity Tier 4 field" element if "<t4>" "value is not empty"
    And I validate text "<t5>" to be displayed for "Salesforce Opportunity Tier 5 field" element if "<t5>" "value is not empty"
    And I validate text "<t6>" to be displayed for "Salesforce Opportunity Tier 6 field" element if "<t6>" "value is not empty"


    Examples:
      |url   |num|t1                      |t2            |t3|t4                            |t5|t6|t5noo|t6noo|
      |zQXAA1|1  |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|Existing Staff        |Existing Employee     |6|4|
      |yfSAAT|2  |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|Existing Staff        |New Recruit (BPP RS)  |6|4|
      |zQ8AAL|3  |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|Existing Staff        |New Recruit (in house)|6|4|
      |zQIAA1|4  |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|Traineeships          |Existing Employee     |6|4|
      |zQNAA1|5  |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|Traineeships          |New Recruit (BPP RS)  |6|4|
      |zQXAA1|6  |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|Traineeships          |New Recruit (in house)|6|4|
      |yfSAAT|7  |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|School Leavers        |Existing Employee     |6|4|
      |zQ8AAL|8  |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|School Leavers        |New Recruit (BPP RS)  |6|4|
      |zQIAA1|9  |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|School Leavers        |New Recruit (in house)|6|4|
      |zQNAA1|10 |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|Graduates             |Existing Employee     |6|4|
      |zQXAA1|11 |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|Graduates             |New Recruit (BPP RS)  |6|4|
      |yfSAAT|12 |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|Graduates             |New Recruit (in house)|6|4|
      |zQ8AAL|13 |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|Mixed Recruitment Type|Existing Employee     |6|4|
      |zQIAA1|14 |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|Mixed Recruitment Type|New Recruit (BPP RS)  |6|4|
      |zQNAA1|15 |Accountancy and Tax     |Apprenticeship|PQ|Assistant Accountant - Level 3|Mixed Recruitment Type|New Recruit (in house)|6|4|
      |zQXAA1|16 |Professional Development|Bespoke       |PD|ICAS                         |Blended               |                      |5|1|
      |yfSAAT|17 |Professional Development|Bespoke       |PD|ICAS                         |Face to Face          |                      |5|1|
      |zQ8AAL|18 |Professional Development|Bespoke       |PD|ICAS                         |Online Classroom Live |                      |5|1|
      |zQIAA1|19 |Professional Development|Bespoke       |PD|ICAS                         |Online Demand         |                      |5|1|