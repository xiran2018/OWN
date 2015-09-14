package admin.ru.own.www.entity;

public class ProductMultiLanguage 
{
	private int id;
	private	int product_id;
	private	int lan_id;
	private	String product_name;
	private	String product_desc;
	private	String product_detail_desc;
	private	String title;
	private	String keywords;
	private	String description;
	public ProductMultiLanguage() {
	}
	public ProductMultiLanguage(int pid, int lanid,String en_other_name,
			String en_product_description, String en_title, String en_keywords,
			String en_description) 
	{
		this.product_id=pid;
		this.lan_id=lanid;
		this.product_name=en_other_name;
		this.product_desc=en_product_description;
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
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getLan_id() {
		return lan_id;
	}
	public void setLan_id(int lan_id) {
		this.lan_id = lan_id;
	}

	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
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
	public String getProduct_detail_desc() {
		return product_detail_desc;
	}
	public void setProduct_detail_desc(String product_detail_desc) {
		this.product_detail_desc = product_detail_desc;
	}
	
}
