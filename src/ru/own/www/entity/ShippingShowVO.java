package ru.own.www.entity;

import admin.ru.own.www.entity.Shipping;
import admin.ru.own.www.entity.ShippingTemplateTime;
import admin.ru.own.www.entity.ShippingTemplateXiangxi;

/**  
 * This class is used for 显示某一个国家的物流信息 
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月4日 下午3:27:54  
 */
public class ShippingShowVO 
{
	Shipping ship;  //货运名称
	ShippingTemplateXiangxi shipFee;//货运费用
	ShippingTemplateTime shipTime;  //货运时间
	public Shipping getShip() {
		return ship;
	}
	public void setShip(Shipping ship) {
		this.ship = ship;
	}
	public ShippingTemplateXiangxi getShipFee() {
		return shipFee;
	}
	public void setShipFee(ShippingTemplateXiangxi shipFee) {
		this.shipFee = shipFee;
	}
	public ShippingTemplateTime getShipTime() {
		return shipTime;
	}
	public void setShipTime(ShippingTemplateTime shipTime) {
		this.shipTime = shipTime;
	}
	
	
}

