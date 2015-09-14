package admin.ru.own.www.entity;

import java.util.List;

public class ShippingShow
{
	private Integer count;
	private List<Shipping> listobj;

	
	
	public ShippingShow() 
	{
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public List<Shipping> getListobj() {
		return listobj;
	}

	public void setListobj(List<Shipping> listobj) {
		this.listobj = listobj;
	}
	
	
	
	
}
