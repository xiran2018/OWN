// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Dom4JUtility.java

package admin.ru.own.www.util;

import java.io.File;
import java.util.Iterator;
import java.util.List;
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

	public static boolean insertInfo(String configFilePath, String selectNodes, String values)
	{
		Document document;
		try
		{
			SAXReader saxReader = new SAXReader();
			document = saxReader.read(new File(configFilePath));
			Element ip;
			for (Iterator iter = document.selectNodes(selectNodes).iterator(); iter.hasNext(); ip.setText(values))
				ip = (Element)iter.next();

		}
		catch (DocumentException e)
		{
			Log.log4jLogTrace(Dom4JUtility.class, "Parse the config file is wrong when set config value!!!!!!");
			e.printStackTrace();
			return false;
		}
		Utility.writeXML(configFilePath, document);
		return true;
	}

	public static String getInfo(String configFilePath, String selectNodes)
	{
		String content = null;
		try
		{
			SAXReader saxReader = new SAXReader();
			Document document = saxReader.read(new File(configFilePath));
			String value = null;
			for (Iterator iter = document.selectNodes(selectNodes).iterator(); iter.hasNext();)
			{
				Element ip = (Element)iter.next();
				value = ip.getText();
			}

			content = value;
		}
		catch (DocumentException e)
		{
			Log.log4jLogError(Dom4JUtility.class, "Parse the config file is wrong!!!!!!");
			e.printStackTrace();
		}
		return content;
	}
}
