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
import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.entity.BrandSeries;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Attribute_Fetch_By_CategoryId extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int categoryId;	
	private String result="";


	public String execute()
	{
			List<Attribute> list=null;
			DataAcessObject dao=new DataAcessObject();
			list=dao.getAttributeByCategoryId(categoryId);
			if(list==null)
			{
				return ERROR;	
			}
			else
			{
				
				TraverseDataGrid<Attribute> traverse=new TraverseDataGrid<Attribute>();
				
				result=traverse.fetchDataGrid(list);
//				System.out.println("*************************************"+result);
				
				return SUCCESS;	
			}

    }

	public String fecthGlobalAttr()
	{
			List<Attribute> list=null;
			list=MyBatisDAO.fetchGlobalAttr();
			if(list==null)
			{
				return ERROR;	
			}
			else
			{
				
				TraverseDataGrid<Attribute> traverse=new TraverseDataGrid<Attribute>();
				
				result=traverse.fetchDataGrid(list);
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