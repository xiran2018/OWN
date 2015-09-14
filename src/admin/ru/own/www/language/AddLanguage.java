package admin.ru.own.www.language;

import admin.ru.own.www.entity.Language;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionSupport;

public class AddLanguage extends ActionSupport 
{
	String result;
    String languagename;
    String foreignername;
    String languagecode;
    String countrycode;
    Short show;
    
    @Override
    public String execute() throws Exception 
    {
    	Language lan=new Language();
    	lan.setLanguageName(languagename);
    	lan.setForeignerName(foreignername);
    	lan.setLanguageCode(languagecode);
    	lan.setCountryCode(countrycode);
    	lan.setShow(show);
    	boolean flag=MyBatisDAO.insertLanguage(lan);
    	if(flag==true)
    	{
    		result="插入成功";
    		return SUCCESS;
    	}
    	else
    	{
    		result="插入失败，请稍后再试";
    		return ERROR;
    	}
    }
    
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getLanguagename() {
		return languagename;
	}
	public void setLanguagename(String languagename) {
		this.languagename = languagename;
	}
	public String getForeignername() {
		return foreignername;
	}
	public void setForeignername(String foreignername) {
		this.foreignername = foreignername;
	}
	public String getLanguagecode() {
		return languagecode;
	}
	public void setLanguagecode(String languagecode) {
		this.languagecode = languagecode;
	}
	public String getCountrycode() {
		return countrycode;
	}
	public void setCountrycode(String countrycode) {
		this.countrycode = countrycode;
	}
	public Short getShow() {
		return show;
	}
	public void setShow(Short show) {
		this.show = show;
	}

    
}
