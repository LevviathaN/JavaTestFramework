package ui.utils;

import org.openqa.selenium.By;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UiExceptionHandler {
    private List<Object> handlers = new ArrayList<>();
    private List<String> triggers = new ArrayList<>();
    private By element;
    private Exception e;
    private String log, name;
    //boolean map, used by UiHandlers to determine, if exception was handled by any handler. If not, then DEFAULT_HANDLER is executed.
    public static Map<String, Boolean> isHandled = new HashMap<>();
    //boolean, used by UiHandlers to determine, if you want to repeat Action, on which you had an exception, after running handlers.
    public static boolean repeatAction = true;

}
