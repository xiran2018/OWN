// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   emailUtility.java

package admin.ru.own.www.mail;

import admin.ru.own.www.util.Dom4JUtility;

public class emailUtility
{

	public emailUtility()
	{
	}

	public static boolean insertEmailInfo(String configFilePath, String elementName, String values)
	{
		String selectNodesString = (new StringBuilder("/Config/Email/")).append(elementName).toString();
		return Dom4JUtility.insertInfo(configFilePath, elementName, values);
	}

	public static String getEmailInfo(String configFilePath, String elementName)
	{
//		String selectNodesString = (new StringBuilder("/Config/Email/")).append(elementName).toString();
		return Dom4JUtility.getInfo(configFilePath, elementName);
	}
}
