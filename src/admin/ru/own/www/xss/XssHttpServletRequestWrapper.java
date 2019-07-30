// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   XssHttpServletRequestWrapper.java

package admin.ru.own.www.xss;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper
{

	HttpServletRequest orgRequest;

	public XssHttpServletRequestWrapper(HttpServletRequest request)
	{
		super(request);
		orgRequest = null;
		orgRequest = request;
	}

	public String getParameter(String name)
	{
		String value = super.getParameter(xssEncode(name));
		if (value != null)
			value = xssEncode(value);
		return value;
	}

	public String[] getParameterValues(String parameter)
	{
		String values[] = super.getParameterValues(parameter);
		if (values == null)
			return null;
		int count = values.length;
		String encodedValues[] = new String[count];
		for (int i = 0; i < count; i++)
			encodedValues[i] = xssEncode(values[i]);

		return encodedValues;
	}

	public String getHeader(String name)
	{
		String value = super.getHeader(xssEncode(name));
		if (value != null)
			value = xssEncode(value);
		return value;
	}

	private static String xssEncode(String value)
	{
		if (value != null)
		{
			value = value.replaceAll("", "");
			Pattern scriptPattern = Pattern.compile("<script>(.*?)</script>", 2);
			value = scriptPattern.matcher(value).replaceAll("");
			scriptPattern = Pattern.compile("src[\r\n]*=[\r\n]*\\'(.*?)\\'", 42);
			value = scriptPattern.matcher(value).replaceAll("");
			scriptPattern = Pattern.compile("src[\r\n]*=[\r\n]*\\\"(.*?)\\\"", 42);
			value = scriptPattern.matcher(value).replaceAll("");
			scriptPattern = Pattern.compile("</script>", 2);
			value = scriptPattern.matcher(value).replaceAll("");
			scriptPattern = Pattern.compile("<script(.*?)>", 42);
			value = scriptPattern.matcher(value).replaceAll("");
			scriptPattern = Pattern.compile("eval\\((.*?)\\)", 42);
			value = scriptPattern.matcher(value).replaceAll("");
			scriptPattern = Pattern.compile("expression\\((.*?)\\)", 42);
			value = scriptPattern.matcher(value).replaceAll("");
			scriptPattern = Pattern.compile("javascript:", 2);
			value = scriptPattern.matcher(value).replaceAll("");
			scriptPattern = Pattern.compile("vbscript:", 2);
			value = scriptPattern.matcher(value).replaceAll("");
			scriptPattern = Pattern.compile("onload(.*?)=", 42);
			value = scriptPattern.matcher(value).replaceAll("");
		}
		return value;
	}

	public HttpServletRequest getOrgRequest()
	{
		return orgRequest;
	}

	public static HttpServletRequest getOrgRequest(HttpServletRequest req)
	{
		if (req instanceof XssHttpServletRequestWrapper)
			return ((XssHttpServletRequestWrapper)req).getOrgRequest();
		else
			return req;
	}
}
