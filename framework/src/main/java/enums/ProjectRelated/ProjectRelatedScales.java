package enums.ProjectRelated;

import java.util.*;

public class ProjectRelatedScales {

//    public static LinkedList<String> diamondCut = new LinkedList<>(Arrays.asList("NONE","GOOD","VERY GOOD","EXCELLENT","IDEAL"));
//    public static LinkedList<String> diamondColor = new LinkedList<>(Arrays.asList("K","J","I","H","G","F","E","D"));
//    public static LinkedList<String> diamondClarity = new LinkedList<>(Arrays.asList("SI2","SI1","VS2","VS1","VVS2","VVS1","IF"));

    public static Map<String,List<String>> scalesMap = new HashMap<>();

    static {
        scalesMap.put("diamondCut", new ArrayList<>(Arrays.asList("NONE","GOOD","VERY GOOD","EXCELLENT","IDEAL")));
        scalesMap.put("diamondColor", new ArrayList<>(Arrays.asList("K","J","I","H","G","F","E","D")));
        scalesMap.put("diamondClarity", new ArrayList<>(Arrays.asList("SI2","SI1","VS2","VS1","VVS2","VVS1","IF")));
    }

}
