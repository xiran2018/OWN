package ru.own.www.filter;



import java.io.IOException;
import java.util.Locale;

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
import admin.ru.own.www.mybatis.dao.CurrencyDAO;
import admin.ru.own.www.mybatis.dao.CurrencyDAOImp;
import admin.ru.own.www.mybatis.dao.LanguageDAOImp;
import admin.ru.own.www.util.Utility;


/**
 * 获取用户的请求地址，包括参数
 * @author jingquanliang
 *
 */
public class QequestURLFilter implements Filter
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
		 
		
		if (!targetURL.contains("jqladmin")&&!targetURL.contains("admin_relogin.jsp")) 
		{//包含jqladmin的，是后台地址,admin_relogin是后台管理员重新登录地址
			//设置语言的 session
			checkLanguageSession(req);
			
			//设置货币的session
			checkCurrencySession(req);
			
			if(lastTargetURL.contains("jsp")||FilterAction.containsRedirctJSPAction(lastTargetURL))
			{//如果需要被过滤,如果lastTargetURL等于""，说明访问的是首页
				
				
	            //设置客户原来请求的url地址   
	            session.setAttribute("customerRequestPage", Utility.getRequestURL(req));
			}
		}
		 
		chain.doFilter(req, res);	
	}
	 
	/**
	 * 查看session中是否有货币的id，如果没有，则从数据库中取出来，然后添加至session中
	 * @param request
	 */
	public void checkCurrencySession(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
//		Log.log4jLogInfo(QequestURLFilter.class, (String)session.getAttribute("languageId"));
		String currencyId=(String) session.getAttribute("currencyId");
		String currencyRate=(String) session.getAttribute("currencyRate");
		String currencyName=(String) session.getAttribute("currencyName");
		String currencySymbol=(String) session.getAttribute("currencySymbol");
		if(currencyId!=null&&!currencyId.equals("")&&currencyRate!=null&&!currencyRate.equals("")&&currencyName!=null&&!currencyName.equals("")&&currencySymbol!=null&&!currencySymbol.equals(""))
		{
			return ;
		}
		else
		{
			CurrencyDAO fid=new CurrencyDAOImp();
			Currency defaultCurrency=fid.getDefaultCurrency();
			currencyId=""+defaultCurrency.getIdcurrency();
			currencyRate=""+defaultCurrency.getCurrencyrate();
			currencyName=""+defaultCurrency.getCurrencyname();
			currencySymbol=""+defaultCurrency.getCurrencysymbol();
//			Log.log4jLogInfo(QequestURLFilter.class, "defaultlang="+defaultlang);
			session.setAttribute("currencyId", currencyId);
			session.setAttribute("currencyRate", currencyRate);
			session.setAttribute("currencyName", currencyName);
			session.setAttribute("currencySymbol", currencySymbol);
			return;
		}
	}
	/**
	 * 查看session中是否有语言的id，如果没有，则从数据库中取出来，然后添加至session中
	 * @param request
	 */
	public void checkLanguageSession(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
//		Log.log4jLogInfo(QequestURLFilter.class, (String)session.getAttribute("languageId"));
		String languagdId=(String) session.getAttribute("languageId");
		
		String lan_code="en";
		String lan_country="US";
		
		if(languagdId!=null&&!languagdId.equals(""))
		{
//			LanguageDAOImp landao=new LanguageDAOImp();
//			Language defaultLan=landao.getLanguageById(Integer.parseInt(languagdId));
//			lan_code=defaultLan.getLanguageCode();
//			lan_country=defaultLan.getCountryCode();
		}
		else
		{
			LanguageDAOImp landao=new LanguageDAOImp();
			Language defaultLan=landao.getDefaultLanguage();
			landao.closeSession();
			String defaultlang=""+defaultLan.getId();
			lan_code=defaultLan.getLanguageCode();
			lan_country=defaultLan.getCountryCode();
			session.setAttribute("languageId", defaultlang);  //设置要显示的语言的id
		}
		
		//如果这里不设置语言的上下文，则如果直接访问jsp页面的时候，因为不能再拦截器里设置上下文（拦截器只能对action请求做作用，不对jsp页面有作用），所以前台有些多语言标签不能正确的解析
//		Locale locale = new Locale(lan_code, lan_country);
//		ActionContext actionContext = ActionContext.getContext();//设置struts上下文语种
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


