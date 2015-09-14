package admin.ru.own.www.logic;


import java.sql.Timestamp;

import net.sf.json.JSON;
import net.sf.json.JSONArray;

import org.hibernate.Session;
import org.hibernate.Transaction;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;

import admin.ru.own.www.entity.Category;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionSupport;

public class Category_Insert extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer categoryId;
	
	private String categoryName;
	private Integer categoryFatherId;
	private String multiLanString;
	
	private short isShow;
	private String icon;
	private String image;
	private short imagesize;
	
	private Short isFather;
	
	Category category;

	public String execute()
	{
		
		
		category=new Category();
		category.setCategoryFatherId(categoryFatherId);
		category.setCategoryName(categoryName);
		category.setIcon(icon);
		category.setImage(image);
		category.setImagesize(imagesize);
		category.setIsShow(isShow);

		
//		JSONArray jsonArrary=JSONArray.fromObject(multiLanString);
		
		//加入新的catrgory到主表
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		category.setCreateTime(timestamp);
		category.setIsFather((short)0);
		Session session=HibernateSessionFactory.getSession();
		Transaction tx = null;
		 try 
		 {
				tx=session.beginTransaction();
				session.save(category);
				Category temp=(Category) session.get(Category.class, category.getCategoryFatherId());
				temp.setIsFather((short)1);
				tx.commit();
				//存储分类对应的外语名称相关信息
				categoryId= category.getCategoryId();
				MyBatisDAO.insertCategoryMulitLanguage(multiLanString,categoryId);
		 }
		 catch (Exception e) 
		 {
			 System.out.println(">>>>>>>>>>>>>>>>thers is a bug for save category!!!!");
			 e.printStackTrace();
		     if (tx!=null) tx.rollback();
			 return ERROR;
		 }
		 finally 
		 {
				session.close();
				
		 }
		 return SUCCESS;	
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

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Integer getCategoryFatherId() {
		return categoryFatherId;
	}

	public void setCategoryFatherId(Integer categoryFatherId) {
		this.categoryFatherId = categoryFatherId;
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

	public short getIsShow() {
		return isShow;
	}

	public void setIsShow(short isShow) {
		this.isShow = isShow;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public short getImagesize() {
		return imagesize;
	}

	public void setImagesize(short imagesize) {
		this.imagesize = imagesize;
	}

	



    

}