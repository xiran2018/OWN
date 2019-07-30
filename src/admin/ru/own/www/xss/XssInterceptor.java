// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   XssInterceptor.java

package admin.ru.own.www.xss;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class XssInterceptor extends AbstractInterceptor
{

    public XssInterceptor()
    {
    }

    public String intercept(ActionInvocation invocation)
            throws Exception
    {
        ActionContext actionContext = invocation.getInvocationContext();
        Map map = actionContext.getParameters();
        java.util.Map.Entry entry;
        String value;
        for (Iterator iterator = map.entrySet().iterator(); iterator.hasNext(); entry.setValue(xssEncode(value)))
        {
            entry = (java.util.Map.Entry)iterator.next();
            value = ((String[])entry.getValue())[0];
        }

        return invocation.invoke();
    }

    private String xssEncode(String value)
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
}