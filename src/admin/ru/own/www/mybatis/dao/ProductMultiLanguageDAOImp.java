package admin.ru.own.www.mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class ProductMultiLanguageDAOImp implements ProductMultiLanguageDAO {
	private SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
	private ProductMultiLanguageDAO dao = sqlSession.getMapper(ProductMultiLanguageDAO.class);
	@Override
	public void closeSession() {
		sqlSession.close();
	}
	@Override
	public List<Integer> getSearchCommodity(Map<String, Object> args) {
		return dao.getSearchCommodity(args);
	}
}
