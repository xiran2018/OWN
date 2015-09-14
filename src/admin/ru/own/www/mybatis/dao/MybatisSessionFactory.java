package admin.ru.own.www.mybatis.dao;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.Transaction;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

public class MybatisSessionFactory {
	public final static SqlSessionFactory sqlSessionFactory = getSessionFactory();
	private final static TransactionFactory transactionFactory = new JdbcTransactionFactory();

	public final static Transaction getTranscation(SqlSession sqlSession) {
		return transactionFactory.newTransaction(sqlSession.getConnection());
	}

	private static SqlSessionFactory getSessionFactory() {
		SqlSessionFactory sqlSessionFactory = null;
		String resource = "configfile/mybatis-configure.xml";
		try {
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader(resource));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlSessionFactory;
	}

}
