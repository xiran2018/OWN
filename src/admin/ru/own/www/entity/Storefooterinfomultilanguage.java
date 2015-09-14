package admin.ru.own.www.entity;

import java.sql.Timestamp;

/**
 * Storefooterinfomultilanguage entity. @author MyEclipse Persistence Tools
 */

public class Storefooterinfomultilanguage implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer storefooterinfoid;
	private Integer lanid;
	private String name;
	private String content;
	private String title;
	private String keyword;
	private String description;
	private Timestamp createtime;
	private Timestamp modifytime;

	// Constructors

	/** default constructor */
	public Storefooterinfomultilanguage() {
	}

	/** minimal constructor */
	public Storefooterinfomultilanguage(Integer storefooterinfoid,
			Integer lanid, Timestamp createtime, Timestamp modifytime) {
		this.storefooterinfoid = storefooterinfoid;
		this.lanid = lanid;
		this.createtime = createtime;
		this.modifytime = modifytime;
	}

	/** full constructor */
	public Storefooterinfomultilanguage(Integer storefooterinfoid,
			Integer lanid, String title, String keyword, String description,
			Timestamp createtime, Timestamp modifytime) {
		this.storefooterinfoid = storefooterinfoid;
		this.lanid = lanid;
		this.title = title;
		this.keyword = keyword;
		this.description = description;
		this.createtime = createtime;
		this.modifytime = modifytime;
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

	public Integer getLanid() {
		return this.lanid;
	}

	public void setLanid(Integer lanid) {
		this.lanid = lanid;
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