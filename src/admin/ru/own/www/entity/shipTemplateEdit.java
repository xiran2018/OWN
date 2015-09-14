package admin.ru.own.www.entity;

import java.util.List;

public class shipTemplateEdit 
{
	//编辑物流模板相关
	private int id;  //货运方式的id
	private String name;//货运方式的name
	private int st_id;  //货运模板的id
	private Integer timeStyle;  //时间的设定方式,0为统一的运输时间，1为自定义运输时间
	private String time; //货运时间（当选择统一的方式时）
	private Integer shipStyle;
	private List<ShippingTemplateTime> timeMode;
	private List<ShippingTemplateXiangxi> shipMode;
	
	
	
	public shipTemplateEdit() 
	{
	}
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Integer getTimeStyle() {
		return timeStyle;
	}



	public void setTimeStyle(Integer timeStyle) {
		this.timeStyle = timeStyle;
	}







	public String getTime() {
		return time;
	}



	public void setTime(String time) {
		this.time = time;
	}



	public Integer getShipStyle() {
		return shipStyle;
	}



	public void setShipStyle(Integer shipStyle) {
		this.shipStyle = shipStyle;
	}



	public List<ShippingTemplateTime> getTimeMode() {
		return timeMode;
	}
	public void setTimeMode(List<ShippingTemplateTime> timeMode) {
		this.timeMode = timeMode;
	}
	public List<ShippingTemplateXiangxi> getShipMode() {
		return shipMode;
	}
	public void setShipMode(List<ShippingTemplateXiangxi> shipMode) {
		this.shipMode = shipMode;
	}
	public int getSt_id() {
		return st_id;
	}
	public void setSt_id(int st_id) {
		this.st_id = st_id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}
	
}
