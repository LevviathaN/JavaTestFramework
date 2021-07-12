package ui.utils;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.util.*;

/**
 * Class created to handle high-level operations with Google Spreadsheets
 * @author ruslanlevytskyi
 * */
public class SpreadsheetsHelper {

    private static final String SPREADSHEET_ID = "1Ji59wwrYIBa88zKEWIJRRSJGsbpVVR3trT9cRyeVyEQ";
    //A map of literal and numeric ordinal numbers of spreadsheet columns
    private static Map<Integer,String> columns;
    private static Map<String,String> squads;
    public static long executionTime = 0;
    public static void initializeColumns() {
        squads = new HashMap<>();
        squads.put("ProductFactory","Terra");
        squads.put("Salesforce","Titan");
        squads.put("BuildEmpire","Venus");
        columns = new HashMap<>();
        columns.put(1,"A");
        columns.put(2,"B");
        columns.put(3,"C");
        columns.put(4,"D");
        columns.put(5,"E");
        columns.put(6,"F");
        columns.put(7,"G");
        columns.put(8,"H");
        columns.put(9,"I");
        columns.put(10,"J");
        columns.put(11,"K");
        columns.put(12,"L");
        columns.put(13,"M");
        columns.put(14,"N");
        columns.put(15,"O");
        columns.put(16,"P");
        columns.put(17,"Q");
        columns.put(18,"R");
        columns.put(19,"S");
        columns.put(20,"T");
        columns.put(21,"U");
        columns.put(22,"V");
        columns.put(23,"W");
        columns.put(24,"X");
        columns.put(25,"Y");
        columns.put(26,"Z");
    }

    public static String getColumnName(int inputNumber) {
        String columnName = "";
        if (inputNumber < 26) {
            columnName = columns.get(inputNumber);
        } else {
            while (inputNumber > 26) {
                columnName = columnName + columns.get(inputNumber % 26);
                inputNumber = inputNumber / 26;
            }
            columnName = columnName + columns.get(inputNumber);
        }
        return new StringBuilder(columnName).reverse().toString();
    }

    public static void updateRegressionResults(String application) {
        //getting all regression dates
        List<List<Object>> values = SpreadsheetsAPI.getValues(squads.get(application) + "!A1:1",SPREADSHEET_ID);
        int qtt = values.get(0).size();
        String last = values.get(0).get(qtt-1).toString();
        System.out.println(last);

        //getting all tests from the spreadsheet
        List<List<Object>> testNamesColumn = SpreadsheetsAPI.getValues(squads.get(application) + "!B2:B",SPREADSHEET_ID);
        List<String> testNames = new ArrayList<>();
        for (List<Object> row : testNamesColumn) {
            if (!row.isEmpty()) {
                testNames.add(row.get(0).toString());
            }
        }

        //getting report date
        String filePath = Reporter.getReportPath().toString();
        String[] path = filePath.split("_");
        String date = path[1];
        String[] dateFrag = date.split("-");
        String correctDate = dateFrag[2] + "." + dateFrag[1] + "." + dateFrag[0];

        //getting execution duration
        long second = (executionTime / 1000) % 60;
        long minute = (executionTime / (1000 * 60)) % 60;
        long hour = (executionTime / (1000 * 60 * 60)) % 24;
        String time = String.format("%02d:%02d:%02d", hour, minute, second);

        //checking actuality of tests in spreadsheet
        Map<String,String> testResults = RetryAnalyzer.passMap;
        List<List<Object>> valuesToUpdate = new ArrayList<>();
        valuesToUpdate.add(Arrays.asList(correctDate));
        valuesToUpdate.add(Arrays.asList(time));
        List<String> availableScenarios = getAvailableTests(application);
        List<String> excessTestsSpreadsh = new ArrayList<>();
        for (String name : testNames) {
            if (testResults.containsKey(name)) {
                valuesToUpdate.add(Arrays.asList(testResults.get(name).substring(0, 1).toUpperCase() + testResults.get(name).substring(1) + "ed"));
                testResults.remove(name);
            } else {
                valuesToUpdate.add(Arrays.asList("N/A"));
            }
            if (availableScenarios.contains(name)) {
                availableScenarios.remove(name);
            } else {
                excessTestsSpreadsh.add(name);
            }
        }

        //Console log about actuality of test cases in spreadsheet
        if (!excessTestsSpreadsh.isEmpty()) {
            System.out.println("\n_________________________________________________________________");
            System.out.println("Following tests availale in framework, but absent in spreadsheet:\n");
            for (String name : availableScenarios) {
                System.out.println(name);
            }
            System.out.println("_________________________________________________________________");
        }

        if (!excessTestsSpreadsh.isEmpty()) {
            System.out.println("\n_________________________________________________________________");
            System.out.println("Following tests availale in spreadsheet, but absent in framework:\n");
            for (String name : excessTestsSpreadsh) {
                System.out.println(name);
            }
            System.out.println("_________________________________________________________________");
        }

        if (!testResults.isEmpty()) {
            System.out.println("\n_________________________________________________________________");
            System.out.println("Following test results was not updated due to absence in spreadsheet:\n");
            for (String name : testResults.keySet()) {
                System.out.print(name);
                System.out.println(" - " + testResults.get(name));
            }
            System.out.println("_________________________________________________________________");
        }

        //writing date and results right after last regression column in spreadsheet
        SpreadsheetsAPI.updateTable(squads.get(application) + "!" + getColumnName(qtt+1) + "1",SPREADSHEET_ID, valuesToUpdate);
    }

    public static void manageSpreadsheet(String application) {
        SpreadsheetsAPI.app = application;
        initializeColumns();
        SpreadsheetsAPI.initiate();
        updateRegressionResults(application);
    }

    /**
     * Get list of all test cases created in framework
     * todo currently only for PF
     * @return list of steps of reusable scenario with specified name
     * @author Ruslan Levytskyi
     */
    private static synchronized List<String> getAvailableTests(String application) {

        List<String> availableReusableStepsList = new ArrayList<>();

        try {
            File inputFile = new File("src/main/resources/data/bpp/PFScenarios.xml");
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(inputFile);
            doc.getDocumentElement().normalize();
            availableReusableStepsList = new ArrayList<>();

            Node reusablesNode = doc.getElementsByTagName("scenarios").item(0);
            Element reusablesElement = (Element) reusablesNode;

            NodeList reusablesList = reusablesElement.getElementsByTagName("scenario");
            for (int i = 0; i < reusablesList.getLength(); i++) {
                Node reusableNode = reusablesList.item(i);
                Element reusableElement = (Element) reusableNode;
                NodeList tagsList = reusableElement.getElementsByTagName("tag");
                boolean correctApp = false;
                for (int j = 0; j < tagsList.getLength(); j++) {
                    Node tag = tagsList.item(j);
                    correctApp = tag.getTextContent().contains(application) || correctApp;
                }
                if (correctApp) availableReusableStepsList.add(reusableElement.getAttribute("name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return availableReusableStepsList;
    }
}
