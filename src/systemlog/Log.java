package systemlog;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.config.ConfigurationSource;

import admin.ru.own.www.config.Parameters;
import admin.ru.own.www.logic.StoreOperate;

public class Log implements WriteLog 
{

	private static Log log;

	// 私有的构造方法，避免外部创建实例
	private Log() 
	{

	}

	synchronized public void out(String logs)
	{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		System.out.print(df.format(new Date()));// new Date()为获取当前系统时间
		System.out.print("  ");
		System.out.println(logs);
	}

	public static Log getInstance() 
	{
		if (log == null) 
		{
			log = new Log();
		}
		return log;
	}

	synchronized public void out(int size) 
	{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		System.out.print(df.format(new Date()));// new Date()为获取当前系统时间
		System.out.print("  ");
		System.out.println(size);
	}
	
	synchronized public static void log4jLogTrace(Class<?> cla,String s)
	{
		String log4j2ConfigPath=Parameters.log4j2ConfigPath;
	    System.setProperty("-Dlog4j.configurationFile",log4j2ConfigPath);
	    Logger logger = LogManager.getLogger(cla.getName());
	    logger.trace(s);
	}
	
	synchronized public static void log4jLogError(Class<?> cla,String s)
	{
		String log4j2ConfigPath=Parameters.log4j2ConfigPath;
	    System.setProperty("-Dlog4j.configurationFile",log4j2ConfigPath);
	    Logger logger = LogManager.getLogger(cla.getName());
	    logger.error(s);
	}
	
	synchronized public static void log4jLogDebug(Class<?> cla,String s)
	{
		String log4j2ConfigPath=Parameters.log4j2ConfigPath;
	    System.setProperty("-Dlog4j.configurationFile",log4j2ConfigPath);
	    Logger logger = LogManager.getLogger(cla.getName());
	    logger.debug(s);
	}
	
	
	synchronized public static void log4jLogInfo(Class<?> cla,String s)
	{
		String log4j2ConfigPath=Parameters.log4j2ConfigPath;
	    System.setProperty("-Dlog4j.configurationFile",log4j2ConfigPath);
	    Logger logger = LogManager.getLogger(cla.getName());
	    logger.info(s);
	}

	
	synchronized public static void log4jLogFatal(Class<?> cla,String s)
	{
		String log4j2ConfigPath=Parameters.log4j2ConfigPath;
	    System.setProperty("-Dlog4j.configurationFile",log4j2ConfigPath);
	    Logger logger = LogManager.getLogger(cla.getName());
	    logger.fatal(s);
	}
}
