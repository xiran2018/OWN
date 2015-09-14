package admin.ru.own.www.vo;

import java.util.List;

import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.ProductSku;

public class SkuVO {
	private ProductSku sku;
	private List<AttributeValue> atrValues;
	
	public ProductSku getSku() {
		return sku;
	}
	public void setSku(ProductSku sku) {
		this.sku = sku;
	}
	public List<AttributeValue> getAtrValues() {
		return atrValues;
	}
	public void setAtrValues(List<AttributeValue> atrValues) {
		this.atrValues = atrValues;
	}
	
	
}
