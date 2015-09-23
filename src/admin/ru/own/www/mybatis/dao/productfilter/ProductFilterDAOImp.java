package admin.ru.own.www.mybatis.dao.productfilter;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;

public class ProductFilterDAOImp implements ProductFilterDAO {
	private SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
	private ProductFilterDAO dao = sqlSession.getMapper(ProductFilterDAO.class);
	@Override
	public void closeSession() {
		sqlSession.close();
	}

	@Override
	public List<Integer> getExhibitionProducts(Map<String, Object> args) {
		return dao.getExhibitionProducts(args);
	}

	@Override
	public List<Integer> getIndexProductsLimit(Map<String, Object> args) {
		return dao.getIndexProductsLimit(args);
	}

	@Override
	public List<Integer> getPushProductsLimit(Map<String, Object> args) {
		return dao.getPushProductsLimit(args);
	}

	@Override
	public int getPushProductsTotalNumber(Map<String, Object> args) {
		return dao.getPushProductsTotalNumber(args);
	}

}
