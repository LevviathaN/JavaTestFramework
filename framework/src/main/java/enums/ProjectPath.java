package enums;

/**
 * Storage for all path strings in the project
 * */
public enum ProjectPath {
    ROOT_FOLDER(System.getProperty("user.dir").replace("\\", "/")),
    PROPERTIES_FOLDER("/src/main/resources/"),
    METADATA_FOLDER("/src/main/resources/metadata/"),
    PRIVAT_REQUESTS("/src/main/resources/api/xmlRequests/privat/");

    private String path;

    ProjectPath(String path) {
        this.path = path;
    }

    public String getPath() {
        return  this.path;
    }
}
