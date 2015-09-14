package admin.ru.own.www.entity;

import java.util.List;

public class StoreFooterInfoEdit 
{
	Storefooterinfo parentInfo;
	List<Storefooterinfo> childInfoList;
	
	
	
	public Storefooterinfo getParentInfo() {
		return parentInfo;
	}
	public void setParentInfo(Storefooterinfo parentInfo) {
		this.parentInfo = parentInfo;
	}
	public List<Storefooterinfo> getChildInfoList() {
		return childInfoList;
	}
	public void setChildInfoList(List<Storefooterinfo> childInfoList) {
		this.childInfoList = childInfoList;
	}
	
	
}
