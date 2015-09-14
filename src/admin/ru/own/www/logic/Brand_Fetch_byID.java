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
import admin.ru.own.www.entity.BrandMultiLanguage;
import admin.ru.own.www.entity.BrandSeries;
import admin.ru.own.www.entity.EditBrandMultiLanguage;
import admin.ru.own.www.entity.EditCategoryMultiLanguage;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Brand_Fetch_byID extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int brandId;	
	private BrandSeries brand=null;
	List<EditBrandMultiLanguage> cml;



	public String execute()
	{
			List<BrandSeries> list=null;
			DataAcessObject dao=new DataAcessObject();
			brand = dao.getBrandSeriesByBrandId(brandId);
			if(brand!=null)
			{
				cml=MyBatisDAO.fetchBrandMultiLang(brandId);
				return SUCCESS;	

			}
			else
			{
				
				return ERROR;	
			}

    }


	public int getBrandId() {
		return brandId;
	}


	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}


	public BrandSeries getBrand() {
		return brand;
	}


	public void setBrand(BrandSeries brand) {
		this.brand = brand;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public List<EditBrandMultiLanguage> getCml() {
		return cml;
	}


	public void setCml(List<EditBrandMultiLanguage> cml) {
		this.cml = cml;
	}

}