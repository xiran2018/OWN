package admin.ru.own.www.mail;

import java.net.MalformedURLException;
import java.net.URL;

import javax.activation.DataSource;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.ImageHtmlEmail;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.SimpleEmail;
import org.apache.commons.mail.resolver.DataSourceUrlResolver;

import admin.ru.own.www.entity.User;
import admin.ru.own.www.util.Utility;

public class EmailSend {
	public EmailSend() {

	}

	public static boolean sendSimpleMail(String sendMailString) {
		// MultiPartEmail email = new MultiPartEmail();//如果要发送带附件的邮件，需使用这个类
		// HtmlEmail email = new HtmlEmail();//可以发送html类型的邮件
		SimpleEmail email = new SimpleEmail();
		// email.setTLS(true); //是否TLS校验，，某些邮箱需要TLS安全校验，同理有SSL校验
		// email.setDebug(true);
		email.setSSLOnConnect(true);
		email.setHostName("box976.bluehost.com");
		email.setSmtpPort(465);
		email.setAuthenticator(new DefaultAuthenticator("frank@poplanding.com", "880309jQl"));
		try {
			email.setFrom("liza@poplanding.com"); // 发送方,这里可以写多个
			email.addTo("2045254608@qq.com"); // 接收方
			email.addCc("965761402@qq.com"); // 抄送方
			// email.addBcc("yuaio@163.com"); // 秘密抄送方
			email.setCharset("GB2312");
			email.setSubject("测试邮件，看看能不能收到"); // 标题
			// email.setMsg("测试测试内容，请查阅！！！");// 内容
			email.setMsg(sendMailString);// 内容
			email.send();
//			System.out.println("发送成功");
		} catch (EmailException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static void sendMailWithAttachment() {
		String basePath = Utility.getRootPath();
		// System.out.println("********************basePath:"+basePath);
		String fileName = basePath + "/upload/emailAttachImage/logo.jpg";
		// Create the attachment
		EmailAttachment attachment = new EmailAttachment();
		// attachment.setURL(new
		// URL("http://www.apache.org/images/asf_logo_wide.gif"));
		attachment.setPath(fileName);
		attachment.setDisposition(EmailAttachment.ATTACHMENT);
		attachment.setDescription("Picture of John");
		attachment.setName("logo.jpg");

		try {
			// Create the email message
			MultiPartEmail email = new MultiPartEmail();
			// email.setDebug(true);
			email.setSSLOnConnect(true);
			email.setHostName("box976.bluehost.com");
			email.setSmtpPort(465);
			email.setAuthenticator(new DefaultAuthenticator("frank@poplanding.com", "880309jQl"));

			email.setFrom("liza@poplanding.com", "liza");// 发送方,这里可以写多个
			email.addTo("540692237@qq.com", "quanliang"); // 接收方
			email.addCc("965761402@qq.com", "haixia"); // 抄送方
			// email.addTo("jdoe@somewhere.org", "John Doe");
			email.setSubject("The picture");
			email.setMsg("Here is the picture you wanted");

			// add the attachment
			email.attach(attachment);

			// send the email
			email.send();
//			System.out.println("附件发送成功");
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}

	public static boolean sendHtmlMail(User user,String sendMailString) {
		String basePath = Utility.getRootPath();
		// System.out.println("********************basePath:"+basePath);
		String fileName = basePath + "/upload/emailAttachImage/logo.jpg";
		// Create the attachment
		EmailAttachment attachment = new EmailAttachment();
		// attachment.setURL(new
		// URL("http://www.apache.org/images/asf_logo_wide.gif"));
		attachment.setPath(fileName);
		attachment.setDisposition(EmailAttachment.ATTACHMENT);
		attachment.setDescription("welcome to our shopping store");
		attachment.setName("logo.jpg");

		try {
			// Create the email message
			HtmlEmail email = new HtmlEmail();
			
			email.setDebug(true);

			// email.setDebug(true);
			email.setSSLOnConnect(true);
			email.setHostName("box976.bluehost.com");
			email.setSmtpPort(465);
			email.setAuthenticator(new DefaultAuthenticator("frank@poplanding.com", "880309jQl"));

			email.setFrom("liza@poplanding.com", "liza");// 发送方,这里可以写多个
			email.addTo(user.getUsermail(), "quanliang"); // 接收方
			// email.addCc("965761402@qq.com","haixia"); // 抄送方
			// email.addTo("jdoe@somewhere.org", "John Doe");
			email.setSubject("Get Password");

			email.setMsg("Here is the picture you wanted");

			// add the inline image
			// embed the image and get the content id
			// URL url = new
			// URL("http://localhost:8080/own/upload/emailAttachImage/logo.jpg");
			// String cid = email.embed(url, "Apache logo");

			// set the html message
			// email.setHtmlMsg("<html>The apache logo - <img src=\"cid:"+cid+"\"></html>");
			email.setHtmlMsg(sendMailString);

			// set the alternative message
			email.setTextMsg("Your email client does not support HTML messages");

			// add the attachment
			email.attach(attachment);

			// send the email
			email.send();
//			System.out.println("html email 发送成功");
		} catch (EmailException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static void sendHtmlMailwithEmbeddedImages() {
		String basePath = Utility.getRootPath();
		// System.out.println("********************basePath:"+basePath);
		String fileName = basePath + "/upload/emailAttachImage/logo.jpg";
		// Create the attachment
		EmailAttachment attachment = new EmailAttachment();
		// attachment.setURL(new
		// URL("http://www.apache.org/images/asf_logo_wide.gif"));
		attachment.setPath(fileName);
		attachment.setDisposition(EmailAttachment.ATTACHMENT);
		attachment.setDescription("Picture of John");
		attachment.setName("logo.jpg");

		try {

			// Create the email message
			ImageHtmlEmail email = new ImageHtmlEmail();

			// define you base URL to resolve relative resource locations
			URL url = new URL("http://www.apache.org");

			// create the email message
			// email.setDataSourceResolver(new DataSourceResolverImpl(url));
			email.setDataSourceResolver(new DataSourceUrlResolver(url));

			// email.setDebug(true);
			email.setSSLOnConnect(true);
			email.setHostName("box976.bluehost.com");
			email.setSmtpPort(465);
			email.setAuthenticator(new DefaultAuthenticator("frank@poplanding.com", "880309jQl"));

			email.setFrom("liza@poplanding.com", "liza");// 发送方,这里可以写多个
			email.addTo("540692237@qq.com", "quanliang"); // 接收方
			email.addCc("965761402@qq.com", "haixia"); // 抄送方
			// email.addTo("jdoe@somewhere.org", "John Doe");
			email.setSubject("The picture");

			// load your HTML email template
			String htmlEmailTemplate = "<html>www.poplanding.com - <img src='images/asf_logo_wide.gif'></html>";

			// set the html message
			email.setHtmlMsg(htmlEmailTemplate);

			// set the alternative message
			email.setTextMsg("Your email client does not support HTML messages");

			// add the attachment
			email.attach(attachment);

			// send the email
			email.send();
//			System.out.println("image html email 发送成功");
		} catch (EmailException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		User user=new User();
		user.setUsermail("965761402@qq.com");
		// sendSimpleMail();
		// sendMailWithAttachment();
		sendHtmlMail(user,"sdjf");
		// sendHtmlMailwithEmbeddedImages();
	}
}
