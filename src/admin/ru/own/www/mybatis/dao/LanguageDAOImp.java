package admin.ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.ProductMultiLanguage;

public class LanguageDAOImp implements LanguageMapper{
	private SqlSession session = MybatisSessionFactory.sqlSessionFactory.openSession();
	private LanguageMapper mapper = session.getMapper(LanguageMapper.class);
	@Override
	public void insertLanguage(Language lan) {
		mapper.insertLanguage(lan);
	}

	@Override
	public List<Language> getAllLanguage() {
		List<Language> allLanguage = mapper.getAllLanguage();
		return allLanguage;
	}
	
	public static void main(String[] args) {
		LanguageDAOImp languageDAOImp = new LanguageDAOImp();
		languageDAOImp.getAllLanguage();
		System.out.println("");
	}
	@Override
	public List<Language> getShowLanguage() {
		List<Language> allLanguage = mapper.getShowLanguage();
		return allLanguage;
	}

	@Override
	public void closeSession() {
		session.close();
	}

	public Language getDefaultLanguage() {
		Language defaultLanguage = mapper.getDefaultLanguage();
		return defaultLanguage;
	}

	public Language getLanguageById(int tempId) {
		Language defaultLanguage = mapper.getLanguageById(tempId);
		return defaultLanguage;
	}
	
}
