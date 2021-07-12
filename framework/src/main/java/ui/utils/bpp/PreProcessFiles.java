package ui.utils.bpp;

import java.io.IOException;

/**
 * @author yzosin
 * <p>
 * The class defines apropriate paths to framework resources
 * </p>
 */
public class PreProcessFiles {

	protected static String METADATA_AND_KEYWORDS_FILES_FOLDER_PATH = null;
	protected static String PROPERTIES_FILES_FOLDER_PATH = null;
	public static String ROOT_FOLDER_PATH = null;
	public static String GUI_FOLDER_PATH = null;
	public static String TEST_FILES_FOLDER_PATH = null;
	public static String QUARK_FILES_FOLDER_PATH = null;
	public static String DOWNLOADED_FILES_FOLDER_PATH = null;

	public PreProcessFiles(){
	}

	public static synchronized String setPropertiesFiles() {
		return PROPERTIES_FILES_FOLDER_PATH;
	}

	String className = this.getClass().getName().replace('.', '/');
	String classJar =
			this.getClass().getResource("/" + className + ".class").toString();


	/**
	 * The method is used for providing the right paths to the client's and the developer's resources folders
	 * - argument that come from command line
	 */
	public void initPaths(boolean moduleUI){
		String rootFolder = System.getProperty("user.dir").replace("\\", "/");
		if (!classJar.startsWith("jar:")) {

			ROOT_FOLDER_PATH = rootFolder;
			GUI_FOLDER_PATH = rootFolder + "/gui";
			METADATA_AND_KEYWORDS_FILES_FOLDER_PATH = rootFolder + "/src/main/resources/data/bpp/keywords.metadata";

			if(moduleUI){
				PROPERTIES_FILES_FOLDER_PATH = rootFolder + "/src/main/resources/default.properties";
				TEST_FILES_FOLDER_PATH = rootFolder + "/testFilesToUpload";
				QUARK_FILES_FOLDER_PATH = rootFolder + "/quarkFiles";
				DOWNLOADED_FILES_FOLDER_PATH = rootFolder + "/downloads";
			}
		}
		else {
			ROOT_FOLDER_PATH = rootFolder;
			GUI_FOLDER_PATH = rootFolder + "/gui";
			METADATA_AND_KEYWORDS_FILES_FOLDER_PATH = rootFolder + "/resources/data/bpp/keywords.metadata";
			TEST_FILES_FOLDER_PATH = rootFolder + "/testFilesToUpload";
			QUARK_FILES_FOLDER_PATH = rootFolder + "/quarkFiles";
			DOWNLOADED_FILES_FOLDER_PATH = rootFolder + "/downloads";
			if (moduleUI) {
				PROPERTIES_FILES_FOLDER_PATH = rootFolder + "/resources/default.properties";
			}
		}
	}


	/**
	 *
	 * Determines if arguments have been provided to run tests locally from the
	 * project level rather than expectedly the NoahClient. The files are
	 * expected to be located locally from the current directory under a folder
	 *
	 * @author tchin
	 * @param args criteria specified by manual qa
	 * @throws IOException will throw exception ending the test execution if invalid information is available
	 * @return returns true if all test configurations are correct and normal test execution can proceed
	 */
	public boolean preProcessTestConfiguration(String... args) throws IOException {

		try {
			initPaths(true);
			//PropertiesHelper.gatherPropertiesFromJSON();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return  false;
		}
	}

}