package ui.utils.bpp;

import org.openqa.selenium.By;
import ui.pages.BasePage;
import ui.utils.Reporter;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
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

    //private static final Logger log = Logger.getLogger(TestParametersController.class);

    private static final Pattern ACCEPTABLE_METADATA_PATTERN = Pattern.compile("^MD_([A-Z]+_){2}[A-Z]+$");
    private static final Pattern ACCEPTABLE_KEYWORD_PATTERN = Pattern.compile("^([A-Za-z\\d-_.]*<?KW_AUTO_[A-Z]+(\\b|[|])[~:)(/A-Za-z._#?-]*>?[/A-Za-z\\d@._-]*)+$");
    private static final Pattern ACCEPTABLE_EXECUTION_CONTEXT_PATTERN = Pattern.compile("^([A-Za-z\\d\\s:\\-/\\\\|@_.=]*<?EC_([A-Z]+_*)+[A-Z]*>?[A-Za-z\\d\\s:\\-/\\|.]*)+$|" +
            "EC_([A-Z]+_*)+[A-Z]+$");
    private static final Pattern GENERAL_METADATA_PATTERN = Pattern.compile("^MD_.+$");
    private static final Pattern GENERAL_KEYWORD_PATTERN = Pattern.compile("^.*KW_.+$");
    private static final Pattern GENERAL_EXECUTION_CONTEXT_PATTERN = Pattern.compile("^(.|.+)?EC_.+$");
    private static final Pattern GENERAL_SIMPLIFIED_RANDOM_PATTERN = Pattern.compile("^([A-Za-z\\d-_.]*\\[?[~:)(/A-Za-z._#?-]*\\]?)+$");

    private static final String KEYWORD_NAME_PREFIX = "KW_AUTO_";
    private static final String EXECUTION_CONTEXT_PREFIX = "EC_";
    private static final String KEYWORD_NAME_TO_SKIP = "KW_AUTO_SELECT";
    private static final String KEYWORD_SF_DATE = "KW_AUTO_SFDATE";

    /**
     * The method performs two-levels verification of passed value to be a metadata key.
     * First level checkup is based on determining whether the passed value starts with 'MD_' prefix.
     * If the result is true, then on the second level it is possible to check whether the passed parameter is well-formatted and acceptable to be handled further.
     *
     * @param value value that needs to be checked
     * @return true if the parameter is acceptable metadata
     */
    private static boolean isMetaData(String value) {
        Matcher acceptableMetaDataMatcher = ACCEPTABLE_METADATA_PATTERN.matcher(value);
        Matcher possibleMetaDataMatcher = GENERAL_METADATA_PATTERN.matcher(value);
        if (possibleMetaDataMatcher.matches()) {
            if (acceptableMetaDataMatcher.matches()) {
                return true;
            } else {
                String messageToLog = "\n\t\tAcceptable metadata format is MD_FILE_SHEET_KEY.\n" +
                        "\t\tFile name, sheet and key should be a word in uppercase.";
                String messageToReport = "<pre>Acceptable metadata format is 'MD_FILE_SHEET_KEY'.<br>" +
                        "File name, sheet and key should be a word in uppercase.</pre>";
                Reporter.log("Passed \"" + value + "\" parameter looks like a metadata key but it's format is not acceptable." + messageToLog);
                Reporter.log("Passed \"" + value + "\" parameter looks like a metadata key but it's format is not acceptable." + messageToReport);
                return false;
            }
        }
        return false;
    }

    /**
     * The method performs two-levels verification of passed value to be a keyword.
     * First level checkup is based on determining whether the passed value contains the 'KW_'.
     * If the result is true, then on the second level it is possible to check whether the passed parameter is well-formatted and acceptable to be handled further.
     *
     * @param value value that needs to be checked
     * @return true if the parameter is acceptable keyword
     */
    private static boolean isKeyword(String value) {
        Matcher acceptableKeywordMatcher = ACCEPTABLE_KEYWORD_PATTERN.matcher(value);
        Matcher possibleKeywordMatcher = GENERAL_KEYWORD_PATTERN.matcher(value);
        if (possibleKeywordMatcher.matches()) {
            if (acceptableKeywordMatcher.matches()) {
                return true;
            } else {
                String messageToLog = "\n\t\tAcceptable single keyword format is 'KW_AUTO_keyword name|modifier if needed'. Keyword name should be a word in uppercase.\n" +
                        "\t\tEach keyword may be combined with pre-pending and/or post-pending text. Format: 'pre-pending text<KEYWORD>post-pending text'.\n" +
                        "\t\tPre-pending and post-pending texts are optional and may contain upper- and lowercase letters, digits, '_', '-', '@', '.'\n" +
                        "\t\tInput value may contain several keywords.";
                String messageToReport = "<pre>Acceptable single keyword format is 'KW_AUTO_keyword name|modifier if needed'. Keyword name should be a word in uppercase.<br>" +
                        "Each keyword may be combined with pre-pending and/or post-pending text. Format: 'pre-pending text&lt;KEYWORD&gt;post-pending text'.<br>" +
                        "Pre-pending and post-pending texts are optional and may contain upper- and lowercase letters, digits, '_', '-', '@', '.'<br>" +
                        "Input value may contain several keywords.</pre>";
                Reporter.log("Passed \"" + value + "\" parameter looks like a keyword but it's format is not acceptable." + messageToLog);
                Reporter.log("Passed \"" + value + "\" parameter looks like a keyword but it's format is not acceptable." + messageToReport);
                return false;
            }
        }
        return false;
    }

    /**
     * The method performs two-levels verification of passed value to be an execution context key.
     * First level checkup is based on determining whether the passed value starts with 'EC_' prefix.
     * If the result is true, then on the second level it is possible to check whether the passed parameter is well-formatted and acceptable to be handled further.
     *
     * @param value value that needs to be checked
     * @return true if the parameter is acceptable execution context key
     */
    private static boolean isExecutionContextKey(String value) {
        Matcher acceptableExecutionContextMatcher = ACCEPTABLE_EXECUTION_CONTEXT_PATTERN.matcher(value);
        Matcher possibleExecutionContextMatcher = GENERAL_EXECUTION_CONTEXT_PATTERN.matcher(value);
        if (possibleExecutionContextMatcher.matches()) {
            if (acceptableExecutionContextMatcher.matches()) {
                return true;
            } else {
                String messageToLog = "\n\t\tAcceptable execution context format is EC_PART-1..._PART-N.\n" +
                        "\t\tExecution context key should contain 'EC' prefix and any number of words in uppercase separated by '_'.";
                String messageToReport = "<pre>Acceptable execution context format is 'EC_PART-1..._PART-N'.<br>" +
                        "Execution context key should contain 'EC' prefix and any number of words in uppercase separated by '_'.</pre>";
                Reporter.log("Passed \"" + value + "\" parameter looks like a execution context key but it's format is not acceptable." + messageToLog);
                Reporter.log("Passed \"" + value + "\" parameter looks like a execution context key but it's format is not acceptable." + messageToReport);
                return false;
            }
        }
        return false;
    }


    private static boolean isSimplifiedRandom(String value) {
//        Matcher possibleSimplifiedRandomMatcher = GENERAL_SIMPLIFIED_RANDOM_PATTERN.matcher(value);
        return (value.contains("[") && value.contains("]") && !value.contains("//"));
    }

    /**
     * The method checks whether passed parameter is any of keyword, metadata or executions context key.
     *
     * @param parameter parameter that comes from excel sheet
     * @return converted value by provided parameter. Otherwise returns the unmodified parameter that was passed from excel sheet.
     */
    public static String checkIfSpecialParameter(String parameter) {
        //if metadata (starts with MD_, for instance MD_CREDENTIALS_BPPUSER)
        if (isMetaData(parameter)) {
            //get metadata from document (MD_CREDENTIALS_BPPUSER returns username, MD_LINKS_BPPURL returns Url etc.)
            return MetaDataHandler.getMetaDataValue(parameter);
        }

        //otherwise if keyword (contains KW_ or KW_AUTO, for instance AutoName<KW_AUTO_RANDOMNUMBER|####>)
        else if (isKeyword(parameter)) {

            //check if equals KW_AUTO_SELECT
            if (parameter.equals(KEYWORD_NAME_TO_SKIP)) {
                //just return input parameter without changes
                return parameter;
            }

            if (parameter.equals(KEYWORD_SF_DATE)) {
                return KeywordsHandler.salesForceDateAPIdateFormat();
            }

            //split parameter into two parts: static text, and KW_ value itself
            String[] splitArray = parameter.split("[<>]");
            StringBuilder resultingValue = new StringBuilder();

            //cycle through parts of parameter
            for (String element : splitArray) {
                //if part is KW_ value
                if (element.startsWith(KEYWORD_NAME_PREFIX)) {
                    //then add transformed KW_ value to resultingValue
                    resultingValue.append(KeywordsHandler.getValueByKeyword(element.substring(3)));
                }

                //if part is NOT KW_ value
                else {

                    //trim slashes, if present
                    if (element.contains("/")) {
                        String updateElement = element.replace("/", "");
                        resultingValue.append(updateElement);
                    } else {
                        resultingValue.append(element);
                    }
                }
            }
            return resultingValue.toString();
        }

        //otherwise check if contains EC_ value
        else if (isExecutionContextKey(parameter)) {

            String[] splitArray = parameter.split("[<>]");
            StringBuilder splittedValue = new StringBuilder();
            for (String element : splitArray)
                if (element.startsWith(EXECUTION_CONTEXT_PREFIX)) {
                    splittedValue.append(ExecutionContextHandler.getExecutionContextValueByKey(element));
                } else {
                    splittedValue.append(element);
                }
            return splittedValue.toString();
        }

        //If it is simplified random generation
        else if (isSimplifiedRandom(parameter)) {

            String[] splitArraySimplified = parameter.split("[\\[\\]]");
            StringBuilder resultingValueSimplified = new StringBuilder();
            StringBuilder ecVarNameSimplified = new StringBuilder();
            ecVarNameSimplified.append("EC");

            for (String element : splitArraySimplified) {
                if (element.startsWith("#")){
                    resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_RANDOMNUMBER|" + element));
                }
                else if (element.startsWith("FIRSTNAME")){
                    resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_FIRSTNAME"));
                    ecVarNameSimplified.append("_");
                    ecVarNameSimplified.append("FIRSTNAME");
                }
                else if (element.startsWith("LASTNAME")){
                    resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_LASTNAME"));
                    ecVarNameSimplified.append("_");
                    ecVarNameSimplified.append("LASTNAME");
                }
                else if (element.startsWith("STREET")){
                    resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_STREET"));
                    ecVarNameSimplified.append("_");
                    ecVarNameSimplified.append("STREET");
                }
                else if (element.startsWith("CITYUSA")){
                    resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_CITYUSA"));
                    ecVarNameSimplified.append("_");
                    ecVarNameSimplified.append("CITYUSA");
                }
                else if (element.startsWith("EMAIL")){
                    if (element.contains("HARAKIRI")){
                        resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_FIRSTNAME"));
                        resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_LASTNAME"));
                        resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_RANDOMNUMBER|####"));
                        resultingValueSimplified.append("@harakirimail.com");
                    } else {
                        resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_EMAIL"));
                    }
                    ecVarNameSimplified.append("_");
                    ecVarNameSimplified.append("EMAIL");
                }
                else if (element.startsWith("PHONE")){
                    if (element.contains("-")){
                        resultingValueSimplified.append(element.replace("PHONE-",""));
                        resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_RANDOMNUMBER|#######"));
                    } else {
                        resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_PHONE|##########"));
                    }
                    ecVarNameSimplified.append("_");
                    ecVarNameSimplified.append("PHONE");
                }
                else if (element.startsWith("TODAY")){
                    if (element.contains("-")||element.contains("+")){
                        resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_TODAY|DD/MM/YYYY_" + element.replace("TODAY","")));
                    } else {
                        resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_TODAY|DD/MM/YYYY"));
                    }
                    ecVarNameSimplified.append("_");
                    ecVarNameSimplified.append("TODAY");
                }
                else if (element.startsWith("DOB")){
                    if (element.contains("-")){
                        resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_DOB|DD/MM/YYYY_" + element.replace("DOB-","")));
                    } else {
                        resultingValueSimplified.append(KeywordsHandler.getValueByKeyword("AUTO_TODAY|DD/MM/YYYY"));
                    }
                    ecVarNameSimplified.append("_");
                    ecVarNameSimplified.append("DOB");
                }
                else if (element.startsWith("TIMENOW")){
                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd MMM HH:mm");
                    LocalDateTime now = LocalDateTime.now(ZoneId.of("Europe/London"));
                    String currentDateTime = dtf.format(now);
                    ecVarNameSimplified.append("_");
                    ecVarNameSimplified.append("TIMENOW");
                    resultingValueSimplified.append(currentDateTime);
                }
                //if part is NOT KW_ value
                else {

                    //trim slashes, if present
                    if (element.contains("/")) {
                        String updateElement = element.replace("/", "");
                        resultingValueSimplified.append(updateElement);
                    } else if (element.startsWith("~")) {
                        Reporter.log("Only autogenerated part is used as EC variable value");
                    } else {
                        resultingValueSimplified.append(element);
                    }

                    //form EC_ value name from camelCase static text
                    if (element.startsWith("~")) {
                        element = element.replace("~", "");
                    }
                    for (String w : element.split("(?<!(^|[A-Z]))(?=[A-Z])|(?<!^)(?=[A-Z][a-z])")) {
                        if (!w.isEmpty()){
                            ecVarNameSimplified.append("_");
                            ecVarNameSimplified.append(w.toUpperCase());
                        }
                    }
                }
            }

            ExecutionContextHandler.setExecutionContextValueByKey(ecVarNameSimplified.toString(), resultingValueSimplified.toString());
            Reporter.log("Execution Context variable '" + ecVarNameSimplified.toString() +
                    "' was automatically created with value '" + resultingValueSimplified.toString() + "'");
            return resultingValueSimplified.toString();
        }

        //If contains no special parameters, then just return input value
        else {
            return parameter;
        }
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
        BasePage page = new BasePage();
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
}