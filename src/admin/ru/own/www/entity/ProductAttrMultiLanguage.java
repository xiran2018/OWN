package admin.ru.own.www.entity;

/**
 * 此类的属性时商品属性多语言的类
 * @author jingquanliang
 *
 */
public class ProductAttrMultiLanguage 
{
	int id;
	int productattr_id;
	int lan_id;
	String name;
	String title;
	String keywords;
	String description;
	public ProductAttrMultiLanguage() 
	{
		// TODO Auto-generated constructor stub
	}
	public ProductAttrMultiLanguage(int productattr_id,int lanid,String other_name,
			 String en_title, String en_keywords,String en_description) 
	{
		this.productattr_id=productattr_id;
		this.lan_id=lanid;
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
	public int getLan_id() {
		return lan_id;
	}
	public void setLan_id(int lan_id) {
		this.lan_id = lan_id;
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
