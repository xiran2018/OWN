package admin.ru.own.www.mybatis.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import admin.ru.own.www.entity.Language;


public class LanguageMybatisSpringDAOImpTest {
	
	@Test
	public void test() 
	{
        String configPath = "configfile/applicationContext.xml";
        ApplicationContext ctx = new ClassPathXmlApplicationContext(configPath);
        LanguageMybatisSpringDAOImp lmad = (LanguageMybatisSpringDAOImp) ctx.getBean("languageMybatisSpringDAOImp");
        List<Language> aa=lmad.getAllLanguage();
        System.out.println(aa.size());
	}

}
