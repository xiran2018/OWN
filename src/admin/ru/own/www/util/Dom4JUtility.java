// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Dom4JUtility.java

package admin.ru.own.www.util;

import java.io.*;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import org.apache.commons.configuration.PropertiesConfiguration;

import org.dom4j.*;
import org.dom4j.io.SAXReader;
import systemlog.Log;


// Referenced classes of package admin.ru.own.www.util:
//			Utility

public class Dom4JUtility
{

	public Dom4JUtility()
	{
	}

	public static boolean insertInfo(String configFilePath, String selectNodes, String values) {

		try
		{
			PropertiesConfiguration propsConfig=new PropertiesConfiguration(configFilePath);
			propsConfig.setEncoding("UTF-8");
			propsConfig.setListDelimiter('?');//如果内容中包含,设置分割符以后在加载文件才能保证取到所有内容
//			propsConfig.load(configFilePath);
			propsConfig.setAutoSave(true);
			propsConfig.setProperty(selectNodes,values);
//			propsConfig.setFileName(configFilePath);
			propsConfig.save();
//			System.out.println(propsConfig);
			//			propsConfig.c;
//			Parameters params = new Parameters();
//			FileBasedConfigurationBuilder<FileBasedConfiguration> builder =
//					new FileBasedConfigurationBuilder<FileBasedConfiguration>(PropertiesConfiguration.class)
//							.configure(params.properties()
//									.setFileName(configFilePath)
//									.setListDelimiterHandler(new DefaultListDelimiterHandler('|')));
//			Configuration config = builder.getConfiguration();
//			config.setProperty(selectNodes, values);
//			builder.save();
		}
		catch(Exception cex)
		{
			System.err.println("loading of the configuration file failed");
			cex.printStackTrace();
		}

		return true;
//		Document document = null;
//		try
//		{
////			FileInputStream in = new FileInputStream(new File(configFilePath));
////			Reader read = new InputStreamReader(in,"gbk");
//			SAXReader saxReader = new SAXReader();
////			saxReader.setEncoding("UTF-8");
////			document = saxReader.read(read);
//			document = saxReader.read(new File(configFilePath));
//			Element ip;
//			for (Iterator iter = document.selectNodes(selectNodes).iterator(); iter.hasNext(); ip.setText(values))
//				ip = (Element)iter.next();
//
//		}
//		catch (DocumentException e)
//		{
//			Log.log4jLogTrace(Dom4JUtility.class, "Parse the config file is wrong when set config value!!!!!!");
//			e.printStackTrace();
//			return false;
//		}
//		if(document!=null){
//			Utility.writeXML(configFilePath, document);
//		}

//		return true;
	}

	public static String getInfo(String configFilePath, String selectNodes)
	{
		try {
			//getResourceAsStream 有缓存  修改后 还是返回以前的。。
			//InputStream in = Config.class.getClassLoader().getResourceAsStream("config.properties");

			Properties config = new Properties();
			try {
				InputStream in =new BufferedInputStream(new FileInputStream(configFilePath));
				config.load(in);
				in.close();
			} catch (IOException e) {
				System.out.println("加载初始化配置文件失败11111!");
				e.printStackTrace();
			}
			String value = config.getProperty(selectNodes);
//			System.out.println(selectNodes);
//			System.out.println(value);
			return value;
		} catch (Exception e) {
			System.err.println("读取初始化配置文件失败222!");
			e.printStackTrace();
			return null;
		}

//		String content = null;
//		try
//		{
////			FileInputStream in = new FileInputStream(new File(configFilePath));
////			Reader read = new InputStreamReader(in,"UTF-8");
//			SAXReader saxReader = new SAXReader();
////			saxReader.setEncoding("UTF-8");
////			Document document = saxReader.read(read);
//			Document document = saxReader.read(new File(configFilePath));
//			String value = null;
//			for (Iterator iter = document.selectNodes(selectNodes).iterator(); iter.hasNext();)
//			{
//				Element ip = (Element)iter.next();
//				value = ip.getText();
//			}
//
//			content = value;
//		}
//		catch (DocumentException e)
//		{
//			Log.log4jLogError(Dom4JUtility.class, "Parse the config file is wrong!!!!!!");
//			e.printStackTrace();
//		}
//		return content;
	}
}
