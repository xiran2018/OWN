package admin.ru.own.www.entity;

import java.sql.Timestamp;

/**
 * BrandSeries entity. @author MyEclipse Persistence Tools
 */

public class AbstraTreeGrid implements java.io.Serializable {

	// Fields

	private Integer Id;
	private Integer parentId;


	// Constructors

	/** default constructor */
	public AbstraTreeGrid() {
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}



}