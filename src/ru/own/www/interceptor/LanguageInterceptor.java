package ru.own.www.interceptor;

import java.util.Locale;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import admin.ru.own.www.entity.Language;
import admin.ru.own.www.mybatis.dao.LanguageDAOImp;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 转换语言
 * @author jj
 *
 */
public class LanguageInterceptor extends AbstractInterceptor 
{
	private static final long serialVersionUID = 1358600090729208361L;
	//拦截Action处理的拦截方法
	public String intercept(ActionInvocation invocation) throws Exception
	{
	
		// 取得请求相关的ActionContext实例
		ActionContext ctx=invocation.getInvocationContext();
		Map session=ctx.getSession();
		//取出名为languageId的session属性，因为在filter中已经对其进行了赋值，所以运行到这里时，这个值一定是存在的
		String languageId=(String)session.get("languageId");
		
		int tempId=Integer.parseInt(languageId);
		//获取语言的信息
		LanguageDAOImp landao=new LanguageDAOImp();
		Language showLanguage=landao.getLanguageById(tempId);
		landao.closeSession();
		String lan_code=showLanguage.getLanguageCode();
		String lan_country=showLanguage.getCountryCode();
		
		Locale locale = new Locale(lan_code, lan_country);
		ActionContext.getContext().setLocale(locale);//设置struts上下文语种
		
		return invocation.invoke();
	
	}
}


