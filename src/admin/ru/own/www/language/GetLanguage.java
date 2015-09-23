package admin.ru.own.www.language;

import java.util.List;

import admin.ru.own.www.entity.Language;
import admin.ru.own.www.mybatis.dao.LanguageDAOImp;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionSupport;

public class GetLanguage extends ActionSupport 
{
	List<Language> multiLanguage=null;
	String callback=null;
	
    
    @Override
    public String execute() throws Exception 
    {
    	LanguageDAOImp landao=new LanguageDAOImp();
    	multiLanguage=landao.getShowLanguage();
    	landao.closeSession();
    	if(multiLanguage!=null)
    	{
    		if(callback!=null)
    		{
    			callback="getShowLanguage('type':'200')";
    			return "APP";
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
