package ui.utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.testng.IRetryAnalyzer;
import org.testng.ITestResult;

import java.io.File;
import java.io.FileWriter;
import java.util.concurrent.ConcurrentHashMap;

public class RetryAnalyzer implements IRetryAnalyzer {

    public static ConcurrentHashMap<String, Integer> counterMap = new ConcurrentHashMap<>();
    public static ConcurrentHashMap<String, String> passMap = new ConcurrentHashMap<>();
    public static int limit = Integer.parseInt(Tools.determineEffectivePropertyValue("retryExecutionLimit"));

    public synchronized boolean retry(ITestResult result) {
        String scenarioName;
        String actualScenarioName = Reporter.getCurrentTestName();
        if (actualScenarioName.contains("attempt")) {
            scenarioName = actualScenarioName.substring(0, actualScenarioName.length() - 10);
        } else {
            scenarioName = actualScenarioName;
        }
        if (!counterMap.containsKey(scenarioName)) {
            counterMap.put(scenarioName, 1);
        } else {
            counterMap.replace(scenarioName, counterMap.get(scenarioName) + 1);
        }
        return counterMap.get(scenarioName) <= limit;
    }

    public static void deletePreviousAttemptsFromHtmlReport() {
        String filePath = Reporter.getReportPath().toString().concat("/report.html");

        for (String testName : passMap.keySet()) {
            try {
                File inputFile = new File(filePath);
                org.jsoup.nodes.Document doc = Jsoup.parse(inputFile, "utf-8");
                Elements testNameElements = doc.getElementsByClass("test-name");
                for (org.jsoup.nodes.Element element : testNameElements) {
                    if (element.text().contains(testName)) {
                        Element testNode = element.parents().first().parents().first();
                        if (testNode.attr("status").equals("fail")) {
                            if (passMap.get(testName).equals("pass")) {
                                testNode.remove();
                            } else if (passMap.get(testName).equals("fail")) {
                                if (!element.text().contains("attempt_" + limit)) {
                                    testNode.remove();
                                }
                            }
                        }
                    }
                }
                inputFile.delete();
                FileWriter writer = new FileWriter(filePath, false);
                writer.write(doc.outerHtml());
                writer.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
