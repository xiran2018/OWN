package admin.ru.own.www.logic;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;

import org.hibernate.Session;
import org.hibernate.Transaction;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;
import ru.own.www.entity.User;
import admin.ru.own.www.entity.AdminUser;
import admin.ru.own.www.entity.Category;
import admin.ru.own.www.entity.CategoryShow;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Category_Delete extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer categoryId;	


	@SuppressWarnings("finally")
	public String execute(){
		
		System.out.println("sljdfsjlfjd++++++++"+categoryId);
		
		Category category;

		Session session=HibernateSessionFactory.getSession();
		Transaction tx = null;
		 try {
				tx=session.beginTransaction();
				category=(Category) session.get(Category.class, categoryId);
				session.delete(category);
				tx.commit();
		 }
		 catch (Exception e) {
			 System.out.println(">>>>>>>>>>>>>>>>thers is a bug for delete category!!!!"+e);
		     if (tx!=null) tx.rollback();
			 return ERROR;
		 }
		 finally {
				session.close();
				MyBatisDAO.deleteMultiForeiCategory(categoryId);
				return SUCCESS;	
		 }

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




    

}