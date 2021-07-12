package ui.utils.bpp;

import api.RestApiController;
import ui.utils.BPPLogManager;
import ui.utils.Reporter;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;

/**
 * @author yzosin
 * <p>
 * The class to get locator properties for web-elements
 * </p>
 */
public class PropertiesHelper {

    Properties properties;

    //Map is needed to store the web-elements' locator ('xpath', 'css-selector' etc.)
    private static Map<String, String> locatorProperties = new TreeMap<String, String>();

    private static final String PROPERTIES_FOLDER = PreProcessFiles.PROPERTIES_FILES_FOLDER_PATH;

    /**
     * <p>This function used to get properties for API requests </p>
     *
     * @author yzosin
     */
    public Properties getProperties() {

        properties = new Properties();
        InputStream inputStream;
        try {
            inputStream = new FileInputStream(PreProcessFiles.ROOT_FOLDER_PATH + "/src/main/resources/api/configuration.properties");
            properties.load(inputStream);
            inputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return properties;
    }

    /**
     * <p>It returns the property value specified in either environment variable or configuration.properties
     * It gives priority to the property specified in Java environment variable For e.g. -Ddriver=FIREFOX
     *
     * @param key used to search for property
     * @return </p>
     */
    public static String determineEffectivePropertyValue(String key) {

        PropertiesHelper propertiesHelper = new PropertiesHelper();

        if (null != System.getProperty(key)) {
            return System.getProperty(key);
        } else {
            return propertiesHelper.getProperties().getProperty(key);
        }
    }

    /**
     * <p>
     * method needed to read the JSON file and:
     * - get web-elements' locator and store them in static variable called 'properties'.
     * This should be called before test
     * execution.
     *
     * @throws NullPointerException when failed to reade excel sheet
     *                              </p>
     */
    public static void gatherPropertiesFromJSON() throws NullPointerException {

        RestApiController controller = new RestApiController();

        try {
            Map<String, String> props = controller.processLocatorProperties("/src/main/resources/Locators.json");
            locatorProperties.putAll(props);
        } catch (NullPointerException e2) {
            Reporter.log("Failed to read sheet from properties file located in the " + PROPERTIES_FOLDER);
            BPPLogManager.getLogger().error("Failed to read sheet from properties file located in the " + PROPERTIES_FOLDER, e2);
            throw new NullPointerException();
        } catch (Exception e3) {
            Reporter.log("Failed to gather properties");
            BPPLogManager.getLogger().error("Failed to gather properties", e3);
            throw new NullPointerException();
        }
    }
}
