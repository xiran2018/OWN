package admin.ru.own.www.logic;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;
import ru.own.www.entity.User;

import admin.ru.own.www.entity.AdminUser;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class logout extends ActionSupport {

	public String execute() {
		ActionContext ac = ActionContext.getContext();
		ac.getSession().remove("user");
		ac.getSession().remove("prePage");
		return SUCCESS;
	}

}