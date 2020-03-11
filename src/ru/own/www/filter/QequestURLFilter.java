package ru.own.www.filter;



import admin.ru.own.www.entity.*;
import admin.ru.own.www.mybatis.dao.*;
import admin.ru.own.www.util.Utility;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.*;
import javax.servlet.http.*;

import com.opensymphony.xwork2.ActionContext;
import ru.own.www.util.FilterAction;


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
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		String currentURL = req.getRequestURI();
		String targetURL = req.getServletPath().substring(1);
		String lastTargetURL = targetURL.substring(targetURL.lastIndexOf("/") + 1, targetURL.length());
		HttpSession session = req.getSession();
		if (!targetURL.contains("jqladmin") && !targetURL.contains("admin_relogin.jsp"))
		{
			checkLanguageSession(req,targetURL);
			checkCurrencySession(req);
			checkShipCountrySession(req, lastTargetURL);
			if (lastTargetURL.contains("jsp") || FilterAction.containsRedirctJSPAction(lastTargetURL))
			{
				String preURL = Utility.getRequestURL(req);
				if (!lastTargetURL.contains("login.action"))
					session.setAttribute("customerRequestPage", preURL);
			}
		}

		MyRequestWrapper request1 = new MyRequestWrapper(req);
//————————————————
//		版权声明：本文为CSDN博主「dr_showtime」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
//		原文链接：https://blog.csdn.net/dr_showtime/article/details/83920581
		 
		chain.doFilter(request1, res);
	}

	private void checkShipCountrySession(HttpServletRequest request, String lastTargetURL)
	{
		HttpSession session = request.getSession();
		if (FilterAction.containsShipCountryJSPAction(lastTargetURL))
		{
			Integer tempId = (Integer)session.getAttribute("defaultShippingCountryId");
			if (tempId == null || tempId.intValue() <= 0)
			{
				List sc = MyBatisDAO.getAllShowShippingCountry();
				for (int j = 0; j < sc.size(); j++)
				{
					ShippingCountry temp = (ShippingCountry)sc.get(j);
					int tempCountryId = temp.getId().intValue();
					if (tempCountryId <= 0)
						continue;
					session.setAttribute("defaultShippingCountryId", Integer.valueOf(tempCountryId));
					break;
				}

			}
		}
	}
	 
	/**
	 * 查看session中是否有货币的id，如果没有，则从数据库中取出来，然后添加至session中
	 * @param request
	 */
	public void checkCurrencySession(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String currencyId = (String)session.getAttribute("currencyId");
		String currencyRate = (String)session.getAttribute("currencyRate");
		String currencyName = (String)session.getAttribute("currencyName");
		String currencySymbol = (String)session.getAttribute("currencySymbol");
		if (currencyId != null && !currencyId.equals("") && currencyRate != null && !currencyRate.equals("") && currencyName != null && !currencyName.equals("") && currencySymbol != null && !currencySymbol.equals(""))
		{
			return;
		} else
		{
			CurrencyDAO fid = new CurrencyDAOImp();
			Currency defaultCurrency = fid.getDefaultCurrency();
			currencyId = (new StringBuilder()).append(defaultCurrency.getIdcurrency()).toString();
			currencyRate = (new StringBuilder()).append(defaultCurrency.getCurrencyrate()).toString();
			currencyName = (new StringBuilder()).append(defaultCurrency.getCurrencyname()).toString();
			currencySymbol = (new StringBuilder()).append(defaultCurrency.getCurrencysymbol()).toString();
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
	public void checkLanguageSession(HttpServletRequest request,String targetURL)
	{
		HttpSession session = request.getSession();
		String languagdId = (String)session.getAttribute("languageId");
		String lan_code = "en";
		String lan_country = "US";
		if (languagdId == null || languagdId.equals(""))
		{
			LanguageDAOImp landao = new LanguageDAOImp();
			Language defaultLan = landao.getDefaultLanguage();
			landao.closeSession();
			String defaultlang = (new StringBuilder()).append(defaultLan.getId()).toString();
			lan_code = defaultLan.getLanguageCode();
			lan_country = defaultLan.getCountryCode();
			session.setAttribute("languageId", defaultlang);
		}
		else if(targetURL.contains("common/footer") && targetURL.contains(".jsp")){
			String requestLanId = languageCheck(request);
			if(("-1").equals(requestLanId)){ //说明参数中没有语言设置的选项，直接用默认的即可
				requestLanId = languagdId;
			}
			LanguageDAOImp landao = new LanguageDAOImp();
			Language defaultLan = landao.getLanguageById(Integer.parseInt(requestLanId));
			landao.closeSession();
			String defaultlang = (new StringBuilder()).append(defaultLan.getId()).toString();
			lan_code = defaultLan.getLanguageCode();
			lan_country = defaultLan.getCountryCode();
			session.setAttribute("languageId", defaultlang);
			Locale locale = new Locale(lan_code, lan_country);
			session.setAttribute("WW_TRANS_I18N_LOCALE",locale);
		}
		
		//如果这里不设置语言的上下文，则如果直接访问jsp页面的时候，因为不能再拦截器里设置上下文（拦截器只能对action请求做作用，不对jsp页面有作用），所以前台有些多语言标签不能正确的解析
//		try{
////			System.out.println("lan_code");
////			System.out.println(lan_code);
////			System.out.println(lan_country);
//			Locale locale = new Locale(lan_code, lan_country);
////		ActionContext actionContext = ActionContext.getContext();//设置struts上下文语种,出错，获取的为null
////			ActionContext.getContext().setLocale(locale);//设置struts上下文语种,出错，
//		}catch (Exception e){
//			System.out.println(e);
//		}

	}


	/**
	 * 这是为了应对jsp的请求，因为jsp页面，不经过acton拦截器的语言设置
	 * 检查请求参数中是否有语言的代码，如果有的话，就需要返回语言的id，如果没有就返回none
	 * 返回请求的地址
	 * @param request
	 * @return
	 */
	public String languageCheck(HttpServletRequest request)
	{


		Map<String,String[]> zzMap = request.getParameterMap();
		if(zzMap!=null)
		{
			for(String s:zzMap.keySet())  //S是请求参数的key
			{

				String[] value=zzMap.get(s); //value 是具体的数值
				for(String val:value)
				{
					if(s.equals("languageId"))
					{//把语言的id加入session
//						HttpSession session = request.getSession();
//						session.setAttribute("languageId", val);
						return val; //返回语言的id
					}
				}


			}
		}
		return "-1";
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


