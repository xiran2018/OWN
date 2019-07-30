// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   XssFilter.java

package admin.ru.own.www.xss;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

// Referenced classes of package admin.ru.own.www.xss:
//			XssHttpServletRequestWrapper

public class XssFilter
	implements Filter
{

	public XssFilter()
	{
	}

	public void init(FilterConfig filterconfig)
		throws ServletException
	{
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
		throws IOException, ServletException
	{
		XssHttpServletRequestWrapper xssRequest = new XssHttpServletRequestWrapper((HttpServletRequest)request);
		chain.doFilter(xssRequest, response);
	}

	public void destroy()
	{
	}
}
