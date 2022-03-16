package ui.utils;

import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.HashMap;
import java.util.Map;
/**
 * @author rlevytskyi
 * <p>
 * Enum to handle different exceptions after click (e.c. spinners and modules that may overlay ui elements)
 * </p>
 */
public enum UiHandlers {

    PF_SPINNER_HANDLER((element, e) -> {
        SeleniumHelper.isHandled.put("pfSpinnerHandler", false);
        WebDriverWait wait = new WebDriverWait(SeleniumHelper.driver(),Duration.ofSeconds(SeleniumHelper.DEFAULT_TIMEOUT),Duration.ofSeconds(1));
        if (e.getMessage().contains("opacity: 1; transition: opacity 225ms cubic-bezier")){
            Reporter.log("Handling PF Spinner");
            BPPLogManager.getLogger().info("Handling PF Spinner");
            wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@role='progressbar']")));
            SeleniumHelper.clickWithJS(element);
            SeleniumHelper.isHandled.put("pfSpinnerHandler", true);
            SeleniumHelper.repeatAction = false;
        }
    }),

    PF_PREMATURE_MENU_CLICK_HANDLER((element, e) -> {
        SeleniumHelper.isHandled.put("pfPrematureMenuClickHandler", false);
        WebDriverWait wait = new WebDriverWait(SeleniumHelper.driver(),Duration.ofSeconds(SeleniumHelper.DEFAULT_TIMEOUT),Duration.ofSeconds(1));
        if (e.getMessage().contains("jss5784")){
            Reporter.log("Handling PF Premature Menu Item Click");
            BPPLogManager.getLogger().info("Handling PF Premature Menu Item Click");
            SeleniumHelper.sleepFor(3000);
            SeleniumHelper.clickOnElement(element);
            SeleniumHelper.isHandled.put("pfPrematureMenuClickHandler", true);
            SeleniumHelper.repeatAction = false;
        }
    }),

    WAIT_HANDLER((element, e) -> {
        SeleniumHelper.isHandled.put("waitHandler", false);
        if (e.getMessage().contains("modal-body scrollable slds-modal__content slds-p-around--medium")||
                e.getMessage().contains("panel slds-modal transitioning movetocenter")||
                e.getMessage().contains("panel slds-modal slds-fade-in-open transitioning movefromcenter")||
                e.getMessage().contains("panel slds-modal slds-fade-in-open")||
                e.getMessage().contains("panel slds-modal")||
                e.getMessage().contains("modal-glass visible")||
                e.getMessage().contains("jss243")||e.getMessage().contains("bodyWrapper")||
                e.getMessage().contains("loading-wrapper")){
            Reporter.log("Handling overlay by Wait");
            BPPLogManager.getLogger().info("Handling overlay by Wait");
            SeleniumHelper.sleepFor(9000);
            SeleniumHelper.isHandled.put("waitHandler", true);
        }
    }),

    PF_SCROLL_HANDLER((element, e) -> {
        SeleniumHelper.isHandled.put("pfScrollHandler", false);
        if(e.getMessage().contains("Other element would receive the click: <button id=\"gladlyChatDragHandle\"")||
                e.getMessage().contains("jss1wye7u4")){
            Reporter.log("Handling click overlay by scrolling 300 pixels down");
            int scrollLength = 100;
            BPPLogManager.getLogger().info("Handling click overlay by scrolling " + scrollLength + " pixels down");
            SeleniumHelper.scrollBy(0,scrollLength);
            SeleniumHelper.isHandled.put("pfScrollHandler", true);
        }
    }),

    PF_SCROLL_UP_HANDLER((element, e) -> {
        SeleniumHelper.isHandled.put("pfScrollUpHandler", false);
        if(e.getMessage().contains("Other element would receive the click: <li class=\"nav-item dropdown\">")||
                e.getMessage().contains("jss1wye7u4")){
            Reporter.log("Handling click overlay by scrolling 100 pixels up");
            int scrollLength = -100;
            BPPLogManager.getLogger().info("Handling click overlay by scrolling " + scrollLength + " pixels up");
            SeleniumHelper.scrollBy(0,scrollLength);
            SeleniumHelper.isHandled.put("pfScrollUpHandler", true);
        }
    }),

    PF_SCROLL_TO_ELEMENT_HANDLER((element, e) -> {
        SeleniumHelper page = new SeleniumHelper();
        SeleniumHelper.isHandled.put("pfScrollToElementHandler", false);
        if(e.getMessage().contains("Other element would receive the click: <button")){
            Reporter.log("Handling click overlay by scrolling to element");
            BPPLogManager.getLogger().info("Handling click overlay by scrolling to element");
            SeleniumHelper.scrollToElement(page.findElement(element));
            SeleniumHelper.isHandled.put("pfScrollToElementHandler", true);
        }
    }),

    SF_CLICK_HANDLER((element, e) -> {
        SeleniumHelper.isHandled.put("sfClickHandler", false);
        if(e.getMessage().contains("javascript error: Cannot read property 'defaultView' of undefined") ||
                e.getMessage().contains("Other element would receive the click: <one-record-home-flexipage2") ||
                e.getMessage().contains("Other element would receive the click: <span force-lookup_lookup")){
            Reporter.log("Handling SF Click with JS");
            BPPLogManager.getLogger().info("Handling SF Click with JS");
            SeleniumHelper.clickWithJS(element);
            SeleniumHelper.repeatAction = false;
            SeleniumHelper.isHandled.put("sfClickHandler", true);
        }
    }),

    PAGE_NOT_LOAD_HANDLER((element, e) -> {

        SeleniumHelper page = new SeleniumHelper();
        StackTraceElement[] stackTraceElementArray = e.getStackTrace();
        StackTraceElement s = stackTraceElementArray[2];
        Boolean bool = s.getMethodName().contains("waitForPageToLoad")
                && e.getCause()==null;

        SeleniumHelper.isHandled.put("pageNotLoadHandler", false);
        if(bool){
            Reporter.log("Handling Page not load");
            BPPLogManager.getLogger().info("Handling Page not load");
            page.executeJSCode("window.stop()");
            SeleniumHelper.repeatAction = false;
            SeleniumHelper.isHandled.put("pageNotLoadHandler", true);
        }
    }),

    ACCEPT_ALERT((element, e) -> {
        SeleniumHelper page = new SeleniumHelper();
        SeleniumHelper.isHandled.put("acceptAlert", false);
            if (e.getMessage().contains("Are you sure want to review this application?")
                    ||e.getMessage().contains("Please make sure that the EPA Gateway Time is set correctly for this application before continuing. Do you wish to proceed changing the application status?")
                    ||e.getMessage().contains("Are you sure want to publish this blog post?")
                    ||e.getMessage().contains("Are you sure want to archive this blog post?")
                    ||e.getMessage().contains("Are you sure?")
                    ||e.getMessage().contains("Are you sure want to remove this component from a page?")
                    ||e.getMessage().contains("Some questions are not answered yet.")
                    ||e.getMessage().contains("Are you sure you wish to confirm this student is eligible?")
                    ||e.getMessage().contains("Are you sure want to publish this page?")) {
                BPPLogManager.getLogger().info("Handling an expected JS Alert" );
                Reporter.log("Handling an expected JS Alert");
                BPPLogManager.getLogger().info("Handling an expected JS Alert");
                page.acceptAlertMessage();
                SeleniumHelper.repeatAction = false;
                SeleniumHelper.isHandled.put("acceptAlert", true);
            }
    }),

    DEFAULT_HANDLER((element, e) -> {
        boolean handled = false;
        for (Boolean value : SeleniumHelper.isHandled.values()) {
            if (value) handled = true;
        }
        if (!handled){
            SeleniumHelper.repeatAction = false;
            Reporter.log("Default Handler: FAIL");
            BPPLogManager.getLogger().info("Default Handler: FAIL");
            Reporter.fail(Tools.getStackTrace(e));
            throw new RuntimeException("Failure clicking on element");
        }
    });

    private final UiHandler handler;

    private static final Map<UiHandler, UiHandlers> lookup = new HashMap<UiHandler, UiHandlers>();

    static {
        for (UiHandlers handlers : UiHandlers.values()) {
            lookup.put(handlers.getHandler(), handlers);
        }
    }

    UiHandlers(UiHandler handler){
        this.handler = handler;
    }

    public UiHandler getHandler(){
        return handler;
    }

}
