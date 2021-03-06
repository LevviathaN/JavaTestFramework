package utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * Created by Ruslan Levytskyi on 05.07.19.
 */

public class CsvReader {

    private static final char DEFAULT_SEPARATOR = ',';
    private static final char DEFAULT_QUOTE = '"';

    private static File fCsvFile;
    private static Scanner scanner;
    private static List<String> headers;

    public CsvReader(String file){
        try{
            fCsvFile = new File(file);
            scanner = new Scanner(fCsvFile);
            headers = parseLine(scanner.nextLine(),'|');
        } catch(Exception e){
            e.printStackTrace();
        }
    }

    public void getHeaders(){
        for(String header : headers){
            System.out.println(header);
        }
    }

    public void CSV() {

        while (scanner.hasNext()) {
            List<String> line = parseLine(scanner.nextLine(),'|');
            System.out.println("Country [id= " + line.get(0) + ", code= " + line.get(1) + " , name=" + line.get(2) + "]");
        }
        scanner.close();

    }

    //_______________________Main Methods________________________
    public void getAllDistinctValues(String column){

    }

    public String getValue(String keyCol, String keyValue, String targetCol){
        String targetVal = "";
        while (scanner.hasNext()) {
            List<String> line = parseLine(scanner.nextLine(),'|');
            if(line.get(headers.indexOf(keyCol)).equals(keyValue)){
                targetVal = line.get(headers.indexOf(targetCol));
            }
        }
        scanner.close();
        return targetVal;
    }

    public List<String> getValues(String keyCol, String keyValue, String targetCol){
        List<String> targetVals = new ArrayList<>();
        while (scanner.hasNext()) {
            List<String> line = parseLine(scanner.nextLine(),'|');
            if(line.get(headers.indexOf(keyCol)).equals(keyValue)){
                    targetVals.add(line.get(headers.indexOf(targetCol)));
            }
        }
        scanner.close();
        return targetVals;
    }

    //_______________________Base Methods________________________
    public static List<String> parseLine(String cvsLine) {
        return parseLine(cvsLine, DEFAULT_SEPARATOR, DEFAULT_QUOTE);
    }

    public static List<String> parseLine(String cvsLine, char separators) {
        return parseLine(cvsLine, separators, DEFAULT_QUOTE);
    }

    public static List<String> parseLine(String cvsLine, char separators, char customQuote) {

        List<String> result = new ArrayList<>();

        //if empty, return!
        if (cvsLine == null && cvsLine.isEmpty()) {
            return result;
        }

        if (customQuote == ' ') {
            customQuote = DEFAULT_QUOTE;
        }

        if (separators == ' ') {
            separators = DEFAULT_SEPARATOR;
        }

        StringBuffer curVal = new StringBuffer();
        boolean inQuotes = false;
        boolean startCollectChar = false;
        boolean doubleQuotesInColumn = false;

        char[] chars = cvsLine.toCharArray();

        for (char ch : chars) {

            if (inQuotes) {
                startCollectChar = true;
                if (ch == customQuote) {
                    inQuotes = false;
                    doubleQuotesInColumn = false;
                } else {

                    //Fixed : allow "" in custom quote enclosed
                    if (ch == '\"') {
                        if (!doubleQuotesInColumn) {
                            curVal.append(ch);
                            doubleQuotesInColumn = true;
                        }
                    } else {
                        curVal.append(ch);
                    }

                }
            } else {
                if (ch == customQuote) {

                    inQuotes = true;

                    //Fixed : allow "" in empty quote enclosed
                    if (chars[0] != '"' && customQuote == '\"') {
                        curVal.append('"');
                    }

                    //double quotes in column will hit this!
                    if (startCollectChar) {
                        curVal.append('"');
                    }

                } else if (ch == separators) {

                    result.add(curVal.toString());

                    curVal = new StringBuffer();
                    startCollectChar = false;

                } else if (ch == '\r') {
                    //ignore LF characters
                    continue;
                } else if (ch == '\n') {
                    //the end, break!
                    break;
                } else {
                    curVal.append(ch);
                }
            }

        }

        result.add(curVal.toString());

        return result;
    }

}
