// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   EmailHtmlObject.java

package admin.ru.own.www.mail;

import admin.ru.own.www.mail.password.EmailHtmlPassword;
import java.util.HashMap;

// Referenced classes of package admin.ru.own.www.mail:
//			EmailHtmlRegister, EmailHtmlCommon

public class EmailHtmlObject
{

	public static HashMap emailHtmlCommonHashMap = getEailHtmlCommonHashMap();
	public static HashMap registerHtmlHashMap = getRegisterHtmlHashMap();
	public static HashMap getPasswordHtmlHashMap = getPasswordHtmlHashMap();

	public EmailHtmlObject()
	{
	}

	public static HashMap getRegisterHtmlHashMap()
	{
		HashMap registerHtmlMap = new HashMap();
		EmailHtmlRegister ruEmailHtmlRegister = new EmailHtmlRegister();
		ruEmailHtmlRegister.setSubject("Востановление пароля");
		ruEmailHtmlRegister.setHeader(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(8)))).getHeader());
		ruEmailHtmlRegister.setHello(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(8)))).getHello());
		ruEmailHtmlRegister.setWelcome(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(8)))).getWelcome());
		ruEmailHtmlRegister.setBaseURL(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(8)))).getBaseUrl());
		ruEmailHtmlRegister.setEmail("Ваш логин для входа на сайт");
		ruEmailHtmlRegister.setActivate("Пожалуйста, нажмите на ссылку ниже, чтобы активировать номер счета");
		ruEmailHtmlRegister.setRegards(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(8)))).getRegards());
		ruEmailHtmlRegister.setCompany(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(8)))).getCompany());
		ruEmailHtmlRegister.setTag(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(8)))).getTag());
		registerHtmlMap.put(Integer.valueOf(8), ruEmailHtmlRegister);
		EmailHtmlRegister enEmailHtmlRegister = new EmailHtmlRegister();
		enEmailHtmlRegister.setSubject("welcome to registe 999own");
		enEmailHtmlRegister.setHeader(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(7)))).getHeader());
		enEmailHtmlRegister.setHello(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(7)))).getHello());
		enEmailHtmlRegister.setWelcome(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(7)))).getWelcome());
		enEmailHtmlRegister.setBaseURL(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(7)))).getBaseUrl());
		enEmailHtmlRegister.setEmail("Your can use your email to visit the website");
		enEmailHtmlRegister.setActivate("Please click on the link to activate your account");
		enEmailHtmlRegister.setRegards(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(7)))).getRegards());
		enEmailHtmlRegister.setCompany(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(7)))).getCompany());
		enEmailHtmlRegister.setTag(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(7)))).getTag());
		registerHtmlMap.put(Integer.valueOf(7), enEmailHtmlRegister);
		return registerHtmlMap;
	}

	private static HashMap getEailHtmlCommonHashMap()
	{
		HashMap emailHtmlCommonMap = new HashMap();
		EmailHtmlCommon ruEmailHtmlCommon = new EmailHtmlCommon();
		EmailHtmlCommon.setBaseUrl("http://www.999own.ru");
		EmailHtmlCommon.setHello("Здравствуйте");
		EmailHtmlCommon.setWelcome("Добро пожаловать на обувной интернет портал QIFA.ru");
		String ruheaderString = (new StringBuilder("<a href='")).append(EmailHtmlCommon.getBaseUrl()).append("'>www.999own.ru - <img src='images/logo.jpg'></a>").toString();
		EmailHtmlCommon.setHeader(ruheaderString);
		EmailHtmlCommon.setRegards("С Уважением к Вам и Вашему бизнесу,");
		EmailHtmlCommon.setCompany("Компания 999OWN ( '999OWN' - нулевая дистанция с производителем!)");
		String tag = "<a href='http://www.999own.ru/' target='_blank'>WWW.999OWN.RU</a><br>13436838059<br><a href='mailto:info@999own.ru' target='_blank'>info@999won.ru</a>";
		EmailHtmlCommon.setTag(tag);
		emailHtmlCommonMap.put(Integer.valueOf(8), ruEmailHtmlCommon);
		EmailHtmlCommon enEmailHtmlCommon = new EmailHtmlCommon();
		EmailHtmlCommon.setBaseUrl("http://www.999own.ru");
		String enheaderString = (new StringBuilder("<a href='")).append(EmailHtmlCommon.getBaseUrl()).append("'>www.999own.ru - <img src='images/logo.jpg'></a>").toString();
		EmailHtmlCommon.setHeader(enheaderString);
		EmailHtmlCommon.setHello("Hello");
		EmailHtmlCommon.setWelcome("Welcome to the online store 999own.ru");
		EmailHtmlCommon.setRegards("Full respect for you and your business,");
		EmailHtmlCommon.setCompany("Inspiration Limited ( '999own' - Zero Distance & Manufacturer!)");
		String entag = "<a href='http://www.999own.ru/' target='_blank'>WWW.999OWN.RU</a><br>13436838059<br><a href='mailto:info@999own.ru' target='_blank'>info@999won.ru</a>";
		EmailHtmlCommon.setTag(entag);
		emailHtmlCommonMap.put(Integer.valueOf(7), enEmailHtmlCommon);
		return emailHtmlCommonMap;
	}

	private static HashMap getPasswordHtmlHashMap()
	{
		HashMap emailHtmlPasswordHashMap = new HashMap();
		EmailHtmlPassword ruEmailHtmlPassword = new EmailHtmlPassword();
		ruEmailHtmlPassword.setSubject("Find the password of 999OWN");
		ruEmailHtmlPassword.setHeader(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(8)))).getHeader());
		ruEmailHtmlPassword.setHello(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(8)))).getHello());
		ruEmailHtmlPassword.setBaseURL(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(8)))).getBaseUrl());
		ruEmailHtmlPassword.setRegards(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(8)))).getRegards());
		ruEmailHtmlPassword.setCompany(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(8)))).getCompany());
		ruEmailHtmlPassword.setTag(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(8)))).getTag());
		emailHtmlPasswordHashMap.put(Integer.valueOf(8), ruEmailHtmlPassword);
		EmailHtmlPassword enEmailHtmlPassword = new EmailHtmlPassword();
		enEmailHtmlPassword.setSubject("Find the password of 999OWN");
		enEmailHtmlPassword.setHeader(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(7)))).getHeader());
		enEmailHtmlPassword.setHello(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(7)))).getHello());
		enEmailHtmlPassword.setBaseURL(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(7)))).getBaseUrl());
		enEmailHtmlPassword.setRegards(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(7)))).getRegards());
		enEmailHtmlPassword.setCompany(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(7)))).getCompany());
		enEmailHtmlPassword.setTag(((EmailHtmlCommon) (emailHtmlCommonHashMap.get(Integer.valueOf(7)))).getTag());
		emailHtmlPasswordHashMap.put(Integer.valueOf(7), enEmailHtmlPassword);
		return emailHtmlPasswordHashMap;
	}

}
