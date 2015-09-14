package admin.ru.own.www.logic;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;

import org.hibernate.Session;
import org.hibernate.Transaction;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;
import ru.own.www.entity.User;

import admin.ru.own.www.entity.AdminUser;
import admin.ru.own.www.entity.BrandSeries;
import admin.ru.own.www.entity.Category;
import admin.ru.own.www.entity.CategoryShow;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Brand_Modify extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer selfId;
	private String brandName;
	private Short status;
	private String title;
	private String keyword;
	private String description;

	@SuppressWarnings("finally")
	public String execute(){
		BrandSeries brand;
		Session session=HibernateSessionFactory.getSession();
		Transaction tx = null;
		 try {
				tx=session.beginTransaction();
				brand=(BrandSeries) session.get(BrandSeries.class, selfId);
				brand.setBrandName(brandName);
				brand.setBrandStatus(status);
				tx.commit();
		 }
		 catch (Exception e) {
			 System.out.println(">>>>>>>>>>>>>>>>thers is a bug for modify brandseries!!!!"+e);
		     if (tx!=null) tx.rollback();
			 return ERROR;
		 }
		 finally {
				session.close();
				return SUCCESS;	
		 }

    }
	
	public String modifyXiangxi()
	{
		BrandSeries brand=new BrandSeries();
		brand.setBrandId(selfId);
		brand.setBrandName(brandName);
		brand.setBrandTitle(title);
		brand.setBrandKeywords(keyword);
		brand.setBrandDescription(description);

		int flag=MyBatisDAO.modifybrandXiangXi(brand);
		if(flag==1)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public Integer getSelfId() {
		return selfId;
	}

	public void setSelfId(Integer selfId) {
		this.selfId = selfId;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}



	public Short getStatus() {
		return status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}