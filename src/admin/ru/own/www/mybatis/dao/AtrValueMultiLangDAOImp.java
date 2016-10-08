package admin.ru.own.www.mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.AttributeValueMultiLanguage;

public class AtrValueMultiLangDAOImp implements AtrValueMultiLangDAO {
	private SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
	private AtrValueMultiLangDAO attrDAO = sqlSession.getMapper(AtrValueMultiLangDAO.class);
	@Override
	public void closeSession() {
		sqlSession.close();
	}
	@Override
	public void delAttrValueByAtrID(int atrID) {
		attrDAO.delAttrValueByAtrID(atrID);
		sqlSession.commit();
	}
	@Override
	public void insertAttrValue(AttributeValueMultiLanguage entity) {
		attrDAO.insertAttrValue(entity);
		sqlSession.commit();
	}
	@Override
	public AttributeValueMultiLanguage getAttrValueByID(int ID) {
		return attrDAO.getAttrValueByID(ID);
	}
	@Override
	public List<AttributeValueMultiLanguage> getAttrValueByAtrID(int atrID) {
		return attrDAO.getAttrValueByAtrID(atrID);
	}
	@Override
	public void update(AttributeValueMultiLanguage entity) {
		attrDAO.update(entity);
		sqlSession.commit();
	}
	@Override
	public List<AttributeValueMultiLanguage> getAttrValueByAtrIDAndPIDAndAttrValueId(HashMap<String, Object> parameterTypesMap) {
		return attrDAO.getAttrValueByAtrIDAndPIDAndAttrValueId(parameterTypesMap);
	}

}
