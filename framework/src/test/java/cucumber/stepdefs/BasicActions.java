package cucumber.stepdefs;

import org.openqa.selenium.By;
import ui.utils.SeleniumHelper;

import java.util.HashMap;
import java.util.Map;

public class BasicActions extends SeleniumHelper {

    Map<String, Action> basicActionsMap = new HashMap<>();
    Action action;

    public BasicActions() {

    }

    public Action getAction(String actionName, By locator) {

        switch (actionName) {
            case "click":
                action = () -> clickOnElement(locator);
                return action;
            case "hover":
                action = () -> hoverItem(locator);
                return action;
        }

        action = () -> clickOnElement(locator);
        return action;
    }

    public Action getActionWithLocator(String actionName, By locator) {

        switch (actionName) {
            case "click":
                action = () -> clickOnElement(locator);
                return action;
            case "hover":
                action = () -> hoverItem(locator);
                return action;
        }

        action = () -> clickOnElement(locator);
        return action;
    }

    public Action getActionWithLocatorAndString(String actionName, By locator) {

        switch (actionName) {
            case "click":
                action = () -> clickOnElement(locator);
                return action;
            case "hover":
                action = () -> hoverItem(locator);
                return action;
        }

        action = () -> clickOnElement(locator);
        return action;
    }

    public void click() {}

    //public void setText() {}

    public void hover() {}

    public void verify() {}

    public void executeReusable() {}
}
