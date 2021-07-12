package ui.utils.bpp;

import datageneration.metadata.MetaData;
import datageneration.metadata.MetaDataManager;
import ui.utils.BPPLogManager;
import ui.utils.Reporter;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Set;
import java.util.TreeSet;

//import ui.utils.bpp.NoahLogManager;
//import ui.utils.bpp.Reporter;

/**
 * Functionality requested in AGQA-813
 * Created by Nick B.
 * <p>The class is used for handling the metadata passed as test parameters.
 * This class is implemented using the DataManagementUtil-1.5.1 library provided by UTOPIA SOLUTIONS.
 * Note: The class handles two scenarios when metadata key cannot be used:
 * - when metadata key is misspelled in the excel file where the tests are defined;
 * - when metadata file(s) is(are) missing required data;</p>
 */

public class MetaDataHandler {

    private static MetaDataManager metaDataManager = null;
    private static final Path METADATA_FILE_PATH = Paths.get(PreProcessFiles.METADATA_AND_KEYWORDS_FILES_FOLDER_PATH + "/metadata");
    private static final Path METADATA_PRODUCTION_FILE_PATH = Paths.get(PreProcessFiles.METADATA_AND_KEYWORDS_FILES_FOLDER_PATH + "/metadata/production");
    private static final Path METADATA_UAT_FILE_PATH = Paths.get(PreProcessFiles.METADATA_AND_KEYWORDS_FILES_FOLDER_PATH + "/metadata/UAT");
    private static final String PREFIX = "MD_";
    private static Set<String> metadataKeysSet = null;

    public static void instantiate() {
        try {
            if (System.getProperties().containsKey("environment") && System.getProperty("environment").equalsIgnoreCase("Production")) {
                metaDataManager = new MetaDataManager(METADATA_PRODUCTION_FILE_PATH, PREFIX);
            } else if (System.getProperties().containsKey("environment") && System.getProperty("environment").equalsIgnoreCase("UAT")) {
                metaDataManager = new MetaDataManager(METADATA_UAT_FILE_PATH, PREFIX);
            } else {
                metaDataManager = new MetaDataManager(METADATA_FILE_PATH, PREFIX);
            }
        } catch (NullPointerException e) {
            BPPLogManager.getLogger().error("Failed to read metadata file located in the " + METADATA_FILE_PATH.toString());
            //reporter.fail("Failed to read metadata file located in the " + METADATA_FILE_PATH.toString() + "<br>Please read the log file to get more information");
            throw new NullPointerException("Failed to read metadata file.");
        }
    }

    /**
     * @param metadataKey - the metadata name that comes from test excel sheet
     * @return the value that was got by metadata name of such metadata exists. Otherwise it returns the same metadata name back
     */
    public static synchronized String getMetaDataValue(String metadataKey) {
        if ((metadataKeyExists(metadataKey))) {
            return metaDataManager.getMetaData(metadataKey).getValue();
        } else {
            BPPLogManager.getLogger().error("Requested " + metadataKey + " metadata key is absent.\n\t\tPossible reasons are:\n" +
                    "\t\t- the requested key is misspelled" +
                    "\n\t\t- metadata excel file(s) located in the " + METADATA_FILE_PATH.toString() +
                    " folder is(are) missing required data. Tag, Value and Description should be provided for each row.\n" +
                    "\t\tPlease check the excel spreadsheets.\n\t\tCannot proceed with the test execution.");
            Reporter.fail("Requested " + metadataKey + " metadata key is absent.<pre>Possible reasons are:<br>" +
                    "- the requested key is misspelled" + "<br>" +
                    "- metadata excel file(s) located in the " + METADATA_FILE_PATH.toString() +
                    " folder is(are) missing required data. Tag, Value and Description should be provided for each row.<br>" +
                    "Please check the excel spreadsheets.<br>Cannot proceed with the test execution.</pre>");
            throw new NullPointerException("Cannot retrieve the metadata.");
        }
    }

    /**
     * The method is used for checking whether the requested metadata key exists in the metadata dictionary
     *
     * @param metadataKey - requested key that needs to be checked
     * @return true if the key exists and false if does not
     */
    private static synchronized boolean metadataKeyExists(String metadataKey) {
        if (metadataKeysSet == null) {
            metadataKeysSet = new TreeSet<String>();
            String combinedKey;
            for (MetaData metadata : metaDataManager.getMetaDictionary()) {
                combinedKey = PREFIX + metadata.getFileName().split("_")[0].toUpperCase() + "_"
                        + metadata.getSheet().toUpperCase() + "_"
                        + metadata.getTag().split("_")[1].toUpperCase();
                metadataKeysSet.add(combinedKey);
            }
        }
        return metadataKeysSet.contains(metadataKey);
    }
}