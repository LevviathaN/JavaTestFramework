package ui.utils;

import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import ui.pages.BasePage;

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
        BasePage.isHandled.put("pfSpinnerHandler", false);
        WebDriverWait wait = new WebDriverWait(BasePage.driver(), BasePage.DEFAULT_TIMEOUT,300);
        if (e.getMessage().contains("opacity: 1; transition: opacity 225ms cubic-bezier")){
            Reporter.log("Handling PF Spinner");
            wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@role='progressbar']")));
            BasePage.clickWithJS(element);
            BasePage.isHandled.put("pfSpinnerHandler", true);
            BasePage.repeatAction = false;
        }
    }),

    WAIT_HANDLER((element, e) -> {
        BasePage.isHandled.put("waitHandler", false);
        if (e.getMessage().contains("modal-body scrollable slds-modal__content slds-p-around--medium")||
                e.getMessage().contains("panel slds-modal transitioning movetocenter")||
                e.getMessage().contains("panel slds-modal slds-fade-in-open transitioning movefromcenter")||
                e.getMessage().contains("panel slds-modal slds-fade-in-open")||
                e.getMessage().contains("panel slds-modal")||
                e.getMessage().contains("modal-glass visible")||
                e.getMessage().contains("jss243")||e.getMessage().contains("bodyWrapper")||
                e.getMessage().contains("loading-wrapper")){
            Reporter.log("Handling overlay by Wait");
            BasePage.sleepFor(9000);
            BasePage.isHandled.put("waitHandler", true);
        }
    }),

    PF_SCROLL_HANDLER((element, e) -> {
        BasePage.isHandled.put("pfScrollHandler", false);
        if(e.getMessage().contains("jss1bndbcl")||
                e.getMessage().contains("jss1wye7u4")){
            Reporter.log("Handling click overlay by scrolling 300 pixels down");
            BasePage.scrollBy(0,300);
            BasePage.isHandled.put("pfScrollHandler", true);
        }
    }),

    PF_SCROLL_TO_ELEMENT_HANDLER((element, e) -> {
        BasePage page = new BasePage();
        BasePage.isHandled.put("pfScrollToElementHandler", false);
        if(e.getMessage().contains("Other element would receive the click: <button")){
            Reporter.log("Handling click overlay by scrolling to element");
            BasePage.scrollToElement(page.findElement(element));
            BasePage.isHandled.put("pfScrollToElementHandler", true);
        }
    }),

    SF_CLICK_HANDLER((element, e) -> {
        BasePage.isHandled.put("sfClickHandler", false);
        if(e.getMessage().contains("javascript error: Cannot read property 'defaultView' of undefined") ||
                e.getMessage().contains("Other element would receive the click: <one-record-home-flexipage2")){
            Reporter.log("Handling SF Click with JS");
            BasePage.clickWithJS(element);
            BasePage.repeatAction = false;
            BasePage.isHandled.put("sfClickHandler", true);
        }
    }),

    PAGE_NOT_LOAD_HANDLER((element, e) -> {

        BasePage page = new BasePage();
        StackTraceElement[] stackTraceElementArray = e.getStackTrace();
        StackTraceElement s = stackTraceElementArray[2];
        Boolean bool = s.getMethodName().contains("waitForPageToLoad")
                && e.getCause()==null;

        BasePage.isHandled.put("pageNotLoadHandler", false);
        if(bool){
            Reporter.log("Handling Page not load");
            page.executeJSCode("window.stop()");
            BasePage.repeatAction = false;
            BasePage.isHandled.put("pageNotLoadHandler", true);
        }
    }),

    ACCEPT_ALERT((element, e) -> {
        BasePage page = new BasePage();
        BasePage.isHandled.put("acceptAlert", false);
        if(e.getCause()!=null){
            BPPLogManager.getLogger().info("Handling an expected JS Alert" );
            if (e.getCause().toString().contains("Are you sure want to review this application?")
                    ||e.getCause().toString().contains("Please make sure that the EPA Gateway Time is set correctly for this application before continuing. Do you wish to proceed changing the application status?")
                    ||e.getCause().toString().contains("Are you sure want to publish this blog post?")
                    ||e.getCause().toString().contains("Are you sure want to archive this blog post?")
                    ||e.getCause().toString().contains("Are you sure?")
                    ||e.getCause().toString().contains("Are you sure want to remove this component from a page?")
                    ||e.getCause().toString().contains("Some questions are not answered yet.")
                    ||e.getCause().toString().contains("Are you sure want to publish this page?")) {
                Reporter.log("Handling an expected JS Alert");
                page.acceptAlertMessage();
                BasePage.repeatAction = false;
                BasePage.isHandled.put("acceptAlert", true);
            }
        }
    }),

    DEFAULT_HANDLER((element, e) -> {
        boolean handled = false;
        for (Boolean value : BasePage.isHandled.values()) {
            if (value) handled = true;
        }
        if (!handled){
            BasePage.repeatAction = false;
            Reporter.log("Default Handler: FAIL");
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
