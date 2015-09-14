package admin.ru.own.www.entity;

import java.sql.Timestamp;
import java.util.List;

/**
 * Storefooterinfo entity. @author MyEclipse Persistence Tools
 */

public class StorefooterinfoClientShow implements java.io.Serializable 
{
	Storefooterinfo fatherFooterInfo;
	List<Storefooterinfo> childFooterInfo;
	
	public StorefooterinfoClientShow() {
		// TODO Auto-generated constructor stub
	}

	public Storefooterinfo getFatherFooterInfo() {
		return fatherFooterInfo;
	}

	public void setFatherFooterInfo(Storefooterinfo fatherFooterInfo) {
		this.fatherFooterInfo = fatherFooterInfo;
	}

	public List<Storefooterinfo> getChildFooterInfo() {
		return childFooterInfo;
	}

	public void setChildFooterInfo(List<Storefooterinfo> childFooterInfo) {
		this.childFooterInfo = childFooterInfo;
	}
	
	
}