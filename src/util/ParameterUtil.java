// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ParameterUtil.java

package util;

import java.io.PrintStream;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

// Referenced classes of package util:
//			PageUtil

public class ParameterUtil
{

	public ParameterUtil()
	{
	}

	public int getInitPageParameter()
	{
		int initPage = 0;
		try
		{
			initPage = PageUtil.validatePageNumber((new StringBuilder(String.valueOf(getIntParameter("initPage")))).toString());
		}
		catch (Exception exception) { }
		return initPage;
	}

	public int getPageParameter()
	{
		int initPage = 0;
		try
		{
			initPage = PageUtil.validatePageNumber((new StringBuilder(String.valueOf(getIntParameter("page")))).toString());
		}
		catch (Exception e)
		{
			initPage = 0;
		}
		return initPage;
	}

	public int getCategoryIDParameter()
	{
		int categoryid = -1;
		try
		{
			categoryid = getIntParameter("categoryid");
		}
		catch (Exception e)
		{
			System.out.println("categoryid参数异常");
			categoryid = 1;
		}
		return categoryid;
	}

	public int getEndPriceParameter()
	{
		int endPrice = 0x7fffffff;
		try
		{
			endPrice = getIntParameter("endPrice");
			if (endPrice < 0)
				endPrice = 0x7fffffff;
		}
		catch (Exception exception) { }
		return endPrice;
	}

	public int getStartPriceParameter()
	{
		int startPrice = 0;
		try
		{
			startPrice = getIntParameter("startPrice");
			if (startPrice < 0)
				startPrice = 0;
		}
		catch (Exception exception) { }
		return startPrice;
	}

	public int getProductIDParameter()
	{
		int p_id = -1;
		try
		{
			p_id = getIntParameter("p_id");
		}
		catch (Exception e)
		{
			System.out.println("p_id参数异常");
		}
		return p_id;
	}

	public String getIsSuccessParameter()
	{
		return getStrParameter("success");
	}

	public String getStrParameter(String parameterName)
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String str = request.getParameter(parameterName);
		return str;
	}

	public int getIntParameter(String parameterName)
		throws Exception
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		int intParameter = -1;
		try
		{
			String parameter = request.getParameter(parameterName);
			intParameter = Integer.parseInt(parameter);
		}
		catch (Exception e)
		{
			intParameter = -1;
			throw e;
		}
		return intParameter;
	}
}
