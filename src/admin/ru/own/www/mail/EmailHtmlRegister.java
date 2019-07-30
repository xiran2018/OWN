// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   EmailHtmlRegister.java

package admin.ru.own.www.mail;

import admin.ru.own.www.entity.User;

public class EmailHtmlRegister
{

	String subject;
	int languageid;
	String header;
	String hello;
	String welcome;
	String email;
	String activate;
	String baseURL;
	String company;
	String regards;
	String tag;

	public EmailHtmlRegister()
	{
	}

	public String getEmailHtmlRegister(User user)
	{
		String html = (new StringBuilder("<p>")).append(header).append("<p>").toString();
		html = (new StringBuilder(String.valueOf(html))).append("<p>").append(hello).append(",").append(user.getUsername()).append("</p>").toString();
		html = (new StringBuilder(String.valueOf(html))).append("<p>").append(welcome).append("</p>").toString();
		html = (new StringBuilder(String.valueOf(html))).append("<p>").append(email).append(":").append(user.getUsermail()).append("</p>").toString();
		String linkString = (new StringBuilder(String.valueOf(baseURL))).append("/client/newCustomerActivate.action?id=").append(user.getUserid()).append("&checkcode=").append(user.getActivecode()).append("&languageId=").append(user.getLanid()).toString();
		html = (new StringBuilder(String.valueOf(html))).append("<p>").append(activate).append(":").append("<a  target= _blank href=").append(linkString).append(">").append(linkString).append("</a>").append("</p>").toString();
		html = (new StringBuilder(String.valueOf(html))).append("<p>").append(regards).append("</p>").toString();
		html = (new StringBuilder(String.valueOf(html))).append("<p>").append(company).append("</p>").toString();
		html = (new StringBuilder(String.valueOf(html))).append("<p>--------------</p>").toString();
		html = (new StringBuilder(String.valueOf(html))).append("<p>").append(tag).append("</p>").toString();
		return html;
	}

	public int getLanguageid()
	{
		return languageid;
	}

	public void setLanguageid(int languageid)
	{
		this.languageid = languageid;
	}

	public String getHello()
	{
		return hello;
	}

	public void setHello(String hello)
	{
		this.hello = hello;
	}

	public String getWelcome()
	{
		return welcome;
	}

	public void setWelcome(String welcome)
	{
		this.welcome = welcome;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getActivate()
	{
		return activate;
	}

	public void setActivate(String activate)
	{
		this.activate = activate;
	}

	public String getRegards()
	{
		return regards;
	}

	public void setRegards(String regards)
	{
		this.regards = regards;
	}

	public String getTag()
	{
		return tag;
	}

	public void setTag(String tag)
	{
		this.tag = tag;
	}

	public String getCompany()
	{
		return company;
	}

	public void setCompany(String company)
	{
		this.company = company;
	}

	public String getSubject()
	{
		return subject;
	}

	public void setSubject(String subject)
	{
		this.subject = subject;
	}

	public String getHeader()
	{
		return header;
	}

	public void setHeader(String header)
	{
		this.header = header;
	}

	public String getBaseURL()
	{
		return baseURL;
	}

	public void setBaseURL(String baseURL)
	{
		this.baseURL = baseURL;
	}
}
