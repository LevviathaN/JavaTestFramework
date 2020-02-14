package cucumber;

import java.util.HashMap;
import java.util.Map;

public enum StepPatterns {

    I_AM_ON_URL("^I am on \"([^\"]*)\" URL$"),
    I_CLICK_ON_THE_BUTTON("^I click on the \"([^\"]*)\" (?:button|link|option|element)(?: in [^\"]*)?$"),
    FILL_THE_FIELD("^I fill the \"([^\"]*)\" field with \"([^\"]*)\"$"),
    WAIT_FOR("^I wait for \"([^\"]*)\" seconds$"),
    HOVER_OVER("^I hover over the \"([^\"]*)\" (?:button|link|option|element)$"),
    I_SHOULD_SEE_THE_TEXT("^I should see the \"([^\"]*)\" (?:button|message|element)$"),
    I_SHOULD_SEE_THE_MESSAGE_LOCATED_IN_FRAME("^I should see the \"([^\"]*)\" message in \"([^\"]*)\" frame$"),
    I_SHOULD_BE_REDIRECTED_TO_THE_PAGE("^I should be redirected to the \"([^\"]*)\" page$"),
    I_EXECUTE_REUSABLE_STEP("^I execute \"([^\"]*)\" reusable step$"),
    I_REMEMBER_TEXT("^I remember \"([^\"]*)\" text as \"([^\"]*)\" variable$"),
    I_CLICK_ON_ELEMENT_WITH_PARAMETER_SPECIAL("^I click on the \"([^\"]*)\" \"([^\"]*)\"$"),
    I_CLICK_ON_ELEMENT_SPECIAL("^I click on the \"([^\"]*)\"$"),
    I_SET_TEXT_SPECIAL("^I set \"([^\"]*)\" text to the \"([^\"]*)\" \"([^\"]*)\"$"),
    I_SHOULD_SEE_SPECIAL("^I should see \"([^\"]*)\" \"([^\"]*)\"$"),
    I_AM_LOGGED_IN_PF_AS("^I am logged into Product Factory as \"([^\"]*)\"$"),
    I_FILL_PF_FIELD("^I fill the \"([^\"]*)\" PF field with \"([^\"]*)\"$"),
    I_SELECT_FROM_DIALOG("^I select \"([^\"]*)\" from PF dialog$"),
    I_CHECK_UNCHECK("^I \"(check|uncheck)\" \"([^\"]*)\" checkbox$"),
    I_CHECK_UNCHECK_SPECIAL("^I \"(check|uncheck)\" \"([^\"]*)\" \"([^\"]*)\"$"),
    ELEMENTS_ATTRIBUTE_SHOULD_HAVE_VALUE("^Attribute \"([^\"]*)\" of \"([^\"]*)\" should have value \"([^\"]*)\"$"),
    ELEMENTS_ATTRIBUTE_SHOULD_HAVE_VALUE_SPECIAL("^Attribute \"([^\"]*)\" of \"([^\"]*)\" \"([^\"]*)\" should have value \"([^\"]*)\"$"),
    I_PRESS_KEY("^I press \"([^\"]*)\" for \"([^\"]*)\"$"),
    I_VALIDATE_TEXT("^I validate text \"([^\"]*)\" to be displayed for \"([^\"]*)\" element$"),
    I_CLICK_ON_ELEMENT_WITH_PARAMETER_SPECIAL_IF("^I click on the \"([^\"]*)\" \"([^\"]*)\" if \"([^\"]*)\" \"([^\"]*)\"$"),
    I_CLICK_ON_THE_BUTTON_IF("^I click on the \"([^\"]*)\" (?:button|link|option|element) if \"([^\"]*)\" \"([^\"]*)\"$"),
    I_EXECUTE_REUSABLE_STEP_IF("^I execute \"([^\"]*)\" reusable step if \"([^\"]*)\" \"([^\"]*)\"$"),
    I_SELECT_FROM_DROPDOWN("I select \"([^\"]*)\" from \"([^\"]*)\" element"),
    I_SHOULD_SCROLL_TO_THE_BOTTOM_OF_THE_PAGE("^I should scroll to the bottom of the page$"),
    I_UPLOAD_FILE("I upload \"([^\"]*)\" file to \"([^\"]*)\" element"),
    I_SHOULD_NOT_SEE_ELEMENT("I shouldn't see the \"([^\"]*)\" (?:button|message|element|text)$"),
    I_SHOULD_SEE_MESSAGE_IN_FRAME("^I should see the \"([^\"]*)\" message in \"([^\"]*)\" frame$"),
    I_SWITCH_TO_WINDOW("^I switch to window with index \"([^\"]*)\"$"),
    I_CLICK_WITH_JS("^I click on the \"([^\"]*)\" (?:button|link|option|element) by JS$"),
    BROWSER_PERFORMES_COMMAND("^Browser performes \"([^\"]*)\" command$"),
    I_SELECT_FROM_ELEMENT_SPECIAL("^I select \"([^\"]*)\" from \"([^\"]*)\" \"([^\"]*)\"$"),
    I_CAPTURE_DATA("^I capture text data \"([^\"]*)\" as \"([^\"]*)\" variable$");

    private final String pattern;

    private static final Map<String, StepPatterns> lookup = new HashMap<String, StepPatterns>();

    static {
        for (StepPatterns steps : StepPatterns.values()) {
            lookup.put(steps.getPattern(), steps);
        }
    }

    StepPatterns(String pattern) {
        this.pattern = pattern;
    }

    public String getPattern() {
        return pattern;
    }

    public static StepPatterns get(String pattern) {
        return lookup.get(pattern);
    }

    public static StepPatterns getEnum(String pattern) {
        for (StepPatterns p: values()) {
            if (p.getPattern().equalsIgnoreCase(pattern))
                return p;
        }throw new IllegalArgumentException("Can't find pattern type " + pattern);
    }

}
