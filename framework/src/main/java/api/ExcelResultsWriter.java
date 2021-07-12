package api;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import ui.utils.GlobalDataBridge;

import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

/**
 * @author astepaniuk
 * <p>
 * The class write data from JSON response into excel file
 * </p>
 */
public class ExcelResultsWriter {

    static void createApiExcel() {

        FileOutputStream fileOut = null;
        Workbook workbook = new XSSFWorkbook();

        Font headerFont = workbook.createFont();
        headerFont.setBold(true);
        headerFont.setFontHeightInPoints((short) 13);
        headerFont.setColor(IndexedColors.RED.getIndex());
        headerFont.setFontName("Times New Roman");

        getDataInMap().entrySet().forEach(key -> {

            Sheet sheet = workbook.createSheet(key.getKey());

            CellStyle headerCellStyle = workbook.createCellStyle();
            headerCellStyle.setFont(headerFont);

            Row headerRow = sheet.createRow(0);

            ArrayList<String> list = getColumnHeaders(key.getKey());

            list.forEach(listItem -> {
                Cell cell = headerRow.createCell(list.indexOf(listItem));
                cell.setCellValue(listItem);
                cell.setCellStyle(headerCellStyle);
            });

            int rowNum = 1;

            for (ArrayList<String> individualRow : key.getValue()) {

                Row row = sheet.createRow(rowNum++);
                for (int i = 0; i < 100; i++) {
                    sheet.autoSizeColumn(i);
                }

                int cellNum = 0;

                for (String listItem : individualRow) {
                    row.createCell(cellNum++).setCellValue(listItem);
                }
            }
        });

        try {
            fileOut = new FileOutputStream( System.getProperty("user.dir") + "/report" +"//generated-data.xlsx");
            workbook.write(fileOut);
            fileOut.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }

    }

    private static HashMap<String, ArrayList<ArrayList<String>>> getDataInMap() {

        Set<String> set = new HashSet<>();

        HashMap<String, Object> global = GlobalDataBridge.getInstance().getDataBuffer();

        if (global != null) {
            global.entrySet().forEach(entry -> {
                set.add(entry.getKey().replaceAll("[0-9]", ""));
            });
        }

        HashMap<String, ArrayList<ArrayList<String>>> hash = new HashMap<>();

        for (String iterator : set) {

            ArrayList<ArrayList<String>> list = new ArrayList<>();

            global.entrySet().forEach(y -> {
                if (y.toString().contains(iterator)) {
                    list.add((ArrayList<String>) y.getValue());
                }
            });

            hash.put(iterator, list);
        }

        return hash;
    }

    private static ArrayList<String> getColumnHeaders(String schema) {

        JSONParser parser = new JSONParser();

        StringBuilder path = new StringBuilder();
        path.append(System.getProperty("user.dir"));
        path.append("/src/main/resources/");
        path.append("excel-header-template.json");

        try (FileReader reader = new FileReader(path.toString())) {

            JSONObject obj = (JSONObject) parser.parse(reader);

            return (ArrayList<String>) obj.get(schema);

        } catch (ParseException | IOException ex) {
            ex.printStackTrace();
        }

        return null;
    }
}
