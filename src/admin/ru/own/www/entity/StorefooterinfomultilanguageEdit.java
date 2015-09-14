package admin.ru.own.www.entity;

import java.sql.Timestamp;

/**
 * Storefooterinfomultilanguage entity. @author MyEclipse Persistence Tools
 */

public class StorefooterinfomultilanguageEdit implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer storefooterinfoid;
	private String lanname;
	private String name;
	private String content;
	private String title;
	private String keyword;
	private String description;
	private Timestamp createtime;
	private Timestamp modifytime;

	// Constructors

	/** default constructor */
	public StorefooterinfomultilanguageEdit() {
	}



	// Property accessors

	public Integer getId() {
		return this.id;
	}
	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStorefooterinfoid() {
		return this.storefooterinfoid;
	}

	public void setStorefooterinfoid(Integer storefooterinfoid) {
		this.storefooterinfoid = storefooterinfoid;
	}







	public String getLanname() {
		return lanname;
	}



	public void setLanname(String lanname) {
		this.lanname = lanname;
	}



	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeyword() {
		return this.keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public Timestamp getModifytime() {
		return this.modifytime;
	}

	public void setModifytime(Timestamp modifytime) {
		this.modifytime = modifytime;
	}

}