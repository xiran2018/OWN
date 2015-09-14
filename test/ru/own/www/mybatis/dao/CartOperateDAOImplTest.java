package ru.own.www.mybatis.dao;

import static org.junit.Assert.*;

import org.junit.Ignore;
import org.junit.Test;

import ru.own.www.entity.Cart;
import systemlog.Log;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月13日 上午10:47:26  
 */
public class CartOperateDAOImplTest {

	@Ignore
	public void testInsertShopCart() 
	{
		Cart cart=new Cart();
		cart.setProductid(1);
		cart.setSkuid(-1);
		cart.setProductname("1111");
		cart.setProductnumber(3);
		cart.setProductprice(Float.parseFloat("4"));
		
		
		
		cart.setUserid(5);
		
		CartOperateMapper com=new CartOperateDAOImpl();
		com.openSession();
		boolean sucessFlag=com.insertShopCart(cart);
		com.commit();
		if(sucessFlag)
		{
			Log.log4jLogInfo(this.getClass(),""+cart.getCartid() );
		}
		com.closeSession();
	}
	
	@Test
	public void testInsertShopCartProductAttrValues()
	{
		
		CartOperateMapper com=new CartOperateDAOImpl();
		com.openSession();
		boolean insertAttrValueFlag=com.insertShopCartProductAttrValues(15,"17|61");
		com.commit();
		com.closeSession();
	}
	
	@Ignore
	public void testSplit()
	{
		String attrStrings="17|61";
		String [] attrValueStrings=attrStrings.split("\\|");
		int len=attrValueStrings.length;
		System.out.println(len);
	}

}
