// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   emailOperate.java

package admin.ru.own.www.mail;

import admin.ru.own.www.config.Parameters;
import admin.ru.own.www.util.Utility;
import com.opensymphony.xwork2.ActionSupport;

// Referenced classes of package admin.ru.own.www.mail:
//			SendEmailArgs, emailUtility, EmailStaticArgs

public class emailOperate extends ActionSupport
{

	SendEmailArgs ee;

	public emailOperate()
	{
	}

	public String emailManager()
	{
		String configFilePath = Parameters.configPath;
		String rootPath = Utility.getRootPath();
		configFilePath = (new StringBuilder(String.valueOf(rootPath))).append("/").append(configFilePath).toString();
		ee = new SendEmailArgs();
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
		return "success";
	}

	public String updateEmailInfo()
	{
		(new EmailStaticArgs()).update(ee);
		String configFilePath = Parameters.configPath;
		String rootPath = Utility.getRootPath();
		configFilePath = (new StringBuilder(String.valueOf(rootPath))).append("/").append(configFilePath).toString();
		boolean flag = false;
		if (ee != null)
		{
			flag = emailUtility.insertEmailInfo(configFilePath, "attachmentFilePath", ee.getAttachmentFilePath());
			flag = emailUtility.insertEmailInfo(configFilePath, "attachmentDescription", ee.getAttachmentDescription());
			flag = emailUtility.insertEmailInfo(configFilePath, "attachmentName", ee.getAttachmentName());
			flag = emailUtility.insertEmailInfo(configFilePath, "imageBaseURL", ee.getImageBaseURL());
			flag = emailUtility.insertEmailInfo(configFilePath, "sslOnConnect", String.valueOf(ee.isSslOnConnect()));
			flag = emailUtility.insertEmailInfo(configFilePath, "hostName", ee.getHostName());
			flag = emailUtility.insertEmailInfo(configFilePath, "smtpPort", String.valueOf(ee.getSmtpPort()));
			flag = emailUtility.insertEmailInfo(configFilePath, "hostUserName", ee.getHostUserName());
			flag = emailUtility.insertEmailInfo(configFilePath, "hostPassword", ee.getHostPassword());
			flag = emailUtility.insertEmailInfo(configFilePath, "from", ee.getFrom());
			flag = emailUtility.insertEmailInfo(configFilePath, "fromName", ee.getFromName());
		}
		return "success";
	}

	public SendEmailArgs getEe()
	{
		return ee;
	}

	public void setEe(SendEmailArgs ee)
	{
		this.ee = ee;
	}
}
