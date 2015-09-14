package admin.ru.own.www.mybatis.dao;

import static org.junit.Assert.*;

import java.util.Arrays;

import org.junit.Ignore;
import org.junit.Test;

import systemlog.Log;
import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.ProductMultiLanguage;

public class MyBatisDAOTest {

	@Test
	public void testArraySort()
	{
		String btring = "-1|2|9|3|10|4";
		String [] attrValueStrings=btring.split("\\|");
		int len=attrValueStrings.length;
		int []arrayInt=new int[len];
		for(int i=0;i<len;i++)
		{
			arrayInt[i]=Integer.parseInt(attrValueStrings[i]);
		}
		Arrays.sort(arrayInt);
		for(int j=0;j<len;j++)
		{
			Log.log4jLogInfo(this.getClass(), ""+arrayInt[j]);
		}
	}
	
	//@Test
	@Ignore
	public void testInsertLanguage() 
	{
    	Language lan=new Language();
    	lan.setLanguageName("英语");
    	lan.setForeignerName("enligsh");
    	lan.setLanguageCode("en");
    	lan.setCountryCode("US");
    	lan.setShow((short)0);
    	MyBatisDAO.insertLanguage(lan);
	}
	
//	@Test
	@Ignore
	public void testinsertProductMultiLanguage()
	{
		ProductMultiLanguage pml=new ProductMultiLanguage();
		pml.setProduct_name("sjfl");
		pml.setProduct_desc("sj");
		pml.setProduct_id(11);
		pml.setTitle("slf");
		pml.setKeywords("sdf");
		pml.setDescription("sjdf");
		MyBatisDAO.insertProductMultiLanguage(pml);
	}
	
//	@Test
	@Ignore
	public void testgetAllLanguage()
	{
		MyBatisDAO.getAllLanguage();
	}
	@Test
	public void testinsertCategoryMulitLanguage()
	{
		String multiLanString="[{'id':7,'other_name':'ert','other_title':'ert','other_keywords':'ert','other_desc':'ert'},{'id':8,'other_name':'ert','other_title':'eer','other_keywords':'ter','other_desc':'tert'}]";
		MyBatisDAO.insertCategoryMulitLanguage(multiLanString, 20);
	}

}
