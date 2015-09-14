package admin.ru.own.www.logic;



import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import systemlog.Log;
import admin.ru.own.www.util.Utility;



public class AuthFilter implements Filter
{
	public void doFilter(ServletRequest request,
	ServletResponse response,
	FilterChain chain)
	throws IOException, ServletException 
	{
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String currentURL = req.getRequestURI();
//		Log.log4jLogTrace(AuthFilter.class,"this is filter^^^^^^currentURL^^^^^^^^^^"+currentURL);
		//method 1
		//得到请求地址之后，去除"/own",得到：/fg/secondforegroundpage_showAll.action 或者 /index.jsp
//		String targetURL = currentURL.substring(currentURL.indexOf("/", 2), currentURL.length());

		//method 2
		String targetURL = req.getServletPath().substring(1);//用这个函数之后不需要考虑项目名称长度的问题.substring(1)的目的是把第一个“/”去除
//		Log.log4jLogTrace(AuthFilter.class,"this is filter^^^^^^^^^^^^^^^^"+targetURL);
		HttpSession session = req.getSession();
		 
		
		if (targetURL.contains("jqladmin")&&(targetURL.contains("jsp")||targetURL.contains("action"))) 
		{//服务器地址
			//Log.log4jLogTrace(AuthFilter.class,"haha,match right!!!!!!!!");
			if (session == null || session.getAttribute("user") == null) 
			{
				// 用户还未登陆

	            // 获取HttpServletRequest对象
	            
	            //设置客户原来请求的url地址   
	            session.setAttribute("prePage",  Utility.getGoingURL(req));
//				System.out.println("haha,match right!!!!!!!!开始执行返回操作");
				res.sendRedirect(req.getContextPath() + "/admin_relogin.jsp"); 
				return;
			}
			
			
		}
		else
		{//客户端地址
			session.setAttribute("prePage",  Utility.getGoingURL(req));
		}
		 
	
		chain.doFilter(req, res);	
	}

	public void destroy() 
	{
		
	}

	public void init(FilterConfig filterConfig) throws ServletException 
	{//获取配置文件中配置的参数
//		String characterEncoding = filterConfig.getInitParameter("characterEncoding");
//		Log.log4jLogInfo(AuthFilter.class, "获取到配置文件参数characterEncoding"+characterEncoding);
		
	}
}


