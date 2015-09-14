package ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;
import ru.own.www.entity.Cart;
import ru.own.www.entity.CartProductAttr;
import ru.own.www.entity.CartProductImage;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月14日 下午12:47:45  
 */
public class CartProductImageDAOImpl implements CartProductImageMapper
{
	
	private SqlSession sqlSession;
	@SuppressWarnings("unused")
	private CartProductImageMapper cartImageMapper;
	
	@Override
	public int addCartProductImageIndexCount(int id) 
	{
		int count=cartImageMapper.addCartProductImageIndexCount(id);
		return count;
	}
	@Override
	public int insertCartProductImage(CartProductImage cpi) 
	{
		int count=cartImageMapper.insertCartProductImage(cpi);
		return count;
	}
	@Override
	public List<CartProductImage> getCartProductImageAddrByPidAndAttrs(Cart cart) 
	{
		List<CartProductImage> cpiCartProductImage=cartImageMapper.getCartProductImageAddrByPidAndAttrs(cart);
		return cpiCartProductImage;
	}
	@Override
	public void openSession()
	{
		sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		cartImageMapper = sqlSession.getMapper(CartProductImageMapper.class);
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
}
