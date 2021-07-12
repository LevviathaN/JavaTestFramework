package ui.utils;

import org.apache.log4j.FileAppender;
import org.apache.log4j.Logger;

import java.util.concurrent.ConcurrentHashMap;

/**
 * @author yzosin
 * <p>
 * The logger class
 * </p>
 */
public class BPPLogManager {
    private static final ConcurrentHashMap<Long, Logger> loggers = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<Long, FileAppender> appenders = new ConcurrentHashMap<>();

    public static synchronized Logger getLogger() {
        if (loggers.containsKey(Thread.currentThread().getId())) {
            return loggers.get(Thread.currentThread().getId());
        } else {
            Logger logger = Logger.getLogger(Thread.currentThread().getName());
            loggers.put(Thread.currentThread().getId(), logger);
            return logger;
        }
    }

    public static synchronized void addFileAppender(FileAppender appender) {
        getLogger().removeAppender(appenders.get(Thread.currentThread().getId()));
        appenders.put(Thread.currentThread().getId(), appender);
        getLogger().addAppender(appender);
    }
}
