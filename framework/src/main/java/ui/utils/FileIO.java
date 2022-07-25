package ui.utils;


import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

/**
 * Used to read/write properties from properties files
 * @author rlevytskyi
 */
public class FileIO {

    static String CONFIG_FILE = System.getProperty("config");
    static String PROPERTIES = "src/main/resources/" + ((CONFIG_FILE == null) ? "default" : CONFIG_FILE) + ".properties";

    public static String getConfigProperty(String fieldName) {
        String fileLocation = PROPERTIES;
        String result = null;

        try {
            //open file
            File file = new File(fileLocation);
            //open input stream to read file
            FileInputStream fileInput = new FileInputStream(file);
            //create Properties object
            Properties properties = new Properties();
            //load properties from file
            properties.load(fileInput);
            //close file
            fileInput.close();
            //get property by name
            result = properties.getProperty(fieldName);

        } catch (FileNotFoundException e) {
            e.printStackTrace();
            BPPLogManager.getLogger().error("Config was not found");
        } catch (IOException e) {
            e.printStackTrace();
            BPPLogManager.getLogger().error("Config was not opened");
        } catch (Exception e) {
            e.printStackTrace();
            BPPLogManager.getLogger().error("Field was not found: " + fieldName);
        }
        return result;
    }

    public static List<List<String>> parseCsvAsList(String fileName, String delimiter) {
        List<List<String>> records = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] values = line.split(delimiter);
                records.add(Arrays.asList(values));
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return records;
    }
}

