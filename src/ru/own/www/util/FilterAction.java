package ru.own.www.util;

import ru.own.www.entity.Cart;

/**
 * This class is used for fiter actions that can redirect one jsp page  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2014-12-3 下午4:05:15 
 *
 */
public class FilterAction 
{
	//包含需要重新定向的jsp或者aciton请求，客户端获取前一次请求的url，从而用户可以变换语言或者货币的时候，可以准确的定向到当前页面
	public static String [] filterRedirctJSPAction={"index.action","cart.jsp","modifyMailAddress.action","addMailAddress.action","category_showAll.action","productShow.action","confirmorder.action","checkout.action","showAllOrders.action","orderDetail.action","userinfo.action","changePasswordSecurity.action","buyerIndex.action","shippingAddressShow.action"};
	
	//相应的页面或者action需要有货运国家session信息，从而在filter中可以保证该session的信息是存在的
	public static String [] shipCountryJSPAction={"productShow.action","cart.jsp","confirmorder.action"};
	
	
	//验证是否已经登陆的页面或者action请求
	public static String [] loginAuthFilterJSPAction={"checkout.jsp","cart.jsp","confirmorder.action","checkout.action"};
	
	public static boolean containsRedirctJSPAction(String actionArgs)
	{
		int len=filterRedirctJSPAction.length;
		String tempString;
		for(int i=0;i<len;i++)
		{
			tempString=filterRedirctJSPAction[i];
			if(tempString.equals(actionArgs))
				return true;
		}
		return false;
	}

	public static boolean containsShipCountryJSPAction(String lastTargetURL) 
	{
		int len=shipCountryJSPAction.length;
		String tempString;
		for(int i=0;i<len;i++)
		{
			tempString=shipCountryJSPAction[i];
			if(tempString.equals(lastTargetURL))
				return true;
		}
		return false;
	}
	
	public static boolean containsLoginAuthFilterJSPAction(String lastTargetURL) 
	{
		int len=loginAuthFilterJSPAction.length;
		String tempString;
		for(int i=0;i<len;i++)
		{
			tempString=loginAuthFilterJSPAction[i];
			if(tempString.equals(lastTargetURL))
				return true;
		}
		return false;
	}
}
