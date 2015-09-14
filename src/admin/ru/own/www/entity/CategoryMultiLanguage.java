package admin.ru.own.www.entity;

public class CategoryMultiLanguage 
{
	int id;
	int category_id;
	int lan_id;
	String name;
	String title;
	String keywords;
	String description;
	public CategoryMultiLanguage() 
	{
		// TODO Auto-generated constructor stub
	}
	public CategoryMultiLanguage(int category_id,int lanid,String other_name,
			 String en_title, String en_keywords,String en_description) 
	{
		this.category_id=category_id;
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
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
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
