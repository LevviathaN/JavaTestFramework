package ui.utils;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
/**
 * @author yzosin
 * <p> Reads .css and .js files to customize reporting architecture </p>
 *
 */
public class ReadFileInText {

    public static String readFile(String fileName){

        InputStream in = ReadFileInText.class.getResourceAsStream("/" + fileName);
        BufferedReader reader = new BufferedReader(new InputStreamReader(in));

        String currentLine = "";
        String allText = "";
        try {
            while ((currentLine = reader.readLine()) != null) {
                allText += currentLine;
            }

            return allText;
        } catch (IOException e) {
            e.printStackTrace();
        }
        finally{
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "";
    }
}
