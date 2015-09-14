package admin.ru.own.www.mybatis.dao;

import java.util.List;

import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.ProductMultiLanguage;

public interface LanguageMapper extends MyBatisMapper
{
	public void insertLanguage(Language lan);
	
	public List<Language> getAllLanguage();

	public Language getDefaultLanguage();

	public List<Language> getShowLanguage();

	public Language getLanguageById(int tempId);
}
