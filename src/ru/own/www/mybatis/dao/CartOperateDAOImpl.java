package ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;
import ru.own.www.entity.Cart;
import ru.own.www.entity.CartProductAttr;
import ru.own.www.entity.CartProductAttrShowVO;
import ru.own.www.entity.CartProductImage;
import ru.own.www.entity.shopCartShowVO;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月13日 上午10:00:39  
 */
public class CartOperateDAOImpl implements CartOperateMapper
{
	private SqlSession sqlSession;
	@SuppressWarnings("unused")
	private CartOperateMapper cartMapper;
	
	
	@Override
	public int getCartTotalByUserId(int userid) 
	{
		return cartMapper.getCartTotalByUserId(userid);
	}
	
	@Override
	public void deleteCartAttrs(int cartId) 
	{
		cartMapper.deleteCartAttrs(cartId);
	}
	
	@Override
	public shopCartShowVO getShopCartItemByCartId(int cartId) 
	{
		shopCartShowVO  tempCartProductCart=cartMapper.getShopCartItemByCartId(cartId);
		return tempCartProductCart;
	}
	
	@Override
	public List<CartProductAttrShowVO> getCartProductAttrs(int cartid,int tempanguageId) 
	{
		List<CartProductAttrShowVO>  tempCartProductAttrList=cartMapper.getCartProductAttrs(cartid,tempanguageId);
		return tempCartProductAttrList;
	}
	
	@Override
	public List<shopCartShowVO> getShopCartItemList(int userid) 
	{
		List<shopCartShowVO>  tempShopCartItemList=cartMapper.getShopCartItemList(userid);
		return tempShopCartItemList;
	}
	
	@Override
	public void deleteProductImageById(int id) 
	{
		cartMapper.deleteProductImageById(id);
	}

	@Override
	public void reduceProductImageIndexCountById(int id) 
	{
		cartMapper.reduceProductImageIndexCountById(id);
	}
	
	@Override
	public CartProductImage getCartProductImageById(Integer productimageaddrid) 
	{
		CartProductImage temp=cartMapper.getCartProductImageById(productimageaddrid);
		return temp;
	}
	
	@Override
	public Cart getCartItemByCartId(int cartid) 
	{
		Cart temp=cartMapper.getCartItemByCartId(cartid);
		return temp;
	}
	
	@Override
	public int deleteShopCartItem(int cartid) 
	{
		int temp=cartMapper.deleteShopCartItem(cartid);
		return temp;
	}
	
	@Override
	public int updateShopCartQuantity(int cartid, int count) 
	{
		int temp=cartMapper.updateShopCartQuantity(cartid,count);
		return temp;
	}
	
	@Override
	public int updateShipId(int cartid, int shippingid) 
	{
		int count=cartMapper.updateShipId(cartid,shippingid);
		return count;
	}
	@Override
	public boolean insertShopCart(Cart cart) 
	{
		boolean flag=cartMapper.insertShopCart(cart);
		return flag;
	}
	
	@Override
	public boolean insertShopCartProductAttrValues(Integer cartid,String attrStrings) 
	{
		String [] attrValueStrings=attrStrings.split("\\|");
		int len=attrValueStrings.length;
		for(int i=0;i<len;i++)
		{
			CartProductAttr cpa=new CartProductAttr();
			cpa.setCartId(cartid);
			cpa.setAttrvalueId(Integer.parseInt(attrValueStrings[i]));
			boolean flag=insertShopCartAttrValue(cpa);
			if(!flag)
			{
				return false;
			}
		}
		return true;
	}
	@Override
	public int addCartNumberOfProduct(Integer cartid, int count2) 
	{
		int count=cartMapper.addCartNumberOfProduct(cartid,count2);
		return count;
	}
	@Override
	public List<Cart> getAlreadyCartInDB(Cart tmeCart) 
	{
		List<Cart> cartList=cartMapper.getAlreadyCartInDB(tmeCart);
		return cartList;
	}	
	
	@Override
	public boolean insertShopCartAttrValue(CartProductAttr cpa) 
	{
		boolean flag=cartMapper.insertShopCartAttrValue(cpa);
		return flag;
	}

	@Override
	public void openSession()
	{
		sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		cartMapper = sqlSession.getMapper(CartOperateMapper.class);
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




	
	
}
