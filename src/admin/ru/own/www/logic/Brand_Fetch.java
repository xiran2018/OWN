package admin.ru.own.www.logic;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;
import admin.ru.own.www.dao.DataAcessObject;
import admin.ru.own.www.entity.BrandSeries;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Brand_Fetch extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int categoryId;	
	private String result="";


	public String execute()
	{
			List<BrandSeries> list=null;
			DataAcessObject dao=new DataAcessObject();
			list=dao.getBrandSeriesByCategoryId(categoryId);
			if(list==null)
			{
				return SUCCESS;	
			}
			else
			{
				
				Traverse traverse=new Traverse();
				
				result=traverse.fetchChildren(list);
//				System.out.println("*************************************"+result);
				
				return SUCCESS;	
			}

    }

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}




    

}