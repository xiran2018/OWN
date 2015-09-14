package ru.own.www.interceptor;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import ru.own.www.util.FilterAction;
import systemlog.Log;
import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.ShippingCountry;
import admin.ru.own.www.mybatis.dao.LanguageDAOImp;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class ShipCountryInterceptor extends AbstractInterceptor 
{
	private static final long serialVersionUID = 1358600090729208361L;
	//拦截Action处理的拦截方法
	public String intercept(ActionInvocation invocation) throws Exception
	{
        // 获取HttpServletRequest对象
        HttpServletRequest req = ServletActionContext.getRequest();
        String targetURL = req.getServletPath().substring(1);//用这个函数之后不需要考虑项目名称长度的问题.substring(1)的目的是把第一个“/”去除
        String lastTargetURL = targetURL.substring(targetURL.lastIndexOf("/")+1, targetURL.length());
//        Log.log4jLogTrace(ShipCountryInterceptor.class,targetURL+"||"+lastTargetURL);
		
        if(FilterAction.containsShipCountryJSPAction(lastTargetURL))
        {
        	// 取得请求相关的ActionContext实例
        	ActionContext ctx=invocation.getInvocationContext();
        	Map session=ctx.getSession();
        	//取出名为defaultShippingCountryId的session属性
        	Integer tempId=(Integer) session.get("defaultShippingCountryId");
        	if(tempId==null||tempId<=0)
        	{
        		//获取所有的国家信息
        		List<ShippingCountry> sc=MyBatisDAO.getAllShowShippingCountry();
        		for(int j=0;j<sc.size();j++)
        		{
        			ShippingCountry temp=sc.get(j);//获取某一个国家
        			int tempCountryId=temp.getId();
        			session.put("defaultShippingCountryId", tempCountryId);
        		}
        	}
        }
		
		return invocation.invoke();
	
	}
}


