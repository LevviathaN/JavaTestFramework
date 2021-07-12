package CodeEditor;

/** Class to reperesent Locator object in table view
 * @author ruslanlevytskyi
 * */
public class Locator {

    private String name;
    private String value;

    public Locator(){
        this.name = "";
        this.value = "";
    }

    public Locator(String name, String value){
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

}
