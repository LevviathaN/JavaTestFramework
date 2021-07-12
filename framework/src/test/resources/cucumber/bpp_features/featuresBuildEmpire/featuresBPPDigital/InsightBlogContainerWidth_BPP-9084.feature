@DigitalSite @BuildEmpire
Feature: BPP Digital Insights Container Width
  As a designer, I'd like to increase the container width of the insight/blog template to 100%
  so that I can use all cms components within them

  @Insights  #TC-4315
  Scenario: BPP Digital Insights Container Width
    Given I am on "https://web-stage-bppdigital.bppuniversity.com/insights/bpp-university-legal-advice-clinics" URL
    Then Сss "width" of "BPP Digital Insights Container" should have value "1366px"