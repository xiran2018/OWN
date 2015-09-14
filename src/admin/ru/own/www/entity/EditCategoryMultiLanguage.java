package admin.ru.own.www.entity;

public class EditCategoryMultiLanguage 
{
	int id;
	int category_id;
	String languageName;
	String name;
	String title;
	String keywords;
	String description;
	public EditCategoryMultiLanguage() 
	{
		// TODO Auto-generated constructor stub
	}
	public EditCategoryMultiLanguage(int category_id,String lanname,String other_name,
			 String en_title, String en_keywords,String en_description) 
	{
		this.category_id=category_id;
		this.languageName=lanname;
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

	public String getLanguageName() {
		return languageName;
	}
	public void setLanguageName(String languageName) {
		this.languageName = languageName;
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
