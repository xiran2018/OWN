package admin.ru.own.www.util;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import admin.ru.own.www.mybatis.dao.LanguageDAOImp;
import admin.ru.own.www.mybatis.dao.LanguageMapper;

public class DefaultLanguageUtil {
	
	public static int getDefaultLanguageID() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Object lanidObj = null;
		if(session != null){
			lanidObj = session.get("languageId");
		}
		if(lanidObj==null) {
			LanguageMapper dao = new LanguageDAOImp();
			int defaultLangID = dao.getDefaultLanguage().getId();
			dao.closeSession();
			return defaultLangID;
		} else {
			return Integer.parseInt((String) lanidObj);
		}
	}
}
