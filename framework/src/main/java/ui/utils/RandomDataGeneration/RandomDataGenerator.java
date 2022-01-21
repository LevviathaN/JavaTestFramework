package ui.utils.RandomDataGeneration;

import com.google.api.client.repackaged.com.google.common.base.CharMatcher;
import enums.RegexPattern;
import org.apache.commons.lang3.RandomStringUtils;
import ui.utils.Reporter;
import ui.utils.SeleniumHelper;
import ui.utils.Tools;
import ui.utils.bpp.ExecutionContextHandler;
import ui.utils.bpp.KeywordsHandler;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;

/** Class used for random data generation */
public class RandomDataGenerator {

    //ThreadLocal object to ensure proper functioning in multiple threads
    private static final ThreadLocal<RandomDataGenerator> instance = new ThreadLocal<RandomDataGenerator>() {
        @Override
        protected RandomDataGenerator initialValue() {
            return new RandomDataGenerator();
        }
    };

    public HashMap<String, GenerateRandom> generatorsMap = new HashMap<>();
    public static RandomDataGenerator getInstance() {
        return instance.get();
    }

    //initialization of generatorsMap with appropriate generators lambdas
    private RandomDataGenerator() {
        generatorsMap.put("#",(s) -> KeywordsHandler.getValueByKeyword("AUTO_RANDOMNUMBER|" + s));
        generatorsMap.put("*",(s) -> KeywordsHandler.getValueByKeyword(RandomStringUtils.randomAlphabetic(s.length())));
        generatorsMap.put("FIRSTNAME",(s) -> KeywordsHandler.getValueByKeyword("AUTO_FIRSTNAME"));
        generatorsMap.put("LASTNAME",(s) -> KeywordsHandler.getValueByKeyword("AUTO_LASTNAME"));
        generatorsMap.put("STREET",(s) -> KeywordsHandler.getValueByKeyword("AUTO_STREET"));
        generatorsMap.put("CITYUSA",(s) -> KeywordsHandler.getValueByKeyword("AUTO_CITYUSA"));
        generatorsMap.put("EMAIL",(s) -> {
            String mail =
            KeywordsHandler.getValueByKeyword("AUTO_FIRSTNAME") +
            KeywordsHandler.getValueByKeyword("AUTO_FIRSTNAME") +
            KeywordsHandler.getValueByKeyword("AUTO_RANDOMNUMBER|####");
            if (s.contains("MAILDROP")){
                mail += "@maildrop.cc";
            } else if (s.contains("NADA")){
                mail += "@getnada.com";
            } else if (s.contains("HARAKIRI")){
                mail += "@harakirimail.com";
            } else if (s.contains("GUERILLA")){
                mail += "@guerillamail.info";
            } else if (s.contains("YOPMAIL")){
                mail += "@yopmail.com";
            }else {
                mail += KeywordsHandler.getValueByKeyword("AUTO_EMAIL");
            }
            return mail;
        });
        generatorsMap.put("PHONE",(s) -> {
            String phone;
            if (s.contains("-")){
                phone = s.replace("PHONE-","") + KeywordsHandler.getValueByKeyword("AUTO_RANDOMNUMBER|#######");
            } else {
                phone = KeywordsHandler.getValueByKeyword("AUTO_PHONE|##########");
            }
            return phone;
        });
        generatorsMap.put("TODAY",(s) -> {
            if (s.contains("-")||s.contains("+")){
                return KeywordsHandler.getValueByKeyword("AUTO_TODAY|DD/MM/YYYY_" + s.replace("TODAY",""));
            } else {
                return KeywordsHandler.getValueByKeyword("AUTO_TODAY|DD/MM/YYYY");
            }
        });
        generatorsMap.put("DOB",(s) -> {
            if (s.contains("-")){
                return KeywordsHandler.getValueByKeyword("AUTO_DOB|DD/MM/YYYY_" + s.replace("DOB-",""));
            } else {
                return KeywordsHandler.getValueByKeyword("AUTO_TODAY|DD/MM/YYYY");
            }
        });
        generatorsMap.put("TIMENOW",(s) -> {//todo: create separate class for times and time format operations
            String timePattern = null;
            if (s.endsWith("MMMMd,yyyy")) {
                timePattern = "MMMM d, yyyy";
            } else if (s.endsWith("yyyy-MM-dd")){
                timePattern = "yyyy-MM-dd";
            } else if (s.endsWith("yyyy-MM-dd'T'HH:mm")){
                timePattern = "yyyy-MM-dd'T'HH:mm";
            } else if (s.endsWith("VPE")) {
                if (s.contains("CALENDAR")) {
                    String time = String.valueOf(Tools.getCurDateTimeInMilliseconds());
                    timePattern = time.substring(0, 4);
                } else {
                    timePattern = "MMM d yyyy";
                }
            } else if (s.startsWith("TIMENOW-PLUS") || s.startsWith("TIMENOW-MINUS")) {
                timePattern = "yyyy-MM-dd HH:mm";
            } else {
                timePattern = "dd MMM HH:mm";
            }
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern(timePattern);
            LocalDateTime now = LocalDateTime.now(ZoneId.of("Europe/London"));

            if (s.contains("TMR")) {
                now = now.plusDays(1);
            } else if (s.contains("YTD")) {
                now = now.minusDays(1);
            } else if (s.contains("OHB")) {
                now = now.minusHours(1);
            } else if (s.matches("TIMENOW-PLUS-(\\d+)DAYS") || s.matches("TIMENOW-MINUS-(\\d+)DAYS")) {
                int number = Integer.parseInt(s
                        .replace("TIMENOW-PLUS-","+")
                        .replace("DAYS","")
                        .replace("TIMENOW-MINUS-","-")
                );
                now = now.plusDays(number);
            } else if (s.matches("TIMENOW-PLUS-(\\d+)HOURS") || s.matches("TIMENOW-MINUS-(\\d+)HOURS")) {
                int number = Integer.parseInt(s
                        .replace("TIMENOW-PLUS-","+")
                        .replace("HOURS","")
                        .replace("TIMENOW-MINUS-","-")
                );
                now = now.plusHours(number);
            }
            return  dtf.format(now);
        });
        generatorsMap.put("DATEFORMAT",(s) -> {
            String prenthesis = s.substring(11,s.length()-1);
            String dateString = prenthesis.split("[,]")[0];
            String givenPattern = prenthesis.split("[,]")[1];
            String desireblePattern = prenthesis.split("[,]")[2];
            SimpleDateFormat givenFormat = new SimpleDateFormat(givenPattern);
            SimpleDateFormat desirebleFormat = new SimpleDateFormat(desireblePattern);
            Date date = null;
            try {
                date = givenFormat.parse(dateString);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            return desirebleFormat.format(date);
        });
        generatorsMap.put("SUBSTRING",(s) -> {
            String prenthesis = s.substring(10,s.length()-1);
            String[] operands = prenthesis.split("[,]");
            String actualParameter = (operands[0]);
            int begIndex = operands[1].startsWith("-") ? actualParameter.length() - Integer.parseInt(operands[1].substring(1)) : Integer.parseInt(operands[1]);
            int endIndex = operands[2].startsWith("-") ? actualParameter.length() - Integer.parseInt(operands[2].substring(1)) : Integer.parseInt(operands[2]);
            String substr = actualParameter.substring(begIndex,endIndex);
            return substr;
        });
        generatorsMap.put("SUM",(s) -> {
            int sum = 0;
            String prenthesis = s.substring(4,s.length()-1);
            String[] operands = prenthesis.split("[,]");
            for (int i = 0; i < operands.length; i++) {
                sum += Integer.parseInt((operands[i]));
            }
            return String.valueOf(sum);
        });
    }

    /** Method to generate value based by provided key */
    public String generateValue(String parameter) {
        String[] splitArraySimplified = parameter.split("[\\[\\]]");
        StringBuilder resultingValueSimplified = new StringBuilder();
        StringBuilder ecVarNameSimplified = new StringBuilder();
        ecVarNameSimplified.append("EC");

        //for each part of provided parameter determine if it's Random Data keyword or EC modifier
        for (String element : splitArraySimplified) {
            //if it's RandomData keyword (if part of parameter starts with any of keys in GeneratorMap)
            if (generatorsMap.keySet().stream().anyMatch(element::startsWith)){
                //parse through generators
                for (String generator : generatorsMap.keySet()) {
                    //and with required generator
                    if (element.startsWith(generator)) {
                        //generate random data and append it to resulting value
                        resultingValueSimplified.append(generatorsMap.get(generator).generate(element));
                        if (!(generator.contains("*")||generator.contains("#"))) {
                            ecVarNameSimplified.append("_");
                            ecVarNameSimplified.append(generator);
                        }
                    }
                }
            }
            //if part is NOT KW_ value
            else {
                boolean nameOnly = false;
                boolean valueOnly = false;
                if (element.startsWith("$")) valueOnly = true;
                else if (element.startsWith("~")) nameOnly = true;
                if (valueOnly) {
                    element = element.replace("$", "");
                }
                //trim slashes, if present
                if (element.contains("/")) {
                    String updateElement = element.replace("/", "");
                    resultingValueSimplified.append(updateElement);
                } else if (nameOnly) {
                    Reporter.log("Only autogenerated part is used as EC variable value");
                } else {
                    resultingValueSimplified.append(element);
                }

                //form EC_ value name from camelCase static text
                if (nameOnly) {
                    element = element.replace("~", "");
                }
                if (!valueOnly) {
                    for (String w : element.split("(?<!(^|[A-Z]))(?=[A-Z])|(?<!^)(?=[A-Z][a-z])")) {
                        if (!w.isEmpty()){
                            ecVarNameSimplified.append("_");
                            ecVarNameSimplified.append(w.toUpperCase());
                        }
                    }
                }
            }
        }

        ExecutionContextHandler.setExecutionContextValueByKey(ecVarNameSimplified.toString(), resultingValueSimplified.toString());
        Reporter.log("Execution Context variable '" + ecVarNameSimplified.toString() +
                "' was automatically created with value '" + resultingValueSimplified.toString() + "'");
        return resultingValueSimplified.toString();
    }

    /** Method to generate value by keyword (old BPP functionality) */
    public String getKeyword(String parameter) {
        //check if equals KW_AUTO_SELECT
        if (parameter.equals(RegexPattern.KEYWORD_NAME_TO_SKIP.getRegex())) {
            //just return input parameter without changes
            return parameter;
        }

        //split parameter into two parts: static text, and KW_ value itself
        String[] splitArray = parameter.split("[<>]");
        StringBuilder resultingValue = new StringBuilder();

        //cycle through parts of parameter
        for (String element : splitArray) {
            //if part is KW_ value
            if (element.startsWith(RegexPattern.KEYWORD_NAME_PREFIX.getRegex())) {
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
}
