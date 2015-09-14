package admin.ru.own.www.entity;

public class AttributeValueMultiLanguage 
{
	int id;
	int attrvalue_id;
	int lan_id;
	String name;
	String title;
	String keywords;
	String description;
	
	private String languageName;
	public AttributeValueMultiLanguage() 
	{
		// TODO Auto-generated constructor stub
	}
	public AttributeValueMultiLanguage(int attrvalue_id,int lanid,String other_name,
			 String en_title, String en_keywords,String en_description) 
	{
		this.attrvalue_id=attrvalue_id;
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


	public int getAttrvalue_id() {
		return attrvalue_id;
	}
	public void setAttrvalue_id(int attrvalue_id) {
		this.attrvalue_id = attrvalue_id;
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
	public String getLanguageName() {
		return languageName;
	}
	public void setLanguageName(String languageName) {
		this.languageName = languageName;
	}
	@Override
	public String toString() {
		return "AttributeValueMultiLanguage [id=" + id + ", attrvalue_id=" + attrvalue_id + ", lan_id=" + lan_id + ", name=" + name + ", title=" + title + ", keywords=" + keywords + ", description="
				+ description + "]";
	}
	
	

}
