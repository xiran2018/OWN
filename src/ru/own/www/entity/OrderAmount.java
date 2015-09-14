package ru.own.www.entity;

/**
 * 订单的金额类，包含一个订单的各种金额，总额，优惠等
 * @author jql
 *
 */
public class OrderAmount 
{
	float orderTotal;//这个订单的总金额 orderTotal = itemTotal + shippingTotal + handlingTotal + taxTotal
	float itemTotal;//所有物品的总价格
	float shippingTotal;//邮寄运费的总价格
	float handlingTotal;//处理费用的总价格
	float taxTotal;//税费的总价格
	float shippingDiscountTotal;//邮寄运费总的折扣
	
	public OrderAmount() {
	}
	
	public float getOrderTotal() {
		return orderTotal;
	}
	public void setOrderTotal(float orderTotal) {
		this.orderTotal = orderTotal;
	}
	public float getItemTotal() {
		return itemTotal;
	}
	public void setItemTotal(float itemTotal) {
		this.itemTotal = itemTotal;
	}
	public float getShippingTotal() {
		return shippingTotal;
	}
	public void setShippingTotal(float shippingTotal) {
		this.shippingTotal = shippingTotal;
	}
	public float getHandlingTotal() {
		return handlingTotal;
	}
	public void setHandlingTotal(float handlingTotal) {
		this.handlingTotal = handlingTotal;
	}
	public float getTaxTotal() {
		return taxTotal;
	}
	public void setTaxTotal(float taxTotal) {
		this.taxTotal = taxTotal;
	}
	public float getShippingDiscountTotal() {
		return shippingDiscountTotal;
	}
	public void setShippingDiscountTotal(float shippingDiscountTotal) {
		this.shippingDiscountTotal = shippingDiscountTotal;
	}
	
}
