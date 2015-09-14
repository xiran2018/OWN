package ru.own.www.entity;

import java.sql.Timestamp;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer UId;
	private String UName;
	private String UPassword;
	private String UType;
	private Timestamp zctime;
	private Timestamp lasttime;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String UName, String UPassword, Timestamp zctime,
			Timestamp lasttime) {
		this.UName = UName;
		this.UPassword = UPassword;
		this.zctime = zctime;
		this.lasttime = lasttime;
	}

	/** full constructor */
	public User(String UName, String UPassword, String UType, Timestamp zctime,
			Timestamp lasttime) {
		this.UName = UName;
		this.UPassword = UPassword;
		this.UType = UType;
		this.zctime = zctime;
		this.lasttime = lasttime;
	}

	// Property accessors

	public Integer getUId() {
		return this.UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}

	public String getUName() {
		return this.UName;
	}

	public void setUName(String UName) {
		this.UName = UName;
	}

	public String getUPassword() {
		return this.UPassword;
	}

	public void setUPassword(String UPassword) {
		this.UPassword = UPassword;
	}

	public String getUType() {
		return this.UType;
	}

	public void setUType(String UType) {
		this.UType = UType;
	}

	public Timestamp getZctime() {
		return this.zctime;
	}

	public void setZctime(Timestamp zctime) {
		this.zctime = zctime;
	}

	public Timestamp getLasttime() {
		return this.lasttime;
	}

	public void setLasttime(Timestamp lasttime) {
		this.lasttime = lasttime;
	}

}