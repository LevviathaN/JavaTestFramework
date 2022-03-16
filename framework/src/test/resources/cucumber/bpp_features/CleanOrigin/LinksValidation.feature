@CleanOrigin @LinksValidation
Feature: Links Validation
  As an user
  I want to be able sure that i am redirected to correct pages when I clkck on links

  @Positive @Regression @P1
  Scenario Outline: Home Page Links Validation
    Given I execute "Log In To Clean Origin" reusable step
    And I should scroll to the "bottom" of the page
    And I click on the "<elementToClick>" element
    And I wait for "3" seconds
    And I capture current URL as "EC_CURRENT_URL" variable
    And I verify that "<url>" element "contains" to "EC_CURRENT_URL" element
    And I should see the "xpath=<elementToValidate>" element

    Examples:
      |elementToClick|url              |elementToValidate|
      |Home Page Build Your Ring Button|engagement/|//h1[contains(.,'Engagement')]|
      |Home Page Start With A Setting|engagement/|//h1[contains(.,'Engagement Rings')]|
      |Home Page Start With A Diamond|diamonds/|//span[@class='base'][contains(.,'Diamonds')]|
      |Home Page Earrings Link|jewelry/diamond-earrings/|//span[@class='base'][contains(.,'Diamond Earrings')]|
      |Home Page Necklaces Link|jewelry/diamond-pendants/|//span[@class='base'][contains(.,'Diamond Pendants')]|
      |Home Page Rings Link|jewelry/diamond-rings/|//span[@class='base'][contains(.,'Diamond Rings')]|
      |Home Page Shop All Studs Button|diamond-stud-earrings/|//h1[contains(.,'Diamond')]|
      |Home Page Why Lab Read More Button|about-lab-created-diamonds/|//h1[contains(.,'Lab Grown')][contains(.,'Diamonds')]|
      |Home Page Find Ring Size Read More Button|find-her-ring-size/|//h1[contains(.,'How To Find Her Ring Size')]|

  @Positive @Regression @P1
  Scenario Outline: Footer Links Validation
    Given I execute "Log In To Clean Origin" reusable step
    And I should scroll to the "bottom" of the page
    And I click on the "<elementToClick>" "Footer Link"
    And I wait for "3" seconds
    And I capture current URL as "EC_CURRENT_URL" variable
    And I verify that "<url>" element "contains" to "EC_CURRENT_URL" element
    And I should see the "xpath=<elementToValidate>" element

    Examples:
      |elementToClick|url              |elementToValidate|
      |Engagement|engagement/|//h1[contains(.,'Engagement')]|
      |Diamonds|diamonds/|//h1[contains(.,'Diamonds')]|
      |Matching Bands|matching-bands/|//h1[contains(.,'Matching Bands')]|
      |Bridal Sets|bridal-sets/|//h1[contains(.,'Bridal Sets')]|
      |Tennis Bracelets|jewelry/tennis-bracelets/|//h1[contains(.,'Tennis Bracelets')]|
      |Diamond Stud Earrings|diamond-stud-earrings/|//h1[contains(.,'Diamond Stud')][contains(.,'Earrings')]|
      |Our Story|our-story/|//h1[contains(.,'Our Story')]|
      |Blog|blog/|//h1[contains(.,'Blog')]|
      |Affiliate Program|affiliate-program/|//h1[contains(.,'Affiliate Program')]|
      |Lab Grown|about-lab-created-diamonds/|//h1[contains(.,'Lab Grown')][contains(.,'Diamonds')]|
      |Reviews|/reviews|//span[contains(@class,'yotpo-logo-title')]|
      |FAQs|faq/|//h1[contains(.,'Our Frequently Asked Questions')]|
      |Shipping|shipping-policy/|//h1[contains(.,'Shipping Policy')]|
      |Returns|return-policy/|//h1[contains(.,'Return Policy')]|
      |Contact Us|contacts/|//h1[contains(.,'Contact Us')]|
      |Press Kit|K6iwZrJVj3S5X/|//h2[@class='title-header-view'][contains(.,'Clean Origin')]|

  @Positive @Regression @P1
  Scenario Outline: Menu Links Validation
    Given I execute "Log In To Clean Origin" reusable step
    Then I hover over the "<menu>" "Navigation Menu Item"
    And I click on the "<submenu>" "Navigation Submenu Item"
    And I capture current URL as "EC_CURRENT_URL" variable
    And I verify that "<url>" element "contains" to "EC_CURRENT_URL" element
    And I should see the "xpath=<element>" element

    Examples:
      |menu      |submenu                      |url                                      |element|
      |DIAMONDS  |DIAMONDS                     |diamonds/                                |//h1[contains(.,'Diamonds')]|
      |DIAMONDS  |Round                        |diamonds/                                |//td[@data-attr='diamond_shape'][contains(.,'Round')]|
      |DIAMONDS  |Cushion                      |diamonds/                                |//td[@data-attr='diamond_shape'][contains(.,'Cushion')]|
      |DIAMONDS  |Marquise                     |diamonds/                                |//td[@data-attr='diamond_shape'][contains(.,'Marquise')]|
      |DIAMONDS  |Pear                         |diamonds/                                |//td[@data-attr='diamond_shape'][contains(.,'Pear')]|
      |DIAMONDS  |Oval                         |diamonds/                                |//td[@data-attr='diamond_shape'][contains(.,'Oval')]|
      |DIAMONDS  |Princess                     |diamonds/                                |//td[@data-attr='diamond_shape'][contains(.,'Princess')]|
      |DIAMONDS  |Radiant                      |diamonds/                                |//td[@data-attr='diamond_shape'][contains(.,'Radiant')]|
      |DIAMONDS  |Asscher                      |diamonds/                                |//td[@data-attr='diamond_shape'][contains(.,'Asscher')]|
      |DIAMONDS  |Emerald                      |diamonds/                                |//td[@data-attr='diamond_shape'][contains(.,'Emerald')]|
      |DIAMONDS  |All Diamonds                 |diamonds/                                |//h1[contains(.,'Diamonds')]|
      |ENGAGEMENT|ENGAGEMENT                   |engagement-rings/                        |//h1[contains(.,'Engagement')][contains(.,'Rings')]|
      |ENGAGEMENT|Start with a Setting         |engagement/                              |//div[contains(.,'Create your Ring')]|
      |ENGAGEMENT|Start with a Diamond         |diamonds/                                |//h1[contains(.,'Diamonds')]|
      |ENGAGEMENT|Engagement Rings             |engagement/                              |//h1[contains(.,'Engagement')]|
      |ENGAGEMENT|Preset Solitaires            |solitaire-diamond-ring/                  |//h1[contains(.,'Preset Solitaire Diamond Rings')]|
      |ENGAGEMENT|Solitaire                    |engagement/solitaire-engagement-rings/   |//h1[contains(.,'Solitaire Engagement Rings')]|
      |ENGAGEMENT|Halo                         |engagement/halo-engagement-rings/        |//h1[contains(.,'Halo')]|
      |ENGAGEMENT|Classic                      |engagement/classic-engagement-rings/     |//h1[contains(.,'Classic')]|
      |ENGAGEMENT|Signet                       |signet-rings/                            |//h1[contains(.,'Signet Rings')]          |
      |ENGAGEMENT|Three-Stone                  |engagement/three-stone-engagement-rings/ |//h1[contains(.,'Three-Stone Engagement Rings')]|
      |ENGAGEMENT|Vintage                      |vintage-style-engagement-rings/          |//h1[contains(.,'Vintage')]|
      |ENGAGEMENT|Bridal Sets                  |bridal-sets/                             |//h1[contains(.,'Bridal Sets')]|
      |ENGAGEMENT|Unique                       |unique-engagement-rings/                 |//h1[contains(.,'Unique Engagement Rings')]|
      |ENGAGEMENT|White Gold                   |engagement/?metal_type[0]=14K+White+Gold&metal_type[1]=18K+White+Gold  |//span[@class='filter-value'][contains(.,'14K White Gold')]/following::span[contains(.,'18K White Gold')]|
      |ENGAGEMENT|Rose Gold                    |engagement/?metal_type=14K+Rose+Gold                                   |//span[@class='filter-value'][contains(.,'14K Rose Gold')]|
      |ENGAGEMENT|Yellow Gold                  |engagement/?metal_type[0]=14K+Yellow+Gold&metal_type[1]=18K+Yellow+Gold|//span[@class='filter-value'][contains(.,'14K Yellow Gold')]/following::span[contains(.,'18K Yellow Gold')]|
      |ENGAGEMENT|Platinum                     |engagement/?metal_type=Platinum                                        |//span[@class='filter-value'][contains(.,'Platinum')]|
      |ENGAGEMENT|Non-Binary Engagement Rings  |non-binary-engagement-rings/|//h1[contains(.,'Non-Binary Engagement Rings')]|
      |ENGAGEMENT|Art Deco Engagement Rings    |art-deco-engagement-rings/  |//h1[contains(.,'Art Deco Engagement Rings')]|
      |ENGAGEMENT|East West Engagement Rings   |east-west-engagement-rings/ |//h1[contains(.,'East West')]|
      |ENGAGEMENT|Sapphire Engagement Rings    |sapphire-engagement-rings/  |//h1[contains(.,'Sapphire Engagement Rings')]|
      |ENGAGEMENT|Quick Ship Engagement Rings  |quick-ship-engagement-rings/|//h1[contains(.,'Quick Ship Engagement Rings')]|
      |ENGAGEMENT|Minimalist Engagement Rings  |minimalist-engagement-rings/|//h1[contains(.,'Minimalist Engagement Rings')]       |
      |ENGAGEMENT|Perfect Fit Collection       |perfect-fit-collection/     |//h1[contains(.,'Perfect Fit')]|
      |ENGAGEMENT|Precision Collection         |precision-collection/       |//h1[contains(.,'Precision Collection')]|
      |JEWELRY   |JEWELRY                      |ethical-jewelry/            |//h1[contains(.,'Jewelry')]                                  |
      |JEWELRY   |Eternity Bands               |wedding/eternity-bands/     |//h1[contains(.,'Eternity Bands')]                         |
      |JEWELRY   |Anniversary Bands            |wedding/anniversary-bands/  |//h1[contains(.,'Anniversary Bands')]  |
      |JEWELRY   |Stackable Bands              |jewelry/stackable-bands/    |//h1[contains(.,'Stackable Bands')]                      |
      |JEWELRY   |New Arrivals                 |jewelry/new/                |//h1[contains(.,'New Arrivals')]|
      |JEWELRY   |Diamond Pendants             |jewelry/diamond-pendants/   |//h1[contains(.,'Diamond Pendants')]|
      |JEWELRY   |Diamond Earrings             |jewelry/diamond-earrings/   |//h1[contains(.,'Diamond Earrings')]|
      |JEWELRY   |Diamond Bracelets            |jewelry/tennis-bracelets/   |//h1[contains(.,'Tennis Bracelets')]|
      |WEDDING   |WEDDING                      |wedding-rings/              |//h1[contains(.,'Wedding Rings')]|
      |WEDDING   |Eternity Bands               |wedding/eternity-bands/     |//h1[contains(.,'Eternity Bands')]|
      |WEDDING   |Anniversary Bands            |wedding/anniversary-bands/  |//h1[contains(.,'Anniversary Bands')]|
      |WEDDING   |Matching Bands               |matching-bands/             |//h1[contains(.,'Matching Bands')]|
      |WEDDING   |Diamond Stud Earrings        |diamond-stud-earrings/      |//h1[contains(.,'Diamond Stud')][contains(.,'Earrings')]|
      |WEDDING   |Diamond Bracelets            |jewelry/tennis-bracelets/   |//h1[contains(.,'Tennis Bracelets')]|
      |WEDDING   |Women's Wedding Bands        |wedding/wedding-bands/      |//h1[contains(.,'Women')][contains(.,'Wedding Bands')]|
      |WEDDING   |Men's Wedding Bands          |wedding/mens-wedding-bands/ |//h1[contains(.,'Men')][contains(.,'Wedding Bands')]|
      |WEDDING   |New Arrivals                 |wedding/new/                |//h1[contains(.,'New Arrivals')]|
      |ABOUT     |Press                        |in-the-press/               |//h1[contains(.,'In The Press')]   |
      |ABOUT     |ABOUT                        |our-story/                  |//h1[contains(.,'Our Story')]   |
      |ABOUT     |Our Story                    |our-story/                  |//h1[contains(.,'Our Story')]|
      |ABOUT     |Compare                      |comparison/                 |//h1[contains(.,'How do we compare?')]                                |
      |ABOUT     |Blog                         |blog/                       |//a[contains(.,'Wedding Ring Styles')]             |
      |ABOUT     |Reviews                      |reviews/                    |//span[contains(@class,'yotpo-logo-title')]           |
      |ABOUT     |Free Shipping                |shipping-policy/|//h1[contains(.,'Shipping Policy')]           |
      |ABOUT     |100 Day Return Policy        |return-policy/|//h1[contains(.,'Return Policy')]                                              |
      |ABOUT     |Independent Lab Certification|independently-certified/|//h1[contains(.,'Clean Origin Diamond Certification')]    |
      |ABOUT     |Free Resizing                |resizing-policy/|//h1[contains(.,'Our Resizing Policy')]                                     |
      |ABOUT     |FAQs                         |faq/|//h1[contains(.,'Our Frequently Asked Questions')]|
      |ABOUT     |Lifetime Warranty            |warranty/|//h1[contains(.,'Our Warranty')] |
      |LEARN     |4 C's of Diamonds            |diamonds-4cs/|//h1[contains(.,'The 4 C')][contains(.,'s of Diamonds')]                                            |
      |LEARN     |Lab Grown Diamonds           |about-lab-created-diamonds/|//h1[contains(.,'Lab Grown')][contains(.,'Diamonds')]                    |
      |LEARN     |Mined Diamonds               |about-mined-diamonds/|//h1[contains(.,'Mined Diamonds')]                |
      |LEARN     |Conflict-Free Diamonds       |conflict-free-diamonds/|//h1[contains(.,'Conflict Free Diamonds')]|
      |LEARN     |Lab Grown vs. Mined          |spot-lab-grown-diamond/|//*[contains(.,'Can You Spot a Real Diamond?')]                                            |
      |LEARN     |Diamond Shapes               |diamond-shapes/|//h1[contains(.,'Diamond Shapes')]       |
      |LEARN     |Round Diamonds               |round-diamonds/|//h1[contains(.,'Round Diamonds')]               |
      |LEARN     |Princess Diamonds            |princess-diamonds/|//h1[contains(.,'Princess-Cut Diamonds')]|
      |LEARN     |Oval Diamonds                |oval-diamonds/|//h1[contains(.,'Oval Diamonds')]|
      |LEARN     |Emerald Diamonds             |emerald-diamonds/|//h1[contains(.,'Emerald-Cut Diamonds')]             |
      |LEARN     |Cushion Diamonds             |cushion-diamonds/|//h1[contains(.,'Cushion-Cut Diamonds')]                   |
      |LEARN     |Pear Diamonds                |pear-diamonds/|//h1[contains(.,'Pear-Shaped Diamonds')]|
      |LEARN     |Engagement Ring Style Guide  |engagement-ring-styles/|//h1[contains(.,'Engagement Ring Styles')]|
      |LEARN     |Find Her Ring Size           |find-her-ring-size/|//h1[contains(.,'How To Find Her Ring Size')]|
      |LEARN     |How To Shop                  |how-to-shop/|//h1[contains(.,'Engagement Ring Guide')]|
      |LEARN     |Recycled Metals Guide        |recycled-metals-guide/|//h1[contains(.,'Recycled Metals Guide')]|