package admin.ru.own.www.logic;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;

import org.hibernate.Session;
import org.hibernate.Transaction;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;
import ru.own.www.entity.User;
import admin.ru.own.www.dao.DataAcessObject;
import admin.ru.own.www.entity.AdminUser;
import admin.ru.own.www.entity.BrandSeries;
import admin.ru.own.www.entity.Category;
import admin.ru.own.www.entity.CategoryShow;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Brand_Insert extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer brandId;
	private String brandName;
	private Integer brandFatherId;
	private Integer classId;
	private Short isFather;
	private Short status;
	private String multiLanString;

	
	BrandSeries brand;

	@SuppressWarnings("finally")
	public String execute(){
		
		System.out.println("****************calssid************"+classId);
		BrandSeries brand=new BrandSeries();
		brand.setParentBrandId(brandFatherId);
		brand.setBrandName(brandName);
		brand.setClassId(classId);
		brand.setBrandStatus(status);
		brand.setIsParent((short)0);
		brand.setBrandStatus(status);
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		brand.setCreateTime(timestamp);
		
		DataAcessObject dao=new DataAcessObject();
		brandId=dao.Insert_Brand_Series(brand);
		if(brandId==-1||brandId.equals(-1))
		{
			return ERROR;
		}
		else
		{
			MyBatisDAO.insertBrandMultiLanguage(multiLanString,brandId);
			return SUCCESS;	
		}


    }

	


	public Integer getBrandId() {
		return brandId;
	}




	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}




	public String getBrandName() {
		return brandName;
	}




	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}




	public Integer getBrandFatherId() {
		return brandFatherId;
	}




	public void setBrandFatherId(Integer brandFatherId) {
		this.brandFatherId = brandFatherId;
	}




	public static long getSerialversionuid() {
		return serialVersionUID;
	}




	public Short getIsFather() {
		return isFather;
	}

	public void setIsFather(Short isFather) {
		this.isFather = isFather;
	}






	public String getMultiLanString() {
		return multiLanString;
	}




	public void setMultiLanString(String multiLanString) {
		this.multiLanString = multiLanString;
	}











	public Short getStatus() {
		return status;
	}




	public void setStatus(Short status) {
		this.status = status;
	}




	public Integer getClassId() {
		return classId;
	}




	public void setClassId(Integer classId) {
		this.classId = classId;
	}



    

}