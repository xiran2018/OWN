package admin.ru.own.www.vo;

import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.ProductMultiLanguage;

public class ProductMultiLanguageVO {
	private ProductMultiLanguage productMultiLanguage;
	private Language language;
	public ProductMultiLanguage getProductMultiLanguage() {
		return productMultiLanguage;
	}
	public void setProductMultiLanguage(ProductMultiLanguage productMultiLanguage) {
		this.productMultiLanguage = productMultiLanguage;
	}
	public Language getLanguage() {
		return language;
	}
	public void setLanguage(Language language) {
		this.language = language;
	}
	
}
