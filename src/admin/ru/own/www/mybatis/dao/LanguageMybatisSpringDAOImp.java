package admin.ru.own.www.mybatis.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.ProductMultiLanguage;

@Repository("languageMybatisSpringDAOImp")
@Scope("prototype")
public class LanguageMybatisSpringDAOImp implements LanguageMapper{
	
	private LanguageMapper mapper;
	
	@Override
	public void insertLanguage(Language lan) {
		mapper.insertLanguage(lan);
	}

	@Override
	public List<Language> getAllLanguage() {
		List<Language> allLanguage = mapper.getAllLanguage();
		return allLanguage;
	}
	
	
	@Override
	public List<Language> getShowLanguage() {
		List<Language> allLanguage = mapper.getShowLanguage();
		return allLanguage;
	}


	public Language getDefaultLanguage() {
		Language defaultLanguage = mapper.getDefaultLanguage();
		return defaultLanguage;
	}

	public Language getLanguageById(int tempId) {
		Language defaultLanguage = mapper.getLanguageById(tempId);
		return defaultLanguage;
	}

	@Resource
	public void setMapper(LanguageMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public void closeSession() {
		// TODO Auto-generated method stub
		
	}

	

	
	
	
}
