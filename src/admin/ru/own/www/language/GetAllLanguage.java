package admin.ru.own.www.language;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;

import admin.ru.own.www.entity.Language;
import admin.ru.own.www.mybatis.dao.LanguageDAOImp;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionSupport;

public class GetAllLanguage extends ActionSupport implements ServletResponseAware
{
	List<Language> multiLanguage=null;
	
	String callback=null; //说明是webAPP端发送过来的请求
	private HttpServletResponse response;  //说明是webAPP端发送过来的请求的时候返回数据的时候使用
	
    
    @Override
    public String execute() throws Exception 
    {
    	LanguageDAOImp landao=new LanguageDAOImp();
    	multiLanguage=landao.getAllLanguage();
    	landao.closeSession();
    	if(multiLanguage!=null)
    	{
    		if(callback!=null)
    		{//手机端发送过来的请求
    			JSONArray jsonString=JSONArray.fromObject(multiLanguage);
    			String temp=jsonString.toString();
    			callback="getShowLanguage("+temp+")";
    			response.getWriter().write(callback);
    			return "WebAPP";
    		}
    		else 
    		{
    			return SUCCESS;
			}
    	}
    	else
    	{
    		return ERROR;
    	}
    }
    
    @Override
    public void setServletResponse(HttpServletResponse response) {
    	this.response=response;  
    }

	public List<Language> getMultiLanguage() {
		return multiLanguage;
	}

	public void setMultiLanguage(List<Language> multiLanguage) {
		this.multiLanguage = multiLanguage;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	
    
	

    
}
