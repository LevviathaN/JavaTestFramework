package enums;

import java.util.regex.Pattern;

/**
 * Declarations for special symbols specific to this project
 * */
public enum RegexPattern {
    EC("(EC_[A-Z0-9_]*)"),
    RANDOM_DATA("([A-Za-z0-9_~$]*\\[[^\"]*?\\][A-Za-z0-9_~$]*)"),
    PROP("(PR_[A-Za-z0-9_]*)"),
    META_DATA("(MD_[A-Z_]*)"),


    ACCEPTABLE_METADATA_PATTERN("^MD_([A-Z]+_){2}[A-Z]+$"),
    ACCEPTABLE_KEYWORD_PATTERN("^([A-Za-z\\d-_.]*<?KW_AUTO_[A-Z]+(\\b|[|])[~:)(/A-Za-z._#?-]*>?[/A-Za-z\\d@._-]*)+$"),
    ACCEPTABLE_EXECUTION_CONTEXT_PATTERN("^([A-Za-z\\d\\s:\\-/\\\\|@_.=]*<?EC_([A-Z]+_*)+[A-Z]*>?[A-Za-z\\d\\s:\\-/\\|.]*)+$|"),
    GENERAL_METADATA_PATTERN("^MD_.+$"),
    GENERAL_KEYWORD_PATTERN("^.*KW_.+$"),
    GENERAL_EXECUTION_CONTEXT_PATTERN("^(.|.+)?EC_.+$"),
    GENERAL_SIMPLIFIED_RANDOM_PATTERN("^([A-Za-z\\d-_.]*\\[?[~:)(/A-Za-z._#?-]*\\]?)+$"),
    KEYWORD_NAME_PREFIX("KW_AUTO_"),
    EXECUTION_CONTEXT_PREFIX("EC_"),
    KEYWORD_NAME_TO_SKIP("KW_AUTO_SELECT");

    private String regex;

    RegexPattern(String regex) {
        this.regex = regex;
    }

    public String getRegex() {
        return  this.regex;
    }
}
