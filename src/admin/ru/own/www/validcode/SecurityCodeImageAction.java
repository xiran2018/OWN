package admin.ru.own.www.validcode;


import java.io.ByteArrayInputStream;
import java.util.Map;



import org.apache.struts2.interceptor.SessionAware;

import admin.ru.own.www.validcode.SecurityCode.SecurityCodeLevel;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class SecurityCodeImageAction extends ActionSupport implements
		SessionAware {

	private int type;//1:表示客户端的登陆验证码
	private Map<String, Object> session;
	private ByteArrayInputStream imageStream;
	
	@Override
	public String execute() throws Exception {
		
		//如果开启Hard模式，可不区分大小写
		String securityCode = SecurityCode.getSecurityCode(4, SecurityCodeLevel.Hard, false);
		//获取默认难度和长度的验证码
//		String securityCode  = SecurityCode.getSecurityCode();
		imageStream = SecurityImage.getImageAsInputStream(securityCode);
		//放入session
		if(type==1)
		{
			session.put("CLIENT_REGISTER_SESSION_SECURITY_CODE", securityCode);
		}
		else 
		{
			session.put("SESSION_SECURITY_CODE", securityCode);
		}
		return SUCCESS;
	}
	
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setImageStream(ByteArrayInputStream imageStream) {
		this.imageStream = imageStream;
	}

	public ByteArrayInputStream getImageStream() {
		return imageStream;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
	

}