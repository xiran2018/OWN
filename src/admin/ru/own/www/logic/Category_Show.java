package admin.ru.own.www.logic;


import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;
import ru.own.www.entity.User;

import admin.ru.own.www.entity.AdminUser;
import admin.ru.own.www.entity.Category;
import admin.ru.own.www.entity.CategoryShow;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Category_Show extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	List<CategoryShow> list;

	public String execute()
	{

		//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		Session session=HibernateSessionFactory.getSession();
		Transaction tx=session.beginTransaction();
		String hql="select new admin.ru.own.www.entity.CategoryShow(categoryId,categoryFatherId,categoryName) from Category";
		list=session.createQuery(hql).list();
		
		tx.commit();
		session.close();
		int count=list.size();
		//System.out.println("<<<<<<<<<<<<<<<<<<<<<<"+count);
		if(list.size()>=1){
					
		   			Iterator<CategoryShow> itor=list.iterator();
		   			while(itor.hasNext()){
		   				CategoryShow cs=itor.next();
		   				//System.out.println(cs.getId()+"|"+cs.getpId()+"|"+cs.getName());
		   			}

				return SUCCESS;
		}
		
		else{
			return ERROR;
		}
		

    }

	public List<CategoryShow> getList() {
		return list;
	}

	public void setList(List<CategoryShow> list) {
		this.list = list;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

    

}