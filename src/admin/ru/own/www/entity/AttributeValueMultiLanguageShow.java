package admin.ru.own.www.entity;

public class AttributeValueMultiLanguageShow 
{
	int id;
	int attrvalue_id;
	String  language_name;
	String name;
	String title;
	String keywords;
	String description;
	public AttributeValueMultiLanguageShow() 
	{
		// TODO Auto-generated constructor stub
	}
	public AttributeValueMultiLanguageShow(int attrvalue_id,String  language_name,String other_name,
			 String en_title, String en_keywords,String en_description) 
	{
		this.attrvalue_id=attrvalue_id;
		this.language_name=language_name;
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


	public int getAttrvalue_id() {
		return attrvalue_id;
	}
	public void setAttrvalue_id(int attrvalue_id) {
		this.attrvalue_id = attrvalue_id;
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
