package admin.ru.own.www.mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.vo.AttributeVO;

public class AttributeDAOImp implements AttributeDAO {
	private SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
	private AttributeDAO attributeDAO = sqlSession.getMapper(AttributeDAO.class);
	
	@Override
	public List<AttributeVO> getOneCategoryAttribute(int category_id) {
		return attributeDAO.getOneCategoryAttribute(category_id);
	}
	
	@Override
	public Attribute getOneAttribute(int attr_id) {	
		return attributeDAO.getOneAttribute(attr_id);
	}

	@Override
	public void closeSession() {
		sqlSession.close();
	}

	@Override
	public List<AttributeVO> getOneMultiCategoryAttribute(Map<String, Object> args) {
		return attributeDAO.getOneMultiCategoryAttribute(args);
	}

	@Override
	public List<AttributeVO> getOneMultiCategorySearchAttribute(Map<String, Object> args) {
		return attributeDAO.getOneMultiCategorySearchAttribute(args);
	}
}
