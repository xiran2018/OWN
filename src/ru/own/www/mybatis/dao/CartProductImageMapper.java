package ru.own.www.mybatis.dao;

import java.util.List;

import ru.own.www.entity.Cart;
import ru.own.www.entity.CartProductImage;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月14日 下午12:48:08  
 */
public interface CartProductImageMapper {
	
	public int insertCartProductImage(CartProductImage cpi);

	void openSession();

	void closeSession();

	void commit();

	void rollBack();

	public List<CartProductImage> getCartProductImageAddrByPidAndAttrs(Cart cart);

	public int addCartProductImageIndexCount(int id);

}
