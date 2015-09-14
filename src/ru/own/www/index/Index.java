package ru.own.www.index;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;
import ru.own.www.entity.User;
import admin.ru.own.www.dao.DataAcessObject;
import admin.ru.own.www.entity.AdminUser;
import admin.ru.own.www.entity.BrandSeries;
import admin.ru.own.www.entity.Category;
import admin.ru.own.www.entity.CategoryShow;
import admin.ru.own.www.entity.Language;
import admin.ru.own.www.mybatis.dao.LanguageDAOImp;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Index extends ActionSupport implements SessionAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Map session;  


	@SuppressWarnings("finally")
	public String execute() 
	{
		//获取默认语言id
//		int languagdId=(int) session.get("languageId");


		return "success";

	}

	public static long getSerialversionuid() 
	{
		return serialVersionUID;
	}
	
    public void setSession(Map session) 
    {  
	       this.session = session;  
	}  

}