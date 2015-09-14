package ru.own.www.filter;



import java.io.IOException;
import java.util.List;
import java.util.Locale;
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



import com.opensymphony.xwork2.ActionContext;

import ru.own.www.util.FilterAction;
import admin.ru.own.www.entity.Currency;
import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.ShippingCountry;
import admin.ru.own.www.mybatis.dao.CurrencyDAO;
import admin.ru.own.www.mybatis.dao.CurrencyDAOImp;
import admin.ru.own.www.mybatis.dao.LanguageDAOImp;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;
import admin.ru.own.www.util.Utility;


/**
 * 获取用户的请求地址，包括参数
 * @author jingquanliang
 *
 */
public class CustomerAuthFilter implements Filter
{
	
	
	public void doFilter(ServletRequest request,
	ServletResponse response,
	FilterChain chain)
	throws IOException, ServletException 
	{
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String currentURL = req.getRequestURI();
		

		String targetURL = req.getServletPath().substring(1);//用这个函数之后不需要考虑项目名称长度的问题.substring(1)的目的是把第一个“/”去除
		
		//得到最后的名称 比如 secondforegroundpage_showAll.action 或者 index.jsp
		String lastTargetURL = targetURL.substring(targetURL.lastIndexOf("/")+1, targetURL.length());
		HttpSession session = req.getSession();
		 
		
		if (FilterAction.containsLoginAuthFilterJSPAction(lastTargetURL)) 
		{//验证是否登录
				Integer userid=(Integer)session.getAttribute("customeruserid");
				if(userid==null||userid<0)
				{//未登录
					 //设置客户原来请求的url地址   
		            session.setAttribute("customerPrePage",Utility.getGoingURL(req));
					res.sendRedirect(req.getContextPath() + "/login.jsp"); 
					return;
				}
		}
		
		if(FilterAction.containsShipCountryJSPAction(lastTargetURL))
        {//验证相应的页面或者action是否有需要的货运国家session信息
        	//取出名为defaultShippingCountryId的session属性
        	Integer tempId=(Integer) session.getAttribute("defaultShippingCountryId");
        	if(tempId==null||tempId<=0)
        	{
        		//获取所有的国家信息
        		List<ShippingCountry> sc=MyBatisDAO.getAllShowShippingCountry();
        		for(int j=0;j<sc.size();j++)
        		{
        			ShippingCountry temp=sc.get(j);//获取某一个国家
        			int tempCountryId=temp.getId();
        			session.setAttribute("defaultShippingCountryId", tempCountryId);
        		}
        	}
        }
		 
		chain.doFilter(req, res);	
	}
	
	
	public void destroy() 
	{
		
	}

	public void init(FilterConfig filterConfig) throws ServletException 
	{//获取配置文件中配置的参数
//		String characterEncoding = filterConfig.getInitParameter("characterEncoding");
//		Log.log4jLogInfo(QequestURLFilter.class, "获取到配置文件参数characterEncoding"+characterEncoding);
		
	}
}


