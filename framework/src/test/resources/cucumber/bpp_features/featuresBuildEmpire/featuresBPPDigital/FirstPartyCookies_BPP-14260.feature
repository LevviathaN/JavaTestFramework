@DigitalSite
Feature: Implement First Party Cookies

  As part of the onboarding and implementation of Salesforce Audience Studio and in light of ongoing European cookie policy changes and acceptance, BPP require 1st party cookies hardcoding on our BPP.com property> Attached is a deck explaining the work that is required. In summary it is:
  1. Determine unique identifier for a visitor that is persistent over sessions
  Sites should respond to content requests with Set-Cookie response header
  Cookie name should be kppid
  Cookie value should be 11-character alphanumeric (a-z, 0-9, _)
  Cookies expiry set to be 6 months from the point of
  Cookie domain should be "bpp.com"
  2. Request Salesforce team to enable 1st party cookie solution
  3. Validate if data is received.
  Note: the domain property of the cookie inherits for the full domain name of the hosting website e.g. www.bpp.com, web-stage-bppdigital.bppuniversity.com

  @Cookies #TC-5744
  Scenario: Implement First Party Cookies
    Given I am on "MD_COMMON_LINKS_BPPDIGITALINDEXURL" URL
    And Browser gets first party cookies
    Then Browser performs "REFRESH" command
    And I wait for "1" seconds
    Then Browser checks first party cookies
    When I click on the "Courses" "BPP Digital Study expandable link"
    When I click on the "Law" "BPP Digital Student Applications Menu link"
    Then Browser checks first party cookies
    Then Browser deletes cookies
    Given I am on "MD_COMMON_LINKS_BPPDIGITALINDEXURL" URL
    And Browser gets first party cookies