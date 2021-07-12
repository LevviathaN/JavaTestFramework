# TS_AutoTests
In project tree navigate to /src/test/java/cucumber/CucumberUITest.java and open it
Click Play button to the right from code window, to create default run configuration. It will fail, as expected.
In top-right of the window click on dropdown to the right from CucumberUITest.runScenario, and select 'Edit Configuration'
In VM options field paste: -Ddriver=BSTACK_CHROME -Dcucumber.options="--tags @ProductFactory" (if you want to run another application on UAT for example, then you should write -Ddriver=BSTACK_CHROME
-Dcucumber.options="--tags @Salesforce" -Denvironment=UAT)
or: -Ddriver=MOBILE_IOS
    -Dcucumber.options="--tags @Pages --tags @VPE"
    -Denvironment=UAT
    -Ddevice="iPhone XS"
