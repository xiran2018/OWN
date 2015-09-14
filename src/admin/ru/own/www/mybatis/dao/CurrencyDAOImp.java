package admin.ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.Currency;

public class CurrencyDAOImp implements CurrencyDAO {

	@Override
	public List<Currency> getAll() {
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		CurrencyDAO dao = sqlSession.getMapper(CurrencyDAO.class);
		List<Currency> list = dao.getAll();
		sqlSession.close();
		return list;
	}
	
	@Override
	public void update(Currency c) {
		SqlSession session = MybatisSessionFactory.sqlSessionFactory.openSession();
		CurrencyDAO dao = session.getMapper(CurrencyDAO.class);
		dao.update(c);
		session.commit();
		session.close();
	}

	@Override
	public void delete(int idcurrency) {
		SqlSession session = MybatisSessionFactory.sqlSessionFactory.openSession();
		CurrencyDAO mapper = session.getMapper(CurrencyDAO.class);
		mapper.delete(idcurrency);
		session.commit();
		session.close();
	}

	@Override
	public void insert(Currency c) {
		SqlSession session = MybatisSessionFactory.sqlSessionFactory.openSession();
		CurrencyDAO mapper = session.getMapper(CurrencyDAO.class);
		mapper.insert(c);
		session.commit();
		session.close();
	}

	@Override
	public List<Currency> getAllShowCurrency() {
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		CurrencyDAO dao = sqlSession.getMapper(CurrencyDAO.class);
		List<Currency> list = dao.getAllShowCurrency();
		sqlSession.close();
		return list;
	}

	@Override
	public Currency getDefaultCurrency() {
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		CurrencyDAO dao = sqlSession.getMapper(CurrencyDAO.class);
		Currency oneEle = dao.getDefaultCurrency();
		sqlSession.close();
		return oneEle;
	}

	@Override
	public Currency getCurrencyById(int tempId) {
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		CurrencyDAO dao = sqlSession.getMapper(CurrencyDAO.class);
		Currency oneEle = dao.getCurrencyById(tempId);
		sqlSession.close();
		return oneEle;
	}
}
