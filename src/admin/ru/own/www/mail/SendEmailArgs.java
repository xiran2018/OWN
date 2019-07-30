// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   SendEmailArgs.java

package admin.ru.own.www.mail;


public class SendEmailArgs
{

	private String attachmentFilePath;
	private String attachmentDescription;
	private String attachmentName;
	private String imageBaseURL;
	private boolean sslOnConnect;
	private String hostName;
	private int smtpPort;
	private String hostUserName;
	private String hostPassword;
	private String from;
	private String fromName;
	private String to;
	private String toName;
	private String setSubject;
	private String htmlMessage;
	private String alternativeMessage;

	public SendEmailArgs()
	{
	}

	public String getAttachmentFilePath()
	{
		return attachmentFilePath;
	}

	public void setAttachmentFilePath(String attachmentFilePath)
	{
		this.attachmentFilePath = attachmentFilePath;
	}

	public String getAttachmentDescription()
	{
		return attachmentDescription;
	}

	public void setAttachmentDescription(String attachmentDescription)
	{
		this.attachmentDescription = attachmentDescription;
	}

	public String getAttachmentName()
	{
		return attachmentName;
	}

	public void setAttachmentName(String attachmentName)
	{
		this.attachmentName = attachmentName;
	}

	public String getImageBaseURL()
	{
		return imageBaseURL;
	}

	public void setImageBaseURL(String imageBaseURL)
	{
		this.imageBaseURL = imageBaseURL;
	}

	public boolean isSslOnConnect()
	{
		return sslOnConnect;
	}

	public void setSslOnConnect(boolean sslOnConnect)
	{
		this.sslOnConnect = sslOnConnect;
	}

	public String getHostName()
	{
		return hostName;
	}

	public void setHostName(String hostName)
	{
		this.hostName = hostName;
	}

	public int getSmtpPort()
	{
		return smtpPort;
	}

	public void setSmtpPort(int smtpPort)
	{
		this.smtpPort = smtpPort;
	}

	public String getHostUserName()
	{
		return hostUserName;
	}

	public void setHostUserName(String hostUserName)
	{
		this.hostUserName = hostUserName;
	}

	public String getHostPassword()
	{
		return hostPassword;
	}

	public void setHostPassword(String hostPassword)
	{
		this.hostPassword = hostPassword;
	}

	public String getFrom()
	{
		return from;
	}

	public void setFrom(String from)
	{
		this.from = from;
	}

	public String getTo()
	{
		return to;
	}

	public String getFromName()
	{
		return fromName;
	}

	public void setFromName(String fromName)
	{
		this.fromName = fromName;
	}

	public String getToName()
	{
		return toName;
	}

	public void setToName(String toName)
	{
		this.toName = toName;
	}

	public void setTo(String to)
	{
		this.to = to;
	}

	public String getSetSubject()
	{
		return setSubject;
	}

	public void setSetSubject(String setSubject)
	{
		this.setSubject = setSubject;
	}

	public String getHtmlMessage()
	{
		return htmlMessage;
	}

	public void setHtmlMessage(String htmlMessage)
	{
		this.htmlMessage = htmlMessage;
	}

	public String getAlternativeMessage()
	{
		return alternativeMessage;
	}

	public void setAlternativeMessage(String alternativeMessage)
	{
		this.alternativeMessage = alternativeMessage;
	}

	public void update(SendEmailArgs ee)
	{
		attachmentFilePath = ee.getAttachmentFilePath();
		attachmentDescription = ee.getAttachmentDescription();
		attachmentName = ee.getAttachmentName();
		imageBaseURL = ee.getImageBaseURL();
		sslOnConnect = ee.isSslOnConnect();
		hostName = ee.getHostName();
		smtpPort = ee.getSmtpPort();
		hostUserName = ee.getHostUserName();
		hostPassword = ee.getHostPassword();
		from = ee.getFrom();
		fromName = ee.getFromName();
	}
}
