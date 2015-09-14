package admin.ru.own.www.mybatis.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.AttributeValueMultiLanguage;
import admin.ru.own.www.entity.AttributeValueMultiLanguageShow;
import admin.ru.own.www.vo.AttributeValueVO;
import admin.ru.own.www.vo.ProductsVO;

public class AttributeValueDaoImp implements AttrValueMapper {
	private SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
	private AttrValueMapper attrDAO = sqlSession.getMapper(AttrValueMapper.class);
	@Override
	public void insertForeignAttrValue(AttributeValueMultiLanguage cml) {
	}

	@Override
	public AttributeValueVO getAttributeValue(int attr_value_id) {
		AttributeValueVO attrValueVo = attrDAO.getAttributeValue(attr_value_id);
		return attrValueVo;
	}
	
	@Override
	public List<AttributeValueVO> getAttributeValues(int attr_id) {
		List<AttributeValueVO> attrValueVo = attrDAO.getAttributeValues(attr_id);
		return attrValueVo;
	}

	@Override
	public int insert(AttributeValue value) {
		attrDAO.insert(value);
		sqlSession.commit();
		return value.getAttrValueId();
	}

	@Override
	public void delete(int attr_value_id) {
		attrDAO.delete(attr_value_id);
		sqlSession.commit();
	}

	@Override
	public void delAttrValue(int id) {
		attrDAO.delAttrValue(id);
		sqlSession.commit();
	}

	@Override
	public List<AttributeValueMultiLanguageShow> getAttrValuesMultiLangShowByAttrId(int id) {
		return null;
	}

	@Override
	public AttributeValue getAttrValueByAttrId(int id) {
		return null;
	}

	@Override
	public void attrValue_modify_basic(AttributeValue attributeValue) {
		attrDAO.attrValue_modify_basic(attributeValue);
		sqlSession.commit();
	}

	@Override
	public void attrValue_modify_xiangxi(AttributeValueMultiLanguage avml) {
	}

	@Override
	public void update(AttributeValue attributeValue) {
	}

	@Override
	public List<Integer> getTextInputStyleAtrValueIDListByProductID(int p_id) {
		List<Integer> list = attrDAO.getTextInputStyleAtrValueIDListByProductID(p_id);
		return list;
	}

	@Override
	public List<AttributeValueVO> getAttributeValueBATCH(List<Integer> list) {
		List<AttributeValueVO> attrValueVo = attrDAO.getAttributeValueBATCH(list);
		return attrValueVo;
	}

	@Override
	public void closeSession() {
		sqlSession.close();
	}
}
