package ru.own.www.entity;

import java.util.List;

import admin.ru.own.www.entity.Shipping;

public class OrderDetailShowVO 
{
	Orderdetail od;//订单详情，针对每一个商品
	List<Orderdetailproductattr> odpa;  //商品的具体属性信息
	CartProductImage cpi;//商品图片地址
	Shipping ship;  //货运名称
	
	public Orderdetail getOd() {
		return od;
	}
	public void setOd(Orderdetail od) {
		this.od = od;
	}
	public List<Orderdetailproductattr> getOdpa() {
		return odpa;
	}
	public void setOdpa(List<Orderdetailproductattr> odpa) {
		this.odpa = odpa;
	}
	public CartProductImage getCpi() {
		return cpi;
	}
	public void setCpi(CartProductImage cpi) {
		this.cpi = cpi;
	}
	public Shipping getShip() {
		return ship;
	}
	public void setShip(Shipping ship) {
		this.ship = ship;
	}
	
	
}
