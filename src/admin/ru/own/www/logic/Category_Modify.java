package admin.ru.own.www.logic;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.hibernate.Session;
import org.hibernate.Transaction;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;
import ru.own.www.entity.User;

import admin.ru.own.www.dao.DataAcessObject;
import admin.ru.own.www.entity.AdminUser;
import admin.ru.own.www.entity.Category;
import admin.ru.own.www.entity.CategoryShow;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;
import admin.ru.own.www.util.Utility;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Category_Modify extends ActionSupport implements ServletResponseAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer selfId;
	private String categoryName;
	private Integer categoryFatherId;
	private String categoryOtherName;
	private Short isFather;
	private String title;
	private String keyword;
	private String description;
	private String modify_icon;
	private String modify_image;
	private Short modify_imagesize;
	private Short modify_isShow;
	
	private HttpServletResponse response;

	@SuppressWarnings("finally")
	public String execute()
	{
		Category category;
		Session session=HibernateSessionFactory.getSession();
		Transaction tx = null;
		 try 
		 {
				tx=session.beginTransaction();
				category=(Category) session.get(Category.class, selfId);
				category.setCategoryName(categoryName);
				category.setCategoryOtherName(categoryOtherName);
				category.setTitle(title);
				category.setKeyword(keyword);
				category.setDescription(description);
				tx.commit();
		 }
		 catch (Exception e) 
		 {
			 System.out.println(">>>>>>>>>>>>>>>>thers is a bug for save category!!!!"+e);
		     if (tx!=null) tx.rollback();
			 return ERROR;
		 }
		 finally 
		 {
				session.close();
				return SUCCESS;	
		 }

    }
	
	public String basicModify()
	{
		//修改内容
		Category category=new Category();
		category.setCategoryId(selfId);
		category.setCategoryName(categoryName);
		category.setIsShow(modify_isShow);
		//图片的修改已经在上传文件时修改了，这里不需要重新修改了
//		category.setIcon(modify_icon);
//		category.setImage(modify_image);
		category.setImagesize(modify_imagesize);
		boolean flag=MyBatisDAO.modifyCategoryBasic(category);
		if(flag)
		{	
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	
	
	public String xiangxiModify()
	{
		Category category=new Category();
		category.setCategoryId(selfId);
		category.setCategoryName(categoryName);
		category.setTitle(title);
		category.setKeyword(keyword);
		category.setDescription(description);
		int flag=MyBatisDAO.modifyCategoryXiangXi(category);
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

	public String getCategoryOtherName() {
		return categoryOtherName;
	}

	public void setCategoryOtherName(String categoryOtherName) {
		this.categoryOtherName = categoryOtherName;
	}

	public Short getIsFather() {
		return isFather;
	}

	public void setIsFather(Short isFather) {
		this.isFather = isFather;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getModify_image() {
		return modify_image;
	}

	public void setModify_image(String modify_image) {
		this.modify_image = modify_image;
	}



	public Short getModify_isShow() {
		return modify_isShow;
	}

	public void setModify_isShow(Short modify_isShow) {
		this.modify_isShow = modify_isShow;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) 
	{
		this.response = response;
	}

	public String getModify_icon() {
		return modify_icon;
	}

	public void setModify_icon(String modify_icon) {
		this.modify_icon = modify_icon;
	}

	public Short getModify_imagesize() {
		return modify_imagesize;
	}

	public void setModify_imagesize(Short modify_imagesize) {
		this.modify_imagesize = modify_imagesize;
	}



    

}