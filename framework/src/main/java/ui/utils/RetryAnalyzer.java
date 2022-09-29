package ui.utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.testng.IRetryAnalyzer;
import org.testng.ITestResult;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

public class RetryAnalyzer implements IRetryAnalyzer {

    //todo: idea. Adaptive retry: add few seconds timeout before failed step in test
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

    public static void createReportForAllDiamondsTest() {
        String reportFolderPath = Reporter.getReportPath().toString();
        String filePath = reportFolderPath.concat("/report.html");
        String diamondPriceMismatchReportPath = reportFolderPath.concat("/diamondPriceMismatchReport.txt");
        String diamondSoldOutReportPath = reportFolderPath.concat("/diamondSoldOutReport.txt");
        String diamondEmptyPdpPriceReportPath = reportFolderPath.concat("/diamondEmptyPdpPriceReport.txt");
        StringBuilder confirmedMismatchBuilder = new StringBuilder();
        StringBuilder soldOutBuilder = new StringBuilder();
        StringBuilder emptyPdpPriceBuilder = new StringBuilder();

        try {
            File inputFile = new File(filePath);
            org.jsoup.nodes.Document doc = Jsoup.parse(inputFile, "utf-8");
            Elements testNameElements = doc.getElementsByClass("step-details");
            for (org.jsoup.nodes.Element element : testNameElements) {
                if (element.text().contains("Mismatch.")) {
                    if (element.text().contains("Mismatch. Element $")) {
                        confirmedMismatchBuilder.append(element.text()).append("\n");
                    } else {
                        emptyPdpPriceBuilder.append(element.text()).append("\n");
                    }
                }
                if (element.text().contains("Capturing current url as EC_SOLD_OUT_URL")) {
                    soldOutBuilder.append(element.parents().first().nextElementSibling().child(2).text()).append("\n");
                }
            }
            FileWriter writer = new FileWriter(diamondPriceMismatchReportPath, false);
            writer.write(confirmedMismatchBuilder.toString());
            writer.flush();

            FileWriter writer2 = new FileWriter(diamondSoldOutReportPath, false);
            writer2.write(soldOutBuilder.toString());
            writer2.flush();

            FileWriter writer3 = new FileWriter(diamondEmptyPdpPriceReportPath, false);
            writer3.write(emptyPdpPriceBuilder.toString());
            writer3.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
