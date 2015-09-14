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

public class Login extends ActionSupport implements SessionAware {

	private Map<String, Object> session;
	String userName;
	String password;
	String randomCode;

	// 该字段的意思表示，当用户登录时，应该返回何种类型的值，0（默认）：表示可以按照常规的方式返回，1：表示登录成功之后，只能返回json的格式数据，使页面保留在发出请求的页面（防止页面跳转），然后继续登录之前的请求
	int type = 0;

	// 登录前页面
	private String prePage;

	public String execute() {

		// System.out.println("********session********"+session.get("SESSION_SECURITY_CODE"));
		// System.out.println(getUserName());
		// System.out.println(getPassword());
		if (isInvalid(getUserName()))
			return INPUT;
		if (isInvalid(getPassword()))
			return INPUT;
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(AdminUser.class);
		Criterion cri1 = Expression.eq("UName", userName);
		Criterion cri2 = Expression.eq("UPassword", password);
		criteria.add(cri1);
		criteria.add(cri2);
		List list = criteria.list();
		session.close();

		if (list.size() > 0) {
			ActionContext ac = ActionContext.getContext();
			ac.getSession().put("user", userName);
			if (type == 0) {
				// 获取跳转到登陆界面之前的页面地址，由拦截器提供
				prePage = (String) ac.getSession().get("prePage");
				// 清除session中的数据
				ac.getSession().remove("prePage");
				if (prePage == null || "".equals(prePage)) {
					// 不是拦截器跳转到登陆页面的，直接访问的登陆页面
					return "home";
				} else {
					return SUCCESS;
				}
			} else if (type == 1) {
				return "jsonResult";
			}

		} else {
			return ERROR;
		}

		return SUCCESS;
	}

	private boolean isInvalid(String value) {
		return (value == null || value.length() == 0);
	}

	public String getUserName() {
		return userName;
	}

	public String getPrePage() {
		return prePage;
	}

	public void setPrePage(String prePage) {
		this.prePage = prePage;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRandomCode() {
		return randomCode;
	}

	public void setRandomCode(String randomCode) {
		this.randomCode = randomCode;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}