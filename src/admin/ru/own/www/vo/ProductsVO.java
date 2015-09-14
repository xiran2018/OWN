package admin.ru.own.www.vo;

import java.util.List;

import admin.ru.own.www.entity.Products;
import admin.ru.own.www.entity.productImage;

public class ProductsVO {
	private Products products;
	private String showURL;
	private List<productImage> imageURLs;
	private String category;
	private String brand;
	private String shippingTemplateName;
	private List<Product_Basic_Attr_VO> pBasic_Attrs;
	
	public List<Product_Basic_Attr_VO> getpBasic_Attrs() {
		return pBasic_Attrs;
	}
	public void setpBasic_Attrs(List<Product_Basic_Attr_VO> pBasic_Attrs) {
		this.pBasic_Attrs = pBasic_Attrs;
	}
	public Products getProducts() {
		return products;
	}
	public void setProducts(Products products) {
		this.products = products;
	}
	public String getShowURL() {
		return showURL;
	}
	public void setShowURL(String showURL) {
		this.showURL = showURL;
	}
	
	public List<productImage> getImageURLs() {
		return imageURLs;
	}
	public void setImageURLs(List<productImage> imageURLs) {
		this.imageURLs = imageURLs;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getShippingTemplateName() {
		return shippingTemplateName;
	}
	public void setShippingTemplateName(String shippingTemplateName) {
		this.shippingTemplateName = shippingTemplateName;
	}
	public void setShowImgURL() {
		if (getImageURLs()!=null && getImageURLs().size() != 0) {
			for (productImage imgURL : getImageURLs()) {
				if (imgURL.getImageSort() == 1) {
					setShowURL(imgURL.getImageAddr());// 取出展示URL
					break;
				}
			}
			if(getShowURL()==null || getShowURL().equals("")){
				setShowURL(getImageURLs().get(0).getImageAddr());
			}
		}
	}
	
}
