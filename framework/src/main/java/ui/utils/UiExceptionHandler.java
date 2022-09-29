package ui.utils;

import org.openqa.selenium.By;

import java.util.*;

public class UiExceptionHandler {
    private static List<Object> handlers = new ArrayList<>();
    private List<String> triggers = new ArrayList<>();
    private By element;
    private Exception e;
    private String log, name;
    //boolean map, used by UiHandlers to determine, if exception was handled by any handler. If not, then DEFAULT_HANDLER is executed.
    public static Map<String, Boolean> isHandled = new HashMap<>();
    //boolean, used by UiHandlers to determine, if you want to repeat Action, on which you had an exception, after running handlers.
    public static boolean repeatAction = true;

    public void handle() {

    }



    public void addTriggers(String... triggersArray) {
        triggers.addAll(Arrays.asList(triggersArray));
    }

    public void setTriggers(String... triggersArray) {
        triggers = Arrays.asList(triggersArray);
    }

    public void setElementLocator(By locator) {
        element = locator;
    }

    public void setException(Exception ex) {
        e = ex;
    }
}
