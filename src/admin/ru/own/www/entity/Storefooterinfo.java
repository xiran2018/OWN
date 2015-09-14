package admin.ru.own.www.entity;

import java.sql.Timestamp;

/**
 * Storefooterinfo entity. @author MyEclipse Persistence Tools
 */

public class Storefooterinfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Integer fatherid;
	private Short status;
	private String pagename;
	private String image;
	private Timestamp createtime;
	
	private String title;
	private String keyword;
	private String description;

	// Constructors

	/** default constructor */
	public Storefooterinfo() {
	}

	/** minimal constructor */
	public Storefooterinfo(String name, Integer fatherid, Short status,
			String pagename) {
		this.name = name;
		this.fatherid = fatherid;
		this.status = status;
		this.pagename = pagename;
	}

	/** full constructor */
	public Storefooterinfo(String name, Integer fatherid, Short status,
			String pagename, String image, Timestamp createtime) {
		this.name = name;
		this.fatherid = fatherid;
		this.status = status;
		this.pagename = pagename;
		this.image = image;
		this.createtime = createtime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getFatherid() {
		return this.fatherid;
	}

	public void setFatherid(Integer fatherid) {
		this.fatherid = fatherid;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public String getPagename() {
		return this.pagename;
	}

	public void setPagename(String pagename) {
		this.pagename = pagename;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	

}