package ru.own.www.entity;
/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月13日 下午2:07:44  
 */
public class CartProductAttr 
{
	private int id;
	private int cartId;
	private int attrId;
	private int attrvalueId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getAttrId() {
		return attrId;
	}
	public void setAttrId(int attrId) {
		this.attrId = attrId;
	}
	public int getAttrvalueId() {
		return attrvalueId;
	}
	public void setAttrvalueId(int attrvalueId) {
		this.attrvalueId = attrvalueId;
	}

	
}
