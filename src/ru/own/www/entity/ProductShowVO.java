package ru.own.www.entity;

import java.util.List;

import admin.ru.own.www.entity.Products;
import admin.ru.own.www.entity.productImage;
import admin.ru.own.www.entity.shipTemplateEdit;

public class ProductShowVO 
{
	private Products products;
	private List<productImage> pimg; // 商品图片
	private List<Product_Basic_Attr_ShowVO> pBasic_Attrs; // 商品属性，在实际使用的过程中，该字段的值只是保存了该商品包含的属性中，其属性值录入方式为2的商品属性，包含两部分：1：构成sku的属性1：不构成sku的属性
	private List<Product_Basic_Attr13_ShowVO> pBasic_Attrs13; // 商品属性，在实际使用的过程中，该字段的值只是保存了该商品包含的属性中，其属性值录入方式为1或者3的商品属性
	private List<Product_Basic_Attr13_ShowVO> pBasic_Attrs4; // 商品属性，在实际使用的过程中，该字段的值只是保存了该商品包含的属性中，其属性值录入方式为4的商品属性
	private List<Product_SKU_ShowVO> psku;// 商品的sku信息

	private List<shipTemplateEdit> shipTemplate; // 该商品的货运信息

	public Products getProducts() {
		return products;
	}

	public void setProducts(Products products) {
		this.products = products;
	}

	public List<productImage> getPimg() {
		return pimg;
	}

	public void setPimg(List<productImage> pimg) {
		this.pimg = pimg;
	}

	public List<Product_Basic_Attr_ShowVO> getpBasic_Attrs() {
		return pBasic_Attrs;
	}

	public void setpBasic_Attrs(List<Product_Basic_Attr_ShowVO> pBasic_Attrs) {
		this.pBasic_Attrs = pBasic_Attrs;
	}

	public List<Product_SKU_ShowVO> getPsku() {
		return psku;
	}

	public void setPsku(List<Product_SKU_ShowVO> psku) {
		this.psku = psku;
	}

	public List<shipTemplateEdit> getShipTemplate() {
		return shipTemplate;
	}

	public void setShipTemplate(List<shipTemplateEdit> shipTemplate) {
		this.shipTemplate = shipTemplate;
	}

	public List<Product_Basic_Attr13_ShowVO> getpBasic_Attrs13() {
		return pBasic_Attrs13;
	}

	public void setpBasic_Attrs13(List<Product_Basic_Attr13_ShowVO> pBasic_Attrs13) {
		this.pBasic_Attrs13 = pBasic_Attrs13;
	}

	public List<Product_Basic_Attr13_ShowVO> getpBasic_Attrs4() {
		return pBasic_Attrs4;
	}

	public void setpBasic_Attrs4(List<Product_Basic_Attr13_ShowVO> pBasic_Attrs4) {
		this.pBasic_Attrs4 = pBasic_Attrs4;
	}



}
