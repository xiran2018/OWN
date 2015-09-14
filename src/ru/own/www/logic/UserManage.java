package ru.own.www.logic;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;
import ru.own.www.entity.User;

import com.opensymphony.xwork2.ActionSupport;

public class UserManage extends ActionSupport  {
	// 总共的数据量
	private int total;

	// 每页显示多少条
	private int pageSize;

	// 共有多少页
	private int totalPage;

	// 当前是第几页
	private int index;

	// 数据
	private List<?> userlist;

	private Transaction tx;

	public String execute() {
		
		System.out.println("execute me>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		Session sess=HibernateSessionFactory.getSession();
		 try {
		     tx = sess.beginTransaction();
		     //do some work
		     String hql = "from User as u ";
		     Query query = sess.createQuery(hql);
		     userlist= query.list();    //返回的是一个集合
		     tx.commit();
		 }
		 catch (Exception e) {
		     if (tx!=null) tx.rollback();
		 }
		 finally {
		     sess.close();
		 }
		
		return  SUCCESS;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public List<?> getUserlist() {
		return userlist;
	}

	public void setUserlist(List<?> userlist) {
		this.userlist = userlist;
	}

	public Transaction getTx() {
		return tx;
	}

	public void setTx(Transaction tx) {
		this.tx = tx;
	}



}
