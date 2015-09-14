package admin.ru.own.www.mybatis.dao;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.SKU_AtrValue;

public class Sku_AtrValueDAOImp implements Sku_AtrValueDAO {
	private SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
	private Sku_AtrValueDAO dao = sqlSession.getMapper(Sku_AtrValueDAO.class);

	@Override
	public void insert(SKU_AtrValue s_a) {
		dao.insert(s_a);
		sqlSession.commit();
		
	}
	public static void main(String[] args) {
		Sku_AtrValueDAOImp daoImp = new Sku_AtrValueDAOImp();
		SKU_AtrValue s_a = new SKU_AtrValue();
		s_a.setAttr_value_id(15);
		s_a.setSku_id(19);
		daoImp.delete(19);
	}
	@Override
	public void delete(int sku_id) {
		dao.delete(sku_id);
		sqlSession.commit();
	}
	@Override
	public void closeSession() {
		sqlSession.close();
	}
}
