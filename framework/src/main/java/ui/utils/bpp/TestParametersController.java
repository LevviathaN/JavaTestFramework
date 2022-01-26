package ui.utils.bpp;

import enums.RegexPattern;
import org.openqa.selenium.By;
import ui.utils.*;
import ui.utils.RandomDataGeneration.RandomDataGenerator;

import java.util.*;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author nick.
 *
 * <p>This class provides an ability to check whether the passed from excel sheet parameter is
 * a keyword, a metadata or an execution context key and convert such appropriately.</p>
 * <br>NOTES:
 * <br>Keyword:
 * <pre>
 *     - acceptable single keyword format is <b>KW_AUTO_keyword name|modifier if needed</b>.Keyword name should be a word in uppercase.
 *     - each keyword may be combined with pre-pending and/or post-pending text. Format: <b>pre-pending text &lt;KEYWORD&gt; post-pending text</b>.
 *     Pre-pending and post-pending texts are optional and may contain <i>upper- and lowercase letters, digits, '_', '-', '@', '.'</i>
 *     - each input value will be considered as a keyword if it contains 'KW_'.
 *     - input value may contain several keywords.
 * </pre>
 * <p>
 * Metadata:
 * <pre>
 *     - acceptable metadata format is <b>MD_FILE_SHEET_KEY</b>. File name, sheet and key should be a word in uppercase.
 *     - each input value will be considered as a metadata key if it starts with 'MD_'.
 * </pre>
 * <p>
 * Execution Context:
 * <pre>
 *     - acceptable execution context format is <b>EC_part1..._partN</b>. Execution context key should contain 'EC' prefix and any number of words in uppercase separated by '_'.
 *     - each input value will be considered as an execution context key if it starts with 'EC_'.
 * </pre>
 */
public class TestParametersController {

    private static final ThreadLocal<TestParametersController> instance = new ThreadLocal<TestParametersController>() {
        @Override
        protected TestParametersController initialValue() {
            return new TestParametersController();
        }
    };

    //map of methods, that are used to get particular type of Special Parameters
    public static Map<String, DataRetriever> retrieversMap = new LinkedHashMap<>();
    private static final Map<String, String> dataRegexMap = new HashMap<>();
    public static TestParametersController getInstance() {
        return instance.get();
    }

    //initialization of retrievers map
    static {
        retrieversMap.put("EC",(s) -> {
            String value = "";
            if (ExecutionContextHandler.getAllValues().containsKey(s)) {
                if (s.contains("DEADLINEMONTH")) {
                    value = Tools.editMonth(ExecutionContextHandler.getExecutionContextValueByKey(s), 2, 4);
                } else if(s.contains("PRICEVAT")) {
                    value = Tools.calculatePriceWithVat(s);
                }else {
                    value = ExecutionContextHandler.getExecutionContextValueByKey(s);
                }
            } else {
                Logger.getAnonymousLogger().warning("No such EC variable");
            }
            return value;
        });
        retrieversMap.put("MD", MetaDataHandler::getMetaDataValue);
        retrieversMap.put("KW",(s) -> RandomDataGenerator.getInstance().getKeyword(s));
        retrieversMap.put("RD",(s) -> RandomDataGenerator.getInstance().generateValue(s));

        dataRegexMap.put("RD",RegexPattern.RANDOM_DATA.getRegex());
        dataRegexMap.put("KW",RegexPattern.ACCEPTABLE_KEYWORD_PATTERN.getRegex());
        dataRegexMap.put("MD",RegexPattern.META_DATA.getRegex());
        dataRegexMap.put("EC", RegexPattern.EC.getRegex());
    }

    /**
     * The method is used to find and replace special parameters (keywords, metadata, random data and EC variables) in given string.
     *
     * @param parameter parameter that comes from excel sheet
     * @return converted value by provided parameter. Otherwise returns the unmodified parameter.
     */
    public static String checkIfSpecialParameter(String parameter) {
        for (String retriever : retrieversMap.keySet()) {
            List<String> dataList = new ArrayList<String>(); //list of specialParameters of given type (EC, RD, MD, PR)
            Matcher dataPattern = Pattern.compile(dataRegexMap.get(retriever)).matcher(parameter); //pattern to find this data
//            BPPLogManager.getLogger().info("Searching " + retriever + " variables");
            while (dataPattern.find()) { //add found data into previously created list
                dataList.add(dataPattern.group());
                BPPLogManager.getLogger().info(dataPattern.group() + " " + retriever + " variable found");
            }
            for (String data : dataList) { //replace all special parameters with their calculated values in the string
                String value = retrieversMap.get(retriever).retrieve(data);
                parameter = parameter.replaceAll(shieldRegexSpecialChars(data), String.valueOf(value));
                BPPLogManager.getLogger().info("'" + data + "' " + retriever
                        + " variable was successfully replaced with '" + value + "' in '" + parameter + "' string");
            }
        }
        return parameter;
    }

    /**
     * The method switches to frame
     *
     * @param locatorInFrame element located in frame
     * @return an element after frame name is defined and trimmed from xpath locator
     */
    public static By getFrame(String locatorInFrame) {
        String[] elements = locatorInFrame.split(">");
        String frameName = elements[0].substring(8);
        SeleniumHelper page = new SeleniumHelper();
        By element = page.initElementLocator(frameName);
        page.switchToFrame(element);
        return By.xpath(elements[1].substring(6));
    }

    public static By initElementByLocator(String locator) {
        if (PageLocatorMatcher.isXpath(locator)) {
            if(PageLocatorMatcher.isECVariableInXpath(locator)) {
                return By.xpath(PageLocatorMatcher.updateXpath(locator.substring(6)));
            }
            return By.xpath(locator.substring(6));
        } else if (PageLocatorMatcher.isId(locator)) {
            return By.id(locator.substring(3));
        } else if (PageLocatorMatcher.isCss(locator)) {
            return By.cssSelector(locator.substring(4));
        } else if (PageLocatorMatcher.isName(locator)) {
            return By.name(locator.substring(5));
        } else if (PageLocatorMatcher.isTagname(locator)) {
            return By.tagName(locator.substring(8));
        } else if (PageLocatorMatcher.isClass(locator)) {
            return By.className(locator.substring(10));
        } else if (PageLocatorMatcher.isLink(locator)) {
            return By.linkText(locator.substring(5));
        } else if (PageLocatorMatcher.isInFrame(locator)) {
            return getFrame(locator);
        } else {
            Reporter.failTryTakingScreenshot("Cannot initialize " + locator + " as an accepted type of value. Property item cannot be found!");
            return By.linkText(locator);
        }
    }

    /**
     * Method is used to shield special characters with escape character in provided string
     */
    public static String shieldRegexSpecialChars(String string) {
        return string.replace("$","\\$")
                .replace("[","\\[")
                .replace("]","\\]")
                .replace("~","\\~")
                .replace("(","\\(")
                .replace(")","\\)")
                .replace(".","\\.")
                .replace("#","\\#")
                .replace("*","\\*")
                .replace("{","\\{")
                .replace("|","\\|")
                .replace("}","\\}");
    }
}