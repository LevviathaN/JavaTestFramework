package enums;

/**
 * Declarations for special symbols specific to this project
 * */
public enum SpecialSymbols {
    CURRENT_OS_FOLDER_DELIMITER(""),
    MAC_OS_FOLDER_DELIMITER(""),
    EC_VARIABLE("EC_"),
    RANDOM_DATA("RD_");

    private String symbol;

    SpecialSymbols(String symbol) {
        this.symbol = symbol;
    }

    public String getSymbol() {
        return  this.symbol;
    }
}
