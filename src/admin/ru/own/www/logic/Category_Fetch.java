package admin.ru.own.www.logic;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;
import ru.own.www.entity.User;

import admin.ru.own.www.dao.DataAcessObject;
import admin.ru.own.www.entity.AdminUser;
import admin.ru.own.www.entity.Category;
import admin.ru.own.www.entity.CategoryMultiLanguage;
import admin.ru.own.www.entity.CategoryShow;
import admin.ru.own.www.entity.EditCategoryMultiLanguage;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Category_Fetch extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer categoryId;	
	Category category;
	List<EditCategoryMultiLanguage> cml;

	@SuppressWarnings("finally")
	public String execute()
	{
		 category=DataAcessObject.getcategoryById(categoryId);
		 cml=MyBatisDAO.fetchCategoryMultiLang(categoryId);
		 if(category!=null)
		 {
			 return SUCCESS;	
		 }
		 else
		 {
			 return ERROR;
		 }

    }

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public List<EditCategoryMultiLanguage> getCml() {
		return cml;
	}

	public void setCml(List<EditCategoryMultiLanguage> cml) {
		this.cml = cml;
	}






    

}