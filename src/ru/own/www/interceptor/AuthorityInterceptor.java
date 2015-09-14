package ru.own.www.interceptor;

import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthorityInterceptor extends AbstractInterceptor 
{
	private static final long serialVersionUID = 1358600090729208361L;
	//拦截Action处理的拦截方法
	public String intercept(ActionInvocation invocation) throws Exception
	{
		// 取得请求相关的ActionContext实例
		ActionContext ctx=invocation.getInvocationContext();
		Map session=ctx.getSession();
		//取出名为customeruserid的session属性
		Integer customeruserid=(Integer)session.get("customeruserid");
		//如果没有登陆，或者登陆所有的用户名不是aumy，都返回重新登陆
		if(customeruserid!=null&&customeruserid>0)
		{
			return invocation.invoke();
		}
		else 
		{
			return Action.LOGIN;
		}
	}
}


