/**  
* This class is used for showing shopCart
* @author jingquanliang
* @version  
*       1.0, 2015年1月15日 下午10:52:11  
*/   
package ru.own.www.entity;

import java.util.List;

public class shopCartShowVO 
{
	Cart cartvo;  //购物车中的信息
	CartProductImage cpi;//商品图片地址
	List<CartProductAttrShowVO> pAttrShowVOs;//用户选择的商品属性值信息
	ProductBasicShowVO pbvo;  //商品基本信息
	SkuShowVO skuvo;//如果是sku商品，则该商品的sku信息
	List<ShippingShowVO> ssvo;//该商品的货运信息
	
	public ProductBasicShowVO getPbvo() {
		return pbvo;
	}
	public void setPbvo(ProductBasicShowVO pbvo) {
		this.pbvo = pbvo;
	}
	public Cart getCartvo() {
		return cartvo;
	}
	public void setCartvo(Cart cartvo) {
		this.cartvo = cartvo;
	}
	public SkuShowVO getSkuvo() {
		return skuvo;
	}
	public void setSkuvo(SkuShowVO skuvo) {
		this.skuvo = skuvo;
	}
	public List<ShippingShowVO> getSsvo() {
		return ssvo;
	}
	public void setSsvo(List<ShippingShowVO> ssvo) {
		this.ssvo = ssvo;
	}
	public CartProductImage getCpi() {
		return cpi;
	}
	public void setCpi(CartProductImage cpi) {
		this.cpi = cpi;
	}
	public List<CartProductAttrShowVO> getpAttrShowVOs() {
		return pAttrShowVOs;
	}
	public void setpAttrShowVOs(List<CartProductAttrShowVO> pAttrShowVOs) {
		this.pAttrShowVOs = pAttrShowVOs;
	}
	
	
	
}
