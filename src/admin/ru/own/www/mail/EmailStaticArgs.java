// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   EmailStaticArgs.java

package admin.ru.own.www.mail;

import admin.ru.own.www.config.Parameters;
import admin.ru.own.www.util.Utility;

// Referenced classes of package admin.ru.own.www.mail:
//			SendEmailArgs, emailUtility

public class EmailStaticArgs
{

	public static SendEmailArgs emailArgs = getEmailStaticArgs();

	public EmailStaticArgs()
	{
	}

	private static SendEmailArgs getEmailStaticArgs()
	{
		String configFilePath = Parameters.configPath;
		String rootPath = Utility.getRootPath();
		configFilePath = (new StringBuilder(String.valueOf(rootPath))).append("/").append(configFilePath).toString();
		SendEmailArgs ee = new SendEmailArgs();
		ee.setAttachmentFilePath(emailUtility.getEmailInfo(configFilePath, "attachmentFilePath"));
		ee.setAttachmentDescription(emailUtility.getEmailInfo(configFilePath, "attachmentDescription"));
		ee.setAttachmentName(emailUtility.getEmailInfo(configFilePath, "attachmentName"));
		ee.setImageBaseURL(emailUtility.getEmailInfo(configFilePath, "imageBaseURL"));
		String flag = emailUtility.getEmailInfo(configFilePath, "sslOnConnect");
		if ("false".equals(flag))
			ee.setSslOnConnect(false);
		else
			ee.setSslOnConnect(true);
		String hostName = emailUtility.getEmailInfo(configFilePath, "hostName");
		ee.setHostName(hostName);
		flag = emailUtility.getEmailInfo(configFilePath, "smtpPort");
		try
		{
			int port = Integer.parseInt(flag);
			ee.setSmtpPort(port);
		}
		catch (NumberFormatException e)
		{
			ee.setSmtpPort(0);
		}
		String hostUserName = emailUtility.getEmailInfo(configFilePath, "hostUserName");
		ee.setHostUserName(hostUserName);
		ee.setHostPassword(emailUtility.getEmailInfo(configFilePath, "hostPassword"));
		ee.setFrom(emailUtility.getEmailInfo(configFilePath, "from"));
		ee.setFromName(emailUtility.getEmailInfo(configFilePath, "fromName"));
		return ee;
	}

	public boolean update(SendEmailArgs ee)
	{
		synchronized (emailArgs)
		{
			emailArgs.update(ee);
		}
		return true;
	}

	public SendEmailArgs getEmailArgs()
	{
		return emailArgs;
	}

	public void setEmailArgs(SendEmailArgs emailArgs)
	{
		emailArgs = emailArgs;
	}

}
