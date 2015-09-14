package ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;
import ru.own.www.entity.Cart;
import ru.own.www.entity.CartProductAttr;
import ru.own.www.entity.CartProductAttrShowVO;
import ru.own.www.entity.CartProductImage;
import ru.own.www.entity.MailAddress;
import ru.own.www.entity.MailAddressShowVO;
import ru.own.www.entity.Order;
import ru.own.www.entity.OrderShowVO;
import ru.own.www.entity.Orderdetail;
import ru.own.www.entity.Orderdetailproductattr;
import ru.own.www.entity.shopCartShowVO;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月13日 上午10:00:39  
 */
public class PaymentAfterOperateDAOImpl implements PaymentAfterOperateMapper
{
///////////////////////////////////////must be included//////////////////////////////////////////////
	private SqlSession sqlSession;
/////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////must be included/////////////////////////////
	@Override
	public void openSession()
	{
		sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
	}
	
	@Override
	public void closeSession() {
		sqlSession.close();
	}

	@Override
	public void commit() {
		sqlSession.commit();
		
	}

	@Override
	public void rollBack() 
	{
		sqlSession.rollback();
	}

	@Override
	public SqlSession getSqlSession() {
		return sqlSession;
	}
/////////////////////////////////////////////////////////////////////////////////////

}
