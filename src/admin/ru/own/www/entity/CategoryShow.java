package admin.ru.own.www.entity;

import java.sql.Timestamp;

/**
 * Category entity. @author MyEclipse Persistence Tools
 */

public class CategoryShow implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Integer pId;

	// Constructors

	/** default constructor */
	public CategoryShow() {
	}

	/** full constructor */
	public CategoryShow( Integer id, Integer pId,String name) {
		this.id=id;
		this.name = name;
		this.pId = pId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	// Property accessors



}