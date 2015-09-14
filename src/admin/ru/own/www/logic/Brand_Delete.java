package admin.ru.own.www.logic;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.List;

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
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Brand_Delete extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer brandId;	


	@SuppressWarnings("finally")
	public String execute(){
		
		
		return delete(brandId);

    }
	
	//循环遍历删除某个节点下所有的品牌系列
	public String  delete(Integer brandId)
	{
		Integer tempbrandId=brandId;
		
		BrandSeries brand;

		List<BrandSeries> list=null;

		DataAcessObject dao=new DataAcessObject();
		brand=dao.getBrandSeriesByBrandId(tempbrandId);
		list=dao.getBrandSeriesListByparentId(tempbrandId);
		int count=list.size();
		if(list!=null&&list.size()>0)
		{
			BrandSeries temp=null;
			for(int i=0;i<count;i++)
			{
				temp=list.get(i);
				delete(temp.getBrandId());
			}
					
		}
		dao.DeleteBrandbyBrandId(brandId);
		MyBatisDAO.delMulitForeignBrand(brandId);//删除对应语言的信息

		return SUCCESS;	

	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Integer getBrandId() {
		return brandId;
	}

	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}






    

}