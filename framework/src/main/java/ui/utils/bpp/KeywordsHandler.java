package ui.utils.bpp;

import datageneration.keywords.KeywordManager;
import ui.utils.BPPLogManager;
import ui.utils.Reporter;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.util.Date;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

//import ui.utils.bpp.NoahLogManager;
//import ui.utils.bpp.Reporter;

/**
 * Functionality requested in AGQA-813
 * @author nick
 * <p>The class is used for handling the keywords passed as test parameters.
 * This class is implemented using the DataManagementUtil-2.8.2 library provided by UTOPIA SOLUTIONS </p>
 */

public class KeywordsHandler {

    private static KeywordManager keywordManager = null;
    private static final Path KEYWORDS_FILE_PATH = Paths.get(PreProcessFiles.METADATA_AND_KEYWORDS_FILES_FOLDER_PATH + "/keywords");

    public static void instantiate(){
        try {
            keywordManager = new KeywordManager(KEYWORDS_FILE_PATH);
        } catch (NullPointerException e1) {
            BPPLogManager.getLogger().error("Failed to read keywords file located in the " + KEYWORDS_FILE_PATH.toString());
            Reporter.fail("Failed to read keywords file located in the " + KEYWORDS_FILE_PATH.toString()
                    + "<br>Please read the log file to get more information");
            throw new NullPointerException();
        }
    }

    public static String getValueByKeyword(String keyword) {
        try {
            if (keywordManager.isKeyword(keyword)) {
                return keywordManager.getKeyword(keyword).convertKeyword();
            } else {
                BPPLogManager.getLogger().warn(("Requested " + keyword + " keyword is absent. Please check the keywords and/or test spreadsheets."));
                return keyword;
            }
        } catch (Exception e2) {
            BPPLogManager.getLogger().error("Failed to generate a value by provided keyword: " + keyword
                    + ". The most likely that the path to the needed .dat file is wrong. Or an issue occurred during the .dat file reading");
            Reporter.fail("Failed to generate a value by provided keyword: " + keyword
                    + ". The most likely that the path to the needed .dat file is wrong. Or an issue occurred during the .dat file reading" +
                    "<br>Please read the log file to get more information");
            throw new NullPointerException();
        }
    }

    /**
     * Functionality to generate unique RUT number for UNIACC university,
     * more details about requirements for RUT can be found here: https://jira.apolloglobalit.com/browse/CRM-4622
     * https://jira.apolloglobalit.com/browse/AGC-378
     */
    public static String randomRutNumber() {
        Random random = new Random();
        int i = random.nextInt(900000000) + 100000000;
        char[] s = Integer.toString(i).toCharArray();

        int digit1 = Character.getNumericValue(s[0]) * 4;
        int digit2 = Character.getNumericValue(s[1]) * 3;
        int digit3 = Character.getNumericValue(s[2]) * 2;
        int digit4 = Character.getNumericValue(s[3]) * 7;
        int digit5 = Character.getNumericValue(s[4]) * 6;
        int digit6 = Character.getNumericValue(s[5]) * 5;
        int digit7 = Character.getNumericValue(s[6]) * 4;
        int digit8 = Character.getNumericValue(s[7]) * 3;
        int digit9 = Character.getNumericValue(s[8]) * 2;

        int sum = digit1 + digit2 + digit3 + digit4 + digit5 + digit6 + digit7 + digit8 + digit9;
        int tempSum = sum / 11;
        int remainder = sum - (tempSum * 11);
        int checkLastDigit = 11 - remainder;

        if (checkLastDigit == 10) {
            return i + "-k";
        } else if (checkLastDigit == 11){
            return i + "-0";
        }
        else {
            return i + "-" + checkLastDigit;
        }
    }
}