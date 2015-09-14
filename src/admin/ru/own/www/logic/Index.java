package admin.ru.own.www.logic;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;


/**  
 * This class is used for 后台管理员的首页
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月8日 下午3:49:59  
 */
public class Index extends ActionSupport implements SessionAware
{
	private Map session; 

	public String index() 
	{
		return SUCCESS;
		
	}

	
	public void setSession(Map session) {
		this.session = session;
	}

	

	
	
}
