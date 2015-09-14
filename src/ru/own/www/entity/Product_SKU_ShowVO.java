package ru.own.www.entity;

import java.util.List;

import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.ProductSku;
import admin.ru.own.www.entity.Product_Basic_Attr;
import admin.ru.own.www.entity.SKU_AtrValue;

public class Product_SKU_ShowVO 
{
	private ProductSku psku; //商品的sku
	private List<SKU_AtrValue> skuAttrValues; //sku包含的属性值
	
	

	public ProductSku getPsku() {
		return psku;
	}
	public void setPsku(ProductSku psku) {
		this.psku = psku;
	}
	public List<SKU_AtrValue> getSkuAttrValues() {
		return skuAttrValues;
	}
	public void setSkuAttrValues(List<SKU_AtrValue> skuAttrValues) {
		this.skuAttrValues = skuAttrValues;
	}
	
	
}
