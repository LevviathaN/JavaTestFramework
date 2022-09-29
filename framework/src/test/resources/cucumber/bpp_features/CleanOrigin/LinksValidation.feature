@CleanOrigin @LinksValidation
Feature: Links Validation
  As an user
  I want to be able sure that i am redirected to correct pages when I clkck on links

  @Positive @Regression @P1
  Scenario Outline: Home Page Links Validation <elementToClick>
    Given I execute "Go to Clean Origin" reusable step
    And I should scroll to the "bottom" of the page
    And I click on the "<elementToClick>" element
    And I wait for "3" seconds
    And I capture current URL as "EC_CURRENT_URL" variable
    And I verify that "<url>" element "contains" to "EC_CURRENT_URL" element
    And I should see the "xpath=<elementToValidate>" element
    #todo: Add second validation item (to differentiate, for example, diamond plp from builder diamond plp)

    Examples:
      |elementToClick|url              |elementToValidate|
      |Home Page Shop Engagement Button|engagement/|//h2[contains(text(),'Engagement Rings')]|
      |Home Page Start With A Setting|engagement/|//h2[contains(text(),'Engagement Rings')]|
      |Home Page Start With A Diamond|diamonds/|//h2[contains(text(),'Diamonds')]|
#      |Home Page Earrings Link|jewelry/diamond-earrings/|//span[@class='base'][contains(.,'Diamond Earrings')]|
#      |Home Page Necklaces Link|jewelry/diamond-pendants/|//span[@class='base'][contains(.,'Diamond Pendants')]|
#      |Home Page Rings Link|jewelry/diamond-rings/|//span[@class='base'][contains(.,'Diamond Rings')]|
#      |Home Page Shop All Studs Button|diamond-stud-earrings/|//h1[contains(.,'Diamond')]|
#      |Home Page Why Lab Read More Button|about-lab-created-diamonds/|//h1[contains(.,'Lab Grown')][contains(.,'Diamonds')]|
#      |Home Page Find Ring Size Read More Button|find-her-ring-size/|//h1[contains(.,'How To Find Her Ring Size')]|

  @Positive @Regression @P1
  Scenario Outline: Footer Links Validation <elementToClick>
    Given I execute "Go to Clean Origin" reusable step
    And I should scroll to the "bottom" of the page
    And I click on the "<elementToClick>" "Footer Link"
    And I wait for "3" seconds
    And I capture current URL as "EC_CURRENT_URL" variable
    And I verify that "<url>" element "contains" to "EC_CURRENT_URL" element
    And I should see the "xpath=<elementToValidate>" element

    Examples:
      |elementToClick|url              |elementToValidate|
      |Engagement|engagement/|//h2[contains(text(),'Engagement Rings')]|
      |Diamonds|diamonds/|//h2[contains(text(),'Diamonds')]|
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
  Scenario Outline: Signed In User Links Validation <elementToClick>
    Given I execute modified "Log In To Clean Origin" reusable step
      |7|Delete||
    And I click on the "xpath=<elementToClick>" element
    And I wait for "3" seconds
    And I capture current URL as "EC_CURRENT_URL" variable
    And I verify that "<url>" element "contains" to "EC_CURRENT_URL" element
    And I should see the "xpath=<elementToValidate>" element

    Examples:
      |elementToClick|url              |elementToValidate|
      |//a[.='test order']      |customer/account/     |//h1[contains(.,'Dashboard')]               |
      |//li//a[.='Information'] |customer/account/edit/|//h1[contains(.,'Edit Account Information')]|
      |//li//a[.='Address Book']|customer/address/     |//h1[contains(.,'Address Book')]            |
      |//li//a[.='My Orders']   |sales/order/history/  |//h1[contains(.,'My Orders')]               |
      |//li//a[.='My Wishlist'] |wishlist/             |//h1[contains(.,'Wishlist')]                |
      |//li//a[.='Newsletter']  |newsletter/manage/    |//h1[contains(.,'Newsletter Subscription')] |
      |//li//a[.='Store Credit']|amstorecredit/        |//h1[contains(.,'Store Credit & Refunds')]  |
      |(//div[@id='clo-footer-nav']//a[.='Track Your Order'])[1]|sales/order/history/|//h1[contains(.,'My Orders')]|
      |//li//a[.='Log Out']     |customer/account/logoutSuccess/|//a[.='Sign In']    |

  @Positive @Regression @P1
  Scenario Outline: Menu Links Validation <menu> <submenu>
    Given I execute "Go to Clean Origin" reusable step
    Then I hover over the "<menu>" "Navigation Menu Item"
    And I wait for "1" seconds
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
      |DIAMONDS  |All Diamonds                 |diamonds/                                |//h2[contains(text(),'Diamonds')]|
      |ENGAGEMENT|ENGAGEMENT                   |engagement-rings/                        |//h2[contains(text(),'Engagement')][contains(text(),'Rings')]|
      |ENGAGEMENT|Start with a Ring             |engagement/                              |//h2[contains(text(),'Engagement')]|
      |ENGAGEMENT|Start with a Diamond         |diamonds/                                |//h2[contains(.,'Diamonds')]|
      |ENGAGEMENT|Shop All Engagement Rings    |engagement/                              |//h2[contains(text(),'Engagement')]|
      |ENGAGEMENT|Top Sellers                  |engagement/most-popular-engagement-rings/|//h2[contains(text(),'Our Most Popular Engagement Rings')]|
      |ENGAGEMENT|Quick Ship                   |solitaire-diamond-ring/                  |//h2[contains(text(),'Preset Solitaire Diamond Rings')]|
      |ENGAGEMENT|Solitaire                    |engagement/solitaire-engagement-rings/   |//h2[contains(.,'Solitaire Engagement Rings')]|
      |ENGAGEMENT|Halo                         |engagement/halo-engagement-rings/        |//h2[contains(.,'Halo')]|
      |ENGAGEMENT|Classic                      |engagement/classic-engagement-rings/     |//h2[contains(text(),'Classic')]|
      |ENGAGEMENT|Three-Stone                  |engagement/three-stone-engagement-rings/ |//h2[contains(text(),'Three-Stone Engagement Rings')]|
      |ENGAGEMENT|Vintage                      |vintage-style-engagement-rings/          |//h2[contains(text(),'Vintage')]|
      |ENGAGEMENT|Bridal Sets                  |bridal-sets/                             |//h2[contains(.,'Bridal Sets')]|
      |ENGAGEMENT|Unique                       |unique-engagement-rings/                 |//h2[contains(.,'Unique Engagement Rings')]|
      |ENGAGEMENT|White Gold                   |engagement/?metal_type[0]=14K+White+Gold&metal_type[1]=18K+White+Gold  |//span[@class='filter-value'][contains(.,'14K White Gold')]/following::span[contains(.,'18K White Gold')]|
      |ENGAGEMENT|Rose Gold                    |engagement/?metal_type=14K+Rose+Gold                                   |//span[@class='filter-value'][contains(.,'14K Rose Gold')]|
      |ENGAGEMENT|Yellow Gold                  |engagement/?metal_type[0]=14K+Yellow+Gold&metal_type[1]=18K+Yellow+Gold|//span[@class='filter-value'][contains(.,'14K Yellow Gold')]/following::span[contains(.,'18K Yellow Gold')]|
      |ENGAGEMENT|Platinum                     |engagement/?metal_type=Platinum                                        |//span[@class='filter-value'][contains(.,'Platinum')]|
      |ENGAGEMENT|For Us                       |non-binary-engagement-rings/|//h2[contains(text(),'CO For Us')]|
      |ENGAGEMENT|Art Deco Engagement Rings    |art-deco-engagement-rings/  |//h2[contains(text(),'Art Deco Engagement Rings')]|
      |ENGAGEMENT|East West Engagement Rings   |east-west-engagement-rings/ |//h2[contains(text(),'East-West')]|
      |ENGAGEMENT|Sapphire Engagement Rings    |sapphire-engagement-rings/  |//h2[contains(text(),'Sapphire Engagement Rings')]|
      |ENGAGEMENT|Minimalist Engagement Rings  |minimalist-engagement-rings/|//h2[contains(text(),'Modern Luxe Collection')]       |
      |ENGAGEMENT|Perfect Fit Collection       |perfect-fit-collection/     |//h2[contains(text(),'Perfect Fit')]|
      |ENGAGEMENT|Precision Collection         |precision-collection/       |//h2[contains(text(),'Precision Collection')]|
      |JEWELRY   |JEWELRY                      |ethical-jewelry/            |//h2[contains(text(),'Jewelry')]          |
      |JEWELRY   |Eternity Bands               |eternity-bands/             |//h2[contains(text(),'Eternity Rings')]  |
      |JEWELRY   |Anniversary Bands            |anniversary-bands/          |//h2[contains(text(),'Anniversary Rings')]  |
      |JEWELRY   |Stackable Bands              |stackable-bands/            |//h2[contains(text(),'Stackable Rings')] |
      |JEWELRY   |Promise Rings                |promise-rings/              |//h2[contains(text(),'Promise Rings')] |
      |JEWELRY   |Diamond Stud Earrings        |diamond-stud-earrings/      |//h2[contains(text(),'Diamond Stud Earrings')]|
      |JEWELRY   |Diamond Earrings             |jewelry/diamond-earrings/   |//h2[contains(text(),'Diamond Earrings')]|
      |JEWELRY   |Blue Diamond Earrings        |blue-diamond-earrings/      |//h2[contains(text(),'Blue Diamond Earrings')]|
      |JEWELRY   |Pink Diamond Earrings        |pink-diamond-earrings/      |//strong[contains(text(),'Pink Diamond Earrings')]|
      |JEWELRY   |Tennis Bracelets             |jewelry/tennis-bracelets/   |//h2[contains(text(),'Diamond Tennis Bracelets')]|
      |JEWELRY   |All Bracelets                |jewelry/diamond-bracelets/  |//h2[contains(text(),'Diamond Bracelets')]|
      |JEWELRY   |Tennis Necklaces             |jewelry/diamond-tennis-necklaces/|//h2[contains(text(),'Diamond Tennis Necklaces')]|
      |JEWELRY   |Pendants                     |jewelry/diamond-pendants/   |//h2[contains(text(),'Diamond Pendant')]|
      |JEWELRY   |All Necklaces                |jewelry/diamond-pendants/   |//h2[contains(text(),'Diamond Pendant')]|
      |JEWELRY   |CO Bridal Suite              |jewelry/bridal-jewelry/     |//h2[contains(text(),'CO Bridal Suite')]|
      |JEWELRY   |Essentials Collection        |classic-diamond-jewelry/    |//h2[contains(text(),'Essentials Collection')]|
      |JEWELRY   |Colored Diamond Jewelry      |colored-diamond-jewelry/    |//h2[contains(text(),'Colored Diamond Jewelry')]|
      |JEWELRY   |Top Sellers                  |colored-diamond-jewelry/    |//h2[contains(text(),'Colored Diamond Jewelry')]|
      |JEWELRY   |All Jewelry                  |jewelry/                    |//h2[contains(text(),'Diamond Jewelry')]|
      |WEDDING   |WEDDING                      |wedding-rings/              |//h2[contains(.,'Wedding Rings')]|
      |WEDDING   |Bridal Suite                 |jewelry/bridal-jewelry/     |//h2[contains(.,'CO Bridal Suite')]|
      |WEDDING   |For Us                       |non-binary-engagement-rings/|//h2[contains(text(),'CO For Us')]|
      |WEDDING   |Top Sellers                  |wedding/most-popular-wedding-rings/|//h2[contains(text(),'Best Selling Wedding Rings')]|
      |WEDDING   |Shop All Wedding             |wedding/wedding-rings/      |//h2[contains(text(),'Wedding Rings')]|
      |WEDDING   |Anniversary                  |wedding/anniversary-bands/  |//h2[contains(text(),'Anniversary Rings')]|
      |WEDDING   |Eternity                     |wedding/eternity-rings/     |//h2[contains(text(),'Eternity Rings')]|
      |WEDDING   |5 & 7 Stone                  |wedding/7-and-5-stone-diamond-rings/|//h2[contains(text(),'7 & 5 Stone Diamond Rings')]|
      |WEDDING   |Contour                      |wedding/curved-wedding-bands/|//h2[contains(text(),'Contour Wedding Bands')]|
      |WEDDING   |Unique                       |wedding/unique-wedding-rings/|//h2[contains(text(),'Unique Wedding Rings')]|
      |WEDDING   |Plain                        |wedding/plain-wedding-bands/|//h2[contains(text(),'Plain Wedding Bands')]|
      |WEDDING   |Stackable                    |jewelry/stackable-rings/    |//h2[contains(text(),'Stackable Rings')]|
      |WEDDING   |s Diamond Rings              |wedding/mens-diamond-wedding-bands/|//h2[contains(text(),'Men')][contains(text(),'Diamond Wedding Bands')]|
      |WEDDING   |s Plain Rings                |wedding/mens-plain-wedding-bands/|//h2[contains(text(),'Mens Gold Wedding Bands')]|
      |Our Story |Press                        |in-the-press/               |//h2[contains(.,'In The Press')]   |
      |Our Story |Our Story                    |our-story/                  |//h2[contains(.,'Our Story')]|
      |Our Story |Compare                      |comparison/                 |//h2[contains(.,'How do we compare?')]                                |
      |Our Story |Blog                         |blog/                       |//h1[contains(.,'Blog')]             |
      |Our Story |Reviews                      |reviews/                    |//span[contains(@class,'yotpo-logo-title')]           |
      |Support   |Free Shipping                |shipping-policy/            |//strong[text()='Customer Service > Shipping']     |
      |Support   |100 Day Return Policy        |return-policy/              |//strong[text()='Customer Service > Return Policy']|
      |Support   |Forever Service Plan         |customer-service/forever-service-plan/|//strong[text()='Customer Service > Forever Service Plan']|
      |Support   |Independent Lab Certification|independently-certified/    |//strong[text()='Independently Certified']|
      |Support   |Free Resizing                |resizing-policy/            |//strong[text()='Customer Service > Resizing']|
      |Support   |FAQs                         |faq/                        |//strong[text()='Customer Service > FAQ']|
      |Support   |Lifetime Warranty            |warranty/                   |//strong[text()='Customer Service > Warranty']|
      |Support   |Financing With Affirm        |customer-service/affirm-financing/|//strong[text()='Customer Service > Affirm Financing']|
      |Support   |Progressive Leasing          |customer-service/progressive-leasing/|//strong[text()='Customer Service > Progressive Leasing']|
      |Support   |Track Your Order             |customer-service/track-order/|//strong[text()='Customer Service > Track Order']|
      |Support   |Virtual Appointments         |virtual-appointments/       |//h2[contains(text(),'Virtual Appointments')]|
      |Support   |Dallas Showroom              |jewlery-stores/dallas-tx-75034/|//h2[contains(text(),'Clean Origin Dallas Showroom')]|
      |Education |Lab Grown Diamonds           |about-lab-created-diamonds/|//h2[contains(text(),'Lab Grown Diamonds')] |
      |Education |Conflict Free Diamonds       |conflict-free-diamonds/    |//h2[contains(text(),'Conflict Free Diamonds')]|
      |Education |s of Diamonds                |diamonds-4cs/              |//h2[contains(text(),'The 4 C')][contains(.,'s of Diamonds')] |
      |Education |Hearts & Arrows              |hearts-and-arrows/         |//h2[contains(text(),'Hearts and Arrows by Clean Origin')]|
      |Education |Ideal Love Diamonds          |ideal-love/                |//strong[text()='Ideal Love']                  |
      |Education |Engagement Ring Style Guide  |engagement-ring-styles/    |//h2[contains(text(),'Engagement Ring Styles')]|
      |Education |Find Her Ring Size           |find-her-ring-size/        |//h2[contains(text(),'Ring Size Chart')]|
      |Education |The Perfect Ring             |how-to-shop/               |//h2[contains(text(),'Engagement Ring Guide')]|
      |Education |Sustainable Recycled Materials|recycled-metals-guide/    |//h2[contains(text(),'Recycled Metals Guide')]|
      |Education |Mined Diamonds               |about-mined-diamonds/      |//h2[contains(text(),'Mined Diamonds')]        |