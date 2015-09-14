package admin.test;

import static junit.framework.Assert.*;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;

import admin.ru.own.www.entity.AttributeValueMultiLanguage;
import admin.ru.own.www.mybatis.dao.AtrValueMultiLangDAO;
import admin.ru.own.www.mybatis.dao.AtrValueMultiLangDAOImp;

public class AttributeValueMultilanguageDAOTest {
	@Test
	public void update() {
		AtrValueMultiLangDAO dao = new AtrValueMultiLangDAOImp();
		AttributeValueMultiLanguage entity = new AttributeValueMultiLanguage();
		entity.setName("aa");
		entity.setKeywords("ss");
		entity.setTitle("t");
		entity.setDescription("de");
		entity.setId(1);
		dao.update(entity);
		AttributeValueMultiLanguage attrValueByID = dao.getAttrValueByID(1);
		assertEquals("aa", attrValueByID.getName());
	}
	
	@Ignore
	@Test
	public void getAttrValueByAtrID(){
		AtrValueMultiLangDAO dao = new AtrValueMultiLangDAOImp();
		AttributeValueMultiLanguage entity = new AttributeValueMultiLanguage();
		entity.setAttrvalue_id(1);
		entity.setLan_id(2);
		entity.setName("aa");
		entity.setKeywords("ss");
		entity.setTitle("t");
		entity.setDescription("de");
		dao.insertAttrValue(entity);
		dao.insertAttrValue(entity);
		dao.insertAttrValue(entity);
		List<AttributeValueMultiLanguage> attrValueByAtrID = dao.getAttrValueByAtrID(1);
		assertTrue(attrValueByAtrID.size()!=0);
		
		dao.delAttrValueByAtrID(1);
		
	}
	@Ignore
	@Test
	public void insertAttrValueByAtrID() {
		AtrValueMultiLangDAO dao = new AtrValueMultiLangDAOImp();
		AttributeValueMultiLanguage entity = new AttributeValueMultiLanguage();
		entity.setAttrvalue_id(1);
		entity.setLan_id(2);
		entity.setName("aa");
		entity.setKeywords("ss");
		entity.setTitle("t");
		entity.setDescription("de");
		dao.insertAttrValue(entity);
		
		AttributeValueMultiLanguage e = dao.getAttrValueByID(entity.getId());
		assertEquals("aa", e.getName());
		assertEquals(1, e.getAttrvalue_id());
		assertEquals(2, e.getLan_id());
		
		dao.closeSession();
	}
	@Ignore
	@Test
	public void delAttrValueByAtrID() {
		AtrValueMultiLangDAO dao = new AtrValueMultiLangDAOImp();
		AttributeValueMultiLanguage entity = new AttributeValueMultiLanguage();
		entity.setAttrvalue_id(1);
		entity.setLan_id(2);
		entity.setName("aa");
		entity.setKeywords("ss");
		entity.setTitle("t");
		entity.setDescription("de");
		dao.insertAttrValue(entity);
		
		dao.delAttrValueByAtrID(entity.getAttrvalue_id());
		AttributeValueMultiLanguage e = dao.getAttrValueByID(entity.getAttrvalue_id());
		assertNull(e);
	}
}
