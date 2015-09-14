package ru.own.www.entity;

public class ShippingInfo 
{
	float shippingFee=0; //货运费用
	String shippingTime; //货运时间
	public float getShippingFee() {
		return shippingFee;
	}
	public void setShippingFee(float shippingFee) {
		this.shippingFee = shippingFee;
	}
	public String getShippingTime() {
		return shippingTime;
	}
	public void setShippingTime(String shippingTime) {
		this.shippingTime = shippingTime;
	}
	
	

}
