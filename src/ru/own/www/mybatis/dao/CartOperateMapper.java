package ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ru.own.www.entity.Cart;
import ru.own.www.entity.CartProductAttr;
import ru.own.www.entity.CartProductAttrShowVO;
import ru.own.www.entity.CartProductImage;
import ru.own.www.entity.shopCartShowVO;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月13日 上午10:00:25  
 */
public interface CartOperateMapper {

	boolean insertShopCart(Cart cart);

	void openSession();

	void closeSession();
	
	void commit();
	
	void rollBack();

	boolean insertShopCartAttrValue(CartProductAttr cpa);

	boolean insertShopCartProductAttrValues(Integer cartid, String attrStrings);

	List<Cart> getAlreadyCartInDB(Cart tmeCart);

	int addCartNumberOfProduct(Integer cartid, int count2);

	int updateShipId(int cartid, int shippingid);

	int updateShopCartQuantity(int cartid, int count);

	int deleteShopCartItem(int cartid);

	SqlSession getSqlSession();

	Cart getCartItemByCartId(int cartid);

	CartProductImage getCartProductImageById(Integer productimageaddrid);

	void deleteProductImageById(int id);


	void reduceProductImageIndexCountById(int id);

	/**
	 * 获取购物车中商品的所有信息，以便显示
	 * @return
	 */
	List<shopCartShowVO> getShopCartItemList(int userid);

	List<CartProductAttrShowVO> getCartProductAttrs(int cartid,
			int tempanguageId);

	shopCartShowVO getShopCartItemByCartId(int cartId);

	void deleteCartAttrs(int cartId);

	int getCartTotalByUserId(int userid);


}
