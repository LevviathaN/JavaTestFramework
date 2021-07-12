package ui.utils;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.sheets.v4.Sheets;
import com.google.api.services.sheets.v4.SheetsScopes;
import com.google.api.services.sheets.v4.model.*;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


/**
 * Class provides basic methods to work with Google Spreadsheets
 * @author ruslanlevytskyi
 * */
public class SpreadsheetsAPI {
    private static final String APPLICATION_NAME = "BPP Automation";
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
    private static String TOKENS_DIRECTORY_PATH = "tokens";
    private static Sheets service;
    public static String app;

    /**
     * Global instance of the scopes required by this quickstart.
     * If modifying these scopes, delete your previously saved tokens/ folder.
     */
    private static List<String> SCOPES = Arrays.asList(SheetsScopes.SPREADSHEETS,SheetsScopes.DRIVE);
    private static String CREDENTIALS_FILE_PATH = "/credentials.json";

    /**
     * Creates an authorized Credential object.
     * @param HTTP_TRANSPORT The network HTTP Transport.
     * @return An authorized Credential object.
     */
    private static Credential getCredentials(final NetHttpTransport HTTP_TRANSPORT) {
        CREDENTIALS_FILE_PATH = "/credentials" + app + ".json";
        TOKENS_DIRECTORY_PATH = "tokens/" + app;
        // Load client secrets.
        try {
            InputStream in = SpreadsheetsAPI.class.getResourceAsStream(CREDENTIALS_FILE_PATH);
            if (in == null) {
                throw new FileNotFoundException("Resource not found: " + CREDENTIALS_FILE_PATH);
            }
            GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

            // Build flow and trigger user authorization request.
            GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                    HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
                    .setDataStoreFactory(new FileDataStoreFactory(new java.io.File(TOKENS_DIRECTORY_PATH)))
                    .setAccessType("offline")
                    .build();
            LocalServerReceiver receiver = new LocalServerReceiver.Builder().setPort(8888).build();
            return new AuthorizationCodeInstalledApp(flow, receiver).authorize("user");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    /**
     * Method to get values from spreadsheet
     * @param range range to insert data into. Wrritten in A1 notation (Test!B2:D5)
     * @param spreadsheetId is a part of spreadsheet URL
     * @return values array, represented by list of lists (inner lists represents rows)
     * */
    public static List<List<Object>> getValues(String range, String spreadsheetId) {
        try {
            ValueRange response = service.spreadsheets().values()
                    .get(spreadsheetId, range)
                    .execute();
            List<List<Object>> values = response.getValues();
            if (values == null || values.isEmpty()) {
                System.out.println("No data found.");
                return null;
            } else {
//                System.out.println("Test Name");
//                for (List row : values) {
//                    if(!row.isEmpty()){
//                        System.out.println(row.get(0));
//                    }
//                }
                return values;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Method to write list of values into specified range of spreadsheet
     * @param range range to insert data into. Wrritten in A1 notation (Test!B2:D5)
     * @param spreadsheetId is a part of spreadsheet URL
     * @param valuesToUpdate values to be iserted, represented by list of list (inner lists represents rows)
     * */
    public static UpdateValuesResponse updateTable(String range, String spreadsheetId, List<List<Object>> valuesToUpdate) {
        try {
            ValueRange body = new ValueRange()
                    .setValues(valuesToUpdate);
            UpdateValuesResponse result =
                    service.spreadsheets().values().update(spreadsheetId, range, body)
                            .setValueInputOption("RAW")
                            .execute();
            System.out.printf("%d cells updated.", result.getUpdatedCells());
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Method to copy values from one range of spreadsheet to another
     * todo: still in development
     * */
    public static void copyPaste(String spreadsheetId) {
        try {
            List<Request> requests = new ArrayList<>();
            requests.add(new Request()
                    .setCopyPaste(new CopyPasteRequest()
                            .setSource(new GridRange()
                                    .setSheetId(0)
                                    .setStartColumnIndex(1)
                                    .setStartRowIndex(1)
                                    .setEndColumnIndex(1)
                                    .setEndRowIndex(10))
                            .setDestination(new GridRange()
                                    .setSheetId(0)
                                    .setStartColumnIndex(15)
                                    .setStartRowIndex(1)
                                    .setEndColumnIndex(15)
                                    .setEndRowIndex(10))
                            .setPasteType("PASTE_NORMAL")
                            .setPasteOrientation("NORMAL")));

            BatchUpdateSpreadsheetRequest body = new BatchUpdateSpreadsheetRequest().setRequests(requests);
            BatchUpdateSpreadsheetResponse copyPasteResponse = service.spreadsheets().batchUpdate(spreadsheetId, body).execute();
            for (Response rspns : copyPasteResponse.getReplies()) {
                System.out.println(rspns.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
//            return null;
        }
    }

    /**
     * Build a new authorized API client service.
     */
    public static void initiate() {
        try {
            final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
            service = new Sheets.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                    .setApplicationName(APPLICATION_NAME)
                    .build();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}