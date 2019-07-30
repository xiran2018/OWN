// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   EmailHtml.java

package admin.ru.own.www.mail;

import admin.ru.own.www.entity.User;
import admin.ru.own.www.mail.password.EmailHtmlPassword;
import java.util.HashMap;

// Referenced classes of package admin.ru.own.www.mail:
//			EmailHtmlObject, EmailHtmlRegister, EmailEntity

public class EmailHtml
{

	public EmailHtml()
	{
	}

	public EmailEntity getRegisterHtml(User user)
	{
		String html = ((EmailHtmlRegister)EmailHtmlObject.registerHtmlHashMap.get(user.getLanid())).getEmailHtmlRegister(user);
		String subjectString = ((EmailHtmlRegister)EmailHtmlObject.registerHtmlHashMap.get(user.getLanid())).getSubject();
		EmailEntity emailEntity = createEmailEntity(user, subjectString, html);
		return emailEntity;
	}

	public EmailEntity getPasswordHtml(User user)
	{
		String html = ((EmailHtmlPassword)EmailHtmlObject.getPasswordHtmlHashMap.get(user.getLanid())).getEmailGetPasswordHtml(user);
		String subjectString = ((EmailHtmlPassword)EmailHtmlObject.getPasswordHtmlHashMap.get(user.getLanid())).getSubject();
		EmailEntity emailEntity = createEmailEntity(user, subjectString, html);
		return emailEntity;
	}

	private EmailEntity createEmailEntity(User user, String subject, String content)
	{
		EmailEntity emailEntity = new EmailEntity();
		emailEntity.setUser(user);
		emailEntity.setSubject(subject);
		emailEntity.setContent(content);
		return emailEntity;
	}
}
