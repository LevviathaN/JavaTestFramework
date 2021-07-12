package ui.utils;

import java.util.HashMap;

/**
 * @author astepaniuk
 * This class (singleton) is designed to act as a bridge to transfer data between claases across the framework.
 */
public class GlobalDataBridge {

    private static GlobalDataBridge instance = null;

    public HashMap<String, Object> getDataBuffer() {
        return dataBuffer;
    }

    private HashMap<String, Object> dataBuffer = new HashMap<>();

    public static GlobalDataBridge getInstance() {
        if (instance==null) {
            instance = new GlobalDataBridge();
        }

        return instance;
    }

    private GlobalDataBridge() {
    }

    public void setBufferValueByKey(String key, Object value) {

        if (key != null && value !=null) {
            dataBuffer.put(key, value);
        } else {
            System.out.println("Some of the data you are trying to insert is null!");
        }
    }

    public <T> T getBufferValueByKey(String key) {

        if (dataBuffer != null || dataBuffer.size() != 0) {
            return (T) dataBuffer.get(key);
        } else {
            System.out.println("Data Bridge does not contain data!");
        }

        return null;
    }

    public void removeBufferElement(String key) {
        if (key != null) {
            dataBuffer.remove(key);
        }
    }

    public Boolean bufferContainsKey (Object key) {

        if (key != null) {
           return dataBuffer.containsKey(key);
        }

        return null;
    }

    public void copyMapToBuffer (HashMap<String, Object> copiedMap) {

        if (copiedMap != null && copiedMap.size() != 0) {

            this.dataBuffer.putAll(copiedMap);
        }
    }

    public void copyValueToAnotherKey(String sourceKey, String targetKey) {

        Object sourceValue = dataBuffer.get(sourceKey);

        if (sourceValue != null) {
            dataBuffer.put(targetKey, sourceValue);
        }

        else {
            System.out.println("Buffer element, which source key has been provided either does not contain any value or does not exist");
        }
    }
}
