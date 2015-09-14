package admin.ru.own.www.logic;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import admin.ru.own.www.util.Utility;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AdminAuthorityInterceptor extends AbstractInterceptor 
{
	private static final long serialVersionUID = 1358600090729208361L;
	//拦截Action处理的拦截方法
	public String intercept(ActionInvocation invocation) throws Exception
	{
	
		/* if(!ServletActionContext.getRequest().isRequestedSessionIdValid()){
	         //session过期,转向session过期提示页,最终跳转至登录页面
	         return Action.LOGIN;
	     }	*/
		// 取得请求相关的ActionContext实例
		ActionContext ctx=invocation.getInvocationContext();
		Map session=ctx.getSession();
		//取出名为user的session属性
		String user=(String)session.get("user");
//		System.out.println("adminauthorINterceptor user:"+user);
		//如果没有登陆，或者登陆所有的用户名不是aumy，都返回重新登陆
		if(user!=null)
		{
			// 用户已经登录，获取请求地址
			
            // 获取HttpServletRequest对象
            HttpServletRequest req = ServletActionContext.getRequest();
            
            //设置客户原来请求的url地址   
            session.put("prePage",  Utility.getGoingURL(req,invocation));
            
			return invocation.invoke();
		}
		else
		{
			// 用户还未登陆

            // 获取HttpServletRequest对象
            HttpServletRequest req = ServletActionContext.getRequest();
            
            //设置客户原来请求的url地址   
            session.put("prePage",  Utility.getGoingURL(req,invocation));

			
			//没有登陆，将服务器提示设置成一个HttpServletRequest属性
            String requestType = req.getHeader("X-Requested-With");
            if (requestType != null && requestType.equals("XMLHttpRequest")) 
            {
                return Action.ERROR;
            } else 
            {
                return Action.LOGIN;
            }
//			return Action.LOGIN;
		}

	 }
	

 }


