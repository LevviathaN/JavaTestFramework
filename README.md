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


For linux based Jenkins add 'Execute shell' step as the first step of the build, and enter following commands:
mvn install:install-file -Dfile=$WORKSPACE/framework/src/main/resources/data/bpp/openjfx-78-backport-1.8.0-ea-b96.1.jar -DgroupId=net.java.openjfx.backport -DartifactId=openjfx-78-backport -Dversion=1.8.0-ea-b96.1 -Dpackaging=jar
mvn install:install-file -Dfile=$WORKSPACE/framework/src/main/resources/data/bpp/DataManagementUtil-2.8.2.jar -DgroupId=DataGen -DartifactId=DataManagementUtil -Dversion=2.8.2 -Dpackaging=jar
mvn install:install-file -Dfile=$WORKSPACE/framework/src/main/resources/data/bpp/