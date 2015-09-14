package admin.ru.own.www.entity;

/**
 * 此类的主要作用是商品属性多语言版本的显示
 * @author jingquanliang
 *
 */
public class ProductAttrMultiLanguageShow 
{
	int id;
	int productattr_id;
	String lan_name;
	String name;
	String title;
	String keywords;
	String description;
	public ProductAttrMultiLanguageShow() 
	{
		// TODO Auto-generated constructor stub
	}
	public ProductAttrMultiLanguageShow(int productattr_id,String lan_name,String other_name,
			 String en_title, String en_keywords,String en_description) 
	{
		this.productattr_id=productattr_id;
		this.lan_name=lan_name;
		this.name=other_name;
		this.title=en_title;
		this.keywords=en_keywords;
		this.description=en_description;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}


	public int getProductattr_id() {
		return productattr_id;
	}
	public void setProductattr_id(int productattr_id) {
		this.productattr_id = productattr_id;
	}

	public String getLan_name() {
		return lan_name;
	}
	public void setLan_name(String lan_name) {
		this.lan_name = lan_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	

}
