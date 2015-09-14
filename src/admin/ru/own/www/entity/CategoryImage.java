package admin.ru.own.www.entity;

import java.sql.Timestamp;

/**
 * Category entity. @author MyEclipse Persistence Tools
 */

public class CategoryImage implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer categoryid;
	private String imgsrc;
	private Integer imghref;
	private String type;
	private Short used;
	


	// Constructors

	/** default constructor */
	public CategoryImage() {
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}





	public Integer getCategoryid() {
		return categoryid;
	}


	public void setCategoryid(Integer categoryid) {
		this.categoryid = categoryid;
	}


	public String getImgsrc() {
		return imgsrc;
	}


	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}


	public Integer getImghref() {
		return imghref;
	}


	public void setImghref(Integer imghref) {
		this.imghref = imghref;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public Short getUsed() {
		return used;
	}


	public void setUsed(Short used) {
		this.used = used;
	}

	

}