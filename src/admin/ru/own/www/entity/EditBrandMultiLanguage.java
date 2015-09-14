package admin.ru.own.www.entity;

public class EditBrandMultiLanguage 
{
	int id;
	int brand_id;
	String  language_name;
	String name;
	String title;
	String keywords;
	String description;
	public EditBrandMultiLanguage() 
	{
		// TODO Auto-generated constructor stub
	}
	public EditBrandMultiLanguage(int brand_id,String lanname,String other_name,
			 String en_title, String en_keywords,String en_description) 
	{
		this.brand_id=brand_id;
		this.language_name=lanname;
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

	public int getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}

	public String getLanguage_name() {
		return language_name;
	}
	public void setLanguage_name(String language_name) {
		this.language_name = language_name;
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
